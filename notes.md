# Notes

You can copy Devise views (for customization) to your app by running:

       rails g devise:views

## Commands

### error messages

in rails c:  to find out why something is not saving
 user.errors.messages

<!-- you may need to append the rake commands with: `bundle exec` -->
### local commands

git push
rake db:migrate VERSION=0
rake db:migrate
rake db:seed
rails console

### heroku commands

git push heroku
heroku run rake db:migrate VERSION=0
heroku run rake db:migrate
heroku run rake db:seed
heroku run rails console
