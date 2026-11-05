const html = document.documentElement;
const btn  = document.getElementById('theme-btn');

function applyTheme(dark) {
  html.setAttribute('data-theme', dark ? 'dark' : 'light');
  btn.textContent = dark ? 'light' : 'dark';
}

const saved = localStorage.getItem('theme');
const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
applyTheme(saved ? saved === 'dark' : prefersDark);

btn.addEventListener('click', () => {
  const isDark = html.getAttribute('data-theme') === 'dark';
  localStorage.setItem('theme', isDark ? 'light' : 'dark');
  applyTheme(!isDark);
});
