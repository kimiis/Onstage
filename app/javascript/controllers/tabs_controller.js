import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = [ "content", "link" ]

  async load(event) {
    event.preventDefault()
    const url = event.currentTarget.getAttribute("href")
    console.log(url);

    try {
      const response = await fetch(url)
      console.log(response);
      if (response.ok) {
        const html = await response.text()
        console.log("ok");
        this.contentTarget.outerHTML = html
        console.log(this.contentTarget.innerHTML);
      } else {
        console.error("Failed to load content", response.status, response.statusText)
      }
    } catch (error) {
      console.error("Error fetching content", error)
    }
  }

}
