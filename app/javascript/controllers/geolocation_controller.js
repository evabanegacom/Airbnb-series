import { Controller } from 'stimulus';
import { getDistance, convertDistance } from 'geolib';
import { isEmpty } from 'lodash-es';

export default class extends Controller {
    static targets = ['property']
    connect() {
        if(isEmpty(this.element.dataset.latitude) && isEmpty(this.element.dataset.longitude)){
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

            console.log({distance})
            console.log(property.querySelector('[data-distance-away]'))


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
    }else{
        const coordinatesDataset = {latitude: this.element.dataset.latitude, longitude: this.element.dataset.longitude}
        const coordinatesProperty = { latitude: property.dataset.latitude,longitude: property.dataset.longitude }
        this.setDistanceText(coordinatesDataset, coordinatesProperty)
    }
    }
    setDistanceText(coordinatesDataset, coordinatesProperty){
        this.propertyTargets.forEach((property) => {
            console.log(property.querySelector('[data-distance-away]'))
           let distanceFrom = getDistance(
            coordinatesProperty, coordinatesDataset)
           property.querySelector('[data-distance-away]').innerHTML = `${Math.round(convertDistance(distanceFrom, 'km'))} Km away` 
        })
    }

    favourite() {
        console.log('favourite button clicked')
    }
}