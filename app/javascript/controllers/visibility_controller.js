import { Controller } from "@hotwired/stimulus"
import { useClickOutside } from 'stimulus-use'

export default class extends Controller {
  static targets = [ "hideable" ];

  connect() {
    useClickOutside(this)
  }

  clickOutside(event) {
    event.preventDefault()
    this.hideTargets()
  }

  hideTargets() {
    $(this.hideableTargets).hide();
  }

  toggleTargets() {
    $(this.hideableTargets).toggle();
  }
}