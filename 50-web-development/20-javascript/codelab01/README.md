# Codelab 01 - Silly Story Generator
Hi kids, today we're going to create a random silly story generator!
To see the finished result you can check [this page](https://mdn.github.io/learning-area/javascript/introduction-to-js-1/assessment-finished/) (but no peeking at the source code).

If you play around with it you can see that clicking the **Generate random story** button generates a story with random names, places and actions. The temperature and weight in the story changes unit based on if UK is selected or not and the whole thing is seen by 'Bob' or a custom name if one is filled in.

Some things are a bit different in the codelab, so don't look at the example too much in detail. For example, we changed the UK radio button to a checkbox since this made more sense. Also, the temperature and weight in the story will be generated at random as well.

## Present
As you can see, a small app with HTML template, CSS styling and JavaScript boilerplate code is already present. Altough we discourage the use of comments, it can be useful while learning, so explanations of the boilerplate code are in the comments.

To finish the exercise you don't have to change anything in the HTML and CSS, however, don't let that stop you from playing around.

## Stories
- ### Replace the story text with the story template
- ### Replace one of the placeholders with a random word (you can choose which word)
- ### Replace the :name:, :place: and :place: placeholders with a random name, place and action from the lists
> The random values should change every time you click the randomize button. Make sure all values get replaced!
- ### Replace the :temp: and :weight: placeholders with randomly generated temperatures and weights
- ### Get the UK checkbox to work
> Write a function that converts pounds to kg and one that converts fahrenheit to celsius. Use these functions to change the weight and temperature in the story depending on if the checkbox is checked. Don't forget to add the unit of measure in the story!
- ### Use ES6 classes
> Now write a StoryGenerator class that you can initialise with the template, names, places and actions that contains all the logic to generate a story. You can use getters with logic to get a random name, action, place. In the end you just want to call storyGenerator.generate(...) to get a random story.