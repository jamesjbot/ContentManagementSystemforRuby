# Learning Ruby On Rails

## Overview

This is a simple content managment system for learning Ruby on Rails. 

## Technologies and Concepts Used
   
Ruby on Rails, MySQL, Postgres, Heroku, RubyGems, Authentication, MVC Design pattern, Resourceful routes, CRUD - REST mapping, sanitizing content, data validation, cookies, sessions, and using assets.

   Uses Ruby 2.4.0, Rails 5.0.1  
   
## Example usage
   As a public user click thru each of the links in the side bar.  

   You can see this website in use at https://sails-full-of-wind.herokuapp.com/  

## How to set up the dev environment
* Follow the guide on http://guides.rubyonrails.org/getting_started.html to get started with rails development
* Follow the guide on https://dev.mysql.com/doc/refman/5.7/en/installing.html to install MySQL
* Download the repository: https://github.com/jamesjbot/LearningRubyOnRails
* Navigate into the directory of simple_cms
* Start MySQL with the command: `mysql.server start`
* Install any necessary RubyGems with the command: `bundle install`
* Advance the MySQL server thru migrations with the command: `rails db:migrate`
* Start rails with the command: `rails server`
* To use a public user navigate to: http://localhost:3000/
* To user the administration page, navigate to http://locahost:3000/admin

### Administration
* To work from the command line use the command: `rails console`
* Give yourself an administrator account with the commands: 
```
$ a = AdminUser.new(:username => 'username', :password => 'password', :first_name => 'user', :last_name => 'name', :email => 'username@somecompany.com')
$ a.save
```
Now you can create create delete update content from the administration page.

#### Using Postgres instead of MySQL
* Install Postgres you can do this by adding `gem 'pg'` to you gemfile or use the command: `brew install postgresql`
* Run the command `bundle install`
* Run the command `rake db:migrate`
* Run the command `rails console`
* Give yourself an administrator account using code from the administration section above.

## How to ship a change
Changes are not accepted at this time
 
## Change log
* 03-10-2017 Lessons all completed
* 02-26-2017 Initial commit

## License and author info
MIT License
Author: jongs.j@gmail.com