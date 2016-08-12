# Interactive javascript

### Intro
To make your game you are first going to have to work out how to make things move on your page using javascript. This workshop will help walk through one way to do that.

The end goal will be to have some kind of avatar on the screen that you can move around using the arrow keys.

This is intended to be an active tutorial, so please follow along with your own code as we move along! We'll work in small chunks, each with a short explanation of what the chunk is about and a task for you to try on your own. Tasks will be marked like this:

> ```yaml
-> Do the haka!
```

### Table of contents

1. [html/css/js refresher](#htmlcssjs-refresher)
2. [Setup](#setup)
2. [Making an avatar](#make-an-avatar)
3. [Movement!](#movement)
    1. [Using $(document).ready()](#using-documentready)
    2. [Selecting our element](#selecting-our-element)
    3. [Changing CSS with JQuery](#changing-css-with-jquery)
    4. [Introducing setInterval](#introducing-setinterval)
    5. [Keeping track of our current position](#keeping-track-of-our-current-position)
4. [Adding in arrow keys](#adding-in-the-arrow-keys)
    1. [```keyup``` and ```keydown```](#keyup-and-keydown)
    2. [Using keycodes](#using-keycodes)
    3. [Keeping track of key presses](#keeping-track-of-key-presses)
    4. [Putting it all together](#putting-it-all-together) 


## html/css/js refresher
If you feel comfortable with the difference between what html, css, and javascript each do, and feel confident in using them, then feel free to skip down to the next section! Otherwise, check out this refresher:

### [refresher link!](https://github.com/icstars/c36/blob/master/docs/html-css-js-refresher.md)

## Setup
Since the new page will use html, css, and js, let's make files for all of those.

> ```yaml
-> Make empty game.html, game.css, and game.js files in
   the right folders in Cloud9
```

We'll also need to write the basic HTML code we need for a webpage in the ```game.html``` file (with the right ```<html>```, ```<head>```, and ```<body>``` tags), and include links to the CSS and JS files so that the game knows about them.

> ```yaml
-> link to the game.css and game.js files in the game.html
   file using <link> and <script> tags inside of the <head> tag.
-> Check out the landing.html file for an example of how
   to do this!
-> Also make sure to copy the <script> tag that loads JQuery
   and put that on the top part of the <head> tag
```

## Make an avatar
We need something in the html that the JS code can move around. How might we do that?

One way would be to add a new generic tag, like a ```<div>```, to the ```<body>``` of the html and give it a unique id attribute to make it easy for our javascript to find. Let's try that!

> ```yaml
-> Make a new <div> tag inside the html <body> tag and give
   it a useful id attribute
```

So now there is something in the html page that the JS code can grab, but we can't actually see anything! We'll have to add some css styles to the ```div``` we created to make it show up on the page. Let's give it a height, width, background-color, and absolute positioning using our css file

> ```yaml
-> Write a css rule in game.css to give your <div> color, height, width,
   and a "position" of absolute
```

You should now have something that looks a bit like this (color and shape doesn't matter as long as you can see something):

<img src="http://i.imgur.com/2k7xWWy.png" width=800/>

## Movement
Now to make it move!

#### Using $(document).ready()
Before we write any significant JS code we'll need to make sure that it will only run after the rest of the html has loaded, or else we can get weird errors with our code trying to find html tags that don't exist yet. We can do that with something like the following:

```javascript
$(document).ready(function(){
  // code goes here!
})
```

#### Selecting our element
Now we need to use JQuery to select the html element we want to be editing. Remember we can do that using css selectors - so if we gave our ```<div>``` an id of "avatar", it might look something like this:

```javascript
$("#avatar");
```

#### Changing CSS with JQuery
Now how to tell it to move? Since we gave our avatar ```<div>``` absolute positioning, we can use the ```top``` and ```left``` css attributes to control where it will appear on the page. If we can continually change these fast enough, it can look like the object is moving.

Since we're using JQuery, we can dynamically change the css of an html element using the ```.css()``` method. It takes two arguments: the first the name of the css attribute we're changing, and the second the value we're changing it to.

For example, if we wanted to change our avatar's background color to red, we'd do the following:

```javascript
$("#avatar").css("background-color", "red");
```

Now try try to change the "left" css attribute to
> ```yaml
-> Write something that changes the "left" css attribute of your attribute
   to 40, then see what the page does when you open it
-> Make sure to put your code inside the $(document).ready() function!
```

Whoo, movement! But it only happens once. How do we get it to happen multiple times?

#### Introducing setInterval

Here we can use something called the ```setInterval``` function. It takes two things: a function to run, and the amount of time in milliseconds it should wait before calling the function again. Once you start it it will keep repeating the code you gave it every x milliseconds until you close the page. Nifty!

Here's what it might look like:

```javascript
var secondsMessage = function(){
  console.log("It's been one second since the last message")
}

setInterval(secondsMessage, 1000)
// the console will now print the message one time every 1000 milliseconds, or
// one second
```

#### Keeping track of our current position
We're almost ready to use this to make our avatar move continuously. But there's one problem: we can't just keep setting the avatar's ```left``` css attribute to the same number over and over again -- if we do it will just stay in the same place forever. We need some way of keeping track of the avatar's exact horizontal position so that we can keep making that number bigger than it was before.

So let's make a new variable in our JS code, maybe something like "xPosition", and give it a starting value of 10:

```javascript
var xPosition = 10;
```

Now if we make a function that increases that number then sets the ```left``` css attribute of the avatar to the new, bigger xPosition, then we can ```setInterval``` that function. Hopefully we'll see it move!

Here's what that might look like:

```javascript
var xPosition = 10;

var move = function() {
  xPosition = xPosition + 5;
  $("#avatar").css("left", xPosition)
}

setInterval(move, 25);
```

Here, every 25 milliseconds our avatar should move 5 pixels further away from the left.

> ```yaml
-> Write code like the above to make your avatar move!
```

If everything has gone correctly, you should see something like this:

<img src="https://media.giphy.com/media/l2Sq1PdtBhPHpC8vu/giphy.gif" width=800/>

If things aren't working for you, don't hesitate to ask for help!


## Adding in the arrow keys

This is all well and good, but our poor intrepid block is stuck forever blazing a new path past our browser's boundaries right-hand boundaries. Let's see if we can get it to only move to the right when we're pressing the right arrow key.

Somehow we need to get javascript to listen to when we press the right key. But how do we do that?

#### ```keyup``` and ```keydown```

JQuery gives us a way forward with its ```keydown``` and ```keyup``` methods. Here's how they work:

Say I've used JQuery to select an html element, and I want to listen to the key presses someone is making on it. With ```keydown``` I could do that like this:

```javascript
$("body").keydown(function(event) {
  // put code here to do things when a user presses a key down
})
```

Unfortunately, this method will trigger when the user presses any key at all, not just the key we want.

#### Using keycodes

The ```event``` variable that gets passed to the keydown function is our key to finding out which exact key the user pressed. Unfortunately it's not as simple as getting an "a" back when the user pressed the "a" key. Instead, every key on the keyboard has a number associated with it, called the "keyCode". This is the number we'll have to use to see if the user pressed the key we're interested in. You can see it by using ```event.keyCode```.

This code will print out a key's keyCode to the browser's console whenever that key is pressed:

```javascript
$("body").keydown(function(event) {
  console.log(event.keyCode);
})
```

> ```yaml
-> Play around with the above code to try to find the keycode for the right
   arrow key!
   (try adding it to your game.js file, then loading up a browser console
   while the game page is open)
```

Once you've found its keycode we'll have a way in to only move the avatar when that exact key is pressed. For example:

```javascript
var rightArrowKeyCode = whatever_number_you_found

$("body").keydown(function(event) {
  if(event.keyCode === rightArrowKeyCode) {
    // do something
  };
})
```

#### Keeping track of key presses

What do we do from here? Somehow we'll have to let the ```move``` method know when our right arrow key is pressed down. One way to do that is to use a variable that gets set to ```true``` when the right key is pressed and set to ```false``` when it's not. We'd set it to true on the keydown method, and then only run ```move```'s css changes if it's true. Let's try that and see what happens!

```javascript
var rightIsPressed = false  // it should start not pressed
var rightArrowKeyCode = whatever_number_you_found

$("body").keydown(function(event) {
  if(event.keyCode === rightArrowKeyCode) {
    rightIsPressed = true;
  };
})

var xPosition = 10;
var move = function() {
  if(rightIsPressed) {
    xPosition = xPosition + 5;
    $("#avatar").css("left", xPosition)
  }
}

setInterval(move, 25);
```

> ```yaml
-> Try the above in your own game.js file, and see what happens
```

Womp! We're still missing something. Our avatar starts moving correctly when the right arrow is pressed, but doesn't stop moving once we stop pushing it!

Somehow we have to let our code know when that key isn't being pressed anymore. A job for the ```keyup``` function perhaps??

> ```yaml
-> Explore using the the keyup function to fix our broken code...
```

#### Putting it all together

Once you've been able to get this working, then congrats! You have all the parts you need to get the avatar moving in any other direction! In fact, those are the next steps:

> ```yaml
-> make the avatar move left when the left button is pressed
```

> ```yaml
-> incorporate moving up and down
   hint: try using the "top" css attribute here instead of "left"
```

And if you've somehow made it this far and want a new challenge, here are some other things you can try:

* Use an image for the avatar instead of just a shape with a colored background
* see if you can find a way to not let the avatar go past the browser boundaries!
