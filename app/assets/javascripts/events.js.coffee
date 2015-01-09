# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  loading_events = false
  $('a.load-more-events').on 'inview', (e, visible) ->
    return if loading_events or not visible
    loading_events = true
    
    $.getScript $(this).attr('href'), ->
      loading_events = false

# Editor for the event details
$ ->
  $("#descriptionField").editable inlineMode: false
  return
