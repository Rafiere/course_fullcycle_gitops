# Utilizaremos o multistage build.
# Abaixo, temos a imagem de build.
FROM golang:1.20 as build
WORKDIR /app
COPY . .
# O CGO_ENABLED diz que não utilizaremos nada do "C", o GOOS é o sistema operacional e o GOARCH é a plataforma.
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server

# Imagem de run
FROM scratch
WORKDIR /app
#Copiaremos o servidor da etapa anterior para esse container.
COPY --from=build /app/server .