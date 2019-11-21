$(document).on 'turbolinks:load', ->
  $(".remove_team").on 'click', (e) =>
    $('#remove_team_modal').modal('open')
    $('.remove_team_form').attr('action', 'teams/' + e.target.id)
    return false