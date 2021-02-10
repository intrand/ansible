FROM alpine:3.13.1
ARG version
RUN	apk add --no-cache \
		py3-pip \
		python3-dev \
		gcc \
		musl-dev \
		libffi-dev \
		openssl-dev \
		openssh-client \
		sshpass \
		tar \
		apg \
		cargo && \
	python3 -m pip install --no-cache-dir --upgrade \
		pip && \
	python3 -m pip install --no-cache-dir --upgrade \
		wheel \
		setuptools && \
	python3 -m pip install --no-cache-dir --upgrade \
		ansible==${version} \
		github3.py \
		mitogen \
		openshift \
		PyYAML \
		docker \
		jmespath;
ENTRYPOINT ["ansible-playbook"]
