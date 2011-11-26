evaluate = ->
  try
      regex = new RegExp $('#regex').val(), $('#options').val()
    catch e
      $('#results .no-data').text e.toString()
      $('#match-captures').text ''
      $('#match-result').text ''
      return

    matches = regex.exec $('#test').val()
    if matches
      $('#results .no-data').text ''
      $('#match-captures').text ''
      $('#match-result').text matches[0]
      if matches.length > 1
        matches.shift()
        lis = ($('<li>').text match for match in matches)
        list = $('<ol>')
        (list.append li for li in lis)
        $('#match-captures').append list
    else
      $('#results .no-data').text 'No matches'
      $('#match-captures').text ''
      $('#match-result').text ''

$(document).ready ->
  evaluate()
  $('#regex').keyup evaluate
  $('#options').keyup evaluate
  $('#test').keyup evaluate
