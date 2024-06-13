import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { conversationId: Number, currentUserId: Number }
  static targets = ["messages"]


  connect() {
    this.subscription = createConsumer().subscriptions.create(
      { channel: "ConversationChannel", id: this.conversationIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the conversation with the id ${this.conversationIdValue}.`)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the conversation")
    this.subscription.unsubscribe()
  }


  #insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue === data.sender_id
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message ${this.#justifyClass(currentUserIsSender)}">
        <div class="message-container">
          ${message}
        </div>
      </div>
    `
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "sender" : "receiver"
  }
}
