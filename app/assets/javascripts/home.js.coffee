evaluate = ->
  try
      regex = new RegExp $('#regex').val(), $('#options').val()
    catch e
      $('#result.no-data').text 'Error in regex'
      $('#match-captures').text ''
      $('#match-result').text ''
      return

    matches = regex.exec $('#test').val()
    if matches
      $('#match-captures').text ''
      $('#match-result').text matches[0]
      if matches.length > 1
        matches.shift()
        lis = ($('<li>').text match for match in matches)
        list = $('<ol>')
        (list.append li for li in lis)
        $('#match-captures').append list
    else
      $('#result.no-data').text 'No matches'

$(document).ready ->
  $('#regex').keyup evaluate
  $('#options').keyup evaluate
  $('#test').keyup evaluate
  $('#clear-fields').click ->
    $('#regex').val ''
    $('#options').val ''
    $('#test').val ''
