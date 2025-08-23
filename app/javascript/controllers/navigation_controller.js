import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    link: String
  }

  connect() {
    fetch(this.linkValue).then(/* … */)
  }

  navigate(event) {
    event.preventDefault()
    // Handle navigation logic, e.g., using Turbo or a custom method
    Turbo.visit(this.linkValue)
  }
}
