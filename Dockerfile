FROM nginx:latest
#COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /usr/share/nginx/html/furkan-akgunn
COPY index.html /usr/share/nginx/html/furkan-akgunn/
