<a href='https://pledgie.com/campaigns/26743'><img alt='Click here to lend your support to: Fernando&#x27;s Open Source Projects and make a donation at pledgie.com !' src='https://pledgie.com/campaigns/26743.png?skin_name=chrome' border='0' ></a>


CoreLocationUtils
=================

A category with convenient methods for CLLocation, based on **<a href="http://www.movable-type.co.uk/scripts/latlong.html">http://www.movable-type.co.uk/scripts/latlong.html</a>**

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

## Usage

Copy CLLocationUtils to your project, include CLLocation+Utils.h and start using!

Please check CLLocationUtilsTests for examples.
