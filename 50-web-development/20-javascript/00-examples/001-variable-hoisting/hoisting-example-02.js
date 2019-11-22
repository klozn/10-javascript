function noHoist() {
    for (var i = 0; i < 3; i++) {
        const h = 3; // With const or let, no hoisting is performed
    }
    console.log(h); // Will throw an Error: h is not defined
}

noHoist();
