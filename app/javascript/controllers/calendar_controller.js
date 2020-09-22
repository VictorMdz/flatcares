import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.initCalendar()
  }

  initCalendar() {
    const calendar = new Calendar(
      this.containerTarget.id,
      "small",
      ["Sunday", 3],
      [ "#F7F5F1",
        "#E7836B",
        "#E7836B",
        "#E7836B"
      ],
      {
        days: [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday",  "Saturday" ],
        months: [ "January", "Feburary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ],
        indicator: true,
        indicator_type: 1,
        indicator_pos: "bottom",
        placeholder: "<span>No events on this day!</span>"
      }
    )

    console.log(this.containerTarget.dataset.events)

    const events = JSON.parse(this.containerTarget.dataset.events)

    const organizer = new Organizer(
      this.containerTarget.id,
      calendar,
      events
    )
  }
}
