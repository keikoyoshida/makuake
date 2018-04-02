errors = ->
  $('.modal__form__signUp').on("ajax:success", (e, data, status, xhr) ->
  ).on "ajax:error", (e, xhr, status, error) ->
    message = xhr.responseText
    $('.modal__content__formErrors').html(message)

$(document).ready(errors)
$(document).on('page:load', errors)
