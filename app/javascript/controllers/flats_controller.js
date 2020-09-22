import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["title", "input"]

  changeNameToInput () {
    console.log("Hello")
    if (this.titleTarget.querySelector('h1')) {
      this.titleTarget.innerHTML = `
        <input autofocus type="text" data-action="blur->flats#saveValueOfInput" class="input-group-text mb-3" data-target="flats.input">
      `
    }
  }

  saveValueOfInput () {
    console.log(this.titleTarget.dataset.id)
    fetch(`/flats/${this.titleTarget.dataset.id}`, {
      headers: { accept: "application/json", 'content-type': 'application/json' },
      method: "PATCH",
      body: JSON.stringify({
        flat: {
          name: this.inputTarget.value }
        }
      )
    })
      .then(response => response.json())
      .then((data) => {
        this.changeInputToName(data.flat.name);
      });
  }

  changeInputToName (name) {
    if (this.titleTarget.querySelector('input')) {
      this.titleTarget.innerHTML = `
        <h1 class="text-center">${name} tasks</h1>
      `
    }
  }
}
