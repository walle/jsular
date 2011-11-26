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
      if $('#regex').val().length == 0 || $('#test').val().length == 0
        $('#error').html '<p>Jsular is a JavaScript-based regular expression editor.<br /> It\'s a handy way to test regular expressions as you write them.<br /><br /> To start, enter a regular expression and a test string. Or try an </p>'
        example = $('<a>Example</a>').click (e) ->
          e.preventDefault()
          $('#regex').val '^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$'
          $('#test').val 'launch@bacon.com'
          evaluate()
        $('#error p').append example
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
    $('#regex').val ''
    $('#options').val ''
    $('#test').val ''
    evaluate()
  $('#regex').focus()
