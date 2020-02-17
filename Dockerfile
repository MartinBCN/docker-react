FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# New From statement means the previous block is finished
FROM nginx
# copy build from builder
COPY --from=builder /app/build /usr/share/nginx/html
