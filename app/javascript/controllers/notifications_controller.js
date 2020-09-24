import { Controller } from 'stimulus'
import consumer from "../channels/consumer";
import toastr from "toastr";

export default class extends Controller {

  static targets = ['container', 'card']

  connect() {
    this.initActionCable()
  }

  initActionCable() {
    const container = this.containerTarget
    const id = container.dataset.flatId

    consumer.subscriptions.create({ channel: "NotificationChannel", id }, {
      received(data) {
        const userId = container.dataset.userId
        container.insertAdjacentHTML('afterbegin', data.html)
        if (userId != data.id.id) {
          toastr.options.timeOut = 5000
          toastr.options.onclick = () => window.location.href = data.url
          // toastr.info(data.message)
          toastr.success(data.message);
          console.log(data.id.id)
          console.log(userId)
        }
      },
    });
  }
}
