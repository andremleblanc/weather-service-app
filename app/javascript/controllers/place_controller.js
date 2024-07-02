import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="place"
export default class extends Controller {
  static targets = ["zipCode"]

  connect() {
    const input = document.getElementById("address");
    const options = { fields: ["address_components",] };
    const autocomplete = new google.maps.places.Autocomplete(input, options);

    autocomplete.addListener("place_changed", () => { this.handlePlaceChanged(autocomplete) })
  }

  handlePlaceChanged(autocomplete) {
    let place = autocomplete.getPlace()

    // Ensure values are reset each time Place changes.
    let zipCode = ""

    // Iterate through address components and set zip.
    for (const component of place.address_components) {
      const componentType = component.types[0]

      switch (componentType) {
        case "postal_code": {
          zipCode = component.long_name
        }
      }
    }

    // Set values on hidden fields.
    this.zipCodeTarget.value = zipCode
  }
}
