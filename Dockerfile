# Use lightweight nginx as base image
FROM nginx:alpine

# Copy HTML files to nginx default directory
COPY profile.html /usr/share/nginx/html/index.html
COPY Rushoford.jpg /usr/share/nginx/html/Rushoford.jpg

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
