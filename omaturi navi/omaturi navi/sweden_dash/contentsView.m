//
//  contentsView.m
//  sweden_dash
//
//  Created by kazuhiro on 2014/02/03.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "contentsView.h"

@interface contentsView ()

@end

@implementation contentsView{
    
}
@synthesize myStr; //アクセサメソッドについて要確認
@synthesize swedenImg;



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
    //testScrollView.backgroundColor = [UIColor whiteColor];
    testScrollView.scrollEnabled = YES;
    //[self.view addSubview:testScrollView];
    
    
    //imageview
    UIImageView *myimg = [[UIImageView alloc] initWithImage:swedenImg];
    myimg.frame = CGRectMake(50, 100, 220, 150);
    //アスペクト比を崩さないように配置
    [myimg setContentMode:UIViewContentModeScaleAspectFit];
    myimg.image = swedenImg;
    myimg.layer.cornerRadius = 5;
    myimg.clipsToBounds = true;
    [testScrollView addSubview:myimg];

    
    //textview
    UITextView *tv = [[UITextView alloc]initWithFrame:CGRectMake(30, 300, 260, 350)];
    //tv.frame = CGRectMake(30, 300, 260, 500);
    tv.editable = NO;
    //tv.backgroundColor = [UIColor redColor];
    tv.textColor = [UIColor blackColor];
    tv.text = myStr;
    [testScrollView addSubview:tv];
    
//    
//    CGRect frame2 = CGRectMake(0,300,200,100);
//	// 幅180,高さ900のRectの中に表示したときのサイズを計算
//	CGSize size2 = [myTextView.text sizeWithFont:myTextView.font
//                               constrainedToSize:CGSizeMake(180, 900)];
//	
//	frame2.size.height = size2.height;
//	myTextView.frame = frame2;

    [self.view addSubview:testScrollView];
    
    
    
    
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
