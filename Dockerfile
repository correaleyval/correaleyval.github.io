FROM python:3.8 AS build-env
WORKDIR /web

COPY . ./

RUN pip install mkdocs-material mkdocs-jupyter && mkdocs build

FROM nginx:alpine

COPY --from=build-env /web/site/ /usr/share/nginx/html/