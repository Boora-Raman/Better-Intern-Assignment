FROM node:22-bullseye-slim

WORKDIR /app

COPY . .  

 
RUN npm install

RUN npm install -g nodemon express mongoose

EXPOSE 9000

CMD ["nodemon", "app.js"]
