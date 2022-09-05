import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="translation"
export default class extends Controller {
  static targets = ["text"];
  static values = { input_text: String };

  translate() {
    const text = this.textTarget.value;
    const translate_text = text.replace(/[ぁ-ん]/g, function (s) {
      return String.fromCharCode(s.charCodeAt(0) + 0x60);
    });
    this.textTarget.value = translate_text;
  }
}
