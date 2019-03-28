FROM python:2-alpine

WORKDIR /httpbin
COPY --chown=nobody:nobody . /httpbin

RUN apk --update add --update ca-certificates libffi libstdc++ nano bash curl && \
    apk add --no-cache --virtual build-deps build-base libffi-dev && \
    pip install --no-cache-dir gunicorn /httpbin && \
    apk del build-deps && \
    rm -rf /var/cache/apk/*

ENV WEB_CONCURRENCY=4

USER nobody

EXPOSE 80

CMD ["gunicorn", "-b", "0.0.0.0:80", "httpbin:app"]
