
SHELL=bash

# make up SITE=foo

new:
	vagrant	halt ${SITE}
	vagrant destroy -f ${SITE}
	vagrant up ${SITE}
	vagrant ssh ${SITE}

up:
	vagrant up ${SITE}

provision:
	vagrant provision ${SITE}

ssh:
	vagrant ssh ${SITE}

halt:
	vagrant	halt ${SITE}

suspend:
	vagrant	suspend ${SITE}

destroy:
	vagrant	halt ${SITE}
	vagrant destroy -f ${SITE}

copy:
	cp -p example.Vagrantfile Vagrantfile
	cp -p extra-vars.example.yml extra-vars.yml
