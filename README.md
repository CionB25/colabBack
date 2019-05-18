# The CoLab API

## Overview
The CoLab API is Ruby on Rails back-end for A Github Community which allows users to shows what projects they are currently working on, which are available to collaborate. The app also provides the ability for users to search a feed of repositories to request the collaboration on other user's repositories. View here: https://github.com/CionB25/colabBack

## Technology
* Rails
* ActiveRecord, including Serializers
* GraphQL API Requests
* Bcrypt/JWT

## GraphQL
Utilized special calls to Github GraphQL API to assist with creating user database.

## Database Structure
* Repository
* User
* Request
* User/Repo
* User/Request

Users, Repositories & Requests all have their own unique routes to facilitate API calls via RESTful API protocol.

## User Authentication
User authentication and cookie storage through JSON Web Tokens (JWT)
Logs users in on page load if their localStorage has a valid token.
