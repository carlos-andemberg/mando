# Serves the static files with nginx (Coolify: Build Pack "Dockerfile", port 80)
FROM nginx:alpine
COPY *.html /usr/share/nginx/html/
EXPOSE 80
