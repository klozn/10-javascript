function hoist() {
    // variable declaration is hoisted to the top of the function's body: 'var h = undefined;'
    for (var i = 0; i < 3; i++) {
        var h = 3; // becomes: 'h = 3' instead of 'var h = 3'
    }
    console.log(h); // prints out 3 because h is still known here
}

hoist();
