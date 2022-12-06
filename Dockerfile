FROM node:18-alpine
COPY app.js backendApi.js package-lock.json package.json public ./
RUN npm install 
CMD node app.js