import consumer from "channels/consumer"

const chatChannel = consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});

document.getElementById("input-message").addEventListener('keypress', (e) =>
  {
    if (e.keyCode == 13) {
      chatChannel.speak(e.target.value);
      e.target.value = "";
      e.preventDefault();
    }
  }
)
