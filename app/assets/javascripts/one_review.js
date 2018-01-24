// 扱う変数が違うからtubolinksで読み込んでいたものを再度読み込ませるため、jquery.turbolinksで読み込ませる。gon.page初期値をApplicationControllerでnilに設定し、コントローラーからの設定されたページだけ動くようにしている。そうしないと関係ページでエラーが出て必要なメソッドが実行されない。
$(function(){
  if (gon.page === "timeline" || gon.page === "review_show") {
      let arg_js_review_id = gon.arg_js_review_id;
      let arg_js_detail = gon.arg_js_detail;

      for (let i=0; i < gon.arg_js_review_id.length; i++){
        let review_id = arg_js_review_id[i];
        let movie_en_title = arg_js_detail[review_id].movie_en_title;
        let movie_id = arg_js_detail[review_id].movie_id;
        let movie_jp_title = arg_js_detail[review_id].movie_jp_title;
        let movie_image_url = arg_js_detail[review_id].movie_image_url;
          // 映画のタイトルを挿入
            $('.review_content[data-comment="'+review_id+'"]').before('<h3 data-comment="'+review_id+'"><a href="/movies/'+movie_id+'">'+movie_en_title+'</a></h3><h6><small>'+movie_jp_title+'</small></h6>');
          // col-md-9で囲む
            $('.detail_part[data-comment="'+review_id+'"]').wrap('<div class="col-md-9" data-comment="'+review_id+'"></div>');
          // col-md-3で囲んだ画像リンクを挿入
            $('.col-md-9[data-comment="'+review_id+'"]').after('<div class="col-md-3" id="picture_part" data-comment="'+review_id+'"><a href="/movies/'+movie_id+'"><img width="150" class="img-thumbnail" src="'+movie_image_url+'" alt="'+movie_en_title+'"></a></div>');
          // rowで囲む
            $('.one_review[data-comment="'+review_id+'"]').wrapInner('<div class="row" data-comment="'+review_id+'"></div>');

            if (gon.page === "review_show") {
              // リンクを無効化
              $('a[data-name="movie_name"]').parent().html(''+gon.user_name+'さんのレビュー');
              // review文を全文表示
              $('p.review_sentence[data-comment="'+review_id+'"]').removeClass('review_sentence').addClass('whole_sentence_review');
              // phrase文を全文表示
              $('p.phrase_sentence[data-comment="'+review_id+'"]').removeClass('phrase_sentence').addClass('whole_sentence_phrase');
              // 添削・コメントリンクを非表示
              $('.correction_link').css('display','none');
            }
        }
      } else if (gon.page === "movie_show") {

      }

})
