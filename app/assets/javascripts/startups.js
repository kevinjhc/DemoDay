$('#pull-angellist-id').on('click', function() {
  var angellist_name = $('#startup_name').val().toLowerCase();

  if (angellist_name) {

    $.ajax({
      type: 'GET',
      dataType: 'jsonp',
      url: 'https://api.angel.co/1/startups/search?slug=' + angellist_name,
      statusCode: {
        404: function() {
          alert('Company not found');
        }
      },
      success: function(data) {
        fillInIdField(data);
      },
      error: function() {
        alert('Something went wrong with the Angellist API request.');
      }
    });

    function fillInIdField(data) {
      var id = data.id;
      $('#startup_angellist_id').val(id);
    }

  } else {
    alert('Please fill in the company name.');
  }
});

$('.email-button').on('click', function(e) {
  e.preventDefault();

  var thisButton = $(this);
  $(this).parent().find('.email-form').slideToggle();
  $(this).toggleClass('secondary');
  if ( $(this).val() == 'Login via email' ) {
    $(this).val('Close');
  } else {
    $(this).val('Login via email');
  }
});

/*
$('#pull-from-angellist').on('click', function() {
  var domainUrl = $('#startup_domain_url').val();

  if (domainUrl) {

    $.ajax({
      type: 'GET',
      dataType: 'jsonp',
      url: 'https://api.angel.co/1/startups/search?domain=' + domainUrl,
      success: function(data) {
        fillInCompanyFields(data);
      },
      error: function() {
        alert('Something went wrong with the Angellist API request.');
      }
    });

    function fillInCompanyFields(data) {
      var name = data.name,
          bio = data.product_desc;

      $('#startup_name').val(name);
      $('#startup_bio').val(bio);
    }

  } else {
    alert('Please enter a domain name');
  }

  var ceoSlug = $('#startup_ceo_slug').val();

  if (ceoSlug) {

    $.ajax({
      type: 'GET',
      dataType: 'jsonp',
      url: 'https://api.angel.co/1/search/slugs?query=' + ceoSlug,
      success: function(data) {
        retrieveCeoInfo( getCeoId(data) );
      },
      error: function() {
        alert('Something went wrong with the Angellist API request.');
      }
    });

    function getCeoId(data) {
      var ceoId = data.id;
      return ceoId;
    }

    function retrieveCeoInfo(id) {
      $.ajax({
        type: 'GET',
        dataType: 'jsonp',
        url: 'https://api.angel.co/1/users/' + id,
        success: function(data) {
          fillInCeoFields( getCeoName(data) );
        },
        error: function() {
          alert('Something went wrong with the Angellist API request.');
        }
      });
    }

    function getCeoName(data) {
      var ceoName = data.name;
      return ceoName;
    }

    function fillInCeoFields(data) {
      $('#startup_ceo_name').val(data);
    }

  } else {
    alert('Please enter a CEO Slug');
  }


});


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
*/
