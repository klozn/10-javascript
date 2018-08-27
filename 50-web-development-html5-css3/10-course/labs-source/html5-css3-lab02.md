![MODULE: HTML5/CSS3 - LAB 02](../../../../resources/img/switchfully_logo.png "MODULE: HTML5/CSS3 - LAB 02")

# HTML5/CSS3 - LAB 02: CSS3

In this lab we will get you accustomed to the basics of CSS3.

---

# 1. What is CSS(3)?

CSS stands for Cascading Style Sheets.

---

## What can we do with it?

CSS is language created to handle the look and feel of HTML web pages.

With CSS we can *style* the entire layout and content (text, images, tables, backgrounds, etc.) of a page.

Although HTML offers some limited styling possibilities of its own, 
CSS is faster, more reusable, easier to maintain and easier to write.

---

## CSS or CSS3?

In general - when speaking of CSS - people are speaking of CSS3, which is the latest version of CSS.

To avoid confusion: whenever **we** talk about CSS, we mean CSS3.

---

# 2. Adding your first CSS to HTML elements

We'll go through the essentials for writing CSS and adding it to HTML elements.

---

## Inline, Internal and External

There are actually 3 different ways of adding CSS to HTML elements:

Inline, Internal and External:

| | Usage | Reusability |
| ---------- | ------------------------------- | ------------------------------- |
| **Inline** | Uses the style attribute on the HTML element | Limited to HTML element |
| **Internal** | Uses the `<style>` element in the `<head>` element | Limited to the page |
| **External** | Uses an external CSS file | Can be reused by &gt; 1 pages | 

---

### External CSS for the win

Because of reusability, it's advised to use an **external** CSS file whenever possible.

It's also more *"clean"* to separate HTML and CSS as much as possible. 
Intertwining both makes maintainability harder.

However, there are certain Javascript frameworks (e.g.: React) who more or less promote inline CSS.

We will cover all 3 different ways, though.

---

## Inline CSS

Adding CSS to an HTML element the *inline* way is easy.
Just add the attribute `style` to the HTML element you wish to *style*.

Then, as the attribute's value, add one or more CSS **properties** and their **values** (noted as `property:value;`):

```
<p style="color: orange;">Hello World!</p>
```

`color` being the **property** and `orange` its **value**.

| HTML without CSS | HTML with CSS|
| ---------- | ---------- |
| <span>Hello World!</span> | <span style="color:orange;">Hello World!</span> |

---

You can add more than one property:
```
<p style="color: orange; text-transform: uppercase;">Hello World!</p>
```

| HTML without CSS | HTML with CSS|
| ---------- | ---------- |
| <span>Hello World!</span> | <span style="color:orange; text-transform:uppercase;">Hello World!</span> |

---

## CSS properties

There is a huge amount of CSS properties.
The list of CSS text properties that only manipulate text, is already a pretty long one.

We'll provide you with some of the most common and useful. 

However, it's up to you to discover and experiment with them.

---

### CSS text properties

| Property | Values |
| --------------------------- | --------------------------- |
| direction | ltr, rtl |
| text-align | center, left, right |
| text-decoration | overline, line-through, underline |
| text-transform | uppercase, lowercase, capitalize |
| letter-spacing | the amount of spacing in pixels (e.g.: 5px) |
| color | color names (e.g.: orange) or hexadecimal colors (e.g.: #ff7800) |

---

You already did some experimenting with the text properties?

Good, then let's continue.

---

## Internal CSS

Using CSS the internal way is done by creating and nesting the `<style>` element inside the `<head>` element of a page.

CSS properties are then added inside this `<style>` element.
 
However, since we disconnected the CSS properties from the HTML element they need to style, we need to introduce a new concept: the `selector`.

---

### Selector

The `selector` is used for referencing the HTML element to whom the CSS properties should apply.

A selector can be:

- An HTML element (e.g.: p, section, h1, h2, etc.)
- An id value (prefixed by "#")
- A class value (prefixed by ".")

A `selector` has the following notation: `selector { property: value; }`.

We'll provide some examples to make this crystal clear.

---

Let's take the following inline styled HTML element:
```
<p style="color: orange; text-transform: uppercase;" id="hello-world" class="paragraph">Hello World!</p>
```

We're now going to transform it to internal CSS.

To start, remove the inline CSS:
```
<p id="hello-world" class="paragraph">Hello World!</p>
```

---

Reintroduce the removed CSS properties in the `<style>` element.

Use the `<p>` element as the `selector`. By doing so, **every** `<p>` element of that page will be styled accordingly:

```
<html>
    <head>
        ...
        <style>
            p {
                color: orange;
                text-transform: uppercase;
            }
        </style>
    </head>
    ...
</html>
```

Both elements of that page will be styled the same way:
```
<p>I will be styled</p>
<p id="hello-world" class="paragraph">Hello World!</p>
```

---

We could also use the **id**, of the HTML element to style, as the `selector`. By doing so, **only** the HTML element to whom the **id** belongs to, will be styled accordingly (notice the prefix "#"):

```
<html>
    <head>
        ...
        <style>
            #hello-world {
                color: orange;
                text-transform: uppercase;
            }
        </style>
    </head>
    ...
</html>
```

Only the second - hello-world - element of that page will be styled:
```
<p>I will not be styled</p>
<p id="hello-world" class="paragraph">Hello World!</p>
```

---

Alternatively, we could use the **class**, of the HTML element to style, as the `selector`. By doing so, **only** those HTML elements whom contain that **class** will be styled accordingly (notice the prefix "."):

```
<html>
    <head>
        ...
        <style>
            .paragraph {
                color: orange;
                text-transform: uppercase;
            }
        </style>
    </head>
    ...
</html>
```

Only the two last elements will be styled:
```
<p>I will not be styled</p>
<p class="paragraph">I will be styled</p>
<p id="hello-world" class="paragraph">Hello World!</p>
```

---

### Multiple selectors

The `<style>` element can contain multiple `selectors`:

```
<html>
    <head>
        ...
        <style>
            .shouting-text {
                text-transform: uppercase;
            }
        
            p {
                color: #FFFFFF; /* this is the hexadecimal value of color white */
            }
            
            section {
                background-color: #000000; /* this is the hexadecimal value of color black */
            }
        </style>
    </head>
    ...
</html>
```

**Note:** In CSS, `/* comment */` can be used for writing comments. These will be ignored by the browser but can be useful for developers.

---

## External CSS

Using CSS the external way is very similar to the internal way.

The only difference is that with external CSS, the CSS is located in a different file.

This allows for using the CSS on more than one page.

---

External CSS consists of two parts:

- An external file with `.css` as its extension.
- An HTML `<link>` element to include the `.css` file.

Every page that includes the `.css` file, will receive the same CSS styling.

Let's demonstrate this with an example.

---

### Creating and linking an external CSS file

We start with our previous example:
```
<html>
    <head>
        ...
        <style>
            .shouting-text {
                text-transform: uppercase;
            }
        
            p {
                color: #FFFFFF; /* this is the hexadecimal value of color white */
            }
            
            section {
                background-color: #000000; /* this is the hexadecimal value of color black */
            }
        </style>
    </head>
    ...
</html>
```

---

We copy the contents of the `<style>` tag (but not the tag itself) and paste them into a new file that we call `styles.css`:
```
.shouting-text {
    text-transform: uppercase;
}

p {
    color: #FFFFFF; /* this is the hexadecimal value of color white */
}

section {
    background-color: #000000; /* this is the hexadecimal value of color black */
}
```

---

We then remove the `<style>` tag and all it contents from the HTML page and add a `<link>` element, 
which includes the `styles.css`.

We do need to add it the following attributes: 

- The `rel` attribute, where we indicate we're linking a `stylesheet`
- the `href` attribute where we specify a relative path to the CSS file (or an absolute path if the css file is on an external server). 

```
<html>
    <head>
        ...
        <link rel="stylesheet" href="styles.css">
    </head>
    ...
</html>
```
---

That's it, we're all linked up. All the CSS defined in `styles.css` will apply to all the pages who include that stylesheet.

---

### Mixed usage

Using both the inline, internal and external way for adding CSS to HTML elements of a page, is possible.

However, as a rule of thumb, use the external way as much as possible.

---

### Inheriting CSS styles

Elements nested inside other elements will inherit the CSS styles of their parent elements.

Because of this, the text "I am an orange child" will also have an orange color in the following example:

```
<div class="parent" style="color:orange;">
    <p>I will have an orange color</p>
    <div class="child">
        <p>I am an orange child</p>
    </div>  
</div>
```

---

## Do it yourself

It's time, to do it yourself!

---

Create a new css file, name it `mystyles.css`, which contains the following styles:

- The background color of the `body` element should be `#222222`
- All text of class `page-container` should have the color `#72a71f`
- The background color of all `header` elements should be `#72a71f`
- The text color of all `header` elements should be `#222222`
- The `section` elements should have a solid, white border of 5px width (Google: "css border")

When you're done with these, go to the next slide.

Spoiler: there are some more styles to add...

---

Also add the following styles to the `mystyles.css` sheet:

- The element containing id `sign-in` should have background color `#b94f00`
- The element containing id `sign-in` should have text color `white`
- The text contained in `h2` headings should be uppercase'd
- All the links (`<a>`) should have color `orange`
- All the links (`<a>`), when hovered, should have color `red` (Google: "css :hover selector")
- All `input` form fields should have their font size set to large (Google: "css font-size")
- Style the `footer` the same way as the `header`

---

If you did things right, only one line of code should have been added to your *"index.html"* file, 
namely the `<link>` element inside your `<head>` section:
```
<html>
    <head>
        <title>Half-Life Fansite: The best game ever is Half-Life 2</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="mystyles.css">
    </head>
    ...
</html>
```

---

Your `mystyles.css` sheet should look something like this. Inspect it closely. Google - or ask us - the questions you have.
```
body {
    background-color: #222222;
}

.page-container {
    color: #72a71f;
}

header, footer {
    background-color: #72a71f;
    color: #222222;
}

section {
    border: solid 5px white;
}

#sign-in {
    background-color: #b94f00;
    color: white;
}

h2 {
    text-transform: uppercase;
}

a {
    color: orange;
}

a:hover {
    color: red;
}

input {
    font-size: large;
}
```

---

Your web page should now look like this, which is not that, erm... 
Let's just say I bet it has a great personality!

![](../../img/css-website-first-styling.png "MODULE: HTML5/CSS3 - CSS Styling")

---

# 3. The Box Model

Up next, the box model.

---

## Inline-level elements versus Block-level elements

Before explaining what the box model is, we have to explain what inline-level and block-level elements are.

---

### Inline-level elements

Inline-level elements are HTML elements who do not take up the entire width of their parent HTML element (in which they are nested, their "container").

In other words: inline-level elements do not enforce an new entire horizontal line, they stay *in their current line*.

---

The `<label>`, `<input>`, `<a>` and `<span>` elements are (some) examples of inline-level elements.

**Note:** The `<span>` element is actually **thé** element to group content in an *inline* way. It provides no visual change by itself. 
It's the ideal HTML element to add a `class`, `id` or another attribute, in an inline way, to content.

---

To demonstrate an inline-level element, see the following example.

The green border indicates the space the inline-level element takes up.
 
```
This is some text to demonstrate how an <span>inline-level</span> element actually behaves.
```

![](../../img/css-inline-level.png "MODULE: HTML5/CSS3 - Inline-level element")

Notice how an inline-level element does not enforce a new horizontal line. It simply stays inside its current line, 
only taking up as much space as its content requires.

---

### Block-level elements

In contrast, block-level elements do take up the entire width of their parent HTML element.

Their content is fitted inside an invisible `box` which takes up the entire available horizontal space.

Some examples of block-level elements are `<section>`, `<div>`, `<p>`, `<h1>` and `<ul>`.

---

To demonstrate a block-level element, see the following example.

The green border indicates the space the block-level element takes up.
(imagine its parent being the `<body>` element)

```
This is some text to demonstrate how a <p>block-level</p> element actually behaves.
```

![](../../img/css-block-level.png "MODULE: HTML5/CSS3 - block-level element")

Notice how a block-level element enforces a new line and how it takes up a new line and - by default - the entire available horizontal space of that line.

---

## The Box Model explained

We've talked about how block-level elements fit their content in an invisible `box` which takes up a new line and - by default - the entire available horizontal space of that line.

Using the box model, we can describe:

- The amount of spacing required inside a single `box`
- The borders and amount of spacing required between multiple `boxes`

In other words, we can decide the size of the box. It doesn't have to take up *all* the available space.
The box model describes how we can achieve this.

---

The box model consists of 4 parts:

- Content area
- Padding
- Border
- Margin

![](../../img/the-box-model.png "MODULE: HTML5/CSS3 - The Box Model")

---

To make things more clear, try comparing the box model with a garage:

- The content area is the car.
- The padding is the space between your car and the walls.
- The borders are the walls.
- The margin is the space between your garage and other garages.

![](../../img/the-box-model-garage.png "MODULE: HTML5/CSS3 - The Box Model - garage")

---

### Content area

The content area can be given an absolute or relative width and height.

If no width or height is provided, the content area will have a default width of 100%. 
The height adapts itself to the amount of content inside the content area.

---

A content area (in green) with no defined width or height:

<div style=background-color:#72a71f;">Content area</div>

A content area (in green) with width and height defined:

```
div {
    width: 20%; /* relative, meaning: "take up 20% of the available width"*/
    height: 35px; /* absolute, meaning: "take up exactly 35 pixels"*/
}
```

<div style="width:20%; height:35px; background-color:#72a71f;">Content area</div>

---

### Padding

Padding can be added to the top, bottom, left and right of the content area, all independently of each other.

---

The previous content area (in green), without padding:

<div style="width:20%; height:35px; background-color:#72a71f;">Content area</div>

The content area (in green) with padding:

```
div {
    width: 20%;
    height: 35px;
    padding 25px 150px 25px 25px; /* top right bottom left - clockwise */
}
```

<div style="width:20%; height:35px; padding-top:25px; padding-right:150px; padding-bottom:25px; padding-left:25px; background-color:#72a71f;">Content area</div>

Notice how padding expands the content area. However, it expands it with reserved space. Meaning no content can be placed inside this extra (padding) space.

---

It also possible to provide padding using the direction padding properties instead of the shorthand notation:

```
div {
    padding-top: 25px;
    padding-right: 150px;
    padding-bottom: 25px
    padding-left: 25px;
}
```

---

### Borders

Borders can be added to the top, bottom, left and right of the content area + padding, all independently of each other.

Borders have a width, color and style (solid, dotted, dashed, ...)

---

The previous content area + padding (in green):

<div style="width:20%; height:35px; padding-top:25px; padding-right:150px; padding-bottom:25px; padding-left:25px; background-color:#72a71f;">Content area</div>

The content area + padding (in green) with a border:

```
div {
    width: 20%;
    height: 35px;
    padding 25px 150px 25px 25px;
    border: 10px solid white; /* width style color */
}
```

<div style="width:20%; height:35px; padding-top:25px; padding-right:150px; padding-bottom:25px; padding-left:25px; border-color: white; border-style:solid; border-width: 10px; background-color:#72a71f;">Content area</div>

Notice how the border is an extra layer around the content area. 

---

instead of the shorthand notation, we could use more specific border properties:

```
div {
    border-width: 10px 5px 15px 20px; /* top right bottom left - clockwise*/
    border-style: solid dashed solid dashed; /* top right bottom left - clockwise*/
    border-color: white red white red; /* top right bottom left - clockwise*/
}
```

Or, even more specific:

```
div {
    border-top-width: 10px;
    border-top-color: white;
    border-top-style: solid;
}
```

---

### Margin

Margin can be added to the top, bottom, left and right of the border or - if no border is present - the content area + padding.

---

No margin:

<div style="float:left; width:20%; height:35px; padding-top:25px; padding-right:150px; padding-bottom:25px; padding-left:25px; border-color: white; border-style:solid; border-width: 10px; background-color:#72a71f;">Content area</div>
<div style="float:left; background-color:orange">Another element</div>
<div style="clear: both;"></div>

With margin (notice the gap between the elements due to margin):

```
div {
    width: 20%;
    height: 35px;
    padding 25px 150px 25px 25px;
    border: 10px solid white;
    margin: 10px; /* we could also do margin: 10px 10px 10px 10px */
}
```

<div style="float:left; width:20%; height:35px; padding-top:25px; padding-right:150px; padding-bottom:25px; padding-left:25px; border-color: white; border-style:solid; border-width: 10px; background-color:#72a71f; margin:10px;">Content area</div>
<div style="float:left; background-color:orange">Another element</div>
<div style="clear: both;"></div>  

---

## Do it yourself

It's time to add some margin, padding and borders to your own web page!

---

Open up your `mystyles.css` file, add the following properties:

- All `section`, `header` en `footer` elements should have a `padding` of 15px and a `margin` of 25px
- Change to `section` background color to `black`
- Change the border of `section` so that all sides have width 1px, except the bottom, it should have a border of 10px
- The border of `section` can remain of type `solid`, however change its color to `#72a71f`
- Add a `padding` and `margin` of 25px to `#sign-in`
- Set the width of `#sign-in` to 25%

---

Your `mystyles.css` file should now look something like this:
```
body {
    background-color: #222222;
}

.page-container {
    color: #72a71f;
}

header, footer {
    background-color: #72a71f;
    color: #222222;
    padding: 15px;
    margin: 25px;
}

section {
    background-color: black;
    border-style: solid;
    border-width: 1px 1px 10px 1px;
    border-color: #72a71f;
    padding: 15px;
    margin: 25px;
}

#sign-in {
    background-color: #b94f00;
    color: white;
    padding: 25px;
    margin: 25px;
    width: 25%;
}

h2 {
    text-transform: uppercase;
}

a {
    color: orange;
}

a:hover {
    color: red;
}

input {
    font-size: large;
}
```

---

Open your index.html file in your browser, it should look like this:

![](../../img/css-box-model-website.png "MODULE: HTML5/CSS3 - Website updated with padding, margin and borders")

---

# 4. CSS Grid layout

We'll briefly walk you through the CSS Grid layout.

---

## What is Grid Layout?

"CSS Grid Layout is the most powerful layout system available in CSS. 

It is a 2-dimensional system, meaning it can handle both columns and rows. 
You work with Grid Layout by applying CSS rules both to a parent element (which becomes the Grid Container) and to that elements children (which become Grid Items)."

*- Chris House*

---

Simply put: grid layout allows us to position our semantic HTML elements (`<section>`, `<header>`, etc) in a more flexible way.

Know that Grid layout is a very extensive feature of CSS.

We'll cover one usage: grid template.

---

With grid layout, we can transform our page to look like the example on the right:

![](../../img/grid-template.png "MODULE: HTML5/CSS3 - Grid template")

---

## Grid template

One of the easiest ways of working with grid layout, is by using the grid template functionality.

With grid template you have to define different grid areas, which you can then start positioning.

---

If you we look at our preferred page layout, we can identify 4 different grid areas: a header, a footer, a sidebar and our main content.

We can name them however we want. However, keep it logical.

![](../../img/grid-template-areas.png "MODULE: HTML5/CSS3 - Grid template areas")

---

The header section in our *"index.html"* contains both the page title and navigation and is enclosed by the `<header>` element.

The sidebar section contains the *sign in* form and is enclosed by the `<aside>` element.

The footer section is enclosed by the `<footer>` element.

The main section consists out of the "about", "information" and "half-life-games" `<section>` elements. 
We will need to wrap them with a parent element such as a `<div>` or the semantic html element `<main>`.

---

### Grid area

For every enclosing html element we just discussed, we need to add the corresponding grid area we defined:

```
header {
    grid-area: header;
}

footer {
    grid-area: footer;
}

aside {
    grid-area: sidebar;
}

main {
    grid-area: main;
}

```

---

### Grid container

We now need to define our grid container.
The grid container needs to enclose all of our grid-area elements.

Remember, in your *"index.html"* file, how the `<div>` element with id "page-container" does exactly that?

---

In order to enable grid layout, we have to add certain CSS properties (rows, columns, areas) to the "page-container":

```
.page-container {
    display: grid; /* enables the grid layout */
    grid-template-columns: 12% 12% 76%; /* we define 3 columns, 2 taking up 12% of the space each, the other 76% */
    grid-template-rows: auto; /* rows will be generated automatically based on the grid-template-areas */
    grid-template-areas: /* we define a 3 x 3 grid */
            "header header header"
            "sidebar sidebar main" /* The sidebar will take up 24% of the space */
            "footer footer footer";
}
```

---

## Learn more

This is as far we cover grid layout (although we'll still do a "Do it yourself" on the next slides).

If you want to learn more about CSS Grid Layout, check out <a href="https://css-tricks.com/snippets/css/complete-guide-grid/" target="_blank">this complete guide</a>!

---

## Do it yourself

It's time, to do it yourself!

---

In your `index.html` file

- Wrap the "about", "information" and "half-life-games" `<section>` elements with the `<main>` semantic html element.

---

Your `index.html` file should now look like this:

```
<!DOCTYPE html>
<html>
    <head>
        <title>Half-Life Fansite: The best game ever is Half-Life 2</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="mystyles.css">
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

            <main>
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
            </main>

            <footer>
                <p>Half-Life 2 fansite - Some rights reserved</p>
            </footer>

        </div>

    </body>
</html>
```

---

In your `mystyles.css` file, make the following additions:

- The "header" selector should have property `grid-area` and value `header`.
- The "aside" selector should have property `grid-area` and value `sidebar`.
- The "footer" selector should have property `grid-area` and value `footer`.
- The "main" selector should have property `grid-area` and value `main`.
- The ".page-container" selector should have property `display` and value `grid`

---

The ".page-container" selector should have the following grid-template properties:

- 2 columns (25% and 75% wide)
- Automatic rows
- A 3 x 2 layout in which the header fills up the first row, the sidebar is on the left of the middle row, the main content is on the right of the middle row and the footer fills up the third row.

---

Your `mystyles.css` sheet should look something like this.
```
body {
    background-color: #222222;
}

.page-container {
    color: #72a71f;
    display: grid;
    grid-template-columns: 25% 75%;
    grid-template-rows: auto;
    grid-template-areas:
            "header header"
            "sidebar main"
            "footer footer";
}

header {
    grid-area: header;
}

footer {
    grid-area: footer;
}

aside {
    grid-area: sidebar;
}

main {
    grid-area: main;
}

header, footer {
    background-color: #72a71f;
    color: #222222;
    padding: 15px;
    margin: 25px;
}

section {
    background-color: black;
    border-style: solid;
    border-width: 1px 1px 10px 1px;
    border-color: #72a71f;
    padding: 15px;
    margin: 25px;
}

#sign-in {
    background-color: #b94f00;
    color: white;
    padding: 25px;
    margin: 25px;
}

h2 {
    text-transform: uppercase;
}

a {
    color: orange;
}

a:hover {
    color: red;
}

input {
    font-size: large;
}
```

**Note:** Remove the `width:25%` property from the "#sign-in" selector.
Otherwise you're telling the "#sign-in" selector to fill up 25% of the available space, which is only 25% of the entire space.

---

Your web page should now look like this:

![](../../img/grid-template-areas-complete.png "MODULE: HTML5/CSS3 - Grid layout")

---

# 4. Other useful topics

To conclude this lab, we'll provide you with some topics we won't cover, but are useful and can be looked into by yourself.

---

## Responsive design

No matter the screen-size (desktop, tablet, smartphone),
a responsive website will automatically adapt its layout to present its content in a pleasant and readable way.

Like to know more? Read more about it <a href="https://en.wikipedia.org/wiki/Responsive_web_design" target="_blank">here</a>.

---

## CSS frameworks

CSS frameworks allow for faster and easier web development by providing a set of CSS styling, 
out-of-the-box responsive design, typography, browser incompatibility solutions, grid layout systems and more.

Like to know more? Check out <a href="https://getbootstrap.com/" target="_blank">Bootstrap</a>, go to "Get started" and follow the "Quick start".


---

## Preprocessors CSS

Writing CSS can become quite repetitive and little tasks such as having to look up hex color values, 
closing your tags, etc. can become time-consuming. And so that is where a preprocessor comes into play. 
A CSS preprocessor is basically a scripting language that extends CSS and then compiles it into regular CSS.

Preprocessors are completely optional.

Although it might look quite complex, it's good to know preprocessors such as Sass and LESS exist.

---
    
# HTML5/CSS3 - LAB 02: CSS3

**You've got great (CSS) style!**

You have successfully completed this lab.