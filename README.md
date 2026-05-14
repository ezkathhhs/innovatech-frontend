# Innovatech Chile - Frontend 🚀

Este repositorio contiene la aplicación Frontend de Innovatech Chile, desarrollada con **React (Vite)** y empaquetada utilizando buenas prácticas de contenedorización para su despliegue en AWS.

## 🏗️ Arquitectura y Contenedorización

El proyecto utiliza un **Dockerfile Multi-stage**:
1. **Build Stage:** Utiliza `node:20-alpine` para descargar dependencias y compilar los archivos estáticos.
2. **Production Stage:** Utiliza `nginxinc/nginx-unprivileged:alpine`. Esto garantiza que el servidor web se ejecute con un **usuario no root**, cumpliendo con el principio de mínimo privilegio y asegurando la máquina host.

## 🚀 Cómo ejecutar localmente

El ecosistema completo (Frontend, Backend y Base de Datos) está orquestado mediante Docker Compose.

1. Clonar este repositorio y el repositorio del backend en la misma carpeta base.
2. Navegar al directorio del backend donde se encuentra el archivo orquestador.
3. Ejecutar el stack:
   ```bash
   docker-compose up --build -d