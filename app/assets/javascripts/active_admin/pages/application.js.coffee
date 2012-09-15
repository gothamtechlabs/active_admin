#
# Active Admin JS
#

$ = jQuery
$ ->

  $("input.datepicker").datepicker dateFormat: "yy-mm-dd"
  $("input.timepicker").timepicker() # ampm: true
  # $(".datetimepicker").datetimepicker
  #   dateFormat: 'yy-mm-dd'
  #   ampm: true

  $(".clear_filters_btn").click ->
    window.location.search = ""
    false

  $(".dropdown_button").popover()

  $(".chzn").chosen()

  $("input[type='text'].data-collection").each ->
    # console.log(v.split(","))
    $(@).autocomplete_collection()

  $('form').bind 'submit', ->
    $("li.autocomplete").each ->
      $li = $(@)
      $li.each ->
        if !$li.find('.search-choice').length
          $li.find('.chzn-done option[selected]').removeAttr('selected')
          $li.find('.chzn-done option').first().attr('selected', 'selected')
    true
