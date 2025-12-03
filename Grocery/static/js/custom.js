// ensure this runs after jQuery is loaded
  $(function () {

  // Increment button
  $(document).on('click', '.increment-btn', function (e) {
    e.preventDefault();

    var $input = $(this).closest('.product_data').find('.qty-input');
    var value = parseInt($input.val(), 10);

    if (isNaN(value)) {
      value = 0;
    }

    if (value < 10) {    // max limit 10
      value += 1;
      $input.val(value);
    }
  });


  // Decrement button
  $(document).on('click', '.decrement-btn', function (e) {
    e.preventDefault();

    var $input = $(this).closest('.product_data').find('.qty-input');
    var value = parseInt($input.val(), 10);

    if (isNaN(value)) {
      value = 0;
    }

    if (value > 1) {     // min limit 1
      value -= 1;
      $input.val(value);
    }
  });
});