import { Controller } from "@hotwired/stimulus"
import { Html5Qrcode } from "html5-qrcode"

export default class extends Controller {
  static targets = ["select"]
  static values = { lookupUrl: String }

  connect() {
    this.scanner = null
  }

  scan() {
    this.openModal()
  }

  openModal() {
    const modal = document.createElement("div")
    modal.className = "scanner-modal"
    modal.innerHTML = `
    <div class="scanner-modal-content">
      <div id="scanner-viewport"></div>
      <button type="button" class="btn btn-secondary mt-2" data-action="click->barcode-scanner#closeModal">Cancel</button>
    </div>
    `
    document.body.appendChild(modal)
    this.modalElement = modal

    this.scanner = new Html5Qrcode("scanner-viewport")
    this.scanner.start(
      { facingMode: "environment" },
      { fps: 10, qrbox: { width: 250, height: 150 } },
      (decodedText) => this.onScanSuccess(decodedText),
      () => {}
    )
  }

  async onScanSuccess(isbn) {
    console.log(isbn)
    await this.closeModal()

    const response = await fetch(`${this.lookupUrlValue}?isbn=${encodeURIComponent(isbn)}`, {
      headers: { "Accept": "application/json" }
    })

    if (!response.ok) {
      alert("No book found with that barcode.")
      return
    }

    const data = await response.json()
    this.selectTarget.value = data.id
  }

  async closeModal() {
    if (this.scanner) {
      try { await this.scanner.stop() } catch (e) {}
      this.scanner.clear()
      this.scanner = null
    }
    this.modalElement?.remove()
  }

  disconnect() {
    this.closeModal()
  }
}
