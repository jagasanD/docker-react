FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build
# using Ngx server to run reactjs application on production
#copy the builder folder to Ngx html folder 
#react as single page application so few page is there in builder folder
#that we can use for run the application.
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

