# Acebook - SwiftUI Project

Welcome to Acebook, a small social media-focussed group project where we dove into Swift development for the first time! 
This was uncharted territory, navigating the challenge of applying our learnings to a new statically typed language for a week, as well as learning a suite of new tools including Xcode, SwiftUI, and Figma.

## Technologies used

Frontend: SwiftUI

Backend: The backend application was provided in this instance using the MERN stack (https://github.com/Courtney8606/Resource-Acebook-Swift-Backend) 

## Project Goals

* Developing a multi-view SwiftUI application using lists and complex states 
* Designing iOS app mockups using Figma
* Integrating a SwiftUI app with an existing backend using RESTful APIs

## Key Features

* User Sign up and Log in
* Post creation
* Post 'likes'
* On it's way - Commenting on posts

## Installation instructions

These instructions are for macOS, and it is assumed that that the following are already installed:

* NVM
* Node.js
* npm
* Xcode
* TablePlus

After cloning both repositories, navigate to the backend api folder and execute the following commands

**Install any dependencies**
* npm install

**Install MongoDB if required**
* brew tap mongodb/brew
* brew install mongodb-community@6.0

Now restart your terminal and navigate back to the api folder

* brew services start mongodb-community@6.0

**Create a file api/.env with contents confirmed directly with myself**

**Set up a new mongoDB connection in Tableplus**
* URL: mongodb://0.0.0.0/acebook

**Start your backend server**
* npm run dev

**You will now open the app**
* Open the frontend project folder in Xcode

At this stage, you should be able to build and run the app in Xcode
