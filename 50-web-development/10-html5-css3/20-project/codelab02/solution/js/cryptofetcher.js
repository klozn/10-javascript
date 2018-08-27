$(document).ready(function () {

    $.getJSON("https://api.coinmarketcap.com/v1/ticker/?limit=24", function (data) {
        console.log("success");
        console.log(data);
        data.forEach(function(item) {
            $( ".row" )
                .append( `
                    <div class="col-3">
                        <div class="card">
                          <div class="card-body">
                            <h4 class="card-title">${item.name}</h4>
                            <p class="card-text">Price in USD: ${item.price_usd}</p>
                          </div>
                        </div>
                    </div>
                `
                );
        });
    })
    .done(function () {
        console.log("second success");
    })
    .fail(function () {
        console.log("error");
    })
    .always(function () {
        console.log("complete");
    });

    function showCrypto() {

    }

});