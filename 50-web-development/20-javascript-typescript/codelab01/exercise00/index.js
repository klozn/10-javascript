function hoist() {
  for (var i = 0; i < 3; i++) {
    var h = 3; // becomes: 'h = 3'
  }
  console.log(h);
}
