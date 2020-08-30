ARG version
FROM ansible-base:${version}
ENTRYPOINT ["ansible-connection"]
