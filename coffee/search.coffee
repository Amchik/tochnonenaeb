search = ->
  el  = document.querySelector '.center'
  res = document.querySelector '.results'

  if val.match /[^\s]+/g
    el.classList.add 'shadow'
    res.style.display = ''
    document.querySelector('#res').innerHTML = val
  else
    el.classList.remove 'shadow'
    res.style.display = 'none'

