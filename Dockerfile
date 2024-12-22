FROM node:16.20.0-alpine

RUN apk add --no-cache bash

WORKDIR /app

COPY ./wait-for .

COPY ./backend .

RUN chmod +x ./wait-for && \
    chmod +x ./bin/www
ENV NODE_ENV=production JWT_SECRET=aaa967f1-2b08-4dde-a086-5df6bc8eff91 JWT_EXPIRES_IN=604800

COPY ./frontend/build ./public

CMD ["npm", "start"]
