FROM node:16 AS builder
WORKDIR /app
COPY . .
RUN yarn
RUN yarn build facade

FROM node:16-alpine
WORKDIR /app
COPY --from=builder /app ./
CMD ["npm", "run", "start:prod", "dist/main"]