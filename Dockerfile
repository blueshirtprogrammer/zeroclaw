# ZeroClaw - Nginx reverse proxy approach
FROM agent0ai/agent-zero:latest

# Install nginx for reverse proxy
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Configure nginx to forward from 0.0.0.0:80 to localhost:5000
RUN echo '\
server {\n\
    listen 0.0.0.0:80;\n\
    server_name _;\n\
    location / {\n\
        proxy_pass http://127.0.0.1:5000;\n\
        proxy_set_header Host $host;\n\
        proxy_set_header X-Real-IP $remote_addr;\n\
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n\
    }\n\
}\n' > /etc/nginx/sites-available/default

# Set environment
ENV WEB_UI_PORT=5000
ENV WEB_UI_HOST=127.0.0.1
ENV ZC_BRAND_NAME=ZeroClaw

# Start nginx first, then the app
CMD ["bash", "-c", "/usr/sbin/nginx & cd /a0 && python3 run_ui.py"]
