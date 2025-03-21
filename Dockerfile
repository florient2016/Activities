# Use the official Nginx base image
FROM nginx:latest

# Label for maintainability (optional)
LABEL maintainer="Your Name support@florientdogbe.me"

# Install git to clone the repository
RUN apt-get update && apt-get install -y git

# Clone your GitHub repository (replace with your repo URL)
RUN git clone https://github.com/florient2016/Activities.git /tmp/repo

RUN ls -la /tmp/repo

# Copy the web files from the repo to Nginx's default directory
RUN cp -r /tmp/repo/* /usr/share/nginx/html/ && rm -rf /tmp/repo

# Mount a volume for persistent or external content
VOLUME /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]