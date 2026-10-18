// Mobile menu
const menuBtn = document.querySelector('.menu-btn');
const menu = document.getElementById('menu');
menuBtn.addEventListener('click', () => {
  const open = menu.classList.toggle('open');
  menuBtn.setAttribute('aria-expanded', String(open));
  menuBtn.setAttribute('aria-label', open ? 'Close menu' : 'Open menu');
});
menu.addEventListener('click', (e) => {
  if (e.target.closest('a')) {
    menu.classList.remove('open');
    menuBtn.setAttribute('aria-expanded', 'false');
    menuBtn.setAttribute('aria-label', 'Open menu');
  }
});

// Product tabs
const tabs = [...document.querySelectorAll('[role="tab"]')];
function selectTab(tab) {
  tabs.forEach((t) => {
    const on = t === tab;
    t.setAttribute('aria-selected', String(on));
    t.tabIndex = on ? 0 : -1;
    document.getElementById(t.getAttribute('aria-controls')).hidden = !on;
  });
}
tabs.forEach((tab, i) => {
  tab.addEventListener('click', () => selectTab(tab));
  tab.addEventListener('keydown', (e) => {
    if (e.key !== 'ArrowRight' && e.key !== 'ArrowLeft') return;
    const next = tabs[(i + (e.key === 'ArrowRight' ? 1 : tabs.length - 1)) % tabs.length];
    selectTab(next);
    next.focus();
  });
});

// Lightbox for certificates, facility and product images
const lb = document.getElementById('lightbox');
const lbImg = lb.querySelector('img');
document.querySelectorAll('[data-full]').forEach((btn) => {
  btn.addEventListener('click', () => {
    const img = btn.querySelector('img');
    lbImg.src = btn.dataset.full;
    lbImg.alt = img ? img.alt : '';
    if (typeof lb.showModal === 'function') lb.showModal();
    else window.open(btn.dataset.full, '_blank');
  });
});
lb.querySelector('.lb-close').addEventListener('click', () => lb.close());
lb.addEventListener('click', (e) => { if (e.target === lb) lb.close(); });

// Demo enquiry form
document.getElementById('enquiry').addEventListener('submit', (e) => {
  e.preventDefault();
  document.getElementById('sent').hidden = false;
});
