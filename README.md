# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby & Rails version

    Install Ruby 3.2.0

    Insatll Rails 7.0.4.2

* Node.js Version

    Install Node.js v18.14.2

* Operating System

    Ubuntu/Linux

* Configuration

    Clone the project by running 'git clone https://github.com/nomanajmal009/Quizzer.git' on your terminal

    Run 'bundle install' to install the gems and dependencies

* Database creation

    Run 'rails db:create' for creating database in postgresql

    Run 'rails db:migrate' for creating tables/columns in database

* Database initialization

    Run 'rails db:seed' for creating dummy users to access the web app

* How to run the project

    Run 'rails s' command to run the server

    Open 'http://127.0.0.1:3000' url in your browser

* Mobile API Routes for students

    1. Login  '/api/v1/login' => get

        a. Set request headers as { email: 'student@example.com', password: '12345678'} 

        b. In result you will get user record from which api_token will be used for requesting the other endpoints.

    Note : Set request headers as { authorization: 'api_token'} => token_type: Bearer Token
    for using other api endpoints except login.

    2. Logout '/api/v1/logout' => post

    3. Get Test '/api/v1/test/:id' => get

    4. Get All Tests '/api/v1/list_of_tests' => get

    5. Save Test '/api/v1/save_test' => post

