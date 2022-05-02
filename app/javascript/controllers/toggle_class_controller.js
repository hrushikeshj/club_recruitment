import { Controller } from "stimulus"

export default class extends Controller {
  // hide - class sidenav-toggled
  connect() {
    console.log("qwaszx");
    let status = window.localStorage.getItem('sidebar_status')
    if(status){
      if(status == 'hide')
        document.querySelector('body').classList.add('sidenav-toggled')
      else if(status == 'show')
        document.querySelector('body').classList.remove('sidenav-toggled')
    }
  }
  
  toggle({ params}){
    document.querySelector(params["target"]).classList.toggle(params["class"]);

    if(document.querySelector(params["target"]).classList.contains('sidenav-toggled'))
      window.localStorage.setItem('sidebar_status', 'hide')
    else
      window.localStorage.setItem('sidebar_status', 'show')
  }
}
