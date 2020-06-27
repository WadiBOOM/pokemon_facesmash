const sideNavFunction = () => {
  const listPokemon = document.querySelector(".list-pokemon");
  const sideNav = document.querySelector(".sidenav");
  const sideNavRight = document.querySelector(".sidenav-right-part");
  const sideNavLeft = document.querySelector(".sidenav-left-part");

  if (listPokemon) {
    listPokemon.addEventListener("click", (event) => {
      sideNav.classList.add("active");
      sideNavRight.classList.add("sidenav-transition");
      sideNavLeft.addEventListener("click", (event) => {
        sideNavRight.classList.remove("sidenav-transition");
        sideNav.classList.remove("active");
      })
    })
  }
}

export { sideNavFunction }
