const sendNotifications = () => {

const results = document.querySelector(".dropdown-menu");

fetch("/notifications.json")
  .then(response => response.json())
  .then((data) => {
    console.log(data);
    console.log(results);
    data.forEach((result) => {
      console.log(result);
      const notification = `<a class="dropdown-item" href="${result.url}">${result.actor} ${result.action} ${result.notifiable.type}</a>`;
      results.insertAdjacentHTML("beforeend", notification);
    });
  });
}

export { sendNotifications };
