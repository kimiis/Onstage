import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = [ "content", "link" ]

  async load(event) {
    event.preventDefault()
    const url = event.currentTarget.getAttribute("href")
    // console.log(url);
    this.contentTarget.innerHTML = ""
    try {
      const response = await fetch(url)
      if (response.ok) {
        const html = await response.text()
        this.contentTarget.innerHTML = html
      } else {
        console.error("Failed to load content", response.status, response.statusText)
      }
    } catch (error) {
      console.error("Error fetching content", error)
    }
  }

  

}
