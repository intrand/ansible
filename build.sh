#!/bin/sh
root="$(dirname -- "$0")"

if [ -z "${1}" ]; then
	echo "You MUST specify the version of ansible you want to install.";
	exit 1;
fi;

version="${1}";

docker build --build-arg "version=${version}" -t ansible-base:${version} -f "${root}/Dockerfile" "${root}" || exit 1;
docker build --build-arg "version=${version}" -t ansible:${version} -f "${root}/ansible.dockerfile" "${root}" || exit 1;
for i in config connection console doc galaxy inventory playbook pull test vault; do
	if [ $(docker image ls | grep -c "ansible-${i}:${version}") -gt 0 ]; then
		docker image rm "ansible-${i}:${version}";
	fi;
	echo "Building ansible-${i}:${version}...";
	docker build --build-arg "version=${version}" -t "ansible-${i}:${version}" -f "${root}/ansible-${i}.dockerfile" "${root}" || exit 1;
done;
