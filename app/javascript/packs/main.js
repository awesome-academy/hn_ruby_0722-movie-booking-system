function setupTabs () {
  document.querySelectorAll(".tab__button").forEach(button => {
    button.addEventListener("click", () => {
      const sideBar = button.parentElement;
      const tab = sideBar.parentElement;
      const tabcontain = tab.parentElement;
      const tabContainer = tabcontain.parentElement;
      const tabNumber = button.dataset.forTab;
      const tabToActivate = tabContainer.querySelector(`.tab__content[data-tab="${tabNumber}"]`);

      sideBar.querySelectorAll(".tab__button").forEach(button => {
        button.classList.remove("tab__button--active")
      })
      
      tabContainer.querySelectorAll(".tab__content").forEach(button => {
        button.classList.remove("tab__content-active")
      })

      button.classList.add("tab__button--active")
      tabToActivate.classList.add("tab__content-active")
    })
  })
};

document.addEventListener("DOMContentLoaded", () => {
  setupTabs();

  document.querySelectorAll(".tabb ").forEach(tabContainer => {
    tabContainer.querySelector(".tab__sidebar .tab__button").click();
  })
})
