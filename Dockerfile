FROM alpine
LABEL "repository"="https://github.com/d4r1091/git-update-tag-patch"
LABEL "homepage"="https://github.com/d4r1091/git-update-tag-patch"
LABEL "maintainer"="Dario Carlomagno"

COPY entrypoint.sh /entrypoint.sh

RUN apk update && apk add bash git curl jq

ENTRYPOINT ["/entrypoint.sh"]
