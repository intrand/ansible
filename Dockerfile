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
		cargo \
		sudo && \
	mkdir -p /etc/sudoers.d && \
	printf "#0    ALL=(ALL:ALL) NOPASSWD: ALL\n" | tee /etc/sudoers.d/0 && \
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
		jmespath \
		dnspython;
ENTRYPOINT ["ansible-playbook"]
