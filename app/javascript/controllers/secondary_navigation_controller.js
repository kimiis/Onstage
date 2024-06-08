import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {

  static targets = ["navLink", "marker"]

  connect() {
    this.refreshMarkerPosition()
  }

  upadate(event){
    if(!event.target.classList.contains("active")){
      this.navLinkTargets.forEach(link => {
        link.classList.remove("active");
      })
      event.target.classList.add("active");
      this.refreshMarkerPosition();
    }
  }

  refreshMarkerPosition(){
    const activeLink = this.navLinkTargets.find(el => el.classList.contains("active"));
    const rect = activeLink.getBoundingClientRect();
    const position = rect.left;
    const width = rect.width;
    this.markerTarget.style.left = `calc(${position}px + ${width/2}px - 10px)`;
  }
}
