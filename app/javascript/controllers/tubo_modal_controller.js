
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['content'];

  close(e) {
    $(this.contentTarget).empty();
    $(this.element).hide()
  }

  open() {
    $(this.element).show()
  }
}