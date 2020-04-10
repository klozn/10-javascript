# Codelab 01 - Silly Story Generator

Hi kids, today we're going to create a random silly story generator!
To see the finished result you can check [this page](https://mdn.github.io/learning-area/javascript/introduction-to-js-1/assessment-finished/) (but no peeking at the source code).

If you play around with it you can see that clicking the **Generate random story** button generates a story with
random names, places and actions. The temperature and weight in the story have a specific unit, which changes when selecting UK or US.
The story is 'witnessed by' by 'Bob' or by the person whose name you provided.

Some requirements will be a bit different in this codelab than they are in the example.
So don't look at the example too much in detail.

- For example, we changed the UK radio button to a checkbox (not checking it will default to value US)
- Also, the temperature and weight in the story will be generated at random, instead of having fixed values.

## Skeleton

As you can see, a small app with HTML template, CSS styling and JavaScript boilerplate code is already present. Altough we discourage the use of comments, it can be useful while learning, so explanations of the boilerplate code are in the comments.

> Documentation can serve its purpose, we're really talking about comments here, comments which explain snippets of code (as an alternative to writing readable code)

To finish the exercise you don't have to change anything in the HTML and CSS, however, don't let that stop you from playing around.

> Having a proper understanding of HTML of CSS is a huge bonus, if not a vital skill when doing front end development, even if a UI/UX designer is present in your team.

## Run the code

- Open up the `silly-story-generator.html` file in your browser
  - In Intellij: right-click `silly-story-generator.html`, and press `Run ...`

## Stories

1. ### Replace `storyText` with `STORY_TEMPLATE`
2. ### Replace the :name:, :place: and :action: placeholders of the template with a random name, place and action from the lists
   > The random values should change every time you click the randomize button. Make sure all values get replaced!
3. ### Replace Bob with the custom name entered in the inputfield. Do this only if a name is present, otherwise Bob can stay.
4. ### Replace the :temp: and :weight: placeholders with randomly generated temperatures and weights
5. ### Get the UK checkbox to work
   > Write a function that converts pounds to kg and one that converts fahrenheit to celsius. Use these functions to change the weight and temperature in the story depending on whether the checkbox is checked or not. Don't forget to add the unit of measure in the story!
6. ### Use ES6 classes
   > Now write a `StoryGenerator` class that contains everything so that, un the end, we can just call storyGenerator.generate(...) to get a random story.
   > Ideally, we can create an instance of `StoryGenerator` by providing the template, names, places and actions.
