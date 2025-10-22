import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "preview", "placeholder"]

  preview(event) {
    event.preventDefault()
    const input = this.hasInputTarget ? this.inputTarget : event.target
    if (!input.files || !input.files[0]) return

    const file = input.files[0]
    const url = URL.createObjectURL(file)

    if (this.hasPreviewTarget) {
      this.previewTarget.src = url
      this.previewTarget.classList.remove("hidden")
    }

    if (this.hasPlaceholderTarget) {
      this.placeholderTarget.classList.add("hidden")
    }
  }
}
