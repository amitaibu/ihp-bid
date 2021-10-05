$(document).on('ready turbolinks:load', function () {
    // This is called on the first page load *and* also when the page is changed by turbolinks.

    console.log(        $(this).find('form .multiple-field-add')
    // Main wrapper.
    .parent('fieldset.multiple-field-wrapper')
    // Find the first element.
    .find('fieldset.multiple-field'));

    $(this).find('form .multiple-field-add').click(function() {
        // Copy the first fieldset, without the values.
        $(this)
            // Main wrapper.
            .parent('div.multiple-field-wrapper')
            // Find the first element.
            .find('fieldset.multiple-field').first()
            // Clone and append.
            .clone().appendTo('div.multiple-field-inner')
            // Reset values.
            .find('input').val('');

    });



});