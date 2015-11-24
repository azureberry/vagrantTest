VagrantTest
=====


## Requirements

You'll need to have the following items installed before continuing.

  * [vagrant](https://www.vagrantup.com/)
  * [virtualbox](https://www.virtualbox.org/)
  * [chefDK](https://downloads.chef.io/chef-dk/)


(初回)

  ```
  vagrant init ubuntu/trusty64
  berks cookbook chef-repo
  serverspec-init
  ```

  ```
  vagrant plugin install vagrant-omunibus
  vagrant plugin install vagrant-berkshelf
  (vagrant plugin install sahara )
  ```


## Quickstart
  (windows gitbash)

  ```
  vagrant up
  vagrant ssh
  (vagrant reload --provision)
  ```

(serverspec test)

  ```
  cd /vagrant/
  rake
  ```