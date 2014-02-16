//
//  FirstViewController.h
//  sweden_dash
//
//  Created by kazuhiro on 2014/02/03.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "thirdViewController.h"
#import "contentsView.h"



@interface FirstViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *text;
    NSArray *imgArray;
    NSArray *imgs;
    NSArray *explain0;
}
@property (weak, nonatomic) IBOutlet UITableView *myTable;


@end
