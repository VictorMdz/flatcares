import { Controller } from 'stimulus'
import consumer from "../channels/consumer";
import toastr from "toastr";

const notified = new Set()

export default class extends Controller {

  // static targets = ['container', 'card']

  connect() {
    this.initActionCable()
  }

  initActionCable() {
    const container = document.querySelector('#notifications-wrapper')
    const flatId = document.body.dataset.flat
    const user = document.body.dataset.user

    if (flatId) {
      consumer.subscriptions.create({ channel: "NotificationChannel", id: flatId }, {
        received(data) {

          if (container) {
            container.insertAdjacentHTML('afterbegin', data.html)
          }

          if (notified.has(data.notification_id)) {
            return
          }

          if (data.user.id != user) {
            toastr.options.timeOut = 5000
            toastr.options.onclick = () => window.location.href = data.url
            toastr.success(data.message);
            notified.add(data.notification_id)
          }
        },
      });
    }
  }
}
