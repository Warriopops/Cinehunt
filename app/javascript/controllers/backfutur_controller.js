import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["voiture1", "voiture2"]
  connect() {
    console.log("FUTUUUR")
  }
  test(){
    console.log("yyyeees")
    this.voiture1Target.classList.add("d-none");
    this.voiture2Target.classList.remove("d-none");
    setTimeout(() => {
      window.history.go(-1);
    }, 300);

  }
}
