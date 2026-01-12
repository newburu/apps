import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static values = { url: String }

  connect() {
    this.sortable = Sortable.create(this.element, {
      handle: ".handle",
      onEnd: this.onEnd.bind(this)
    })
  }

  onEnd(event) {
    const id = event.item.dataset.id
    const newIndex = event.newIndex + 1 // acts_as_list is 1-based

    fetch(this.urlValue.replace(":id", id), {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ position: newIndex })
    })
  }
}
