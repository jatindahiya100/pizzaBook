// -------------------------------------------------------------------------------------------------------------------
// Fetching Items From Server
var condition = "InitialFetch";
getFoodItems(condition);

$(document).on("click", ".btn", function () {
    $('#label_plate').html($(this).text());
    var condition = $(this).data('id');
    getFoodItems(condition);
});

function getFoodItems(condition) {
    $.ajax({
        url: 'php/Home.php?condition=' + condition,
        type: "GET",
        beforeSend: function () {

        },
        success: function (response) {
            var item = "";
            $.each(response, function (key, value) {
                item += "<div data-id='" + value.item_ID + "' class='item-card'>" +
                    "<img class='items-loading' src='" + value.image + "' alt=''>" +
                    "<label for='item-name'>" + value.item_Name + "</label>" +
                    "<label for='item-info'>" + value.item_Info + "</label>" +
                    "<label for='item-price'><span>Rs.</span> " + value.price + " <span>/piece</span></label>" +
                    "</div>";
            });
            $('.food-items').html(item);

            $(".item-card img").on('load', function () {
                // do stuff on success
                setTimeout(() => {
                    $('.item-card img').removeClass('items-loading');
                }, 1000);
            })
                .on('error', function () {
                    // do stuff on smth wrong (error 404, etc.)
                })
            $.each(function () {
                if (this.complete) {
                    $(this).load();
                } else if (this.error) {
                    $(this).error();
                }
            });
        }
    });
}

// --------------------------------------------------------------------------------------------------------------------
// Fetching Items info from Server
$(document).on("click", ".item-card", function () {
    var item_ID = $(this).data("id");
    $('.modal-box').fadeIn();
    $.ajax({
        url: 'php/Home.php?condition=getIndividualDetails&&item_ID=' + item_ID,
        type: "GET",
        success: function (response) {
            var radiobtns = "";
            for (let index = 0; index < response.length; index++) {
                const element = response[index];
                radiobtns += "<div class='size-Select'>" +
                    "<input checked data-id='" + element['unique_ID'] + "' type='radio' name='radio-button' value='" + element['size'] + "'  class='radio-btn' >" +
                    "<div class='selected-option'>" +
                    "<div class='name'>" + element['size'] + "</div>" +
                    "<div class='name'><strong>Rs. </strong>" + element['price'] + "</div>" +
                    "</div>" +
                    "</div>";
            }
            $('.options').html(radiobtns);
            $('.food_img img').attr("src", response[0]['image']);
            $('.item-Np label[for=item-name]').html(response[0]['item_Name'] + "<br><span>" + response[0]['item_Info'] + "</span>");
            $('.item-Np label[for=item-Price]').html("<span>Rs.</span> " + response[0]['price']);
            $('.statistics ul #rating').html("<img src='images/star.png'> " + response[0]['total_Stars'] / response[0]['total_Reviews']);
            $('.statistics ul #calorie').html("<img src='images/fire.png'> " + response[0]['calorie'] + " cal");
            $('.statistics ul #timing').html("<img src='images/clock.png'> " + response[0]['time_Required']);
            $('.description p').html(response[0]['description']);
        }
    });


});
$(document).on("click", ".back-btn", function () {
    $('.modal-box').fadeOut();
    $("#item_qt").val(1);
});
$(document).on("click", ".qt input", function () {
    if (this.id == "increment") {
        increment();
    } else if (this.id == "decrement") {
        decrement();
    }
});

$(document).on('input', '#item_qt', function () {
    if ($("#item_qt").val() < 1 || isNaN($("#item_qt").val())) {
        $("#item_qt").val(1);
    }
});
function increment() {
    var qty = $("#item_qt").val();
    if (qty > 0) {
        $("#item_qt").val(++qty);
    } else {
        $("#item_qt").val(1);
    }
}

function decrement() {
    var qty = $("#item_qt").val();
    if (qty > 1) {
        $("#item_qt").val(--qty);
    } else {
        $("#item_qt").val(1);
    }
}

let basket_items = [];
if (localStorage.getItem('basket_items')) {
    basket_items = JSON.parse(localStorage.getItem('basket_items'));
}

$(document).on("click", "#add_to_basket", function () {
    if ($('input[name="radio-button"]:checked').length > 0) {
        //  Get Value 
        var p_ID = $('input[name="radio-button"]:checked').data("id");
        var qty = $("#item_qt").val();
        const obj = { p_ID: p_ID, qty: qty }


        basket_items.forEach((element, index, array) => {
            if (element.p_ID == p_ID) {
                if (element.qty != qty) {
                    basket_items.splice(index, 1);
                    alert("Updated");
                } else {
                    basket_items.splice(index, 1);
                    alert("Already There");
                }
            }
        });
        basket_items.push(obj);
        localStorage.setItem('basket_items', JSON.stringify(basket_items));
        // count_cart_items function is defined in header
        count_cart_items();
        $('.modal-box').fadeOut();
        $("#item_qt").val(1);
    }
});