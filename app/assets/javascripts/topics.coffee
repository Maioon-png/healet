$(document).on 'ready page:load', ->
  $('#topic-tags').tagit
  fieldName:   'tag_list'
  singleField: true
  $('#topic-tags').tagit()
  topic_string = $("#tag_hidden").val()
  try
    tag_list = topic_string.split(',')
    for tag in tag_list
      $('#topic-tags').tagit 'createTag', tag
  catch error