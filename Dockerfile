FROM ubuntu:22.04 as base
WORKDIR /src

RUN apt update -y 
RUN apt install build-essential gfortran lua5.2 -y

# ==================================================
# c, cpp
FROM gcc as gcc
WORKDIR /src
COPY /src/. .
RUN gcc -Wall -Wextra -std=c99 -O3 -o cosine_similarity_c cosine_similarity.c -lm
RUN ./cosine_similarity_c > c.txt
RUN g++ -Wall -Wextra -std=c++11 -O3 -o cosine_similarity_cpp cosine_similarity.cpp
RUN ./cosine_similarity_cpp > cpp.txt

# ==================================================
# csharp
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS dotnet
WORKDIR /src
COPY /src/. .
RUN dotnet run cosine_similarity.cs > csharp.txt

# ==================================================
# fortran
FROM base as fortran
WORKDIR /src
COPY /src/. .
RUN gfortran -Wall -Wextra -O3 -o cosine_similarity_fortran cosine_similarity.f90 -lm
RUN ./cosine_similarity_fortran >> fortran.txt

# ==================================================
# go
FROM golang AS go
WORKDIR /src
COPY /src/. .
RUN go run cosine_similarity.go >> go.txt

# ==================================================
# openjdk
FROM openjdk:27-ea-slim AS openjdk
WORKDIR /src
COPY /src/. .
RUN javac cosine_similarity.java
RUN java cosine_similarity >> openjdk.txt

# ==================================================
# nodejs
FROM node AS node
WORKDIR /src
COPY /src/. .
RUN node cosine_similarity.js >> nodejs.txt

# ==================================================
# lua
FROM base as lua
WORKDIR /src
COPY /src/. .
RUN lua5.2 cosine_similarity.lua >> lua.txt

# ==================================================
# php
FROM php as php
WORKDIR /src
COPY /src/. .
RUN php cosine_similarity.php >> php.txt

# ==================================================
# perl
FROM perl as perl
WORKDIR /src
COPY /src/. .
RUN perl cosine_similarity.pl >> perl.txt

# =================================================
# python
FROM python as python
WORKDIR /src
COPY /src/. .
RUN python cosine_similarity.py >> python.txt

# =================================================
# R
FROM r-base as r-base
WORKDIR /src
COPY /src/. .
RUN Rscript cosine_similarity.R >> r.txt

# =================================================
# ruby
FROM ruby as ruby
WORKDIR /src
COPY /src/. .
RUN ruby cosine_similarity.rb >> ruby.txt

# =================================================
# rust
FROM rust as rust
WORKDIR /src
COPY /src/. .
RUN rustc -C opt-level=3 cosine_similarity.rs -o cosine_similarity_rust
RUN ./cosine_similarity_rust >> rust.txt

# =================================================
# typescript
FROM mcr.microsoft.com/devcontainers/typescript-node AS typescript
WORKDIR /src
COPY /src/. .
RUN npx tsc cosine_similarity.ts
RUN node cosine_similarity.js >> typescript.txt

# ==================================================
# final stage to collect results
FROM base
WORKDIR /result
COPY --from=gcc /src/c.txt .
COPY --from=gcc /src/cpp.txt .
COPY --from=dotnet /src/csharp.txt .
COPY --from=fortran /src/fortran.txt .
COPY --from=go /src/go.txt .
COPY --from=openjdk /src/openjdk.txt .
COPY --from=node /src/nodejs.txt .
COPY --from=lua /src/lua.txt .
COPY --from=php /src/php.txt .
COPY --from=perl /src/perl.txt .
COPY --from=python /src/python.txt .
COPY --from=r-base /src/r.txt .
COPY --from=ruby /src/ruby.txt .
COPY --from=rust /src/rust.txt .
COPY --from=typescript /src/typescript.txt .

CMD cp -r /result/*.txt /output/ && ls -l /output