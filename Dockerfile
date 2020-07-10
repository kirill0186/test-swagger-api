FROM node:10

USER root

COPY . .
RUN npm -g install @apidevtools/swagger-cli && swagger-cli bundle swagger.yml --outfile build/swagger.json --type json

FROM swaggerapi/swagger-ui

COPY --from=0 "/build" /app/

ENV SWAGGER_JSON "/app/swagger.json"


