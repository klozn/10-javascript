![MODULE: HTML5/CSS3 - LAB 01](../../../../resources/img/switchfully_logo.png "MODULE: HTML5/CSS3 - LAB 01")

# HTML5/CSS3 - LAB 01: HTML5

In this lab we will teach you everything you need to know about HTML5.

Ready, set, go!

---

# 1. History of the World Wide Web

Tim Berners-Lee, an employee of CERN, created a new way of sharing and reading documents which he called ENQUIRE.
It was a system made up of cards / documents which were connected by hyperlinks. 
In 1990 Berners-Lee wrote an improved proposal, together with Robert Cailliau, of ENQUIRE. 

This was the creation of the World Wide Web (WWW).

---

In late 1991, Berners-Lee created the first version of HTML. 
It became the language to structure the documents on the World Wide Web, to structure *web pages*. 

---

# 2. What is HTML?
     
HTML stands for Hypertext Markup Language. 
It is no programming language, it is a markup language which defines the structure of your web page and allows for adding static content.

---

HTML has a long history of versions. The first standardisation of HTML was HTML 2.0 which was published in 1995.
Since 2012, HTML5 is the widely adopted and latest standardised version of HTML.

Nowadays, when speaking about HTML5, it is common to refer to it as HTML.

---

# 3. HTML: your web page language

With HTML you can take some plain text and transform into a structured web page which contains sections, 
navigation, titles, lists, images and more.

---

A simple text file (file.txt) opened by a browser will be interpreted as plain text by the browser.
If we change the extension of this text file to .html and open it with the browser, the file will be interpreted as HTML.
Simply put, browsers read HTML and display it for you.

---

# 4. Setup (Prepare yourself)

In this chapter, we'll set you up with Git and a text editor

---

## Git

Create yourself a new GitHub repository, clone it into a local directory.

This will become your working directory.

---

## Text editor

Since HTML is written in plain text, all you need have - in order to start writing HTML - is a simple text editor.
All operating systems come with a simple text editor (e.g.: Notepad on Windows).

Alternatively, although recommended, you can download and install an improved text editor 
such as Notepad++ (Windows) or Atom (Mac/Windows).

---
 
Also, make sure that file extensions are not hidden on your operating system.

- If the files in your file explorer only show the name of a file and not the name and its extension (e.g.: file.txt), they are hidden.
- Google yourself how to show them, it's not a difficult thing to do.

---


## Initial content

We will create a web page showcasing the best game ever made (totally objective opinion, I swear).

We'll prepare some initial content for this web page.

---

Create a new plain text file, name it *"index.txt"*

Copy / paste the following content and save it:
```
Best Game Ever

Half-Life 2

About:
Half-Life 2 was released in November 2004 following a five-year, $40 million development phase.
In 2017, the hearts of many gamers were broken when it became clear that Half-Life 3 would never see the light. 

Information:
    Developer: Valve Corporation
    Genre: First-person shooter
```

---

# 5. From plain text to HTML5

Our first step in transforming our plain text to HTML, 
is to make sure our browser will try to interpret the text as HTML.

---

## The .html file extension

Change the *".txt"* extension of *"index.txt"* to *".html"*.

The resulting file should name: `index.html`

Now, open the file with your browser.
Simply double clicking it should suffice.

---

Once your browser opens, inspect what you see.

Still looks a lot like text, right?
This is due to the fact that we didn't enrich our plain text with HTML elements.

However, the `index.html` file is interpreted as HTML, which is a first step in the right direction.

---

# 6. HTML elements

We'll go through some of the most common HTML elements and use them to transform our text to HTML. 

---

## What are HTML elements?

HTML offers a wide range of elements which you can use to wrap certain parts of your content.
This will then make your content appear a certain way, due to the browser interpreting it as HTML.
These elements always consist of a opening and closing tag.

---

an HTML tag has the following form (although some exceptions exist):

- The opening tag is of the form `<tag>`
- The closing tag is of the form `</tag>`
 
---
 
For example, the following plain text will be structured as a paragraph by enclosing it with the paragraph element tag.

Plain text:
```
This is a simple paragraph
```

HTML5 paragraph:
```
<p>This is a simple paragraph</p>
```

When interpreted by the browser as HTML, the text will stand by itself on a single line due to the enclosing paragraph tag.

---

## The root HTML element

The root HTML element is the *html* element itself:

```
<html>
    ...
</html>
```

Every HTML web page requires the root element.

---

## Doctype

The *doctype* declaration must be the first thing in your HTML document.
It instructs the browser about what version of HTML the web page is written in.

For HTML5 the doctype is `<!DOCTYPE html>`:

```
<!DOCTYPE html>
<html>
    ...
</html>
```

---

## Head and Body element

Nested inside the *html* element are the *head* and *body* elements.

The *body* element is the parent element for all the visible content.

The *head* element is for loading in CSS, meta information and more.

```
<!DOCTYPE html>
<html>
    <head>
        ...
    </head>
    <body>
        ...
    </body>
</html>
```

Every HTML web page requires both these elements.

All the elements we will discuss next, are nested into the *body* element.

---

## Heading element

Heading elements are used for titles on a web page.

In total their are 6 heading elements: `<h1>` (more important) to `<h6>` (less important).

Their correct usage is defined:

```
<h1>For web page titles, section titles</h1>
<h2>For web page subject, section subject</h2>
<h3>For sub-titles</h3>
<h4>For sub-titles</h4>
<h5>For sub-titles</h5>
<h6>For sub-titles</h6>
```

---

Which, interpreted by the browser as HTML, will look like this:

![](../../img/html5-heading.png "MODULE: HTML5/CSS3 - Heading elements")

---

## Do it yourself

It's time, to do it yourself!

---

### Update your web page

We will now update your *"index.html"* file with the html elements we've seen so far.

---

Open up the *"index.html"* in your text editor and add the `<html>`, `<head>` and `<body>` tags:
```
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        Best Game Ever
        I'll introduce you to the best game ever made: Half-Life 2
        
        About:
        Half-Life 2 was released in November 2004 following a five-year, $40 million development phase.
        In 2017, the hearts of many gamers were broken when it became clear that Half-Life 3 would never see the light.
        
        Information:
            Developer: Valve Corporation
            Genre: First-person shooter
    </body>
</html>
```

Save your file and open it with your browser.

---

It should look like this:

![](../../img/html-first-tags.png "MODULE: HTML5/CSS3 - First html elements")

Which still looks just like plain text (although it is HTML). 

However, we're now ready to add the heading tags which will change the way things look (hype!).

---

We'll now add the heading elements to our web page.

- Since *"best game ever"* is the title of our page, we'll enclose it with `<h1>`
- Since *"About"* and *"Information"* are subjects of our page, we'll enclose them with `<h3>`

---

Your *"index.html"* file should look like this:
```
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <h1>Best Game Ever</h1>
        I'll introduce you to the best game ever made: Half-Life 2

        <h2>About:</h2>
        Half-Life 2 was released in November 2004 following a five-year, $40 million development phase.
        In 2017, the hearts of many gamers were broken when it became clear that Half-Life 3 would never see the light.

        <h2>Information:</h2>
            Developer: Valve Corporation
            Genre: First-person shooter
    </body>
</html>
```

Don't forget to save it.

---

Fire up *"index.html"* in your browser.

Looking better already, right?

![](../../img/html-first-tags-heading.png "MODULE: HTML5/CSS3 - Heading elements added")

---

## Paragraph element

You're doing great, up next is the paragraph element.

---

To paragraph text, use the paragraph element `<p>`.

The enclosed content will behave as a paragraph. Some spacing before and after the paragraph is created. 
A paragraph will also always start on a new line.

---

### Do it yourself

It's time again, to do it yourself!

---

Enclose every line of readable text with it's own paragraph.

However, we're not paragraphing the text that's placed under the *"Information"* title (We'll do something else with it).

---

Your *"index.html"* file should look like this:
```
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <h1>Best Game Ever</h1>
        <p>I'll introduce you to the best game ever made: Half-Life 2</p>

        <h2>About:</h2>
        <p>Half-Life 2 was released in November 2004 following a five-year, $40 million development phase.</p>
        <p>In 2017, the hearts of many gamers were broken when it became clear that Half-Life 3 would never see the light.</p>

        <h2>Information:</h2>
            Developer: Valve Corporation
            Genre: First-person shooter
    </body>
</html>
```

Save it.

---

Fire up *"index.html"* in your browser.

![](../../img/html-first-tags-paragraph.png "MODULE: HTML5/CSS3 - Paragraph elements added")

Notice the extra spacing, this is due to the `<p>` element.

---

## List element

Up next, the list element.

---

There are 2 kinds of lists: 

Unordered: 

- Unordered (bullets)
- Unordered (bullets)

and, ordered:

1. Ordered (numbered)
2. Ordered (numbered)

---

For the ordered lists we use the `<ol>` tag.

For the unordered lists we use the `<ul>` tag.

List items use the `<li>` tag and are nested inside the `<ul>` or `<ol>` tags.

---

E.g.:
```
<ul>
    <li>Unordered Item 1</li>
    <li>Unordered <Item 2</li>
</ul>
<ol>
    <li>Ordered Item 1</li>
    <li>Ordered Item 2</li>
</ol>    
```

Rendered as HTML:

![](../../img/html5-lists.png "MODULE: HTML5/CSS3 - Lists")

---

### Do it yourself

It's time, to do it yourself!

---

Update your *"index.html"* file to include an unordered list for the text that's placed under the *"Information"* title.

The list-options are:

- Developer: Valve Corporation
- Genre: First-person shooter

---

Your *"index.html"* file should look like this:
```
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <h1>Best Game Ever</h1>
        <p>I'll introduce you to the best game ever made: Half-Life 2</p>

        <h2>About:</h2>
        <p>Half-Life 2 was released in November 2004 following a five-year, $40 million development phase.</p>
        <p>In 2017, the hearts of many gamers were broken when it became clear that Half-Life 3 would never see the light.</p>

        <h2>Information:</h2>
        <ul>
            <li>Developer: Valve Corporation</li>
            <li>Genre: First-person shooter</li>
        </ul>    
    </body>
</html>
```

---

Fire up the *"index.html"* file in your browser.

![](../../img/html-first-tags-lists.png "MODULE: HTML5/CSS3 - List elements added")

Look at that list, isn't it pretty?

---

## Title element

The title element should always be added to a web page.

Opposite to the other elements we already covered, this element does not reside in the `<body>` element.

---

The `<title>` tag is nested inside the `<head>` tag where it provides the page of a descriptive title.

E.g.:
```
<head>
    <title>Here you see the title!</title>
</head>
```

The title will be shown in the tab, of the web page, in your browser:
![](../../img/html5-title.png "MODULE: HTML5/CSS3 - Title")

---

### Do it yourself

It's time, to do it yourself!

---

Update your *"index.html"* file to include a title.

As title, use "Half-Life Fansite: The best game ever is Half-Life 2".

---

Your *"index.html"* should look like this:
```
<!DOCTYPE html>
<html>
    <head>
        <title>Half-Life Fansite: The best game ever is Half-Life 2</title>
    </head>
    <body>
        <h1>Best Game Ever</h1>
        <p>I'll introduce you to the best game ever made: Half-Life 2</p>

        <h2>About:</h2>
        <p>Half-Life 2 was released in November 2004 following a five-year, $40 million development phase.</p>
        <p>In 2017, the hearts of many gamers were broken when it became clear that Half-Life 3 would never see the light.</p>

        <h2>Information:</h2>
        <ul>
            <li>Developer: Valve Corporation</li>
            <li>Genre: First-person shooter</li>
        </ul>    
    </body>
</html>
```

---

Fire up *"index.html"* in your browser.

![](../../img/html-head-title.png "MODULE: HTML5/CSS3 - Title head")

See the title in the tab window? Coolio...

---

# 6. HTML Attributes

HTML attributes enable extra features for HTML elements.

They come in different flavors and sizes, we'll briefly discuss only three.

**Note**: We'll discover more HTML attributes in the following sections.

---

## The id attribute

In general, an HTML attribute has a **name** and a **value**

For example, the `id` attribute:
```
<h1 id="main-title">Half-Life</h1>
```

Whereas `id` is the **name** of the attribute and `main-title` the **value** of the attribute.
Always use quotes for the **value**.

---

### Why use the id attribute

The `id` attribute is used when you want to uniquely identify an HTML element.

There should never be two or more HTML elements with the same id on a single web page.

Id attributes are often used as a pointer by Javascript to manipulate the HTML element it points to.

---

## The class attribute

A `class` attribute can be added to an HTML element to specify one, or more, classes for that element.

For example:
```
<h1 id="main-title" class="title primary">Half-Life</h1>
```

We added two different classes to the `<h1>` tag, namely:

- class `title`
- class `primary`

As opposed to the `id` attribute, `class` attributes don't have to be unique.

---

### Why use the class attribute

Class attributes are most commonly used as pointers to classes in a CSS document (more on this later).

Both the `id` and `class` attributes exist for referencing purposes.

When they're not being referenced by a CSS class or Javascript, they won't have any real effect on their HTML element.

---

### Naming conventions for id and class attribute values

In general, use hyphens (dashes) for id and class values:
```
id="title"
id="main-page-title"
class="contact-form"
```

Some prefer camel-casing their id (and class) values (capitalize every word except the first):
```
id="title"
id="mainPageTitle"
class="contactForm"
```

Whichever you chose, just make sure you use it consistent. Don't mix!

Remember: a good programmer is a clean programmer.

---

## The hidden attribute

The `hidden` attribute, contrary to the `id` and `class` attribute does not have a **value** part.

E.g.:
```
<h1 id="main-title" class="title primary" hidden>Half-Life</h1>
```

---

### Why use the hidden attribute

Whenever you want to hide a certain HTML element, attribute it with `hidden`.

When rendering the HTML, browsers will make sure to not show the HTML elements attributed with `hidden`

---

## The order of attributes

The order of attributes is of no importance:

```
<h1 id="main-title" class="title primary">Half-Life</h1>
```

is exactly the same as:

```
<h1 class="title primary" id="main-title">Half-Life</h1>
```

So don't worry about their order.

---

## Do it yourself

It's time, to do it yourself!
We will now update your *"index.html"* file with the HTML attributes we just covered.

---

Open up the *"index.html"* in your text editor,

- Add an *id*  to the *h1* tag.
- Add a *class* to the first *p* tag.
- Hide the last *p* tag.

---

Your *"index.html"* file should look something like this:
```
<!DOCTYPE html>
<html>
    <head>
        <title>Half-Life Fansite: The best game ever is Half-Life 2</title>
    </head>
    <body>
        <h1 id="primary-title">Best Game Ever</h1>
        <p class="text-splash">I'll introduce you to the best game ever made: Half-Life 2</p>

        <h2>About:</h2>
        <p>Half-Life 2 was released in November 2004 following a five-year, $40 million development phase.</p>
        <p hidden>In 2017, the hearts of many gamers were broken when it became clear that Half-Life 3 would never see the light.</p>

        <h2>Information:</h2>
        <ul>
            <li>Developer: Valve Corporation</li>
            <li>Genre: First-person shooter</li>
        </ul>    
    </body>
</html>
```

---

Save your file and open it with your browser.

Fire up *"index.html"* in your browser.

![](../../img/html-attributes.png "MODULE: HTML5/CSS3 - Attributes")

---

Besides the `hidden` attribute hiding the last paragraph, the attributes don't have any effect on the visual representation of the web page.

---

## Vocabulary recap

Since we introduced quite some new vocabulary, a quick recap on what-is-named-what again:

![](../../img/html-element-explained.png "MODULE: HTML5/CSS3 - HTML elements explained") 

---

## Our simple web page

So far, we've created a fairly simple web page.

What if we created multiple web pages and linked them together? Would that mean we've created a "website"?

Yes, yes it would.

---

# 7. Creating links

You're truly going strong, my young padawan.

Let's use ~~the force~~ HTML links to create a website!

---

## What is a url?

An HTML link contains a url which it needs for navigational purposes.

A url you say?

- A url can point to a root web address: `http://google.com/`
- A url can point to an image: `http://switchfully.com/img/logo.png`
- A url can point to an html file: `http://switchfully.com/index.html`
- ...

---

Point being: a url always consists of 3 parts:

- A protocol, e.g.: `http://` 
- A server, e.g.: `switchfully.com`
- A path pointing to a file, e.g.: `/`, `/img/logo.png` or `index.html`

---

When entering a url in the browser, 
the browser will `request` the specified file (e.g.: index.html) 
from the server (e.g.: switchfully.com) which will provide the file to the browser in a `response`, 
which the browser can then show to the user.

![](../../img/html5-request-response.png "MODULE: HTML5/CSS3 - Request - Response")

---

## HTML links

An HTML link is created using the HTML element `<a>`.

When using the `<a>` tag for navigational purposes, we always need to add the `href` HTML attribute,
which has a relative path or an absolute path as its value.

By adding the `target` attribute we can specify how to navigate when clicking the link:

- Using value `_self` to reuse the current browser tab window.
- Using value `_blank` to open a new browser tab window.

---

There are 2 "types" of links:

- Relative path links
- Absolute path links

In general, (internal) links which reference web pages located on the same server (e.g.: switchfully.com) use relative path links.

(External) links which reference web pages (or websites) located on a different server (e.g.: a link in switchfully.com/index.html which points to google.com) should 
always use absolute path links.

---

Imagine an `index.html` file which is hosted on the server switchfully.com:
```
<ul>
	<li>
		<a href="contact.html" target="_self">Contact us (internal, relative)</a>
	</li>
	<li>			
		<a href="http://www.google.com" target="_blank">Try to Google it... (external, absolute)</a>
	</li>
</ul>
```

In HTML, both links will look the same, however they will act differently due to their target attributes (the Google link will open a new tab, the other won't):

![](../../img/html-links.png "MODULE: HTML5/CSS3 - Links")

---

### Relative v.s. Absolute path links

In our example, we had a relative reference path `href="contact.html"` for the *"contact.html"* page.
This means both the *"index.html"* file (which contains the link) and the *"contact.html"* file it references, 
need te reside in the same directory:
```
| --- switchfully.com (root directory)
|    | --- index.html
|    | --- contact.html
```

---

If the link in *"index.html"* contains `href="pages/contact.html"` as its relative path to *"contact.html"*, the *"contact.html"* file 
should reside in the *"pages"* subdirectory of *"index.html"*:
```
| --- switchfully.com (root directory)
|    | --- index.html
|    | --- pages (subdirectory)
|    |     | --- contact.html
```

---

If the link *"index.html"* contains `href="../contact.html"` as its relative path to *"contact.html"*, the *"contact.html"* file 
should reside in the parent directory:
```
| --- switchfully.com (root directory)
|    | --- contact.html
|    | --- somedirectory (subdirectory)
|    |     | --- index.html
```

In short,

Relative paths are *relative* to the position of the file which includes them.

---

An absolute path for a link, on the other hand, is *absolute* (sounds logical, we know).

As opposed to relative paths, you also have to provide the *procotol* (e.g.: http://) and *server* (e.g.: google.com).
Looks a lot like a url, right? That's because an absolute path for a link is a url.

E.g.:
```
http://google.com/some-page.html
```

---

### There's something special about index.html

When you surf to *"www.switchfully.com"* or *"www.switchfully.com/index.html"*, you will get the same result.

This is due to the fact that whenever you provide a url which does not specify a path pointing to a file, 
the server will `respond` with the *"index.html"* file (if there is one).
```
browser request: http://www.switchfully.com 
    --> server will respond with index.html
    
browser request: http://www.switchfully.com/pages
    --> server will respond with the index.html file located inside the pages directory,
        (if there is an index.html inside the pages directory) 
```

---

### Requesting files which do not exist

When you specify a file which does not exist on the server, the server will return HTTP code `404 NOT FOUND`

Try it by browsing to: `http://www.switchfully.com/unknown.html`

---

## Do it yourself

It's time, to do it yourself!
We will now update your *"index.html"* file with some links!

---

However, first things first:

Create a new web page, in the same directory as *"index.html"* and name it *"half-life-3.html"*.

---
 
Add the following elements (besides the required HTML elements):
 
- A `title` element containing:
    - *"Half-Life Fansite: The best game ever could have been Half-Life 3"*
- A page title
    - *"Half-Life 3"*
- A paragraph containing the text 
    - *"I sit outside as the birds glide,
        With no guidance on how they fly,
        I wonder how and I wonder why,
        The birds have only one eye?
        This must mean Half Life 3 is a lie!"*
- add an internal, relative link to go back to the *"index.html"* page, name it *"Go back"*

---

If you did it right, your new *"half-life-3.html"* page should look like this:
```
<!DOCTYPE html>
<html>
    <head>
        <title>Half-Life Fansite: The best game ever could have been Half-Life 3</title>
    </head>
    <body>
        <h1>Half-Life 3</h1>
        <p>
            I sit outside as the birds glide,
            With no guidance on how they fly,
            I wonder how and I wonder why,
            The birds have only one eye?
            This must mean Half Life 3 is a lie!
        </p>
        <a href="index.html" target="_self">Go back</a>
    </body>
</html>
```

Make sure to save it.

---

Open up the *"index.html"* in your text editor,

- Above the *"About"* title, add a new unordered list containing one list item.
- As the list item, add an internal, relative link to the *"half-life-3.html"* page, name it *"Half-Life 3"*
- Provide this list with the following title: *"Navigation"*
- Create an external, absolute link for the text *"valve corporation"*, it should point to `http://www.valvesoftware.com`

---

Your *"index.html"* page should now look like this:
```
<!DOCTYPE html>
<html>
    <head>
        <title>Half-Life Fansite: The best game ever is Half-Life 2</title>
    </head>
    <body>
        <h1 id="primary-title">Best Game Ever</h1>
        <p class="text-splash">I'll introduce you to the best game ever made: Half-Life 2</p>

        <h2>Navigation</h2>
        <ul>
            <li><a href="half-life-3.html" target="_self">Half-Life 3</a></li>
        </ul>

        <h2>About:</h2>
        <p>Half-Life 2 was released in November 2004 following a five-year, $40 million development phase.</p>
        <p hidden>In 2017, the hearts of many gamers were broken when it became clear that Half-Life 3 would never see the light.</p>

        <h2>Information:</h2>
        <ul>
            <li>Developer: <a href="http://www.valvesoftware.com" target="_blank">Valve Corporation</a></li>
            <li>Genre: First-person shooter</li>
        </ul>    
    </body>
</html>
```

---

Save your file and open it with your browser.

Fire up *"index.html"* in your browser and start navigating!

![](../../img/html-links-website.png "MODULE: HTML5/CSS3 - Linking up your website")

---

# 8. HTML5 - Structuring content with HTML5 semantic elements

HTML5 offers a new set of semantic elements to structure the content of your web page.
We'll go through some of the most common and important semantic elements HTML5 introduces.

> Semantic element: element which clearly defines the content it encloses.

---

A good looking car which is poorly engineered and maintained is still a crappy car.

Replace *"car"* with *"website"*, and you get the picture. 

Writing proper structured HTML5 code is something you should always strive to do!
Take pride in your work.

---

## In the beginning there was DIV

Before HTML5, the `<div>` HTML element was used for structuring your HTML code by grouping together parts of content which belonged together.

The `<div>` element on itself, does not change the visual presentation of your rendered HTML.
It is pure for adding structure to the HTML code.

A `<div>` tag has no semantic meaning.

By adding the `id` or `class` attribute, a logical name or meaning could be given to a `<div>` block.

---

### Do it yourself

It's time, to do it yourself!

---

We have updated the *"index.html"* file with some extra structure using the `<div>` element.
Inspect the document closely, make sure you understand where which opening `<div>` tag is closed (by its `</div>` closing tag).
Make the same additions to your own *"index.html"* file.

```
<!DOCTYPE html>
<html>
    <head>
        <title>Half-Life Fansite: The best game ever is Half-Life 2</title>
    </head>
    <body>
    
        <div class="page-container">
        
            <div id="header">
            
                <h1 id="primary-title">Best Game Ever</h1>
                <p class="text-splash">I'll introduce you to the best game ever made: Half-Life 2</p>
                
                <div id="navigation">
                    <h2>Navigation</h2>
                    <ul>
                        <li><a href="half-life-3.html" target="_self">Half-Life 3</a></li>
                    </ul>
                </div>
                
            </div>
    
            <div id="about" class="section">
                <h2>About:</h2>
                <p>Half-Life 2 was released in November 2004 following a five-year, $40 million development phase.</p>
                <p hidden>In 2017, the hearts of many gamers were broken when it became clear that Half-Life 3 would never see the light.</p>
            </div>
    
            <div id="information" class="section">
                <h2>Information:</h2>
                <ul>
                    <li>Developer: <a href="http://www.valvesoftware.com" target="_blank">Valve Corporation</a></li>
                    <li>Genre: First-person shooter</li>
                </ul>  
            </div>
            
        </div>
        
    </body>
</html>
```

---

Save your *"index.html"* file.

Fire it up in your browser.

![](../../img/html-div.png "MODULE: HTML5/CSS3 - Div")

---

Looks like nothing changed, right? This is as it should be.

Remember that we've added structure to the code which does not impact the visual presentation of the web page.

---

## HTML5 semantic alternatives to DIV

HTML5 offers semantic elements which can replace the `<div>` element in many occasions. 

---

A generic, typical HTML5 website page will have a header at the top, including the site-wide navigation. 
On the left there is a sidebar, on the right are content blocks. At the the bottom is the footer.

Instead of purely using *div*, we can now use the HTML5 semantic elements to (semantically) structure all these different 'pieces':

![](../../img/html-website-structure-semantic-elements.png "MODULE: HTML5/CSS3 - Semantic elements")

---

### Overview

We'll discuss some of the most common HTML5 semantic elements:

- Section
- Header
- Footer
- Nav
- Aside

---

### Section

The `<section>` semantic element specifies a generic web page section and is used for grouping together content 
which is thematically related. This as opposed to the `<div>` element, 
which is not concerned with the thematic relation of content.

---

#### Do it yourself

It's time, to do it yourself!

---

Using you *"index.html"* file: replace the `<div>`'s whose id's are *"about"* and *"information"* with a `<section>` element. 

You can even drop the class attribute whose value is *"section"*, since it's pretty redundant now.

---

Your *"index.html"* file should look something like this:

```
<!DOCTYPE html>
<html>
    ...
    <section id="about">
        <h2>About:</h2>
        <p>Half-Life 2 was released in November 2004 following a five-year, $40 million development phase.</p>
        <p hidden>In 2017, the hearts of many gamers were broken when it became clear that Half-Life 3 would never see the light.</p>
    </section>
    
    <section id="information">
        <h2>Information:</h2>
        <ul>
            <li>Developer: <a href="http://www.valvesoftware.com" target="_blank">Valve Corporation</a></li>
            <li>Genre: First-person shooter</li>
        </ul>  
    </section>
    ...
</html>
```

**Note:** the triple-dots (...) indicate parts we truncated to improve readability.

---

Since the `<section>` element can be seen as a *document inside a document* (it has a self contained page outline),
it would be possible to replace the `<h2>` headings to `<h1>` headings if found necessary.

---

With the arrival of the `<section>` element, does this mean we can replace all the `<div>` elements with `<section>` elements?

Short answer: "No".

Using your *"index.html"* as a reference, the `<div>` tag whose class's value is *"page-container"* should not be replaced by `<section>`:

```
<!DOCTYPE html>
<html>
    ...
    <body>
    
        <div class="page-container">
            ...      
        </div>   
        
    </body>
</html>
```

---

This `<div>` tag is not being used to wrap thematically related content. 
It could be described more as a "technical" wrapper.

Therefore, don't replace it with a `<section>` tag.

---

### Header

The `<header>` semantic element specifies the header of a page **or** section *(1)*, so there can be more than one.

It will contain all the introductory content of a page or section.

Site-wide navigation can be made part of the `<header>`.

Oh, and never-ever confuse `<head>` with `<header>`. That would be a pretty bad thing to do.

*(1)*: Remember how a section has a self contained page outline? Just as it could have its own `<h1>` headings, it can have its own `<header>`.

---

#### Do it yourself

It's time, to ~~get funky~~ do it yourself!

---

Using your *"index.html"* file, replace the `<div>` tag, whose id is "header", to `<header>`.
 
We should alter the id itself as well. Name it "page-header".

---

Your *"index.html"* file should look something like this:
```
<!DOCTYPE html>
<html>
    ...
    <body>
        <div class="page-container">
        
            <header id="page-header">
                <h1 id="primary-title">Best Game Ever</h1>
                <p class="text-splash">I'll introduce you to the best game ever made: Half-Life 2</p>
                
                <div id="navigation">
                    <h2>Navigation</h2>
                    <ul>
                        <li><a href="half-life-3.html" target="_self">Half-Life 3</a></li>
                    </ul>
                </div>
            </header>
            
            ...
        </div>
    </body>
</html>
```

---

### Footer

The `<footer>` semantic element specifies the footer of a page **or** section *(1)*, so there can be more than one.

In general, a footer will contain some copyright information, the author of the content or the contact information - of that page or section.

The `<footer>` is mostly positioned at the bottom of a page or section.


*(1)*: Remember how a section has a self contained page outline? Just as it could have its own `<h1>` headings and `<header>` element, it can have its own `<footer>`.

---

#### Do it yourself

It's time, to do it yourself!

---

Using your *"index.html"* file as a reference, add a footer.

As the footer's content, use a paragraph containing "Half-Life 2 fansite - Some rights reserved".

---

Your *"index.html"* file should look something like this:
```
<!DOCTYPE html>
<html>
    ...
    <body>
        <div class="page-container">
            ...
            
            <footer>
                <p>Half-Life 2 fansite - Some rights reserved</p>
            </footer>
            
        </div>
    </body>
</html>
```

---

### Nav

The `<nav>` semantic element specifies a block of navigational links. 

This implies it should not be used for links which are not part of a navigational block.

---

#### Do it yourself

It's time, to do it yourself!

---

Using your *"index.html"* file, replace the `<div>` tag whose id is "navigation", to `<nav>`.
 
Since it's the page's main navigational block, we alter the id to make this more clear. Name the id "page-navigation".

---

Your *"index.html"* file should look something like this:
```
<!DOCTYPE html>
<html>
    ...
    <body>
        <div class="page-container">
            <header id="page-header">
                <h1 id="primary-title">Best Game Ever</h1>
                <p class="text-splash">I'll introduce you to the best game ever made: Half-Life 2</p>
                
                <nav id="page-navigation">
                    <h2>Navigation</h2>
                    <ul>
                        <li><a href="half-life-3.html" target="_self">Half-Life 3</a></li>
                    </ul> 
                </nav>
                
            </header> 
            ...
        </div>
    </body>
</html>
```

---

### Aside

The `<aside>` semantic element specifies content that is literally *aside* from the content it's placed.
 
The most typical correct use for *aside* is a sidebar.

Enclosing content with `<aside>` will not actually put it aside of other content (remember, these HTML elements do not alter the visual presentation of your page). 
To actually pull this content aside, we need to apply some CSS (which you'll learn later on).

---

#### Do it yourself

It's time, to do it yourself!

---

Using your *"index.html"* file, add a *sign in* sidebar.

Do this by adding an `<aside>` element between the `header` and "about" `section`.

Provide the `<aside>` element with:

- A `h2` heading element with text "Please sign in"
- A paragraph containg the text "No content so far"

---

Your *"index.html"* file should look something like this:
```
<!DOCTYPE html>
<html>
    ...
    <body>
        <div class="page-container">
            ...
            </header>
            
            <aside id="sign-in">
                <h2>Please sign in</h2>
                <p>No content so far</p>
            </aside>
            
            <section id="about">
            ...
        </div>
    </body>
</html>
```

---

## Review your web page


Hopefully you've correctly updated your *"index.html"* after each new semantic element we covered. But hey, maybe you didn't...
However, your *"index.html"* page should look like this now:
```
<!DOCTYPE html>
<html>
    <head>
        <title>Half-Life Fansite: The best game ever is Half-Life 2</title>
    </head>
    <body>
        <div class="page-container">
        
            <header id="page-header">
                <h1 id="primary-title">Best Game Ever</h1>
                <p class="text-splash">I'll introduce you to the best game ever made: Half-Life 2</p>
        
                <nav id="page-navigation">
                    <h2>Navigation</h2>
                    <ul>
                        <li><a href="half-life-3.html" target="_self">Half-Life 3</a></li>
                    </ul>
                </nav>
            </header>
        
            <aside id="sign-in">
                <h2>Please sign in</h2>
                <p>No content so far</p>
            </aside>
        
            <section id="about">
                <h2>About:</h2>
                <p>Half-Life 2 was released in November 2004 following a five-year, $40 million development phase.</p>
                <p hidden>In 2017, the hearts of many gamers were broken when it became clear that Half-Life 3 would never see the light.</p>
            </section>
        
            <section id="information">
                <h2>Information:</h2>
                <ul>
                    <li>Developer: <a href="http://www.valvesoftware.com" target="_blank">Valve Corporation</a></li>
                    <li>Genre: First-person shooter</li>
                </ul>
            </section>
        
            <footer>
                <p>Half-Life 2 fansite - Some rights reserved</p>
            </footer>
        
        </div>
    </body>
</html>
```

---

In your browser, it should look like this:

![](../../img/html-website-semantic-elements-complete.png "MODULE: HTML5/CSS3 - Semantic elements")

---

## Even more HTML5 semantic elements?

We covered some of the most common HTML5 semantic elements.

Do know that there are more (article, main, figure and time).

Feel free to explore them on your own, they're all easy to understand.

However, we'll continue with HTML5 forms now!

---

# 9. HTML5 forms

HTML5 forms are a way of enabling user input. 

They consist of form elements which allow for different types of input such as text fields, checkboxes, dropdown lists, submit buttons and more.

---

## The form element

Defining a form isn't hard, simply use the `<form>` element:
```
<form>
    <!-- form elements go here -->
</form>
```

**Note:** `<!-- comment -->` is used for writing comments in HTML. 
The text inside the tags, nor the tags itself will be displayed to the users of your page.

---

## Form elements

A typical form has a set of form elements of which one is the *submit* button.

---

### Submit button

Every form needs a submit button.

```
<form>
    <input type="submit" value="Sign in">
</form>
```

| Html demo |
| -------------------------------------------- |
| <input type="submit" value="Sign in"> |

---

When pressed, the submit button should trigger the processing of the inputted form data.
For this however, we need some actual code (such as Javascript for example).

**Note:** An `<input>` element does not have a closing tag. So no `</input>`!

---

### Input

As you probably noticed, the submit button is a type of `<input>` form element, but there are more.

By using a different value for the `type` attribute of the `<input>` form element, we create a different kind of `<input>` form element.

---

For example, some standard and common types of `<input>` form elements:
```
<form>
    Firstname: <input type="text" id="firstname" name="firstname"> <br>
    Password: <input type="password" id="your-password" name="your-password" placeholder="secret?"> <br>
    <input type="radio" id="cat-radio" name="cat-or-dog" value="cat" checked> cats rule <br>
    <input type="radio" id="dog-radio" name="cat-or-dog" value="dog"> dogs rule <br>
    <input type="checkbox" id="human-validation" name="human-validation" value="human"> I am human
</form>
```

| Html demo | Browser preview |
| -------------------------------------------- | -------------------------------------------- |
| Firstname: <input type="text" name="firstname"> <br> Password: <input type="password" name="your-password" placeholder="secret?"> <br> <input type="radio" name="cat-or-dog" value="cat" checked> cats rule <br> <input type="radio" name="cat-or-dog" value="dog"> dogs rule <br> <input type="checkbox" name="human-validation" value="human"> I am human | ![](../../img/html-input-form-elements.png "MODULE: HTML5/CSS3 - Input form elements") |

---

**Note:** `<br>` is a HTML tag which enforces a new line. If we didn't use it here, all of our input form elements would be on one line.

The `name` and `value` attributes are optional, however they can change the behavior of the input form elements.
E.g.: radio buttons with the same `name` will be grouped together.

The `id` attribute can be added when we need to reference it (see the later section on labels). 
It can have the same value as the `name` attribute as long as it's unique (see the radio buttons on the previous slide).

---

HTML5 introduced a lot more types of `<input>` form elements.
Experiment with them yourself before continuing:
```
<form>
     Color <input type="color" name="a-color" value="#ffff00"> <br>
     Birthday <input type="date" name="birthday" min="1901-01-01"> <br>
     Birthday (date-time) <input type="datetime-local" name="birthday-time"> <br>
     Birthday (month-year) <input type="month" name="birthday-month"> <br>
     Week <input type="week" name="week-year"> <br>
     Time <input type="time" name="a-time"> <br>
     Email <input type="email" name="email"> <br>
     Amount <input type="number" name="quantity" min="1" max="10"> <br>
     Score <input type="range" name="points" min="0" max="100"> <br>
     Telephone number <input type="tel" name="telephone-number"> <br>
     Url <input type="url" name="my-page"> <br>
     Search <input type="search" name="my-search">
</form>
```

---

| Html demo | Browser preview |
| -------------------------------------------- | -------------------------------------------- |
| Color <input type="color" name="a-color" value="#ffff00"> <br> Birthday <input type="date" name="birthday" min="1901-01-01"> <br> Birthday (date-time) <input type="datetime-local" name="birthday-time"> <br> Birthday (month-year) <input type="month" name="birthday-month"> <br> Week <input type="week" name="week-year"> <br> Time <input type="time" name="a-time"> <br> Email <input type="email" name="email"> <br> Amount <input type="number" name="quantity" min="1" max="10"> <br> Score <input type="range" name="points" min="0" max="100"> <br> Telephone number <input type="tel" name="telephone-number"> <br> Url <input type="url" name="my-page"> <br> Search <input type="search" name="my-search"> | ![](../../img/html-input-form-elements-extra.png "MODULE: HTML5/CSS3 - Input form elements (extra)") |

---

Noticed how the behavior of certain input fields like `email`, `telephone` and `url` doesn't seem to differ from a classic text input field?

That's because their power lies in the fact that their input can be automatically validated (as being an email, telephone or url) once the form gets submitted.

But, when entering input, they do behave - to the user - like simple text input fields.

---

Before continuing,

Are you sure you did some experimenting with all the different types of `<input>`?

---

Absolutely sure?

---

Just kidding, I know you're working hard.

Let's move on!

`#NoTrustIssues`

---

### Selection

Just like `<input>`, `<selection>` is a form element.

It is used to specify a dropdown list of predefined possibilities from which the user can chose.

---

We provide options to the `<select>` form element using the `<option>` element.
Notice that both require a closing tag.

```
<select name="cat-names">
  <option value="bubbles">Bubbles</option>
  <option value="kittycat">Kittycat</option>
  <option value="mistermiauw" selected>Mister Miauw</option>
</select>
```

Adding the `selected` attribute to an option will select that option by default.

| Html demo | Browser preview |
| -------------------------------------------- | -------------------------------------------- |
| <select name="cat-names"><option value="bubbles">Bubbles</option><option value="kittycat">Kittycat</option><option value="mistermiauw" selected>Mister Miauw</option></select> | ![](../../img/html-form-select.png "MODULE: HTML5/CSS3 - Form select") |

---

### Textarea

Just like `<input>` and `<selection>`, `<textarea>` is a form element.

It is used to specify an area, larger than a text input field, in which the user can write text. 

---

A `<textarea>` has 2 unique attributes: `rows` and `cols`. 
They determine the height (rows) and width (cols) of the area.

```
<textarea name="text-message" rows="10" cols="30">
I am but a simply text area
with multiple
lines...
</textarea>
```

| Browser preview |
| ----------------------------------------------------------------- |
| ![](../../img/html-form-textarea.png "MODULE: HTML5/CSS3 - Form textarea") |

---

### Datalist

HTML5 introduced the `<datalist>` element, which comes with the new `list` input form element.

It functions as a combination between a text input field and dropdown list. 

Only a set of pre-defined options is allowed.
However, the user can type-in the option he is searching. If it's in the pre-defined list, it will be suggested to the user.

---

The value of the `list` attribute must always match the value of the datalist's `id` attribute!

The `<datalist>` element is populated with the `<option>` element, just like the `<select>` element.

```
  <input list="best-games-ever-made">
  <datalist id="best-games-ever-made">
    <option value="Half-Life 2">
    <option value="Half-Life">
    <option value="Freddy Fish">
  </datalist> 
```

| Html demo | Browser preview |
| ----------------------------------------------------------------- | ----------------------------------------------------------------- |
| <input list="best-games-ever-made"> <datalist id="best-games-ever-made"> <option value="Half-Life 2"> <option value="Half-Life"> <option value="Freddy Fish"> </datalist>  | ![](../../img/html-form-datalist.png "MODULE: HTML5/CSS3 - Form datalist") |

---

### Even more form elements?

Jup, there are even more form elements (keygen, output, button, etc.).

We have covered most of them. Certainly the most common, which is more than enough for now.

However, you are free (willy) to explore them on your own.

---

### Labels

Before we go and create our own form for our web page, let's quickly talk about labels.

Take a simple text input field:

```
Firstname: <input type="text" name="firstname">
```

"Firstname", the text in front of the input field, is what we call the "label".

However, we didn't make the label explicit.

That's pretty naughty of us and certainly not "clean". 
Time to fix that!

---

when labelling form elements, always use the `label` element to create the label .

Add the `for` attribute to indicate to which form element the label belongs.
The value of the `for` attribute should equal the **id** attribute (**not** the **name** attribute) of the form element it belongs to.

```
<label for="user-firstname">Firstname: </label>
<input id="user-firstname" type="text" name="firstname">
```

| Html demo | Browser preview |
| -------------------------------------------- | -------------------------------------------- |
| <label for=user-firstname>Firstname: </label> <input id="user-firstname" type="text" name="firstname"> | ![](../../img/html-text-field-label.png "MODULE: HTML5/CSS3 - Label") |

---

## Do it yourself

It's time, to do it yourself!

We're now going to create our own sign-up form for our *"index.html"* page. 

Ready, Set, Go!

---

Add a form (inside your `<aside>` element) containing:

- An email input field for entering your email.
- A password input field for entering your password.
- A datalist containing 3 countries (Belgium, France and Germany).
- A select element containing 3 roles (Admin, Moderator, User). Moderator should be the default selected option.
- A checkbox input field, asking the user if he wants to stay logged in.
- A submit button

Make sure to always provide a meaningful label for every element.

Make sure to try it out yourself before inspecting the example code on the next slide.

---

Hopefully your *"index.html"* page looks something like this now:
```
<!DOCTYPE html>
<html>
    <head>
        <title>Half-Life Fansite: The best game ever is Half-Life 2</title>
    </head>
    <body>
        <div class="page-container">
        
            <header id="page-header">
                <h1 id="primary-title">Best Game Ever</h1>
                <p class="text-splash">I'll introduce you to the best game ever made: Half-Life 2</p>
        
                <nav id="page-navigation">
                    <h2>Navigation</h2>
                    <ul>
                        <li><a href="half-life-3.html" target="_self">Half-Life 3</a></li>
                    </ul>
                </nav>
            </header>
        
            <aside id="sign-in">
                <h2>Please sign in</h2>
                <form>
                    <label for="sign-in-email">E-mail: </label>
                    <input id="sign-in-email" type="email"> <br>
                    
                    <label for="sign-in-password">Password: </label>
                    <input id="sign-in-password" type="password"> <br>
                    
                    <label for="sign-in-countries">Countries: </label>
                    <input list="sign-in-countries">
                    <datalist id="sign-in-countries">
                        <option value="Belgium">
                        <option value="France">
                        <option value="Germany">
                    </datalist> <br>
                    
                    <label for="sign-in-roles">Roles: </label>
                    <select id="sign-in-roles">
                        <option value="admin">Administrator</option>
                        <option value="moderator" selected>Moderator</option>
                        <option value="user">User</option>
                    </select> <br>
                    
                    <label for="sign-in-stay-logged-in">Stay loggged in? </label>
                    <input id="sign-in-stay-logged-in" type="checkbox"> <br>
                    
                    <input type="submit" value="Sign in"> <br>
                </form>
            </aside>
        
            <section id="about">
                <h2>About:</h2>
                <p>Half-Life 2 was released in November 2004 following a five-year, $40 million development phase.</p>
                <p hidden>In 2017, the hearts of many gamers were broken when it became clear that Half-Life 3 would never see the light.</p>
            </section>
        
            <section id="information">
                <h2>Information:</h2>
                <ul>
                    <li>Developer: <a href="http://www.valvesoftware.com" target="_blank">Valve Corporation</a></li>
                    <li>Genre: First-person shooter</li>
                </ul>
            </section>
        
            <footer>
                <p>Half-Life 2 fansite - Some rights reserved</p>
            </footer>
        
        </div>
    </body>
</html>
```

---

In your browser, you should see your sign-in form:

![](../../img/html-form-complete.png "MODULE: HTML5/CSS3 - Form complete")

---

# 10. HTML character entities

Certain characters, such as "&lt;", are reserved in HTML (because they are used by HTML itself).
However, sometimes you need to use them as content.

To display these characters, we use character entities.

---

If you want to use "&lt;" as content, for example in an equation (2 &lt; 3), 
you type `&lt;` instead of "&lt;".

`&lt;` is the character entity of "&lt;".

Whenever you want to use "&lt;" as content, use the character entity. 
If you don't, you risk not displaying the character "&lt;" correctly.

---

E.g.:
```
<p> Math equation: 10 &lt; 20 </p>
```

| Html demo | Browser preview |
| -------------------------------------------- | -------------------------------------------- |
| Math equation: 10 &lt; 20 | ![](../../img/html-character-entities.png "MODULE: HTML5/CSS3 - Character entities") |

---

## Character entities: overview

Here are some useful character entities, know that there are more:

| Character entity | Result in HTML |
| ----------- | -----------|
| `&lt;` | &lt; |
| `&gt;` | &gt; |
| `&amp;` | &amp; |
| `&quot;` | &quot; |
| `&apos;` | &apos; |
| `&euro;` | &euro; |
| `&copy;` | &copy; |

---

# 11. HTML character encoding

To correctly display symbols and characters (&copy;, ¨, %, &amp;, ~, etc.), the browser must know how to properly encode them.

---

## What is character encoding?

Pay attention, we'll go a bit (pun intended) more technical. 

A computer does not "understand" symbols, numbers or letters (characters). It understands bits (1 or 0, yes or no).
A collection of 8 bits is a byte (e.g.: 01001001). 

---

Character encoding specifies a translation between bits (or bytes) and characters.


| Bits | Character |
| ----------- | -----------|
| `01000001` | A |
| `01000010` | B |

This above example uses the `ASCII` character set (which is a synonym for character encoding).
ASCII encoding only uses the first 7 bits of a byte (x0000000 through x1111111). 
This allows for (only) 128 characters to be defined ( every bit has 2 possible states, 7 bits in total: 2^7 = 128).

---

## Different character sets / encodings

We just discussed ASCII and how it allows for only 128 characters.

ANSI is an extension of ASCII and uses a full byte (8 bits), this allows for 256 possible characters (2^8 = 256).
ANSI was the default character set for HTML4.

For HTML5 the default character set is UTF-8. A character in UTF-8 can be up to 4 bytes long, allowing up to 2^32 possibilities.
It covers almost all the characters and symbols in the world.

---

## Defining a character set

On a web page, we need to define a character set.

This character set will be used by the browser to correctly display all characters and symbols present on that page.

---

To make you aware of the importance of character sets, take the following example for a website containing the word "België":

| ANSI character set defined | UTF-8 character set defined |
| ----------- | -----------|
| ![](../../img/html-character-encoding-ansi.png "MODULE: HTML5/CSS3 - Ansi encoding") | ![](../../img/html-character-encoding-utf8.png "MODULE: HTML5/CSS3 - UTF-8 encoding") |

The reason "ë" is not properly displayed when using ANSI, is because ANSI does not have an encoding for "ë".

---

### HTML5 default character set

For HTML5, the default character set is `UTF-8`.

Defining the `UTF-8` character encoding is done using the `<meta>` element with attribute `charset`. This will enforce your browser to use the defined character encoding.

It is nested inside the `<head>` element:

```
<head>
    <meta charset="UTF-8">
</head>
```

**Note:** The `<meta>` element does not have a closing tag.

---

### Do it yourself

It's time, to do it yourself!

---

Define `UTF-8` as character encoding for your *"index.html"* page.

---

The head-section of your *"index.html"* page should look like this:
```
<html>
    <head>
        <title>Half-Life Fansite: The best game ever is Half-Life 2</title>
        <meta charset="UTF-8">
    </head>
    <body>
        ...
    </body>
</html>
```

---

# 12. HTML tables

Our final chapter of the HTML5 lab will be about tables.

---

## A table? 

A table is used for presenting data in rows and columns, just like you would in Excel.

Tables are something you'll use pretty often. 

---

## A complete HTML table

We'll start by providing you with a complete example of an HTML table:

```
<table>
    <thead>
        <tr>
            <th>Games</th>
            <th>Review score</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Half-Life</td>
            <td>9/10</td>
        </tr>
        <tr>
            <td>Half-Life</td>
            <td>10/10</td>
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <td></td>
            <td>Average: 9,5/10</td>
        </tr>
    </tfoot>
</table>
```

---

In your browser - with no CSS styling applied - your table will look like this:

| Browser preview |
| -----------|
| ![](../../img/html-table.png "MODULE: HTML5/CSS3 - HTML table") |

---

## Creating a complete HTML table

The `<table>` element creates a table.

```
<table>
</table>
```

---

Directly nested inside the `<table>` element, are the `<thead>` and `<tbody>` elements. 
One defines and groups the header content of a table, the other defines and groups the body content of a table.

You could also add the `<tfoot>` element, if needed. It will insert its nested rows at the very bottom of the table.

```
<table>
    <thead>
    </thead>
    
    <tbody>
    </tbody>
    
    <tfoot>
    </tfoot>
</table>
```

---

`<td>` and `<th>` elements define - respectively - cells and header cells (header cells should be used in the `<thead>` element only). 

They should always be enclosed by `<tr>` elements, which define rows.


```
<table>
    <thead>
        <tr>
            <th>Games</th>
            <th>Review score</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Half-Life</td>
            <td>9/10</td>
        </tr>
        <tr>
            <td>Half-Life</td>
            <td>10/10</td>
        </tr>
    </tbody>
</table>
```

---

### Do it yourself

It's time, to do it yourself!

---

Open up you *"index.html"*, we'll add a simple table.

Create a new section (id = "half-life-games").

Add a title to the section ("Half Life games").

Nested inside this section a table which consists of:

- One column named "Games"
- 3 rows for this column ("Half-Life 1", "Half-Life 2", "Half-Life 2: Episode 1 & 2")

---

If you did things right, your *"index.html"* should like something like this:
```
<!DOCTYPE html>
<html>
    <head>
        <title>Half-Life Fansite: The best game ever is Half-Life 2</title>
        <meta charset="UTF-8">
    </head>
    <body>
    
        <div class="page-container">
        
            <header id="page-header">
                <h1 id="primary-title">Best Game Ever</h1>
                <p class="text-splash">I'll introduce you to the best game ever made: Half-Life 2</p>
        
                <nav id="page-navigation">
                    <h2>Navigation</h2>
                    <ul>
                        <li><a href="half-life-3.html" target="_self">Half-Life 3</a></li>
                    </ul>
                </nav>
            </header>
        
            <aside id="sign-in">
                <h2>Please sign in</h2>
        
                <form>
                    <label for="sign-in-email">E-mail: </label>
                    <input id="sign-in-email" type="email"> <br>
        
                    <label for="sign-in-password">Password: </label>
                    <input id="sign-in-password" type="password"> <br>
        
                    <label for="sign-in-countries">Countries: </label>
                    <input list="sign-in-countries">
                    <datalist id="sign-in-countries">
                        <option value="Belgium">
                        <option value="France">
                        <option value="Germany">
                    </datalist>
                    <br>
        
                    <label for="sign-in-roles">Roles: </label>
                    <select id="sign-in-roles">
                        <option value="admin">Administrator</option>
                        <option value="moderator" selected>Moderator</option>
                        <option value="user">User</option>
                    </select> <br>
        
                    <label for="sign-in-stay-logged-in">Stay loggged in? </label>
                    <input id="sign-in-stay-logged-in" type="checkbox"> <br>
        
                    <input type="submit" value="Sign in"> <br>
                </form>
        
            </aside>
        
            <section id="about">
                <h2>About:</h2>
                <p>Half-Life 2 was released in November 2004 following a five-year, $40 million development phase.</p>
                <p hidden>In 2017, the hearts of many gamers were broken when it became clear that Half-Life 3 would never see
                    the light.</p>
            </section>
        
            <section id="information">
                <h2>Information:</h2>
                <ul>
                    <li>Developer: <a href="http://www.valvesoftware.com" target="_blank">Valve Corporation</a></li>
                    <li>Genre: First-person shooter</li>
                </ul>
            </section>
        
            <section id="half-life-games">
                <h2>Half-Life games</h2>
                <table>
                    <thead>
                    <tr>
                        <th>Games</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Half-Life 1</td>
                    </tr>
                    <tr>
                        <td>Half-Life 2</td>
                    </tr>
                    <tr>
                        <td>Half-Life 2: Episode 1 &amp; 2</td>
                    </tr>
                    </tbody>
                </table>
            </section>
        
            <footer>
                <p>Half-Life 2 fansite - Some rights reserved</p>
            </footer>
        
        </div>
    
    </body>
</html>
```

---

And in your browser, it should look like this:

![](../../img/html-table-complete.png "MODULE: HTML5/CSS3 - HTML table complete")

---
    
# HTML5/CSS3 - LAB 01: HTML5

**Hooray, That's My Lad(y)!** (get it? H, T M L!)

You have successfully completed this lab.
You are now ready to take on the next lab, good luck!