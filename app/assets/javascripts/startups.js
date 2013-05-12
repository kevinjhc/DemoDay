$('#pull-from-angellist').on('click', function() {
  var angellist_id = $('#startup_angellist_id').val();

  if (angellist_id) {

    $.ajax({
      type: 'GET',
      dataType: 'jsonp',
      url: 'https://api.angel.co/1/startups/' + angellist_id,
      success: function(data) {
        fillInFields(data);
      },
      error: function() {
        alert('Something went wrong with the Angellist API request.');
      }
    });

    function fillInFields(data) {
      var name = data.name,
          bio = data.product_desc;

      $('#startup_name').val(name);
      $('#startup_bio').val(bio);
    }

  } else {
    // show error
  }
});