# Cycling Routes - [Live Link](https://cycling-pro.herokuapp.com/)

This app is for users who enjoy cycling and want to see their distance in miles, calories burned and save favorite routes in their profile.

## Built with
* Ruby
* Rails
* Materialize
* gmaps4rails gem


## User stories
* User can see the cycling route map, calories burned and guilty pleasure without login.
* Once login user can save their favorite route.

## Wireframes

<img src="http://i.imgur.com/d93UNa3.jpg" width="600">

<img src="http://i.imgur.com/AG1ZCLP.jpg" width="600">

<img src="http://i.imgur.com/NkJ9Mmu.jpg" width="600">



```
  geocoded_by :location
  after_validation :geocode

  def geocode
    self.latitude , self.longitude = Geocoder.coordinates(self.location)
    self.lat , self.lon = Geocoder.coordinates(self.destination)
  end
```

```
  cal_distance = Geocoder::Calculations.distance_between([@location.latitude,@location.longitude],   [@location.lat,@location.lon])
        @location.distance = cal_distance.round(1)
        time = @location.distance / 13
        @location.calories = 8 * 75 * time
        calories = @location.calories
```
      
      
