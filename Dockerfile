FROM alpine:3.10

LABEL "repository"="https://github.com/d4r1091/git-update-tag-patch"
LABEL "homepage"="https://github.com/d4r1091/git-update-tag-patch"
LABEL "maintainer"="Dario Carlomagno"

RUN apk update && apk add bash git curl jq

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
