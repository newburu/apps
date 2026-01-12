import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "url", "title", "description", "image" ]

  connect() {
    console.log("OGP Fetcher Connected")
  }

  fetch(event) {
    const url = event.target.value
    if (!this.isValidUrl(url)) return

    fetch(`/dashboard/projects/get_ogp?url=${encodeURIComponent(url)}`)
      .then(response => response.json())
      .then(data => {
        if (data.title) this.titleTarget.value = data.title
        if (data.description && this.hasDescriptionTarget) this.descriptionTarget.value = data.description
        if (data.image) this.imageTarget.value = data.image
      })
      .catch(error => console.error("Error:", error))
  }

  isValidUrl(string) {
    try {
      new URL(string);
      return true;
    } catch (_) {
      return false;
    }
  }
}
