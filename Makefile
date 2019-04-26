
SHELL=bash

# make up SITE_NAME=foo

new:
	vagrant	halt ${SITE_NAME}
	vagrant destroy -f ${SITE_NAME}
	vagrant up ${SITE_NAME}
	vagrant ssh ${SITE_NAME}

up:
	vagrant up ${SITE_NAME}

provision:
	vagrant provision ${SITE_NAME}

ssh:
	vagrant ssh ${SITE_NAME}

halt:
	vagrant	halt ${SITE_NAME}

suspend:
	vagrant	suspend ${SITE_NAME}

destroy:
	vagrant	halt ${SITE_NAME}
	vagrant destroy -f ${SITE_NAME}

copy:
	cp -p example.Vagrantfile Vagrantfile
	cp -p extra-vars.example.yml extra-vars.yml
