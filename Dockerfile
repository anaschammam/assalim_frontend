FROM nginx:1.27-alpine

RUN apk add --no-cache bash

COPY www /usr/share/nginx/html
COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template
COPY scripts/docker-entrypoint.sh /custom-entrypoint.sh
RUN sed -i 's/\r$//' /custom-entrypoint.sh && chmod +x /custom-entrypoint.sh

ENV BACKEND_HOST=assalim-backend.railway.internal
ENV BACKEND_PORT=8080

ENTRYPOINT ["/custom-entrypoint.sh"]
