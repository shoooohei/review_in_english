$(function(){
  // textareaの縦幅自動変更
  autosize($('textarea'));

  if(gon.page === "review_new"){
    $('textarea.phrase_form').prop('required','');
    $('#created_cancel_btn').hide();
  }

  // review#newでフレーズが空の場合、そのフレーズフォームを無効にしてレコードを作成しないようにする。reviewだけサブミットする。
  $('#review_form').on('submit', function(){
    if($("textarea.phrase_form").val() == "") {
      $('textarea.phrase_form').attr('disabled','true');
    };
  });
})

$(function(){
  if (gon.page === 'review_edit'){
    $('.phrase_form').attr('readonly','true');
    // phraseの数だけfields_forが自動で生成されるが、hidden_formにidを含んだinputがあるからそれを利用してイテレートする
    // for (let i=0; i<gon.phrase_count; i++){
    //   // prev→div#filling_phrase, findで子要素を探す
    //   var $edit_btn = $('#review_phrases_attributes_'+i+'_id').prev().find('#edit_btn');
    //   $edit_btn.click(function(){
    //     var $this = $(this);
    //     var $phrase_form = $this.prev('.phrase_form');
    //     var $first_contet = $phrase_form.val();
    //     var $cancel_btn = $this.next('#cancel_btn');
    //     $this.hide();
    //     $this.next('#delete_btn').hide();
    //     $phrase_form.removeAttr('readonly');
    //     $cancel_btn.css('display','inline-block');
    //
    //     $cancel_btn.click(function(){
    //       $phrase_form.val($first_contet);
    //       $cancel_btn.hide();
    //       // $thisで#edit_btnが取れるから↓はedit_btnを表示
    //       $this.show();
    //       $phrase_form.attr('readonly','true');
    //     })
    //   });
    // }
    // 追加されたフレーズのキャンセルボタン。セレクタを渡さないとreview#editで後から生成される新しいフォームにクリックファンクションが効かなくなる
    $(document).on('click','div#created_cancel_btn',function(){
      $(this).parent().remove();
      $('#add_btn').show();
    })

    // $('i#delete_phrase_btn').click(function(){
    //   confirm("Are you sure?");
    //   let phrase_id = $(this).next('input[type="hidden"]').val();

      // $(this).prev('input[type="checkbox"]').click();
      // $(this).closest('.filling_phrase').hide();
    // })
  }
})
