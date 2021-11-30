var theme = "white";

function setTheme() {
  document.documentElement.className = theme;
}

function swTheme() {
  theme = theme == "white" ? "dark" : "white";
  setTheme();
}

window.addEventListener("load", function() {
  // DarkReader
  if(document.querySelector('.darkreader--fallback')) theme = "dark";
  setTheme();
});

