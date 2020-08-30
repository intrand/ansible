if [ -z "${UID}" ]; then
	UID=0;
fi;

tag="latest";

if [ ! -z "${1}" ]; then
	tag="${1}";
fi;

alias ansible="docker run -ti --rm --net=host --user \"\${UID}\" -v /etc/passwd:/etc/passwd -v \"\${HOME}\":\"\${HOME}\" -v \"\${PWD}\":\"\${PWD}\" --workdir \"\${PWD}\" ansible:${tag}";
for i in config connection console doc galaxy inventory playbook pull test vault; do
	alias ansible-${i}="docker run -ti --rm --net=host --user \"\${UID}\" -v /etc/passwd:/etc/passwd -v \"\${HOME}\":\"\${HOME}\" -v \"\${PWD}\":\"\${PWD}\" --workdir \"\${PWD}\" ansible-${i}:${tag}";
done;
