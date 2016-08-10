'use strict'

var router = require('express').Router();
var database = require('./c36_modules/database');

module.exports = function() {

  router.get('/', function(req,res){
    return res.render('helloworld.html');
  });

  router.get('/helloworld', function(req,res){
    return res.render('helloworld.html');
  });

  router.get('/landing', function(req, res) {
    return res.render('landing.html');
  });

  /* Your code here */

  return router
}();
