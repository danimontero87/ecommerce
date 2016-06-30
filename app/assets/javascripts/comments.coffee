# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#comments-form", (ev, data)->
  $(this).find("textarea").val(" ")
  $("#comments-box").append("<article style='list-style-type:none'> #{data.body} - #{data.user.email} </article>")
$(document).on "ajax:error", "form#comments-form", (ev, data)->
  console.log data
