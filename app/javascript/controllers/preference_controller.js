import { Controller } from "stimulus"
import Sortable from 'sortablejs';
import { get, post, put, patch, destroy } from '@rails/request.js'

export default class extends Controller {
  connect() {
    console.log("pre-connect")
    this.sortable = Sortable.create(this.element, {
      onUpdate: (evt)=> {
        this.sortable.option("disabled", true)
        this.update_preference(evt.item.dataset.url, evt.newIndex+1)
      }
    });
  }

  async update_preference(url, new_pre){
    const request = await post(url, {
      body: JSON.stringify({ new_pref: new_pre })
    })

    if(request.ok){
      const pref_list_html = await request.text
      console.log(pref_list_html, 'aa', this.element);
      this.element.parentElement.innerHTML = pref_list_html
    }

    this.sortable.option("disabled", false)
  }
}
