import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "firstname", "lastname", "email", "mobile", "gender", "birthday", "password", "confirmPassword"];

  connect() {
    console.log("UsersController connected");
  }

  open(event) {
    const userId = event.currentTarget.dataset.userId;
    const userFirstname = event.currentTarget.dataset.userFirstname;
    const userLastname = event.currentTarget.dataset.userLastname;
    const userEmail = event.currentTarget.dataset.userEmail;
    const userMobile = event.currentTarget.dataset.userMobile;
    const userGender = event.currentTarget.dataset.userGender;
    const userBirthday = event.currentTarget.dataset.userBirthday;

    // Set the userID property of the controller
    this.userID = userId;

    // Populate the form fields with user data
    this.firstnameTarget.value = userFirstname;
    this.lastnameTarget.value = userLastname;
    this.emailTarget.value = userEmail;
    this.mobileTarget.value = userMobile;
    this.genderTarget.value = userGender;
    this.birthdayTarget.value = userBirthday;
  }

  submitForm(event) {
    event.preventDefault(); // Prevent the default form submission behavior

    // Extract data from form fields
    const formData = new FormData(event.currentTarget);
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    formData.append('authenticity_token', csrfToken); // add authenticity token

    // Get the userID from the controller property
    const userId = this.userID;

    // Fetch URL and options for the PATCH request
    const url = `/user_crew/${userId}`;
    const options = {
      method: "PATCH",
      body: formData
    };

    // Send the PATCH request
    fetch(url, options)
      .then(response => {
        if (response.redirected) {
          // Handle success response
          console.log("Profile updated successfully");
          window.location.reload(); // Reload the page

        } else {
          // Handle error response
          console.error("Error updating profile");
        }
      })
      .catch(error => {
        console.error("Error updating profile:", error);
      });
  }
}
