A refresher on HTML, CSS and Javascript. Feel free to skip around to whichever section you're interested in.

###  HTML
HTML is what holds the _content_ of your site -- things like text or links or buttons. It's what your browser reads to show you any of the pages you go to on the web -- you can even see this page's html if you right click on it in a browser and select "view source".

It's made of __tags__, which look like this:

```html
<p>text</p>
```

Every tag has a name (```p``` in this case) and encloses some kind of content between its opening and closing sections -- the bits marked with ```<tagName>``` and ```</tagName>```. The content can either be text, other tags, or both. If a tag is inside of another tag, the first tag is often called a "parent", and the one inside of it a "child".

Tags also can have __attributes__, which look like this:

```html
<p class="description" tabindex="1">text</p>
```

In this case ```class``` and ```tabindex``` are _attributes_ of the tag ```p```, with values of ```description``` and ```1```, respectively.

#### ```class``` and ```id``` attributes
These two attributes are particularly special since they are both used to help write CSS rules. We'll go over exactly what that means in the next section, but for the moment there are only two things to keep in mind:

1. Every ```id``` value must be unique to that page. So you can't have two tags that both have an id with the value "main-content".
2. ```class``` attributes can have multiple values if you add spaces between each class name. For example the tag ```<p class="class-one class-two"></p>``` has two classes: class-one and class-two. Unlike the id attribute there's no limit to how many tags can have the same class.

#### HTML and the web

Although you can write HTML however you'd like, for a browser to be able to read it as a web page it needs a few specific tags set up in the right order. First it needs a root html tag:

```html
<html></html>
```

Inside that tag are two others: the ```<head>``` and ```<body>``` tags. In the ```<head>``` is where you'll put things like the title of the site or links to CSS and Javascript files the page will use. The ```<body>``` tag will hold your actual content. A very basic page might look like this:

```html
<html>
  <head>
    <link rel="stylesheet", type="text/css" href="path/to/css/file.css"/>
    <script src="path/to/js/file.js"></script>
  </head>
  <body>
    Content!
  </body>
</html>
```

And that's it!

### CSS
CSS controls the _design_ of the HTML content. It's what you use if you want to make a button green, your text bigger, or generally make things look nicer than the browser defaults.

You can add CSS rules to an HTML document by using a special ```<link>``` tag, which you put inside the ```<head>```.

CSS is made up of two parts: one to say which exact html tag(s) your css will apply to (a "__css selector__"), and the other to say what to change about the parts you've selected. It looks like this:

```css
p {
  color: "red";
  font-size: 15px;
}
```

```p```, the css selector, tells the css where to apply the changes in the curly brackets. In this case, it will look at everything inside of any html ```<p></p>``` tags.

The things inside of the curly brackets say what to change about the selected html. In this case it makes the font color red and the font size 15 pixels.

#### Selectors
There are a lot of options designating which specific html tags you want to select. Three are most common: by tag type (like we saw above), by a tag's class, or by a tag's ```id``` attribute.

Say I have an html tag that looks like this:

```html
<div class="content text-left-align" id="main-content"></div>
```

It has a name, two classes, and an ID. Here's how we'd select that tag using each of the three different methods:

```css
// by tag name
div {...}

// by a tag's class
.content {...}

// the second class would also work
.text-left-align {...}

// by a tag's id
#main-content {...}
```

#### What you can change with CSS
There are lots of keywords you can use in CSS to change the look of an HTML element. Check out [this overview](http://www.w3schools.com/cssref/) to see all the different things you can do!


## Javascript
Javascript (or JS) can do a lot of things, but on a site it's usually used to make html elements _move_ or _change_. One of the main ways to do this is to have the js code change the css rules on a tag, so that its styling or location changes.

In the i.c. stars project we're using an add-on to JS called JQuery that makes things a little easier to use.

Here's how you could use JS to change an html tag in our project:

First, you'd use JQuery to select the tag you want to change. You can do this with the same css selectors we used above. So if we used this tag again:

```html
<div class="content text-left-align" id="main-content"></div>
```

we could select it in JQuery'd javascript using its ID like this:

```javascript
$('#main-content');
```

Once we have a tag selected, we can change it. If we wanted it to disappear from the page, we could just do this:

```javascript
$('#main-content').hide();
```

If we wanted to make its background red, we can directly change its css, like this:

```javascript
$('#main-content').css("background-color", "red");
```

If we find that we're using that same code over and over again, we can give it a name then reference that name when we want to use it again. Here's what that would look like:

```javascript
// here we put the code into a bucket we're calling "makeBackgroundColorRed"
var makeBackgroundColorRed = function(){
  $('#main-content').css("background-color", "red");
};

// then we make the code run by referencing the name plus open and closed parens
makeBackgroundColorRed();
```

For more on javascript, check out this [awesome codeacademy course](https://www.codecademy.com/learn/javascript)!
