import { Controller } from 'stimulus'
import consumer from "../channels/consumer";

export default class extends Controller {

  static targets = ['container', 'card']

  connect() {
    console.log("hello")
    this.initActionCable()
  }

  initActionCable() {
    const container = this.containerTarget
    const id = container.dataset.flatId

    consumer.subscriptions.create({ channel: "NotificationChannel", id }, {
      received(data) {
        container.insertAdjacentHTML('afterbegin', data)
      },
    });
  }

  changeNotificationBackground () {
    event.preventDefault();
    const element = document.querySelector(".calendar-card-white");
    element.classList.remove("notification-background-notseen");
    element.classList.add("notification-background-seen");
  }
}
