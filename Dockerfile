## BUILD ##
FROM node:alpine AS build
WORKDIR '/app'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

## RUN ##
FROM nginx:alpine
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html