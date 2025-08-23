// app/javascript/controllers/theme_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggle"]

  connect() {
    // Get saved theme or default to light
    const savedTheme = localStorage.getItem("theme") || "light"

    // Apply the theme
    this.applyTheme(savedTheme)

    // Set toggle position based on saved theme
    this.toggleTarget.checked = savedTheme === "dark"
  }

  toggle() {
    // Get current theme based on toggle state
    const newTheme = this.toggleTarget.checked ? "dark" : "light"

    // Apply and save the new theme
    this.applyTheme(newTheme)
    localStorage.setItem("theme", newTheme)
  }

  applyTheme(theme) {
    // Apply theme to document
    document.documentElement.setAttribute("data-theme", theme)

    // Optional: Also add class to body for additional styling
    document.body.className = document.body.className.replace(/theme-\w+/g, "")
    document.body.classList.add(`theme-${theme}`)
  }
}
