# syntax=docker/dockerfile:1.3
ARG ALPINE_VERSION=3.14

# diun.platform=linux/amd64
FROM alpine:${ALPINE_VERSION}

# diun.watch_repo=true
# diun.max_tags=10
# diun.platform=linux/amd64
COPY --from=crazymax/yasu / /

# diun.watch_repo=true
# diun.include_tags=^\d+\.\d+\.\d+$
# diun.platform=linux/amd64
RUN --mount=type=bind,target=.,rw \
  --mount=type=bind,from=crazymax/docker:20.10.6,source=/usr/local/bin/docker,target=/usr/bin/docker \
  yasu --version

# diun.platform=linux/amd64
# diun.metadata.foo=bar
RUN --mount=type=bind,target=.,rw \
  --mount=type=bind,from=crazymax/ddns-route53:foo@sha256:9cb3af44cdd00615266c87e60bc05cac534297be14c4596800b57322f9313615,source=/usr/local/bin/ddns-route53,target=/usr/local/bin/ddns-route53 \
  ddns-route53 --version
