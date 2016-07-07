# c36 NodeJS+PostGres Backend Seed Project

## Introduction
This repo is designed to demonstrate a nodeJS backend. The idea is looking at the examples in this repo to help you build out your own to support your application. The design is explained in more detail below but set up so you don't need to completely understand how it works to get your application up and running. But we challenge you to understand the code, try to improve it, or maybe add tests!

## Getting things up and running

To get setup the project in cloud9 you will need to do the following:

1. Create a new workspace. Fill out the details and make sure to put the `https` github url in **"Clone from Git or Mercurial URL"** and choose the `node.js` template. Check out [workspace creation](docs/images/creating_a_workspace) for more detail. Once you finish you should see the following:
> ![Fill this out!](docs/images/created_workspace.png)

2. In the bash (blue window in picture above) you need to run `npm install`. This command will install all the dependencies listed in the `package.json` file into `/node_modules` directory. Please do not modify files in this folder and if you want to learn more about [package.json](https://docs.nodejitsu.com/articles/getting-started/npm/what-is-the-file-package-json) you should!

3. You will need to have a `config.js` in your `/backend` directory. **You do not need to worry about this. We will provide you with this file.** This file will need to look like the following:
>```javascript
>'use strict';
>
>const heroku = {
>	DATABASE_CONNECTION_URL : "postgres://username:password@heroku-postgres-host:heroku-postgres-port/heroku-database-name?ssl=true"
>};
>
>module.exports = heroku;
>```

4. Now you should be able to start the application by running `npm start` in the bash **(It is important that you run this from the top level directory).** The application has some relative paths that depend on the command running on in this directory.

## Building your backend
This is an explanation about how to use the set up here to make your backend work. The folder structure a little non conventional because you might not necessarily name everything the same name in a project. I would encourage you to follow this format to make things easier as a mental model for your team to follow. After you have the project up and running then to try playing around with the structure of things. Ultimately your folder structure and code organization should be what makes the most sense for your team.

### Starting with the `/frontend` directory:

In here you can put all your html, css, and javascript in the respective directories. To start, keep these directories flat and not creating sub directories inside `/html`, `/css`, or `/js`. If you want to add subdirectories you will have to make sure you understand how that affects the references in your backend code.
w
### Making a router

We created a directory called `/routers` were you can create routers for the different html pages. The idea is that every router will have the single responsibilty for each page. When you create a router you will need to use the `router.get('route', callbackFn())` or `router.post('route', callbackFn())` to make the backend serve your html page, results from a database query, or inserting data into the database. Examples of this are seen in `routers/helloworld.js` and `routers/trainsList.js`.

The following is a template of what the file will look like. You will need to make sure you have these for everything to work correctly.

>```javascript
>'use strict';
>
>var router = require('express').Router();
>var database = require('../c35_modules/database');
>module.exports = function() {
>  
> 	//put your router code here.
>
>	return router
>}();
>```

#### Types of routes
I thought I would highlight the types of routes you will need to make for your application to work. These are the main cases

1) Make your html render (get request)

>```javascript
> router.get('/nameOfYourRoute', function (req, res) {
>    return res.render('nameOfYourHtmlFile.html');
> });
>```

2) Put something in your database (post request)

>```javascript
> router.post('/nameOfYourRoute', function(req,res){
>   var query = "query string"
>   database.executeQuery(query);
>   return res.send("success"); // you can check in your ajax that the request was successful
> });
>```

3) Get data from your database (get request)

>```javascript
> router.get('/trains', function(req,res){
>  	var query = "query string"
>   database.executeQuery(query, function(results) {
>     res.send(results);
>   });
> });
>```

A special note for this last request. Callbacks can be a little tricky but if you copy/paste this code and fill in the query string you should be able to get data out of your database.

### The database

There are two files `postgres_trains_remote_example.sql` and `postgres_trains_local_example.sql` that will help setting up your database. There are instructions in each of the files on how to run them.

The difference between these files is one will help you set a database that exists on cloud9 and the other will set up the database that we have set up for you on heroku. For development you are going to want to set up the local database. The remote database will be used for your database in production. By production we mean the site that your client will go to see your final product.


## Random Useful Things  

### console.log
This is the most useful thing to use in my opinion. You can use this to help you figure out what is going wrong. If you going to ask a question one of the first things we might ask you what is this printing out. You can use this for both frontend and backend debugging.

If you want to play around with this (and something that will help when putting something into a database) you can put it in `routers/helloworld.js` like the following:

```javascript
router.post('/trains', function(req, res){
	console.log(req.body);
});
```
When you do this make a request to `'/train'` and look in your terminal and see what happens.
