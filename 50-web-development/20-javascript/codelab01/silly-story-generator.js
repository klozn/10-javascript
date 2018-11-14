const customName = document.getElementById('customname');
const randomize = document.querySelector('.randomize');
const story = document.querySelector('.story');
const ukRadio = document.getElementById('uk');

const STORY_TEMPLATE = 'It was :temp: outside, so :name: went for a walk. When they got to :place:, they stared in horror for a few moments, then :action:. Bob saw the whole thing, but was not surprised — :name: weighs :weight:, and it was a hot day.';
const NAMES = ['Willy the Goblin', 'Big Daddy', 'Father Christmas'];
const PLACES = ['the soup kitchen', 'Disneyland', 'the White House'];
const ACTIONS = ['spontaneously combusted', 'melted into a puddle on the sidewalk', 'turned into a slug and crawled away'];

function randomValueFromArray(array){
  return array[Math.floor(Math.random()*array.length)];
}

function randomFahrenheit() {
  return Math.floor(80 + Math.random()*60);
}

function randomPounds() {
  return Math.floor(Math.random()*350);
}

function setRandomBackgroundOn(element) {
  element.style.backgroundColor = '#'+(Math.random()*0xFFFFFF<<0).toString(16);
}

randomize.addEventListener('click', () => {
  story.textContent = `The generate button click handler works!
    The UK radio button is ${ukRadio.checked ? 'checked' : 'not checked'} and 
    your custom name is ${customName.value.trim() ? customName.value : 'not filled in'}.`;
  setRandomBackgroundOn(story);
});
