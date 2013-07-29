CoreLocationUtils
=================

A category with convenient methods for CLLocation, based on **<a href="http://www.movable-type.co.uk/scripts/latlong.html">http://www.movable-type.co.uk/scripts/latlong.html</a>**

## Usage

Copy CLLocationUtils to your project, include CLLocation+Utils.h and start using!

## Features

* Convenient CLLocation initializers:
  * initialize with latitude and longitude in radians
  * initialize with a pretty string format (e.g. latitude = @"34° 36' 12\" N" longitude = @"35° 12' 24\" W")
* Obtain coordinates in a pretty format
* Distance between coordinates using:
  * Haversine formula
  * Spherical Law of cosines formula
  * Pythagoras formula
  * Rhumb line formula
* Midpoint along a great circle path between coordinates
* Initial/final bearings to target location from source location
* Calculate target location with a given distance and bearing from source location
