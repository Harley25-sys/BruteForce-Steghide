# 🛠️ Brute-Force - Steghide

Este script realiza un ataque de fuerza bruta para extraer datos ocultos en imágenes compatibles con steghide usando un diccionario de contraseñas.

## 📌 Uso

### 1️⃣ Clonar el repositorio

Para obtener el script, clona el repositorio con:

```python
git clone https://github.com/Jean25-sys/BruteForce-Steghide
```

O si prefieres, copia y pega el código en un archivo manualmente.

### 2️⃣ Otorgar permisos de ejecución

Una vez descargado, dale permisos de ejecución al script:
```
chmod +x bf_steghide.sh
```

### 3️⃣ Ejecutar el script

Pásale la imagen como parámetro para iniciar el ataque de fuerza bruta:
```
./bf_steghide.sh <imagen_oculta>
```
🔹 Ejemplo:
```
./bf_steghide.sh secreto.jpg
```

### 4️⃣ Esperar a que encuentre la contraseña
El script probará todas las contraseñas del diccionario hasta encontrar la correcta. Si la extracción es exitosa, mostrará:
![resultado](https://github.com/Jean25-sys/BruteForce-Steghide/blob/main/images/resultado.png)




