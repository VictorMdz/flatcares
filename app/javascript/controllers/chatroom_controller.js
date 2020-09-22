import { Controller } from 'stimulus'
import consumer from "../channels/consumer";

export default class extends Controller {
  static targets = ['messages', 'author', 'conversation', 'input']
  connect() {
    this.initActionCable()
  }

  initActionCable() {
    const container = this.messagesTarget
    const conversation = this.conversationTarget
    const input = this.inputTarget

    const id = container.dataset.chatroomId

    consumer.subscriptions.create({ channel: "ChatroomChannel", id }, {
      received(data) {
        const template = document.createElement('template')
        template.innerHTML = data
        const message = template.content.firstChild

        const currentUser = document.body.dataset.user
        const author = message.dataset.author

        const isCurrentUser = currentUser == author

        if (!isCurrentUser) {
          message.classList.remove('message--sender')
          message.classList.add('message--recipient')

          const h3 = message.querySelector('h3')
          h3.innerText = h3.dataset.name
        }

        container.insertAdjacentElement('beforeend', message)

        conversation.scrollTop = conversation.scrollHeight

        input.value = ''
      },
    });
  }
}
