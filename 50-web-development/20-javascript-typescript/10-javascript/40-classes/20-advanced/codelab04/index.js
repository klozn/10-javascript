const scope = {
  x: 5,
  log: function() {
    console.log(`x is ${this.x}`);
  },
  delayedLog: function() {
    setTimeout(() => this.log(), 1000);
  }
};

scope.delayedLog();
