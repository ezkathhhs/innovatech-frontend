# ==========================================
# Etapa 1: Construcción (Build Stage)
# ==========================================
FROM node:20-alpine AS builder

WORKDIR /app

# Copiamos solo los archivos de dependencias primero para optimizar la caché (rendimiento)
COPY package*.json ./
RUN npm install

# Copiamos el resto del código y compilamos
COPY . .
RUN npm run build

# ==========================================
# Etapa 2: Producción (Production Stage)
# ==========================================
# Usamos una imagen de Nginx que por defecto corre como usuario NO ROOT
FROM nginxinc/nginx-unprivileged:alpine

# Copiamos los estáticos compilados desde la Etapa 1
COPY --from=builder /app/dist /usr/share/nginx/html

# Al ser no root, Nginx unprivileged usa el puerto 8080 por defecto, no el 80
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]