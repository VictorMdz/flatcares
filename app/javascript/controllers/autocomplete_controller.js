
import { Controller } from 'stimulus'
import places from 'places.js';

export default class extends Controller {
  static targets = ["input"]

  connect() {
    this.initAutocomplete()
  }

  initAutocomplete = () => {
    places({ container: this.inputTarget });
  }
}
