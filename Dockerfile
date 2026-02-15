# ZeroClaw Dockerfile
# Pulls the official Agent Zero image and runs it with ZeroClaw branding

FROM agent0ai/agent-zero:latest

# Set branding
ENV ZC_BRAND_NAME=ZeroClaw
ENV ZC_INACTIVITY_TIMEOUT=3600

# Expose ports
EXPOSE 80 22 9000-9009

# Initialize and run
CMD ["/exe/initialize.sh", "main"]
