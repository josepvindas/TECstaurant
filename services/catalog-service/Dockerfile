# Run from node version 10
FROM node:10
# Working directory 
WORKDIR /usr/src/service/
# Install express inside the container
RUN npm install express --save && npm install
# Copy the current directory to the working directory
COPY . .
# Make port 4007 available for interaction
EXPOSE 4007
# run the application, with command 'node service.js'
CMD ["node","service"]