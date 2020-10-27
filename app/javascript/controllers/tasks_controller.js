import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["title", "input", "assignee", "area"]

  changeNameToInput () {
    if (this.titleTarget.querySelector('h1')) {
      this.titleTarget.innerHTML = `
        <input autofocus type="text" data-action="blur->tasks#saveValueOfInput" class="input-group-text mb-3" data-target="tasks.input">
      `
    }
  }

  saveValueOfInput () {
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

  changeAssigneeToArea () {
    if (this.assigneeTarget.querySelector('div .list-js')) {
      this.assigneeTarget.innerHTML = `
        <input autofocus type="text" data-action="blur->tasks#saveAssigneeOfArea" class="area-group-text mb-3" data-target="tasks.area">
      `
    }
  }

  saveAssigneeOfArea () {
    console.log(this.areaTarget.value)
    fetch(`/areas/${this.assigneeTarget.dataset.id}`, {
      headers: { accept: "application/json", 'content-type': 'application/json' },
      method: "PATCH",
      body: JSON.stringify({
        area: {
          assigned_user: this.areaTarget.value }
        }
      )
    })
      .then(response => response.json())
      .then((data) => {
        this.changeAreaToAssignee(data.area.assigned_user);
      });
  }

  changeAreaToAssignee (assignee) {
    if (this.assigneeTarget.querySelector('area')) {
      this.assigneeTarget.innerHTML = `
        <p data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Assigned to: ${assignee.first_name} ${assignee.last_name[0]}
        </p>
      `
    }
  }
}
