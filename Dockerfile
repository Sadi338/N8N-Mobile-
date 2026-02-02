# Use the official n8n image
FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Expose the default n8n port
EXPOSE 5678

# Set environment variables
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV WEBHOOK_URL=https://your-app-name.onrender.com/

# Start n8n
CMD ["n8n"]
