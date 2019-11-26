
FROM node:10.15-alpine as builder

WORKDIR '/react-app/nginx-web-app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /react-app/nginx-web-app/build /usr/share/nginx/html
