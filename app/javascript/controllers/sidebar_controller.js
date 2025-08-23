import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["overlay", "panel"]
  static classes = ["hidden", "open"]

  connect() {
    // Bind escape key handler
    this.boundHandleEscape = this.handleEscape.bind(this)
    document.addEventListener("keydown", this.boundHandleEscape)
  }

  disconnect() {
    document.removeEventListener("keydown", this.boundHandleEscape)
  }

  open() {
    this.overlayTarget.classList.remove("hidden")
    // Small delay to ensure the element is visible before animating
    requestAnimationFrame(() => {
      this.panelTarget.classList.remove("translate-x-full")
    })
  }

  close() {
    this.panelTarget.classList.add("translate-x-full")
    // Wait for animation to complete before hiding
    setTimeout(() => {
      this.overlayTarget.classList.add("hidden")
    }, 300)
  }

  closeOnBackdrop(event) {
    // Only close if clicking on the backdrop itself, not the panel
    if (event.target === event.currentTarget) {
      this.close()
    }
  }

  handleEscape(event) {
    if (event.key === "Escape" && !this.overlayTarget.classList.contains("hidden")) {
      this.close()
    }
  }
}
