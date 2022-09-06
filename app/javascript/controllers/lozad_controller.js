import { Controller } from "@hotwired/stimulus";
import lozad from "lozad";

// Connects to data-controller="lozad"
export default class extends Controller {
  static targets = ["spinner"];
  connect() {
    const loading = this.spinnerTarget;
    const container = document.getElementById("image-container");
    const observer = lozad(".lozad", {
      loaded: function (el) {
        loading.classList.add("hidden");
        container.classList.remove("w-1/2");
      },
    });

    observer.observe();
  }
}
