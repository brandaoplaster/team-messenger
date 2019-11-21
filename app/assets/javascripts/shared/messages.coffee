set_chat = (name) ->
  $(".chat_name").html(name)

clean_messages = () ->
  $(".messages").html("")
  $(".chat_name").html("")