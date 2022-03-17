FROM node:14.17.0-alpine3.13 AS build
WORKDIR /build
COPY . .
RUN npm install -g typescript; \ 
        yarn; yarn build

FROM node:14.17.0-alpine3.13
WORKDIR /app
COPY --from=build /build/dist/js/ /app
CMD [ "node", "/app/app.js" ]
