import { Controller } from 'stimulus'
import consumer from "../channels/consumer";

export default class extends Controller {
  static targets = ['messages']
  connect() {
    this.initActionCable()
  }

  initActionCable() {
    const container = this.messagesTarget
    const id = container.dataset.chatroomId

    consumer.subscriptions.create({ channel: "ChatroomChannel", id }, {
      received(data) {
        container.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}