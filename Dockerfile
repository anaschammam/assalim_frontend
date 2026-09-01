FROM nginx:1.27-alpine

COPY www /usr/share/nginx/html
COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template

# Railway overrides these; defaults avoid empty-port nginx crash.
ENV BACKEND_HOST=assalim-backend.railway.internal
ENV BACKEND_PORT=8080
