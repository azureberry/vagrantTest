VagrantTest
=====


## Requirements

You'll need to have the following items installed before continuing.

  * [vagrant](https://www.vagrantup.com/)
  * [virtualbox](https://www.virtualbox.org/)
  * [chefDK](https://downloads.chef.io/chef-dk/)

  ```
  vagrant init ubuntu/trusty64
  vagrant plugin install vagrant-omunibus
  vagrant plugin install vagrant-berkshelf
  berks cookbook chef-repo
  berks install
  ```


## Quickstart
  (windows gitbash)

  ```
  vagrant up
  vagrant ssh
  ```

