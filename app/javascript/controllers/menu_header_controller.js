import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {
  static targets = ["avatar", "menu"]
  connect() {
    // const events = ['click', 'mousemove', 'keydown', 'scroll', 'touchstart'];
    // events.forEach(eventType => {
    //   document.addEventListener(eventType, ()=>{
    //     if(this.menuTarget.classList.contains("active")){
    //       this.menuTarget.classList.remove("active");
    //     }
    //   });
    // });
  }

  toggleMenu(){
    this.menuTarget.classList.toggle("active");
  }
}
