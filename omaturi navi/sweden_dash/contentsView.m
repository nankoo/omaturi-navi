//
//  contentsView.m
//  sweden_dash
//
//  Created by kazuhiro on 2014/02/03.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "contentsView.h"


@implementation contentsView

@synthesize myStr; //アクセサメソッドについて要確認
@synthesize contents_img;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //self.title = @"例文";
    UILabel *labelTop = [[UILabel alloc] initWithFrame:CGRectZero];
    labelTop.font = [UIFont boldSystemFontOfSize:20.0];
    labelTop.textColor = [UIColor whiteColor]; // 好きな文字色にする
    self.navigationItem.titleView = labelTop;
    labelTop.text = NSLocalizedString(@"omaturi navi", );//好きな文字を入れる
    [labelTop sizeToFit];

    
    
    //scrollviewのサンプル
    UIScrollView *testScrollView = [[UIScrollView alloc] init];
    testScrollView.delegate = self;
    testScrollView.frame = self.view.bounds;
    testScrollView.contentSize = CGSizeMake(320, 700);
    
    
    //imageview
    UIImageView *myimg = [[UIImageView alloc] initWithImage:contents_img];
    myimg.frame = CGRectMake(50, 100, 220, 150);
    //アスペクト比を崩さないように配置
    [myimg setContentMode:UIViewContentModeScaleAspectFit];
    myimg.image = contents_img;
    myimg.layer.cornerRadius = 5;
    myimg.clipsToBounds = true;
    [testScrollView addSubview:myimg];

    
    //textview
    UITextView *tv = [[UITextView alloc]initWithFrame:CGRectMake(30, 300, 260, 350)];
    tv.editable = NO;
    tv.textColor = [UIColor blackColor];
    tv.text = myStr;
    [testScrollView addSubview:tv];
    

    [self.view addSubview:testScrollView];
    
    
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
