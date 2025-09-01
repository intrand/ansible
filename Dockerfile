FROM alpine:3.22.1
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
		zip \
		unzip \
		apg \
		cargo \
		sudo \
		git && \
	mkdir -p /etc/sudoers.d && \
	printf "#0    ALL=(ALL:ALL) NOPASSWD: ALL\n" | tee /etc/sudoers.d/0 && \
	printf "#500    ALL=(ALL:ALL) NOPASSWD: ALL\n" | tee /etc/sudoers.d/500 && \
	printf "#1000    ALL=(ALL:ALL) NOPASSWD: ALL\n" | tee /etc/sudoers.d/1000 && \
	chmod 0440 \
		/etc/sudoers.d/0 \
		/etc/sudoers.d/500 \
		/etc/sudoers.d/1000 && \
	python3 -m pip install --break-system-packages --no-cache-dir --upgrade \
		pip && \
	python3 -m pip install --break-system-packages --no-cache-dir --upgrade \
		wheel \
		setuptools && \
	python3 -m pip install --break-system-packages --no-cache-dir --upgrade \
		ansible==${version} \
		ansible-runner \
		github3.py \
		mitogen \
		kubernetes \
		PyYAML \
		docker \
		jmespath \
		dnspython \
		hvac \
		proxmoxer;
