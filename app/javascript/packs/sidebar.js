const chevron = document.querySelector('.fa-chevron-down')

chevron.addEventListener('click', () => {
  window.scrollTo({
    top: window.innerHeight,
    left: 0,
    behavior: 'smooth'
  });
})
