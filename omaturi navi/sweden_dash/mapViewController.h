//
//  mapViewController.h
//  BG
//
//  Created by kazuhiro on 2014/02/26.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "contentsView.h"
#import "SecondViewController.h"


@interface mapViewController : UIViewController
<MKMapViewDelegate ,CLLocationManagerDelegate >
{
    //MKMapView *myMapView;
    CLLocationManager *locationManager;
    //__strong CLLocationManager *_locationManager;
    NSArray *imgArray;
    NSArray *imgs;
    NSArray *explain;
    
}
@property (nonatomic, retain) CLLocationManager *locationManager;
-(void) onResume;
-(void) onPause;
@property (weak, nonatomic) IBOutlet MKMapView *myMapView;


@end
