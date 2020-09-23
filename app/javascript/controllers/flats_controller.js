import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["title", "input", "card"]

  changeNameToInput () {
    if (this.titleTarget.querySelector('h1')) {
      this.titleTarget.innerHTML = `
      <div class="mb-2" style="text-align:center;">
        <input autofocus placeholder="edit flat name" type="text" data-action="blur->flats#saveValueOfInput" class="text-center" data-target="flats.input">
      </div>
      `
    }
  }

  saveValueOfInput () {
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
        <h1 class="text-center">${name}</h1>
      `
    }
  }
}
