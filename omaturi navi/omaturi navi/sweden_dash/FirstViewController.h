//
//  FirstViewController.h
//  sweden_dash
//
//  Created by kazuhiro on 2014/02/03.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "mapViewController.h"
#import "contentsView.h"


@interface SWUITableViewCell : UITableViewCell
@end

@interface FirstViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>
{
   
    
    NSDictionary *title_Cell;
    NSArray *title;

    NSArray *latAsia;
    NSArray *latEuro;
    NSArray *latAfrica;
    NSArray *latNouth;
    NSArray *latSouth;
    NSArray *latOseania;
    
    NSArray *lonAsia;
    NSArray *lonEuro;
    NSArray *lonAfrica;
    NSArray *lonNouth;
    NSArray *lonSouth;
    NSArray *lonOseania;

    
    NSString *lat_map;
    NSString *lon_map;
    
    NSString *tag;

    NSArray *coodinateMap;
    CLLocationCoordinate2D center_table;
}
@property (weak, nonatomic) IBOutlet UITableView *myTable;

@property (nonatomic, readonly) CLLocationCoordinate2D center;

@end
