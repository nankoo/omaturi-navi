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
#import "SWRevealViewController.h"


@interface mapViewController : UIViewController
<MKMapViewDelegate ,CLLocationManagerDelegate >
{
    CLLocationManager *locationManager;
    NSArray *imgArray;
    NSArray *imgs;
    
    }
@property (nonatomic, retain) CLLocationManager *locationManager;
-(void) onResume;
-(void) onPause;
@property (weak, nonatomic) IBOutlet MKMapView *myMapView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;


-(void)setLocationCoodinate:(CLLocationCoordinate2D)coodinate;
//コールアウトを閉じる
-(void)closeAnnotation:(BOOL)animated;



@end
