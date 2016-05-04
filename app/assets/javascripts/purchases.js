function getSelectedPackage() {
  return $('input[type="radio"][name="purchase[package]"]:checked').val() + "selected";
}

jQuery(function($) {
  $('#new_purchase').submit(function(event) {
    var $form = $(this);
    $form.find('commit').prop('disabled', true);
    Stripe.createToken($form, stripeResponseHandler);
    return false;
  });
});

var stripeResponseHandler = function(status, response) {
  var $form = $('#new_purchase');

  if (response.error) {
    $form.find('.payment-errors').text(response.error.message);
    //$("#section-payment").click();
    $form.find('commit').prop('disabled', false);
  } else {
    // token contains id, last4, and card type
    var token = response.id;
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="stripeToken" />').val(token));
    $form.get(0).submit();
  }
};
