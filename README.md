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

This App uses Ruby 2.7.2 and Rails 6.1.0. The App also uses a postgreSQL database.

### Note on Ruby Version 
I started the app in Ruby 3.0.0 but I ended up changing to 2.7.2 because I realized 3.0.0 hasn't yet been added to the normal ruby package manager either rvm or rbenv.

1. Clone down the repo
 
 In your terminal:
`git clone git@github.com:zachholcomb/remesh_project.git`

2. Initial Install of App
    
  In your terminal:
  - Navigate to the repository with `cd remesh_project`
  - Run `bundle install` to install all packages the project uses
 
3. Database Set Up
  
  In your terminal:
  - Run `rails db:create` (Creates database)
  - Run `rails db:migrate` (Creates database tables)
  - Run `rails db:seed` (Seeds database with test data)
  
4. To interact with the Application
  
  In your terminal:
  - Run `rails s` (starts Rails development server)
  - With this running in your terminal, you can now navigate to `localhost:3000` in your browser.
  
  ## ************** NOTE ON WEBPACK **************
  
If you run into an issue with opening your app `Webpacker::Manifest::MissingEntryError in Conversations#index` when opening the app, this issue is a [documented problem](https://github.com/rails/webpacker/issues/1295) with webpack and Rails and can be fixed running the following commands:
   
   In your terminal:
   - Close your Rails server with `Ctrl-C`
   - Then run the command `bundle exec rails webpacker:install` (This installs the missing webpack package)
   - Then rerun your server with `rails s` and navigate to `localhost:3000`
  
4. To Run the Test Suite
  
  In your terminal:
  - Run `bundle exec rspec` (If you have server running you'll need to close it with `Ctrl-C`)
  - If set up correctly, you should have 23 passing tests!
  
  
# Reflections

This was a really fun project. Main things I would continue working:

 - Pagination for the conversations index page
 - Pagination for message threads in a conversation's show page
 - Other optimizations for the conversation show page as well
 - Obviously there isn't any styling so I would want to add it -- lots of it
 - Autocomplete functionality for the search bar would be cool as well
 - I would also probably limit the redirects between pages, using modals for the message input might be nice
