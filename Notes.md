# issues

- once the new box is packed, running it with vagrant: packages do not seem to be installed, only docker, wheras the installation has been through all steps..
- issue to get in with an ssh, the idea is then to write a scrit to install the ssh key in the authorized_keys file
# solutions

- solve the issue with vagrant not entering the box: https://openedx.atlassian.net/wiki/spaces/OXA/pages/157802739/Vagrant+is+stuck+Authentication+failure.+Retrying...
  - this allow to access and unlock the situation
  - but maybe need to do it properly in the first place
- solve the role mulpi role directory in packer: https://github.com/hashicorp/packer/issues/1000
