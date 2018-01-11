
  $( function() {
    $( "#slider" ).slider({
      min: 0,
      max: 5,
      step: 0.5,
      slide: function( event, ui ) {
        $( "#amount" ).val( ui.value );
      }
    });
    $( "#amount" ).val( $( "#slider" ).slider( "value" ) );
  } );
