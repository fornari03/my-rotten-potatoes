# MyRottenPotatoes

## Project Overview

MyRottenPotatoes is a simple web application built with Ruby on Rails that allows users to manage a list of movies. This project was developed following the guidelines from Chapter 4 of the "Engineering Software as a Service" textbook with some enhancements.

It serves as a practical example of the Model-View-Controller (MVC) architecture, RESTful routing, and basic database interactions using ActiveRecord. The application supports full CRUD functionality for movies and includes a feature to sort the movie list by title or release date.

## Features

- List all movies from the database.

- View details of a movie.

- Add a new movie to the list.

- Edit the details of an existing movie.

- Delete a movie from the list.

- Sort the movie list by "Movie Title" or "Release Date".

## Prerequisites

Before you begin, ensure you have both Ruby and Rails installed on your machine.

## Setup and Installation

Follow these steps to get your local development environment set up and running.

1. Clone the repository:

    ```bash
    git clone https://github.com/fornari03/my-rotten-potatoes.git myrottenpotatoes

    cd myrottenpotatoes
    ```

2. Install Ruby Dependencies:
This will install all the required gems as specified in the Gemfile.

    ```
    bundle install
    ```

3. Set up the Database:

    ```shell
    rails db:setup
    ```

This command will create the database, load the schema, and seed it with initial data.


If you ever need to reset the database to its initial state, you can run:

```shell
rails db:reset
```

## Running the Application

Once the setup is complete, you can start the local Rails server.

1. Start the Rails Server:

    ```shell
    rails server
    ```

2. Access the Application:

    Open your web browser and navigate to http://localhost:3000. You should see the MyRottenPotatoes movie list.