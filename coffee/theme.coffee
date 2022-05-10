theme = 'white'

setTheme = ->
  document.documentElement.className = theme
  return

swTheme = ->
  theme = if theme is 'white' then 'dark' else 'white'
  setTheme()

window.addEventListener 'load', ->
  # DarkReader
  theme = 'dark' if document.querySelector '.darkreader--fallback'
  setTheme()

