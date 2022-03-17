FROM node:17.7.1-alpine3.15 AS build
WORKDIR /build
COPY . .
RUN npm install -g typescript@3.8; \ 
        yarn; yarn build

FROM node:17.7.1-alpine3.15
WORKDIR /app
COPY --from=build /build/node_modules /app/node_modules
COPY --from=build /build/dist /app/dist
CMD [ "node", "dist/js/app.js" ]
