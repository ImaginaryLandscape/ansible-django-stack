# vagrant up xenial
# vagrant up trusty

VAGRANTFILE_API_VERSION = "2"

#16.04
UBUNTU_VSERION = "ubuntu/xenial64" # ubuntu/trusty64 | ubuntu/bionic64 | centos/7
SITE_NAME = "site_name"
GITHUB_REPO = "github/repo"
GITHUB_BRANCH = "github/branch"
HOST_HTTP_PORT = 8880
HOST_HTTPS_PORT = 4443
HOST_EXTRA_PORT = 18000
DB_DUMP_FILE = "/local/path/to/your/db-dump.sql"
MEDIA_ZIP = "/local/path/to/your/media.zip"
PYTHON_VERSION = "python3.5"
SITE_USER_SSH_PRIVATE_KEY_SRC = "path/to/your/key"
SYNCED_FOLDER_SRC = "/home/marat/Workspace/synced-folder/ansible/#{SITE_NAME}"
SYNCED_FOLDER_DEST = "/srv/sites/#{SITE_NAME}/proj/#{SITE_NAME}"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box

    # OPTIONAL: If you are using VirtualBox, you might want to use that to enable
    # NFS for shared folders. This is also very useful for vagrant-libvirt if you
    # want bi-directional sync
    #config.cache.synced_folder_opts = {
    #  type: :nfs,
    #  # The nolock option can be useful for an NFSv3 client that wants to avoid the
    #  # NLM sideband protocol. Without this option, apt-get might hang if it tries
    #  # to lock files needed for /var/cache/* operations. All of this can be avoided
    #  # by using NFSv4 everywhere. Please note that the tcp option is not the default.
    #  mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    #}
    # For more information please check http://docs.vagrantup.com/v2/synced-folders/basic_usage.html
  end

  config.vm.define SITE_NAME, autostart: false do |box|
    box.vm.box = UBUNTU_VSERION
    box.vm.network "forwarded_port", guest: 80, host: HOST_HTTP_PORT, auto_correct: true
    box.vm.network "forwarded_port", guest: 443, host: HOST_HTTPS_PORT, auto_correct: true
    box.vm.network "forwarded_port", guest: 8000, host: HOST_EXTRA_PORT, auto_correct: true
    # box.vm.network :private_network, ip: PRIVATE_IP
    box.vm.synced_folder ".", "/vagrant", disabled: false
    box.vm.provision :ansible do |ansible|
      ansible.playbook = "ansible/playbooks/playbook-all.yml"
      #ansible.playbook = "ansible/playbooks/playbook-install-python2.yml"
      #ansible.playbook = "ansible/playbooks/add-user.yml"
      #ansible.playbook = 'ansible/playbooks/playbook-docker.yml'
      ansible.verbose = "vvvv"
      ansible.extra_vars = {
      #    "user_to_add" => "testb"

           "install_nginx" => true,
           "install_letsencrypt" => true,
           "install_ntp" => true,
           "install_unattended_updates" => true,
           "install_docker" => false,
           "install_postgis" => false,
           "install_postgres" => true,
           "install_mysql" => false,
           "install_redis" => false,
           "install_elasticsearch"=> false,

           # Set project parameters:
           "site_name" => SITE_NAME,
           "git_repo" => GITHUB_REPO,
           "git_branch" => GITHUB_BRANCH,
           "python_version" => PYTHON_VERSION,
           "site_user_ssh_private_key_src" => SITE_USER_SSH_PRIVATE_KEY_SRC,
           "db_dump_file" => DB_DUMP_FILE,
           "media_content" => MEDIA_ZIP,

           # Ubuntu 16.04 settings (DONT CHANGE - Needed for Ansible)
           #"ansible_python_interpreter" => "/usr/bin/python2.7",
           "ansible_python_interpreter" => "/usr/bin/python3",  # ansible 2.4+ with python3 support
      }
      ansible.become = true
      ansible.limit = "all"
    end
    # Ability to edit from the local machine with an IDE
    box.vm.synced_folder SYNCED_FOLDER_SRC, SYNCED_FOLDER_DEST,
      disabled: false,
      # The ID corresponding to SITE_NAME user (should be correct)
      owner: "1002",
      group: "1003"
  end


  
  config.vm.define 'trusty', autostart: false do |box|
      box.vm.box = "ubuntu/trusty64"
      box.vm.network "forwarded_port", guest: 80, host: 8081
      box.vm.network "forwarded_port", guest: 443, host: 4444
      box.vm.provision :ansible do |ansible|
        ansible.playbook = "ansible/playbooks/playbook-all.yml"
        ansible.verbose = "vvvv"
        ansible.extra_vars = {
             "install_nginx" => true,
             "install_letsencrypt" => true,
             "install_ntp" => true,
             "install_unattended_updates" => true,
             "install_docker" => true,
             "install_postgis" => true,
             "install_postgres" => true,
             "install_mysql" => true,
             "install_redis" => true,
             "site_name" => "chipy",
             "git_repo" => "https://github.com/chicagopython/chipy.org.git",
             "python_version" => "python2.7",
        }
        ansible.become = true
        ansible.limit = "all"
      end
  end

  config.vm.define 'centos7', autostart: false do |box|
      box.vm.box = "centos/7"
      box.vm.network "forwarded_port", guest: 80, host: 8081
      box.vm.network "forwarded_port", guest: 443, host: 4444
      box.vm.provision :ansible do |ansible|
        ansible.playbook = "ansible/playbooks/playbook-all.yml"
        ansible.verbose = "vvvv"
        ansible.extra_vars = {
             "install_nginx" => true,
             "install_ntp" => true,
             "install_unattended_updates" => true,
             "install_postgis" => true,
             "install_postgres" => true,
             "install_mysql" => true,
             "install_redis" => true,
             "site_name" => "jazstudios",
             "python_version" => "python2.7",
        }
        ansible.become = true
        ansible.limit = "all"
      end
  end


end
