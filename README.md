VagrantTest
=====


## Requirements

You'll need to have the following items installed before continuing.

  * [vagrant](https://www.vagrantup.com/)
  * [virtualbox](https://www.virtualbox.org/)
  * [chefDK](https://downloads.chef.io/chef-dk/)
  * gem install serverspec rake

  ```
  vagrant init ubuntu/trusty64
  berks cookbook chef-repo
  ```

  ```
  vagrant plugin install vagrant-omunibus
  vagrant plugin install vagrant-berkshelf
  ```


## Quickstart
  (windows gitbash)

  ```
  vagrant up
  vagrant ssh
  (vagrant reload --provision)
  ```

