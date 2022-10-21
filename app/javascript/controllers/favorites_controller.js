import { Controller } from 'stimulus';

export default class extends Controller {
  favourite() {
    console.log('favourite controller')
    if(this.element.dataset.favorited === 'true') {
        this.element.dataset.favorited = 'false'
       this.element.setAttribute('fill', 'none')
    } else {
       this.element.dataset.favorited = 'true'
       this.element.setAttribute('fill', 'red')
    }
  }
}