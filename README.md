####Aggregate Yo

*Aggregate Yo* is an aggregator for a tourism software booking company.  The site allows users to filter activities by location and type.  Information from the API is updated daily and stored in a database for quick queries.  Images and information for locations will be pulled from the TripAdvisor API.  Images for activities, companies and items will be pulled from the tourism software API.


## Details about the Application

This application uses the following tools:

*Languages/ Frameworks:* RAILS 4.0, Ruby, Javascript, JQuery, HTML, and CSS.

*Gems:* Gmaps4rails, Geocode, Whenever, Figaro

*APIS/ Services:* FH, TripAdvisor

*Testing:* RSpec


###On Your Own
To download the project and set it up locally, run the following commands:

```
$ git clone git@github.com:marinacor1/aggregate_yo.git
```
```
$ bundle
```
```
$ bundle exec figaro install
```
Make sure to switch out my keys for your own. You will need keys for Google Maps and FH
```
$ rake db:create db:migrate
```
```
$ bundle exec rake import
 ```
 ```
$ rake db:seed
```
