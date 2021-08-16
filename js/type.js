// Generated by CoffeeScript 2.5.1
var Type;

Type = class Type {
  constructor(el, text, period = 200) {
    this.el = el;
    this.text = text;
    this.period = period;
    this.id = 0;
    this.txt = '';
    this.deleting = false;
  }

  tick() {
    var dt, full;
    full = this.text[this.id % this.text.length];
    dt = this.period - Math.random() * 100;
    if (this.deleting) {
      dt /= 2;
    }
    this.txt = full.substring(0, this.txt.length + (this.deleting ? -1 : 1));
    this.el.innerHTML = this.txt;
    if (!this.deleting && this.txt === full) {
      this.deleting = true;
      dt = this.period;
    } else if (this.deleting && this.txt === '') {
      this.deleting = false;
      if (++this.id >= this.text.length) {
        this.id = 0;
      }
      dt = 500;
    }
    return setTimeout((() => {
      return this.tick();
    }), dt);
  }

};

window.addEventListener('load', function() {
  window.type = new Type(document.getElementById('wrap'), ['Банковские карты с балансом', 'Дома по 30000 рублей', 'PlayStation 5 за 10000 рублей', 'Discord Nitro за 50 рублей', 'Любая игра за 30 рублей', 'Ты можешь купить всё что угодно', 'Тебя совершенно точно никто не наебёт']);
  window.type.tick();
  console.log('%cЕсли вы открыли консоль, значит вас на 10000% хотят наебать', 'background: red; color: blue; font-size: 64px;');
});
