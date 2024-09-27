# Runs on Alpine container, latest version.
FROM alpine
# Copy the content to the container.
COPY . /
RUN chmod +x /entrypoint.sh && \
	apk update && \
	apk add git openssh rsync


ENTRYPOINT [ "/entrypoint.sh" ]
