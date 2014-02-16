//
//  CustomAnnotationView.h
//  sweden_dash
//
//  Created by kazuhiro on 2014/02/04.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>




@interface CustomAnnotationView : MKPinAnnotationView

@property (strong, nonatomic) UIImageView *calloutView;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)animateCalloutAppearance;

@end
