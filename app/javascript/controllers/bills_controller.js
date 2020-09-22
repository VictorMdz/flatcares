// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["form", "bills", "allButton"]

  connect () {
    this.flat = this.formTarget.dataset.flat
    this.filters = []
  }

  filterBills (event) {
    event.preventDefault();
    const input = event.target;
    const filter = input.dataset.filter;
    const tag = input.tagName;
    const value = tag === 'BUTTON' ? true : input.value;

    if (this.getFilter(filter)) {
      if (tag === 'BUTTON') {
        this.removeFilter(filter, value);
      } else {
        this.getFilter(filter).value = value;
      }
    } else {
      this.addFilter(filter, value);
    }

    fetch(`/flats/${this.flat}/bills?${this.buildQueryParams()}`, {
      headers: { accept: "application/json", 'content-type': 'application/json' },
    })
      .then(response => response.json())
      .then((data) => {
        const bills = data.bills.map(bill => bill.html).join('');
        this.billsTarget.innerHTML = bills;

        input.classList.toggle('active')
      });
  }

  removeFilter(filter, value) {
    this.filters = this.filters.filter(f => f.type !== filter);
  }

  addFilter(type, value) {
    this.filters.push({
      type,
      value
    });
  }

  getFilter (filter) {
    return this.filters.find(f => f.type === filter);
  }

  buildQueryParams() {
    return this.filters.map(f => `${f.type}=${f.value}`).join('&');
  }

  changeClassToActive () {
    if (this.activeTarget.querySelector('.change-to-active')) {
      const element = document.querySelector('.change-to-active');
      element.classList.add("active");
    }
  }
}
