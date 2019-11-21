set_chat = (name) ->
  $(".chat_name").html(name)

clean_messages = () ->
  $(".messages").html("")
  $(".chat_name").html("")

add_message = (message, message_date, name) ->
  $(".messages").append('<div class="message col s12">' +
    '<div class="col m2 l1">' +
    '<i class="material-icons prefix right profile_icon">account_circle</i>'+
    '</div>'+
    '<div class="col m10 s9">'+
    '<div class="row">'+
    '<b>' + name + '</b> <span class="date">' + message_date + '</span>'+
    '</div>' +
    '<div class="row">' + message + '</div>'+
    '</div>'+
    '</div>')