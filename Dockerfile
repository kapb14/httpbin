FROM python:2-alpine

WORKDIR /httpbin

COPY --chown=nobody:nobody . /httpbin

RUN apk add --no-cache --no-progress --upgrade \
      ca-certificates \
      libffi \
      libstdc++ \
      nano \
      bash \
      curl \
      tini \
  && apk add --no-cache --no-progress --upgrade --virtual \
      build-deps \
      build-base \
      libffi-dev \
  && pip install --no-cache-dir --disable-pip-version-check \
      gunicorn /httpbin \
  && apk del build-deps

ENV HTTPBIN_PORT=8080 \
    DEBUG=false \
    HTTPBIN_TRACKING=false \
    WEB_CONCURRENCY=2 \
    GUNICORN_TMPDIR=None

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["gunicorn", "--config", "gunicorn.conf.py", "httpbin:app"]

EXPOSE ${HTTPBIN_PORT}

HEALTHCHECK --interval=30s --timeout=10s --retries=2 \
  CMD curl -f "http://127.0.0.1:${HTTPBIN_PORT}/status/200"

