import consumer from "./consumer";

const initEventCable = () => {
  const messagesContainer = document.getElementById('messages');
  const questionsContainer = document.getElementById('questions');

  console.log(messagesContainer);
  if (messagesContainer) {
    const id = messagesContainer.dataset.eventId;

    consumer.subscriptions.create({ channel: "EventChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        if (data.message) {
          messagesContainer.insertAdjacentHTML('beforeend', data.message);
        }
        if (data.question) {
          questionsContainer.insertAdjacentHTML('beforeend', data.question);
        }
      },
    });
  }
}

export { initEventCable };
