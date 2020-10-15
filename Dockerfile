FROM ubuntu:18.04

RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       ca-certificates \
       curl \
       git \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

ENV HUGO_VERSION="0.76.5"

RUN set -ex \
  && curl -fsSLO --compressed "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" \
  && curl -fsSLO --compressed "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_checksums.txt" \
  && grep " hugo_${HUGO_VERSION}_Linux-64bit.tar.gz\$" hugo_${HUGO_VERSION}_checksums.txt | sha256sum -c - \
  && tar -xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -C /usr/local/bin/ \
  && rm hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
  && rm hugo_${HUGO_VERSION}_checksums.txt \
  && hugo version


CMD ["/workspace/scripts/deploy.sh"]