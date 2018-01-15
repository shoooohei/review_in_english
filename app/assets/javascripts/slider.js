
  $( function() {
    $( "#slider-range-min" ).slider({
      range: "min",
      min: 0,
      max: 5,
      step: 0.5,
      slide: function( event, ui ) {
        $( "#amount" ).val( ui.value );
      }
    });
    $( "#amount" ).val( $( "#slider-range-min" ).slider( "value" ) );
  } );
