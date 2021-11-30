var theme = "white";

function setTheme() {
  // DarkReader
  if(document.querySelector('.darkreader--fallback')) theme = "dark";
  document.documentElement.className = theme;
}

function swTheme() {
  theme = theme == "white" ? "dark" : "white";
  setTheme();
}

window.addEventListener("load", setTheme);
