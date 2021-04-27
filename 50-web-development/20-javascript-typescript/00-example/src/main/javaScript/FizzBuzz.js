function fizzBuzz(amount, callBack) {
    if (typeof amount !== 'number') return;

    const result = [];

    function convertToFizzBuzz(number) {
        if (number % 15 === 0) {
            return "FizzBuzz"
        }
        if (number % 3 === 0) {
            return "Fizz"
        }
        if (number % 5 === 0) {
            return "Buzz"
        }
        return number;
    }

    for (let number = 1; number < amount + 1; number++) {
        result.push(convertToFizzBuzz(number));
    }

    return callBack(result);
}

fizzBuzz(15, function (list) {
    console.log(list);
});
