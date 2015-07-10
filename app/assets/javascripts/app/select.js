$("#invoice_customer_id").chosen();
$("#invoice_invoiced_parts_attributes_0_part_id").chosen();

$('.container').on('cocoon:after-insert', function(e, insertedItem) {
  var selectInputs = document.getElementsByTagName('select');
  $.each(selectInputs, function( index, value ) {
    $(value).chosen();
  });
});
