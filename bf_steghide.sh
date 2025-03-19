#!/bin/bash

# Archivo de imagen con datos ocultos
IMAGE="penguin.jpg"
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
    steghide extract -sf "$IMAGE" -p "$password" -q &>/dev/null

    # Si la extracción es exitosa, mostrar la contraseña y salir
    if [ $? -eq 0 ]; then
        echo -e "\n\n¡Contraseña encontrada!: $password"
        exit 0
    fi

done < "$WORDLIST"

echo -e "\nNo se encontró una contraseña válida."
exit 1
