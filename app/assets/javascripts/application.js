document.addEventListener("DOMContentLoaded", function () {
  const openModalButton = document.getElementById("openModalButton");
	const closeModalButton = document.getElementById("closeModalButton");
  const modal = document.getElementById("myModal");
  const modalOverlay = modal.querySelector(".modal-overlay");

  // Open modal when the button is clicked
  openModalButton.addEventListener("click", function (event) {
		event.preventDefault()
		modal.classList.remove("hidden");
    modal.classList.add("flex");
  });

	closeModalButton.addEventListener("click", function (event) {
		event.preventDefault()
		console.log("Close clicked")
		modal.classList.remove("flex");
		modal.classList.add("hidden");
	});
	
  // Close modal when the overlay or close button is clicked
  modalOverlay.addEventListener("click", function () {
		modal.classList.remove("flex");
		modal.classList.add("hidden");
  });
});
