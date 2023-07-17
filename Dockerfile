FROM golang:1.19-alpine AS builder
ENV CGO_ENABLED=0
WORKDIR /backend
COPY backend/go.* .
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go mod download
COPY backend/. .
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go build -trimpath -ldflags="-s -w" -o bin/service

FROM --platform=$BUILDPLATFORM node:18.12-alpine3.16 AS client-builder
WORKDIR /ui
# cache packages in layer
COPY ui/package.json /ui/package.json
COPY ui/package-lock.json /ui/package-lock.json
RUN --mount=type=cache,target=/usr/src/app/.npm \
    npm set cache /usr/src/app/.npm && \
    npm ci
# install
COPY ui /ui
RUN npm run build

FROM alpine
LABEL org.opencontainers.image.title="Redis Enterprise" \
    org.opencontainers.image.description="Docker extension for Redis Enterprise" \
    org.opencontainers.image.vendor="Virag Tripathi" \
    com.docker.desktop.extension.api.version="0.3.4" \
    com.docker.extension.screenshots="https://github.com/redis-field-engineering/redis-enterprise-docker-extension/blob/main/docs/screenshots/redis-enterprise-docker-extension.png" \
    com.docker.desktop.extension.icon="https://raw.githubusercontent.com/redis-field-engineering/redis-enterprise-docker-extension/main/redis-enterprise.svg" \
    com.docker.extension.detailed-description="Redis Enterprise Docker Extension allows you to create Redis Enterprise Databases without having to install Redis Enterprise locally or manually create a Redis Enterprise Docker container.
Redis Enterprise Docker Extension lets you create Redis Enterprise Databases using the free tier i.e. 30-day FREE TRIAL!" \
    com.docker.extension.publisher-url='[{"title":"GitHub", "url":"https://github.com/redis-field-engineering/redis-enterprise-docker-extension/"}]' \
    com.docker.extension.additional-urls='[{"title":"GitHub", "url":"https://github.com/redis-field-engineering/redis-enterprise-docker-extension/"}]' \
    com.docker.extension.categories="Development" \
    com.docker.extension.changelog="<p> Extension changelog<ul><li>New Feature </li>  <li>Support for both amd64 and arm64</li></ul></p>"

COPY --from=builder /backend/bin/service /
COPY docker-compose.yaml .
COPY metadata.json .
COPY redis-enterprise.svg .
COPY --from=client-builder /ui/build ui
CMD /service -socket /run/guest-services/backend.sock
