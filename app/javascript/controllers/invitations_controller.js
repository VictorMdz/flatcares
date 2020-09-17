import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["field", "additionalFields", "button"]
  addField (event) {
    const html = `
    <div data-target="invitations.field" class="mb-2">
      ${this.fieldTargets[this.fieldTargets.length - 1].innerHTML}
    </div>
    `
    
    this.additionalFieldsTarget.insertAdjacentHTML("beforeend", html);

    this.buttonTargets[0].remove()

    console.log(this.fieldTargets)
  }
}
