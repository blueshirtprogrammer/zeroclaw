# ZeroClaw Dockerfile
# Pulls the official Agent Zero image and runs it with ZeroClaw branding

FROM agent0ai/agent-zero:latest

# Set branding via environment variables
ENV ZC_BRAND_NAME=ZeroClaw
ENV ZC_INACTIVITY_TIMEOUT=3600
ENV WEB_UI_HOST=0.0.0.0

# Expose ports
EXPOSE 80

# Override the default command to ensure it binds to 0.0.0.0
CMD ["bash", "-c", "export WEB_UI_HOST=0.0.0.0 && /exe/initialize.sh main"]
