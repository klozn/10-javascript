function makePainting({brush = 'flat',
                          paint = 'oil',
                          canvasDimensions = { widthInCm: 30, heightInCm: 60 },
                          sellingPrice = {euros: 795, cents: 99}} = {}) {

    console.log(brush, paint, canvasDimensions, sellingPrice);
    // Create a nice painting...
}

makePainting();

makePainting({
    brush: 'bright',
    paint: 'watercolor',
    canvasDimensions: {widthInCm: 20, heightInCm: 44},
    sellingPrice: {euros: 15, cents: 95}
});

makePainting({
    canvasDimensions: {widthInCm: 20, heightInCm: 44},
    sellingPrice: {euros: 80, cents: 0}
});
