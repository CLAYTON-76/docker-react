FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
#don't need volumes here bc this is permanent... not chages to monitor
RUN npm run build

# a from statement automatically stops the previous block and starts new
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#don't need a run command, bc nginx runs by default...
