FROM node:alpine

RUN mkdir -p /app
WORKDIR /app

COPY package.json .
RUN npm install

COPY run.sh .
RUN chmod +x run.sh
COPY index.js .

CMD /app/run.sh
