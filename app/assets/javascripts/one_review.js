// if $('.one_review[data-pate="one_review"]').
  // 扱う変数が違うからtubolinksで読み込んでいたものを再度読み込ませるため、jquery.turbolinksで読み込ませる。
  $(document).on('turbolinks:load',function(){
    let arg_js_review_id = gon.arg_js_review_id;
    let arg_js_detail = gon.arg_js_detail;
    let page = gon.page;

    if (page === "timeline" || page === "review_show") {
      for (let i=0; i < arg_js_review_id.length; i++){
        let review_id = arg_js_review_id[i];
        let movie_en_tile = arg_js_detail[review_id].movie_en_tile;
        let movie_id = arg_js_detail[review_id].movie_id;
        let movie_jp_tile = arg_js_detail[review_id].movie_jp_tile;
        let movie_image_url = arg_js_detail[review_id].movie_image_url;
          // 映画のタイトルを挿入
          if ($('h3[data-comment="'+review_id+'"]').is('*')){}else{
            $('.review_content[data-comment="'+review_id+'"]').before('<h3 data-comment="'+review_id+'"><a href="/movies/'+movie_id+'">'+movie_en_tile+'</a></h3><h6><small>'+movie_jp_tile+'</small></h6>')};
          // col-md-9で囲む
          if ($('.col-md-9[data-comment="'+review_id+'"]').is('*')){}else{
            $('.detail_part[data-comment="'+review_id+'"]').wrap('<div class="col-md-9" data-comment="'+review_id+'"></div>')};
          // col-md-3で囲んで、画像を挿入
          if ($('.col-md-3[data-comment="'+review_id+'"]').is('*')){}else{
            $('.col-md-9[data-comment="'+review_id+'"]').after('<div class="col-md-3" id="picture_part" data-comment="'+review_id+'"><img width="150" class="img-thumbnail" src="'+movie_image_url+'" alt="'+movie_en_tile+'"></div>')};
          // rowで囲む
          if ($('.row[data-comment="'+review_id+'"]').is('*')){}else{
          $('.one_review[data-comment="'+review_id+'"]').wrapInner('<div class="row" data-comment="'+review_id+'"></div>')};

          if (page === "review_show") {
            // review文を全文表示
            $('p.review_sentence[data-comment="'+review_id+'"]').css({'max-height':'','min-height':'100px'});
            // phrase文を全文表示
            $('p.phrase_sentence[data-comment="'+review_id+'"]').css({'max-height':'','min-height':'10px'});
          }
        }
      } else if (page === "movie_show") {

      }


  })
