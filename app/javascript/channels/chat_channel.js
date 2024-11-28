import consumer from "channels/consumer"

const messages= document.getElementById("messages");
const input_message = document.getElementById("input-message");

const chatChannel = consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const timestamp = new Date(data['time_ms']).toLocaleTimeString();
    const t = document.createTextNode(timestamp + ': ' + data['message']);
    const p = document.createElement("p");
    p.appendChild(t);
    messages.append(p);
    input_message.scrollIntoView();
  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});

input_message.addEventListener('keypress', (e) =>
  {
    if (e.keyCode == 13) {
      chatChannel.speak(e.target.value);
      e.target.value = "";
      e.preventDefault();
    }
  }
)
