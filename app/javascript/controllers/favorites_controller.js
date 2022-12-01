import { Controller } from 'stimulus';
import axios from 'axios';

export default class extends Controller {
  favourite() {
    if (this.element.dataset.userLoggedIn === 'false') {
      return document.querySelector('[data-header-target="userAuthLink"]').click()
    }
    console.log('favourite controller')
    if (this.element.dataset.favorited === 'true') {
      axios.delete(this.getUnfavoritePath(this.element.dataset.favoriteId), {
        headers: {
          'accept': 'application/json'
        }
      }).then((response) => {
       console.log(response)
       this.element.dataset.favorited = 'false'
       this.element.dataset.favoriteId = ''
       this.element.setAttribute('fill', '#ced4da')
      })
    } else {
      axios.post(this.getFavoritePath(), {
        user_id: this.element.dataset.userId,
        property_id: this.element.dataset.propertyId
      }, {
        headers: {
          'accept': 'application/json'
        }
      })
        .then((response) => {
          console.log(response)
          this.element.dataset.favorited = 'true'
          this.element.dataset.favoriteId = response.data.id
          this.element.setAttribute('fill', 'red')
        })
    };
  }

  getFavoritePath() {
    return '/api/favorites';
  };

  getUnfavoritePath(favoriteId) {
    return `/api/favorites/${favoriteId}`;
  };
  
}