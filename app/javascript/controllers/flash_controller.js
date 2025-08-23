import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]

  connect() {
    this.messageTargets.forEach((el) => {
      setTimeout(() => {
        el.classList.add("opacity-0")
        el.classList.remove("opacity-100")
        setTimeout(() => el.remove(), 700) // remove from DOM after fade
      }, 4000) // display for 4 seconds
    })
  }
}
