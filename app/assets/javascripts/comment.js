$(function(){
  function buildHTML(comment, commentDate){
    var html = `<div class="comment">
                  <p>
                    <strong>${comment.user_name}：</strong>
                    ${comment.text}
                    <div class="comment_date">
                    ${commentDate}
                    </div>
                  </p>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      const commentDate = moment(data.date).fromNow();
      var html = buildHTML(data, commentDate);
      $('.comments').append(html);
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
  })
})