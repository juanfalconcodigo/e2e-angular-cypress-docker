# FROM  node:19-alpine3.17 AS dev-deps
# WORKDIR /app
# COPY package.json package.json
# RUN npm install

FROM cypress/base:16.16.0
RUN mkdir -p /app
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npx cypress verify
CMD ["npm", "run", "all-tests:report"]

# FROM  node:19-alpine3.17 AS builder
# WORKDIR /app
# COPY --from=dev-deps /app/node_modules /node_modules
# COPY . .
# RUN npm run build

# FROM nginx:1.23.3 as deploy
# COPY --from=builder /app/dist/angular-e2e-cypress /usr/share/nginx/html
# RUN rm /etc/nginx/conf.d/default.conf
# COPY /nginx/nginx.conf /etc/nginx/conf.d
# CMD [ "nginx","-g","daemon off;" ]



