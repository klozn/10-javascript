/**
 * More examples / documentation on https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function
 */

function resolveAfter4Seconds() {
    console.log("--> starting slow promise");
    return new Promise(resolve => {
        setTimeout(function() {
            resolve("Result for Slow received");
            console.log("<-- slow promise is done");
        }, 4000);
    });
};

function resolveAfter1Second() {
    console.log("--> starting fast promise");
    return new Promise(resolve => {
        setTimeout(function() {
            resolve("Result for Fast received");
            console.log("<-- fast promise is done");
        }, 1000);
    });
};

async function start() {
    console.log('Start!');
    const slow = resolveAfter4Seconds(); // starts timer immediately
    const fast = resolveAfter1Second(); // starts timer immediately

    console.log('At position [A]');// [A] -> Execution gets here almost instantly
    console.log(await slow); // [B] -> this statements runs 4 seconds after [A]
    console.log(await fast); // [C] -> this statement runs 4 seconds after [A], but immediately after [B], since our fast promise is already done 3 seconds (but [C] has to wait for statement [B] to be executed).
}

start();
