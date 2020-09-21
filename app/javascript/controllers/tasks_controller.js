import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["title", "input"]

  changeNameToInput () {
    if (this.titleTarget.querySelector('h1')) {
      this.titleTarget.innerHTML = `
        <input autofocus type="text" data-action="blur->tasks#saveValueOfInput" class="input-group-text mb-3" data-target="tasks.input">
      `
    }
  }

  saveValueOfInput () {
    console.log(this.titleTarget.dataset.id)
    fetch(`/areas/${this.titleTarget.dataset.id}`, {
      headers: { accept: "application/json", 'content-type': 'application/json' },
      method: "PATCH",
      body: JSON.stringify({
        area: {
          name: this.inputTarget.value }
        }
      )
    })
      .then(response => response.json())
      .then((data) => {
        this.changeInputToName(data.area.name);
      });
  }

  changeInputToName (name) {
    if (this.titleTarget.querySelector('input')) {
      this.titleTarget.innerHTML = `
        <h1 class="mb-3">${name} tasks</h1>
      `
    }
  }
}
