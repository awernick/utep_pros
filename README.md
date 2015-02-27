# UTEP Pros Event Scheduling system

This is a very powerful scheduling system built in Ruby on Rails.

Version 0.1 alpha

### Features:

* UTEP SSO Integration

## Vagrant

Rubento is used as the development enviornment. Documentation can be found [here](https://github.com/awernick/rubento-box)

To start the Rubento server
```shell
# Fire up Vagrant box
vagrant up
vagrant ssh

# Start Rails server
cd /vagrant
rvmsudo rails server -b 0.0.0.0 -p 80
```
The server is accessible at
```
192.168.33.10
```

But in order to use SSO features, add this to your /etc/hosts file
```
192.168.33.10     dev.uteppros.utep.edu
```
The webapp will now be available at `dev.uteppros.utep.edu` with full SSO capabilities.

## Copyright and license

UTEP Pros was developed by Alan Wernick and Guillermo Vargas. Copyright 2014-2015.

Licensed under the **[Apache License, Version 2.0] [license]** (the "License");
you may not use this software except in compliance with the License.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
