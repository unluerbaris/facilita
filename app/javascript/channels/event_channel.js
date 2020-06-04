import consumer from "./consumer";

const initEventCable = () => {
  const messagesContainer = document.getElementById('messages');
  const questionsContainer = document.getElementById('questions');
  const pollsContainer = document.getElementById('pills-mobile-poll');

  console.log(pollsContainer);
  if (messagesContainer) {
    const id = messagesContainer.dataset.eventId;

    consumer.subscriptions.create({ channel: "EventChannel", id: id }, {
      initialize() {
        console.log('listening to event');
      },
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        if (data.message) {
          messagesContainer.insertAdjacentHTML('beforeend', data.message);
          messagesContainer.scrollTop = messagesContainer.scrollHeight;
        }
        if (data.question) {
          questionsContainer.insertAdjacentHTML('beforeend', data.question);
        }
        if(data.polls) {
          require("chartkick")
          require("chart.js")
          pollsContainer.innerHTML = data.polls;
        }
      },
    });
  }
}

export { initEventCable };
