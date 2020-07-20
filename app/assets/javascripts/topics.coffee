$(document).on 'ready page:load', ->
  if document.URL.match("new") || document.URL.match("edit")
    tag_string = $("#all_tag_hidden").val()
    all_tag_list = tag_string.split(" ")
    $("#topic-tags").tagit
      availableTags: all_tag_list
    $('#topic-tags').tagit()
    topic_string = $("#tag_hidden").val()
    try
      tag_list = topic_string.split(',')
      for tag in tag_list
        $('#topic-tags').tagit 'createTag', tag
    catch error
