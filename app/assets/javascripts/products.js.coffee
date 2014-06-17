# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

conektaErrorResponseHandler = (response) ->
  $form = $("#card-form")
  $form.find(".card-errors").text response.message
  $form.find("button").prop "disabled", false
  return

conektaSuccessResponseHandler = (token) ->
  $form = $("#card-form")
  $form.append $("<input type=\"hidden\" name=\"charge[token]\" />").val(token.id)
  alert token.id
  $form.get(0).submit()
  return

jQuery ($) ->
  $("#card-form").submit (event) ->
    $form = $(this)
    $form.find("button").prop "disabled", true
    Conekta.token.create $form, conektaSuccessResponseHandler, conektaErrorResponseHandler
    false
  return
