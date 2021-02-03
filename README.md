# Description

This is a very simplified version of the Remesh application. This app has 3 different models.

### Conversations
Conversations have messages threads.

### Messages
Messages can have many thoughts or comments attached to them.

### Thoughts
Thoughts are attached to Messages and related to conversations through Messages.

The main functionality of the app is to view and create new Conversations, Messages, and Thoughts. In addition, there is a search functionality that gives users the ability to search conversations by conversation title.

# Set Up

This App uses Ruby 3.0.0 and Rails 6.1.0. The App also uses a postgreSQL database.

1. Clone down the repo

`git clone git@github.com:zachholcomb/remesh_project.git`

2. Initial Install of App

  - Navigate to the repository with `cd remesh_project`
  - Run `bundle install` to install all packages the project uses
 
3. Database Set Up

  - Run `rails db:create` (Creates database)
  - Run `rails db:migrate` (Creates database tables)
  - Run `rails db:seed` (Seeds database with test data)
  
4. To interact with the Application

  - Run `rails s` (starts Rails development server)
  - With this running in your terminal, you can now navigate to localhost:3000 in your browser.
  
4. To Run the Test Suite
  
  - Run `bundle exec rspec`
  - If set up correctly, you should have 23 passing tests!
