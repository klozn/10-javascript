function makePainting(paintOptions) {
    paintOptions = paintOptions === undefined ? {} : paintOptions;
    var brush = paintOptions.brush === undefined ? 'flat' : paintOptions.brush;
    var paint = paintOptions.paint === undefined ? 'oil' : paintOptions.paint;
    var canvasDimensions = paintOptions.canvasDimensions === undefined ? { widthInCm: 30, heightInCm: 60 } : paintOptions.canvasDimensions;
    var sellingPrice = paintOptions.sellingPrice === undefined ? {euros: 795, cents: 99} : paintOptions.sellingPrice;
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
