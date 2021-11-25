function countNonVowelsIn(word) {
    if (typeof word !== 'string') {
        return 0;
    }
    return word.split('').filter(char => !char.match(/[aeiouy]/gi)).length;
}

console.log(countNonVowelsIn('timOthy'));
