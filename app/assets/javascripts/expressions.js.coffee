evaluate = ->
  try
      regex = new RegExp $('#regex').val(), $('#options').val()
    catch e
      $('#error').html '<h3>Error</h3>' + '<p>' + e + '</p>'
      $('#match-captures').text ''
      $('#match-result').text ''
      return

    testdata = $('#test').val()
    lines = testdata.split(/\n/)

    matchCaptures = ''
    matchResult = ''
    $.each(lines, (i, e) ->
      matches = regex.exec e
      if matches
        matchResult += matches[0] + '<br />'
        if matches.length > 1
          matches.shift()
          lis = ($('<li>').text match for match in matches)
          list = $('<ol>')
          (list.append li for li in lis)
          matchCaptures += '<h4>Result ' + (i + 1) + '</h4>' + '<ol>' + list.html() + '</ol>'
    )

    if matchCaptures.length > 0 && matchResult.length > 0
      $('#error').html ''
      $('#match-captures').html '<h3>Match captures</h3>' + '<div>' + matchCaptures + '</div>'
      $('#match-result').html '<h3>Match result</h3>' + '<p>' + matchResult + '</p>'
    else
      $('#error').html '<h3>No matches</h3>'
      $('#match-captures').html ''
      $('#match-result').html ''

$(document).ready ->
  evaluate()
  $('#regex').keyup evaluate
  $('#options').keyup evaluate
  $('#test').keyup evaluate
  $('#clear-fields').click (e) ->
    e.preventDefault()
    $('#regex').val('')
    $('#options').val ''
    $('#test').val ''
  $('#regex').focus()
