import consumer from "./consumer";

const initEventCable = () => {
  const messagesContainer = document.getElementById('messages');
  console.log(messagesContainer);
  if (messagesContainer) {
    const id = messagesContainer.dataset.eventId;

    consumer.subscriptions.create({ channel: "EventChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }

  const questionsContainer = document.getElementById('questions');
  console.log(questionsContainer);
  if (questionsContainer) {
    const id = questionsContainer.dataset.eventId;

    consumer.subscriptions.create({ channel: "EventChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        questionsContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initEventCable };
