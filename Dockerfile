FROM alpine:latest
ARG version
RUN	apk add --no-cache \
		py3-pip \
		python3-dev \
		gcc \
		musl-dev \
		libffi-dev \
		openssl-dev \
		openssh-client \
		tar \
		apg && \
	pip3 install --no-cache-dir wheel && \
	pip3 install --no-cache-dir \
		ansible==${version} \
		github3.py \
		mitogen \
		openshift \
		PyYAML \
		docker;
ENTRYPOINT ["ansible-playbook"]
