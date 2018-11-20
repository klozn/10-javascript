// These variables fetch some HTML elements for you to use in the exercise
const customName = document.getElementById('customname');
const randomize = document.querySelector('.randomize');
const story = document.querySelector('.story');
const ukRadio = document.getElementById('uk');

// These variables contain some random names, places and actions, and the story template with placeholders in the form of :placeholder:
const STORY_TEMPLATE = 'It was :temp: outside, so :name: went for a walk. When they got to :place:, they stared in horror for a few moments, then :action:. Bob saw the whole thing, but was not surprised — :name: weighs :weight:, and it was a hot day.';
const NAMES = ['Willy the Goblin', 'Big Daddy', 'Father Christmas'];
const PLACES = ['the soup kitchen', 'Disneyland', 'the White House'];
const ACTIONS = ['spontaneously combusted', 'melted into a puddle on the sidewalk', 'turned into a slug and crawled away'];

// Use this function to get a random value from an array
function randomValueFrom(array){
  return array[Math.floor(Math.random()*array.length)];
}

// Use this function to get a random temperature in Fahrenheit
function randomFahrenheit() {
  return Math.floor(80 + Math.random()*60);
}

// Use this function to get a random weight in pounds
function randomPounds() {
  return Math.floor(Math.random()*350);
}

// This function is used to generate a random background color for the story placeholder
function setRandomBackgroundOn(element) {
  element.style.backgroundColor = '#'+(Math.random()*0xFFFFFF<<0).toString(16);
}

/* 
  This part of the code adds a click event listener to the randomize button 
  and executes some demo code
*/
randomize.addEventListener('click', () => {
  story.textContent = `The generate button click handler works!
    The UK radio button is ${ukRadio.checked ? 'checked' : 'not checked'} and 
    your custom name is ${customName.value.trim() ? customName.value : 'not filled in'}.`;

  setRandomBackgroundOn(story);
});
