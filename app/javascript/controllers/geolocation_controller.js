import { Controller } from 'stimulus';
import { getDistance, convertDistance } from 'geolib';

export default class extends Controller {
    static targets = ['property']
    connect() {
        //console.log(this.element)
        //console.log(this.propertyTargets)
        window.navigator.geolocation.getCurrentPosition((pos) => {
            //this.element.setAttribute('data', 'latitude:')
            const lon = pos.coords.longitude
            const lat = pos.coords.latitude
            this.element.dataset.latitude = lat
            this.element.dataset.longitude = lon

            const distance = getDistance(
                { latitude: lat, longitude: lon},
                { latitude: 41.6500201, longitude: -72.7342163}
            );

            ///console.log({distance})

            const convert = convertDistance(distance, 'km')
            //console.log({convert})
            this.propertyTargets.forEach((property) => {
                //console.log(property.dataset.latitude)
                console.log(property.querySelector('[data-distance-away]'))
               // console.log(property.dataset.longitude)
               let distanceFrom = getDistance(
                { latitude: lat, longitude: lon}, 
                { latitude: property.dataset.latitude,longitude: property.dataset.longitude })
            //console.log({distanceFrom})
               property.querySelector('[data-distance-away]').innerHTML = `${Math.round(convertDistance(distanceFrom, 'km'))} Km away` 
            })

        })
    }
}