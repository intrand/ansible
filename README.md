# ansible

simple ansible in docker

# build locally

```sh
./build.sh 9.1.0 # or whatever version of ansible you like
```

# aliases / using the containers

```sh
. ./aliases.sh 9.1.0 # or whatever version of ansible you like
```

```sh
cd /some/path/to/ansible/playbooks_and_inventory # this 'cd' is not optional. $PWD is passed into the container
ansible-playbook -i ./inventory/prod.yml ./playbooks/mundane_task.yml # paths must be a relative path within $PWD
```

There are images made for each ansible command with their entrypoints set to the respective binary. You may choose to only build one image and override its entrypoint if you wish. There's no real difference other than the number of docker images that are tagged. The disk space difference is in the order of kilobytes.
