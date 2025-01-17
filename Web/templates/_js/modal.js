document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("dialog").forEach(modal => {
    modal.onclick = e => {
      let rect = modal.getBoundingClientRect();
      var on_modal = (rect.top <= e.clientY && e.clientY <= rect.top + rect.height &&
        rect.left <= e.clientX && e.clientX <= rect.left + rect.width);
      if (!on_modal)
        modal.close();
    };
    modal.querySelector(".modal__close").onclick = () => { modal.close(); }
  });
});
