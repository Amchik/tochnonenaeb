function buySelected() {
  window.location.replace('/buy');
}
function reportSelected() {
  window.location.replace('/kak_naebat');
}

window.addEventListener('load', () => {
  const input = document.getElementById("wrap");
  const fnd = document.getElementById("fnd");
  const fnn = document.getElementById("fnn");
  const fn = document.getElementById("fn");
  input.addEventListener('keyup', (ev) => {
    let value = ev.target.value;

    if (ev.key !== "Enter") return;
    fn.style.visibility = "hidden";
    if (!value) return;

    fnn.style.animation = "vU5LRA .5s infinite linear";
    input.disabled = true;

    setTimeout(() => {
      input.disabled = false;
      fnn.style.animation = "";
      fnd.innerText = value;
      fn.style.visibility = "visible";
    }, 1800);
  })
});