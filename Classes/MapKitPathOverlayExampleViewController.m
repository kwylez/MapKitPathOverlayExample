//
//  MapKitPathOverlayExampleViewController.m
//  MapKitPathOverlayExample
//
//  Created by Cory Wiles on 5/25/10.
//  Copyright Wiles, LLC 2010. All rights reserved.
//

#import "MapKitPathOverlayExampleViewController.h"

@implementation MapKitPathOverlayExampleViewController

@synthesize mapView         = _mapView;
@synthesize newAnnotation   = _newAnnotation;

- (void)dealloc {
  _mapView.delegate = nil;
  [_mapView release];
  [_newAnnotation release];
  
  [super dealloc];
}

- (void)viewDidLoad {

  NSMutableArray *poiAnnotationArray  = [[NSMutableArray alloc] init];
  NSMutableArray *selected = [[NSMutableArray alloc] init];
  
  CLLocationDegrees poiOneLat  = kPhoenixLat;
  CLLocationDegrees poiOneLong = kPhoenixLong;
  
  CLLocation *firstLocation = [[CLLocation alloc] initWithLatitude:poiOneLat longitude:poiOneLong];
  
  self.newAnnotation = [Annotation annotationWithCoordinate:firstLocation.coordinate];
  
  [firstLocation release];

  self.newAnnotation.title    = @"Phoenix Title";
  self.newAnnotation.subtitle = @"Phoenix SubTitle";
  
  [poiAnnotationArray addObject:self.newAnnotation];
  
  [selected addObject:self.newAnnotation];
  
  self.newAnnotation = nil;
  
  CLLocationDegrees poiTwoLat  = kXBldgLat;
  CLLocationDegrees poiTwoLong = kXBldgLong;
  
  CLLocation *secondLocation = [[CLLocation alloc] initWithLatitude:poiTwoLat longitude:poiTwoLong];
  
  self.newAnnotation = [Annotation annotationWithCoordinate:secondLocation.coordinate];
  
  [secondLocation release];
  
  self.newAnnotation.title    = @"XBldg Title";
  self.newAnnotation.subtitle = @"XBldg SubTitle";
  
  [poiAnnotationArray addObject:self.newAnnotation];
  
  [selected addObject:self.newAnnotation];
  
  self.newAnnotation = nil;
  
  [self.mapView addAnnotations:poiAnnotationArray];

  /**
   * This should have called out the annotations?
   */
  self.mapView.selectedAnnotations = selected;

  [selected release];
  
  [poiAnnotationArray release];
  
  CLLocationDegrees currentLat  = 35.15872;
  CLLocationDegrees currentLong = -90.04495;
  
  CLLocation *currentLocation = [[CLLocation alloc] initWithLatitude:currentLat longitude:currentLong];
  
  [self setCurrentLocation:currentLocation];
  
  [currentLocation release];

  CLLocationCoordinate2D mapCoords[2];

  mapCoords[0].latitude  = kPhoenixLat;
  mapCoords[0].longitude = kPhoenixLong;
  mapCoords[1].latitude  = kXBldgLat;
  mapCoords[1].longitude = kXBldgLong;
  
  MKPolyline *polyLine = [MKPolyline polylineWithCoordinates:mapCoords count:2];
  
  [self.mapView insertOverlay:polyLine atIndex:0];
  
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {

	self.mapView = nil;

  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
  
  self.mapView = nil;
  
  [super viewDidUnload];
}

#pragma mark -
#pragma mark Custom Methods
- (void)setCurrentLocation:(CLLocation *)location {
  
  MKCoordinateRegion region = {{0.0f, 0.0f}, {0.0f, 0.0f}};
  
  region.center = location.coordinate;
  
  region.span.longitudeDelta = kDeltaLat;
  region.span.latitudeDelta  = kDeltaLong;
  
  [self.mapView setRegion:region animated:YES];
  [self.mapView regionThatFits:region];
}

#pragma mark -
#pragma mark MKMapViewDelegate Methods
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {
  
  MKPolylineView *overlayView = nil;
  
  if (nil == overlayView) {
    
    overlayView = [[[MKPolylineView alloc] initWithOverlay:overlay] autorelease];

    overlayView.strokeColor = [UIColor blueColor];
    overlayView.lineWidth   = 5.0;
  }
  
  return overlayView;
}

@end
