FROM node:11.3.0-alpine as build-stage
WORKDIR /bloob
#COPY package*json ./
#RUN npm i npm@latest -g
#RUN npm install
COPY . .
#RUN npm run build
# production stage
FROM nginx:1.13.12-alpine as production-stage
COPY --from=build-stage /bloob/dist /usr/share/nginx/html/bloob
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
