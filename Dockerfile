FROM node:13.7.0-alpine3.10 AS build
WORKDIR /build
COPY . .
RUN npm install -g typescript@3.8; \ 
        yarn; yarn build

FROM node:13.7.0-alpine3.10
WORKDIR /app
COPY --from=build /build/node_modules /app/node_modules
COPY --from=build /build/dist /app/dist
CMD [ "node", "dist/js/app.js" ]
