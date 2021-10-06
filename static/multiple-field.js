$(document).on('ready turbolinks:load', function () {
    // This is called on the first page load *and* also when the page is changed by turbolinks.

    $(this).find('form .multiple-field-add')
    // Main wrapper.
    .parent('fieldset.multiple-field-wrapper')
    // Find the first element.
    .find('fieldset.multiple-field');

    $(this).find('form .multiple-field-add').click(function() {
        // Copy the first fieldset, without the values.
        $(this)
            // Main wrapper.
            .parents('div.multiple-field-wrapper')
            // Find the first element.
            .find('fieldset.multiple-field').first()
            // Clone (along with handlers) and append.
            .clone(true).appendTo('div.multiple-field-inner')
            // Reset values.
            .find('input').val('');

        // Bind and new Remove
        attachRemoveMultipleField();

    });

    const attachRemoveMultipleField = function() {
        $(document).find('form .multiple-field-remove').click(function() {
            const $parent = $(this).parents('div.multiple-field-wrapper');
            const numberOfMultipleField =  $parent.find('fieldset.multiple-field').length;

            if (numberOfMultipleField === 1) {
                // Keep the element, but reset its values.
                $(this).parents('fieldset.multiple-field').find('input').val('');
            }
            else {
                // Remove element.
                $(this).parents('fieldset.multiple-field').remove();
            }

        });
    }

    attachRemoveMultipleField();





});