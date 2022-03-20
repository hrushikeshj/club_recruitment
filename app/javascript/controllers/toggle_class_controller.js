import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log("qwaszx")
  }
  
  toggle({ params}){
    document.querySelector(params["target"]).classList.toggle(params["class"]);
  }
}
