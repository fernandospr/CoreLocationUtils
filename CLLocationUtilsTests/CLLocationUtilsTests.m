//
//  CLLocationUtilsTests.m
//  CLLocationUtilsTests
//
//  Created by Fernando Sproviero on 10/07/13.
//  Copyright (c) 2013 Fernando Sproviero. All rights reserved.
//

#import "CLLocationUtilsTests.h"
#import "CLLocation+Utils.h"

@implementation CLLocationUtilsTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testPrettyCoordinates
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:-34.603611 longitude:-58.381667];
    NSString *prettyLat = [location1 prettyLatitude];
    NSString *prettyLon = [location1 prettyLongitude];
    STAssertTrue([prettyLat isEqualToString:@"34° 36' 13\" S"], @"Pretty coordinates do not match");
    STAssertTrue([prettyLon isEqualToString:@"58° 22' 54\" W"], @"Pretty coordinates do not match");
}

- (void)testHaversineZeroDistance
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:40.0 longitude:-73.0];
    CLLocationDistance distance = [location1 haversineDistanceFromLocation:location1];
    STAssertEquals(0.0, distance, @"Distance should be zero");
}

- (void)testHaversineHugeDistance
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:40.0 longitude:-73.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:-10.0 longitude:20.0];
    CLLocationDistance distance = ceil([location1 haversineDistanceFromLocation:location2] / 1000);
    STAssertEquals(10974.0, distance, @"Distance do not match");
}

- (void)testSphericalLawOfCosZeroDistance
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:40.0 longitude:-73.0];
    CLLocationDistance distance = [location1 sphericalLawOfCosDistanceFromLocation:location1];
    STAssertEquals(0.0, distance, @"Distance should be zero");
}

- (void)testSphericalLawOfCosHugeDistance
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:40.0 longitude:-73.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:-10.0 longitude:20.0];
    CLLocationDistance distance = ceil([location1 sphericalLawOfCosDistanceFromLocation:location2] / 1000);
    STAssertEquals(10974.0, distance, @"Distance do not match");
}

- (void)testPythagorasZeroDistance
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:40.0 longitude:-73.0];
    CLLocationDistance distance = [location1 pythagorasDistanceFromLocation:location1];
    STAssertEquals(0.0, distance, @"Distance should be zero");
}

- (void)testPythagorasSmallDistance
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:51.0 longitude:0.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:51.01 longitude:0.0];
    CLLocationDistance distance = ceil([location1 pythagorasDistanceFromLocation:location2]);
    STAssertEquals(1112.0, distance, @"Distance do not match");
}

- (void)testMidPoint
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:50.0 longitude:0.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:-50.0 longitude:0.0];
    CLLocation *location3 = [location1 midpointWithLocation:location2];
    STAssertEquals(0.0, location3.coordinate.latitude, @"Latitude should be zero");
    STAssertEquals(0.0, location3.coordinate.longitude, @"Longitude should be zero");
}

- (void)testAngleZero
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:50.0 longitude:0.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:-50.0 longitude:0.0];
    CLLocationDegrees angle = [location2 angleWithLocation:location1];
    STAssertEquals(0.0, angle, @"Angle should be zero");
}

- (void)testAngle45
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:0.0 longitude:-50.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:50.0 longitude:0.0];
    CLLocationDegrees angle = [location1 angleWithLocation:location2];
    STAssertEquals(45.0, angle, @"Angle should be 45");
}

- (void)testAngle90
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:0.0 longitude:-50.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:0.0 longitude:50.0];
    CLLocationDegrees angle = [location1 angleWithLocation:location2];
    STAssertEquals(90.0, angle, @"Angle should be 90");
}

- (void)testAngle135
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:0.0 longitude:0.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:-50.0 longitude:50.0];
    CLLocationDegrees angle = [location1 angleWithLocation:location2];
    STAssertEquals(135.0, angle, @"Angle should be 135");
}

- (void)testAngle180
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:50.0 longitude:0.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:-50.0 longitude:0.0];
    CLLocationDegrees angle = [location1 angleWithLocation:location2];
    STAssertEquals(180.0, angle, @"Angle should be 180");
}

- (void)testAngle225
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:0.0 longitude:-50.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:50.0 longitude:0.0];
    CLLocationDegrees angle = [location2 angleWithLocation:location1];
    STAssertEquals(225.0, angle, @"Angle should be 225");
}

- (void)testAngle270
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:0.0 longitude:0.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:0.0 longitude:-50.0];
    CLLocationDegrees angle = [location1 angleWithLocation:location2];
    STAssertEquals(270.0, angle, @"Angle should be 270");
}

- (void)testAngle315
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:0.0 longitude:0.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:50.0 longitude:-50.0];
    CLLocationDegrees angle = [location1 angleWithLocation:location2];
    STAssertEquals(315.0, angle, @"Angle should be 315");
}

- (void)testAngleBetweenNegativeAndPositive
{
    STAssertTrue([CLLocation angle:0.0 betweenAngle:-45.0 andAngle:45.0], @"Should return true");
    STAssertTrue([CLLocation angle:0.0 betweenAngle:315.0 andAngle:45.0], @"Should return true");
}

- (void)testAngleBetweenZeroAndPositive
{
    STAssertTrue([CLLocation angle:45.0 betweenAngle:0.0 andAngle:90.0], @"Should return true");
}

- (void)testAngleBetweenPositiveAndPositive
{
    STAssertTrue([CLLocation angle:90.0 betweenAngle:45.0 andAngle:135.0], @"Should return true");
}

- (void)testAngleBetweenPositiveAndNegative
{
    STAssertTrue([CLLocation angle:180.0 betweenAngle:90.0 andAngle:-90.0], @"Should return true");
    STAssertTrue([CLLocation angle:180.0 betweenAngle:90.0 andAngle:270.0], @"Should return true");
}

- (void)testAngleBetweenNegativeAndNegative
{
    STAssertTrue([CLLocation angle:225.0 betweenAngle:180.0 andAngle:-90.0], @"Should return true");
    STAssertTrue([CLLocation angle:225.0 betweenAngle:180.0 andAngle:270.0], @"Should return true");
    STAssertTrue([CLLocation angle:-135.0 betweenAngle:180.0 andAngle:-90.0], @"Should return true");
    STAssertTrue([CLLocation angle:-135.0 betweenAngle:180.0 andAngle:270.0], @"Should return true");
}

- (void)testAngleWithDecimalsBetweenZeroAndPositive
{
    STAssertTrue([CLLocation angle:40.2 betweenAngle:40.1 andAngle:40.3], @"Should return true");
}

- (void)testAngleNotBetweenZeroAndPositive
{
    STAssertFalse([CLLocation angle:90.1 betweenAngle:0.0 andAngle:90.0], @"Should return true");
}

- (void)testInitialBearing
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:35.0 longitude:45.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:35.0 longitude:135.0];
    CLLocationDegrees angle = [location1 initialBearingToLocation:location2];
    STAssertEqualsWithAccuracy(60.0, angle, 1.0, @"Angle should be 60");
}

- (void)testFinalBearing
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:35.0 longitude:45.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:35.0 longitude:135.0];
    CLLocationDegrees angle = [location1 finalBearingToLocation:location2];
    STAssertEqualsWithAccuracy(120.0, angle, 1.0, @"Angle should be 60");
}

- (void)testDestinationLocation
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:50.0 longitude:50.0];
    CLLocation *destinationLocation = [location1 destinationLocationWithInitialBearing:45.0 distance:100000];
    STAssertTrue([destinationLocation.prettyLatitude isEqualToString:@"50° 37' 54\" N"], @"Wrong latitude");
    STAssertTrue([destinationLocation.prettyLongitude isEqualToString:@"51° 00' 09\" E"], @"Wrong longitude");
}

- (void)testPythagorasDestinationLocation
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:0.0 longitude:0.0];
    CLLocation *destinationLocation = [location1 pythagorasDestinationLocationWithInitialBearing:63.435 pythagorasDistance:201.246118];
    STAssertEqualsWithAccuracy(destinationLocation.coordinate.latitude, 90.0, 1.0, @"Wrong latitude");
    STAssertEqualsWithAccuracy(destinationLocation.coordinate.longitude, 180.0, 1.0, @"Wrong longitude");
}

- (void)testPythagorasDestinationLocation45
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:0.0 longitude:0.0];
    CLLocation *destinationLocation = [location1 pythagorasDestinationLocationWithInitialBearing:45.0 pythagorasDistance:100.0];
    STAssertEqualsWithAccuracy(destinationLocation.coordinate.latitude, 70.710678, 1.0, @"Wrong latitude");
    STAssertEqualsWithAccuracy(destinationLocation.coordinate.longitude, 70.710678, 1.0, @"Wrong longitude");
}

- (void)testPythagorasDestinationLocation90
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:0.0 longitude:0.0];
    CLLocation *destinationLocation = [location1 pythagorasDestinationLocationWithInitialBearing:90.0 pythagorasDistance:100.0];
    STAssertEqualsWithAccuracy(destinationLocation.coordinate.latitude, 0.0, 1.0, @"Wrong latitude");
    STAssertEqualsWithAccuracy(destinationLocation.coordinate.longitude, 100.0, 1.0, @"Wrong longitude");
}

- (void)testPythagorasDestinationLocation0Negative
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:-10.0 longitude:0.0];
    CLLocation *destinationLocation = [location1 pythagorasDestinationLocationWithInitialBearing:0.0 pythagorasDistance:100.0];
    STAssertEqualsWithAccuracy(destinationLocation.coordinate.latitude, 90.0, 1.0, @"Wrong latitude");
    STAssertEqualsWithAccuracy(destinationLocation.coordinate.longitude, 0.0, 1.0, @"Wrong longitude");
}

- (void)testPythagorasDestinationLocation45Negative
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:-20.0 longitude:-10.0];
    CLLocation *destinationLocation = [location1 pythagorasDestinationLocationWithInitialBearing:45.0 pythagorasDistance:28.284271];
    STAssertEqualsWithAccuracy(destinationLocation.coordinate.latitude, 0.0, 1.0, @"Wrong latitude");
    STAssertEqualsWithAccuracy(destinationLocation.coordinate.longitude, 10.0, 1.0, @"Wrong longitude");
}

- (void)testConstructorWithPrettyCoordinates
{
    NSString *lat = @"38° 53' 23\" N";
    NSString *lon = @"77° 00' 32\" W";
    CLLocation *location1 = [[CLLocation alloc] initWithPrettyLatitude:lat prettyLongitude:lon];
    STAssertEqualsWithAccuracy(location1.coordinate.latitude, 38.889722, 0.000001, @"Coordinates do not match");
    STAssertEqualsWithAccuracy(location1.coordinate.longitude, -77.008889, 0.000001, @"Coordinates do not match");
}

- (void)testIntersection
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:50.0 longitude:50.0];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:50.0 longitude:0.0];
    double brng1 = 45.0;
    double brng2 = 10.0;
    
    CLLocation *intersection = [location1 intersectionWithSelfBearing:brng1 toLocation:location2 bearing:brng2];
    STAssertTrue([intersection.prettyLatitude isEqualToString:@"40° 22' 51\" N"], @"Coordinates do not match");
    STAssertTrue([intersection.prettyLongitude isEqualToString:@"166° 49' 32\" E"], @"Coordinates do not match");
}

- (void)testRhumbDistance
{
    CLLocation *location1 = [[CLLocation alloc] initWithPrettyLatitude:@"50° 21' 50\" N" prettyLongitude:@"04° 09' 25\" W"];
    CLLocation *location2 = [[CLLocation alloc] initWithPrettyLatitude:@"42° 21' 04\" N" prettyLongitude:@"71° 02' 27\" W"];
    int distance = round([location1 rhumbDistanceFromLocation:location2] / 1000);
    STAssertEquals(distance, 5196, @"Wrong rhumb distance");
}

- (void)testRhumbBearing
{
    CLLocation *location1 = [[CLLocation alloc] initWithPrettyLatitude:@"50° 21' 50\" N" prettyLongitude:@"04° 09' 25\" W"];
    CLLocation *location2 = [[CLLocation alloc] initWithPrettyLatitude:@"42° 21' 04\" N" prettyLongitude:@"71° 02' 27\" W"];
    int brng = round([location1 rhumbBearingToLocation:location2]);
    STAssertEquals(brng, 260, @"Wrong bearing distance");
}

- (void)testRhumbMidpoint
{
    CLLocation *location1 = [[CLLocation alloc] initWithPrettyLatitude:@"50° 21' 50\" N" prettyLongitude:@"04° 09' 25\" W"];
    CLLocation *location2 = [[CLLocation alloc] initWithPrettyLatitude:@"42° 21' 04\" N" prettyLongitude:@"71° 02' 27\" W"];
    CLLocation *destinationLocation = [location1 rhumbMidpointWithLocation:location2];
    STAssertTrue([destinationLocation.prettyLatitude isEqualToString:@"46° 21' 27\" N"], @"Coordinates do not match");
    STAssertTrue([destinationLocation.prettyLongitude isEqualToString:@"38° 49' 39\" W"], @"Coordinates do not match");

}

- (void)testRhumbDestinationLocation
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:50.0 longitude:10.0];
    CLLocation *destinationLocation = [location1 rhumbDestinationLocationWithBearing:116.0 distance:40000];
    STAssertTrue([destinationLocation.prettyLatitude isEqualToString:@"49° 50' 32\" N"], @"Coordinates do not match");
    STAssertTrue([destinationLocation.prettyLongitude isEqualToString:@"10° 30' 08\" E"], @"Coordinates do not match");
}

@end
