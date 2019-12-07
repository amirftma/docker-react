FROM node:13.3.0-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build --loglevel verbose

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
