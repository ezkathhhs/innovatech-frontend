# Innovatech Chile - Frontend 🚀

Este repositorio contiene la aplicación Frontend de Innovatech Chile, desarrollada con React (Vite) y empaquetada para su despliegue automatizado en AWS.

## 🏗️ Arquitectura y Contenedorización

El proyecto utiliza un Dockerfile Multi-stage:
1. Build Stage: Utiliza la imagen node:20-alpine para descargar dependencias y compilar los archivos estáticos.
2. Production Stage: Utiliza la imagen nginxinc/nginx-unprivileged:alpine. Esto garantiza que el servidor web se ejecute con un **usuario no root**, cumpliendo con el principio de mínimo privilegio y asegurando la máquina host.

## 🚀 Cómo ejecutar localmente

El ecosistema completo (Frontend, Backend y Base de Datos) está orquestado mediante Docker Compose.
1. Clona este repositorio y el repositorio del backend en una misma carpeta base.
2. Navega al directorio del backend donde se encuentra el archivo orquestador.
3. Ejecuta el stack con el comando: docker-compose up --build -d
4. El frontend estará disponible en http://localhost

## ⚙️ Pipeline CI/CD

El despliegue está automatizado con GitHub Actions. Al realizar un push a la rama 'deploy', el pipeline:
1. Construye la imagen Docker.
2. Sube la imagen a Docker Hub.
3. Se conecta por SSH a la instancia EC2 Pública en AWS y actualiza el contenedor de Nginx.
test