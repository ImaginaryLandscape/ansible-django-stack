
SHELL=bash

# Example:
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




new-env:
	virtualenv rackenv -p python2.7
	ln -s rackenv rack
	rack/bin/pip install -r requirements.txt

clean:
	unlink rack
	rm -rf rackenv

play:
	ansible-playbook -i inventory.yml --extra-vars "@extra-vars.yml" ansible/playbooks/playbook-rax.yml -vvvv