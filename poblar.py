import psycopg2
import random
from faker import Faker
from datetime import date, timedelta

# 1. CONFIGURACIÓN DE CONEXIÓN
# Cambia estos datos por los de tu pgAdmin
DB_HOST = "localhost"
DB_NAME = "biblioteca_CECyT_3"
DB_USER = "postgres"
DB_PASS = "123" 

# Inicializar Faker en español (México) para datos realistas
fake = Faker('es_MX')

try:
    conn = psycopg2.connect(host=DB_HOST, database=DB_NAME, user=DB_USER, password=DB_PASS)
    cur = conn.cursor()
    print("✅ Conexión exitosa. Iniciando poblado de datos...")

    # --- PASO 1: GENERAR CATALOGOS (Independientes) ---
    
    # Editoriales (Generar 5)
    print("📚 Generando Editoriales...")
    ids_editoriales = []
    for _ in range(5):
        nombre = fake.company() + " Editores"
        cur.execute("INSERT INTO editoriales (nombre, pais, sitio_web) VALUES (%s, %s, %s) RETURNING id_editorial", 
                    (nombre, fake.country(), fake.url()))
        ids_editoriales.append(cur.fetchone()[0])

    # Autores (Generar 10)
    print("✍️ Generando Autores...")
    ids_autores = []
    for _ in range(10):
        nombre = fake.first_name()
        apellido = fake.last_name()
        cur.execute("INSERT INTO autores (nombre, apellido, nacionalidad, biografia) VALUES (%s, %s, %s, %s) RETURNING id_autor",
                    (nombre, apellido, fake.country(), fake.text(max_nb_chars=100)))
        ids_autores.append(cur.fetchone()[0])

    # Usuarios (Generar 20)
    print("busts_in_silhouette Generando Usuarios...")
    ids_usuarios = []
    for _ in range(20):
        nombre = fake.name()
        cur.execute("INSERT INTO usuarios (nombre_completo, correo_electronico, telefono, direccion) VALUES (%s, %s, %s, %s) RETURNING id_usuario",
                    (nombre, fake.email(), fake.phone_number(), fake.address()))
        ids_usuarios.append(cur.fetchone()[0])

    # --- PASO 2: GENERAR LIBROS (Dependen de Editoriales y Categorías) ---
    
    # Obtenemos IDs de categorías existentes (asumiendo que ya insertaste las del SQL anterior)
    cur.execute("SELECT id_categoria FROM categorias")
    ids_categorias = [row[0] for row in cur.fetchall()]
    if not ids_categorias: # Si está vacía, insertar una dummy
        cur.execute("INSERT INTO categorias (nombre) VALUES ('General') RETURNING id_categoria")
        ids_categorias.append(cur.fetchone()[0])

    print("📖 Generando Libros...")
    ids_libros = []
    for _ in range(30): # 30 Libros
        titulo = fake.sentence(nb_words=4).replace(".", "")
        isbn = fake.isbn13()
        anio = random.randint(1950, 2024)
        precio = round(random.uniform(10.0, 150.0), 2)
        id_cat = random.choice(ids_categorias)
        id_edit = random.choice(ids_editoriales)
        
        cur.execute("""
            INSERT INTO libros (titulo, isbn, anio_publicacion, precio, id_categoria, id_editorial) 
            VALUES (%s, %s, %s, %s, %s, %s) RETURNING id_libro
        """, (titulo, isbn, anio, precio, id_cat, id_edit))
        new_book_id = cur.fetchone()[0]
        ids_libros.append(new_book_id)

        # Asignar autor al libro (Tabla asociativa libros_autores)
        autor_random = random.choice(ids_autores)
        cur.execute("INSERT INTO libros_autores (id_libro, id_autor, rol_contribucion) VALUES (%s, %s, 'Autor Principal')",
                    (new_book_id, autor_random))

    # --- PASO 3: GENERAR PRÉSTAMOS (Dependen de Usuarios y Libros) ---
    
    print("📅 Generando Préstamos...")
    ids_prestamos = []
    for _ in range(30): # 30 Préstamos
        id_user = random.choice(ids_usuarios)
        id_book = random.choice(ids_libros)
        
        # Lógica de fechas coherente
        fecha_prestamo = fake.date_between(start_date='-1y', end_date='today')
        fecha_esperada = fecha_prestamo + timedelta(days=15)
        
        # Decidir aleatoriamente si ya lo devolvió o no
        if random.choice([True, False]):
            fecha_real = fecha_prestamo + timedelta(days=random.randint(5, 20)) # A veces temprano, a veces tarde
            estado = "Devuelto"
        else:
            fecha_real = None
            estado = "En curso"

        cur.execute("""
            INSERT INTO prestamos (id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado)
            VALUES (%s, %s, %s, %s, %s, %s) RETURNING id_prestamo
        """, (id_user, id_book, fecha_prestamo, fecha_esperada, fecha_real, estado))
        
        id_prest = cur.fetchone()[0]
        
        # --- PASO 4: GENERAR MULTAS (Solo si devolvió tarde) ---
        if fecha_real and fecha_real > fecha_esperada:
            dias_retraso = (fecha_real - fecha_esperada).days
            monto = dias_retraso * 5.50 # 5.50 por día de retraso
            cur.execute("INSERT INTO multas (id_prestamo, monto, fecha_generacion, estado_pago) VALUES (%s, %s, %s, 'Pendiente')",
                        (id_prest, monto, fecha_real))

    conn.commit()
    cur.close()
    conn.close()
    print(f"✨ ¡Éxito! Base de datos poblada con ~100 registros coherentes.")

except Exception as e:
    print(f"❌ Error: {e}")
    if conn:
        conn.rollback()
