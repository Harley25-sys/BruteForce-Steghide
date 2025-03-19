#!/bin/bash
# Brute Force para Steghide
# Aplica fuerza bruta para extraer datos ocultos en una imagen usando un diccionario de contraseñas.

# Verificar si se proporcionó un archivo como argumento
if [ $# -eq 0 ]; then
    echo -e "\n============================================"
    echo -e "  🛠️  Steghide Brute Force Script"
    echo -e "============================================"
    echo -e "  Uso: $0 <archivo_imagen>"
    echo -e "  Ejemplo: $0 example.jpg"
    echo -e "============================================"
    echo -e "  [+] Autor : Wintxx"
    echo -e "  [+] GitHub: https://github.com/Jean25-sys"
    echo -e "============================================\n"
    exit 1
fi

# Archivo de imagen con datos ocultos (pasado como argumento)
IMAGE="$1"
# Diccionario de contraseñas
WORDLIST="/usr/share/wordlists/rockyou.txt"

# Verificar si el archivo de imagen existe
if [ ! -f "$IMAGE" ]; then
    echo "Error: El archivo $IMAGE no existe."
    exit 1
fi

# Verificar si el diccionario existe
if [ ! -f "$WORDLIST" ]; then
    echo "Error: El archivo de diccionario $WORDLIST no existe."
    exit 1
fi

# Contador de intentos
attempt=0

# Leer cada línea del diccionario
while IFS= read -r password; do
    ((attempt++))
    echo -ne "\rProbando contraseña $attempt: $password"
    
    # Intentar extraer con la contraseña actual (sin guardar los datos)
    output=$(steghide extract -sf "$IMAGE" -p "$password" -q 2>&1)

    # Si la extracción es exitosa, mostrar la contraseña y el archivo extraído
    if [ $? -eq 0 ]; then
        echo -e "\n\n✅ ¡Contraseña encontrada!: $password"

        # Comprobar si hay un archivo recién extraído
        extracted_file=$(ls -t | head -n 1)

        if [ -n "$extracted_file" ]; then
            echo "🔍 Se ha encontrado un archivo oculto: $extracted_file"
        else
            echo "⚠️ Archivo extraído, pero no se pudo determinar el nombre."
        fi

        exit 0
    fi

done < "$WORDLIST"

# Si no se encuentra ninguna contraseña válida
echo -e "\n❌ No se encontró una contraseña válida."
exit 1
