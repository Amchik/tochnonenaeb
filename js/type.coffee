class Type
  constructor: (@el, @text, @period = 200) ->
    @id = 0
    @txt = ''
    @deleting = no

  tick: ->
    full = @text[@id % @text.length]
    dt = @period - Math.random() * 100
    dt /= 2 if @deleting

    @txt = full.substring 0, @txt.length + (if @deleting then -1 else 1)
    @el.innerHTML = @txt

    if not @deleting and @txt is full
      @deleting = yes
      dt = @period
    else if @deleting and @txt is ''
      @deleting = no
      @id = 0 if ++@id >= @text.length
      dt  = 500

    setTimeout (=> @tick()), dt

window.addEventListener 'load', ->
  window.type = new Type document.getElementById('wrap'), [
    'Банковские карты с балансом'
    'Дома по 30000 рублей'
    'PlayStation 5 за 10000 рублей'
    'Discord Nitro за 50 рублей'
    'Любая игра за 30 рублей'
    'Ты можешь купить всё что угодно'
    'Тебя совершенно точно никто не наебёт'
  ]
  window.type.tick()

  console.log '%cЕсли вы открыли консоль, значит вас на 10000% хотят наебать', 'background: red; color: blue; font-size: 64px;'

  return

