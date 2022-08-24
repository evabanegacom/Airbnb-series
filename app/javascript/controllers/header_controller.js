import { Controller } from 'stimulus';
import {enter, leave, toggle} from 'el-transition';

export default class extends Controller {
  static targets = ['openUserMenu', 'userAuthLink']
  connect() {
    //console.log({enter})
    this.openUserMenuTarget.addEventListener('click', this.toggleDropdownMenu)

    this.userAuthLinkTargets.forEach((link) => {
      link.addEventListener('click', (e) => {
        e.preventDefault();
        document.getElementById('modal-trigger').click()
      })
    })
    //this.openUserMenuTarget.textContent = 'hi theere'
  }

  toggleDropdownMenu(){
    toggle(document.getElementById('menu-dropdown-items'))
  }
}