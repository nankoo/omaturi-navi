//
//  FirstViewController.m
//  sweden_dash
//
//  Created by kazuhiro on 2014/02/03.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "FirstViewController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    self.myTable.dataSource = self;
    self.myTable.delegate = self;
    
    
    /////////////////////変数
    text = @[@"これを食べた事がありますか？",@"ここに行った事がありますか？",@"あなたも参加したいですか？",@"首都を知っていますか？",@"国旗の意味を知っていますか？",@"この人を誰か知っていますか？",@"あなたもこれを食べたいですか？",@"一番人気のあるスポーツを知っていますか？",@"あなたはこれが何かわかりますか",@"あなたもこんな人と会ってみたいですか？"];
   //現段階では文字列？
    imgArray = @[@"1.jpg", @"2.jpg", @"11.jpeg", @"4.jpg", @"5.jpeg", @"6.jpg", @"7.jpg", @"8.jpg", @"9.jpg", @"10.jpg"];
    UIImage *im1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *im2 = [UIImage imageNamed:@"2.jpg"];
    UIImage *im3 = [UIImage imageNamed:@"11.jpg"];
    UIImage *im4 = [UIImage imageNamed:@"4.jpg"];
    UIImage *im5 = [UIImage imageNamed:@"5.jpg"];
    UIImage *im6 = [UIImage imageNamed:@"6.jpg"];
    UIImage *im7 = [UIImage imageNamed:@"7.jpg"];
    UIImage *im8 = [UIImage imageNamed:@"8.jpg"];
    UIImage *im9 = [UIImage imageNamed:@"9.jpg"];
    UIImage *im10 = [UIImage imageNamed:@"10.jpg"];
    imgs = [NSArray arrayWithObjects:im1, im2, im3, im4, im5, im6, im7, im8, im9 ,im10 , nil];
    
    
    explain0 = @[@"”シュールストレミング”\n\nニシンを塩漬けにして缶の中で発酵させた、漬物の一種である。スウェーデン近郊国、一部地域でも食卓に上がる場合がある。\nその強烈な臭いから、「世界一臭い食べ物」と評される。缶詰は内部で発生したガスによって缶自体が膨れている。開封する際にそのガスによって汁が勢いよく飛び出し、臭いが広範囲に拡散するため、屋外（噴出を抑えるため水中も含む）で開けることが推奨されている。原産地では缶を開けるための専用の小屋も存在する。指定場所以外で開封した場合、犯罪となることもある",
                 @"”IKEA”\n\nスウェーデン発祥で、ヨーロッパ・北米・アジア・オセアニアなど世界に出店している世界最大の家具販売店。\n店舗にはレストランとカフェが併設されている。レストランではスモークサーモンやミートボールなどを中心としたスウェーデン料理を食べることができる。ちなみにこれらの店内のテーブル、イス等も全て自社製品で統一されている。\nまた、ホットドッグやソフトクリームなどを売っているビストロや、スウェーデン直輸入のものを中心とした食材を販売している「スウェーディッシュ・フード・マーケット」がある店舗もある",
                 @"”夏至祭り”\n\nスウェーデンにおける最も大きいお祭りです。\n夏至はスウェーデンで最も大事な日で、この時期に合わせて夏休みを取る人もいます。\n宴にはジャガイモをゆでたものやサーモンやスペアリブを食べ、食後には、この夏初めてとれたイチゴが登場します。\nまた当日の夜、結婚を願う女性が7種類の草花を枕の下において寝ると、恋がかなえられるという言い伝えもあります",
                 @"”ストックホルム”\n\nスウェーデンの首都で、スウェーデン最大の都市である。\n北欧を代表する世界都市であり、2012年、アメリカのシンクタンクが公表したビジネス・人材・文化・政治などを対象とした総合的な世界都市ランキングにおいて、世界第27位の都市と評価された。",
                 @"”スウェーデン国旗”\n\n青地に金のスカンディナヴィア十字が描かれた旗。金十字旗とも呼ばれる。\nスカンディナヴィア十字は、キリスト教を象徴している。この国旗におけるデザインと色使いは1442年に制定されたスウェーデンの国章に由来するものであると考えられている。\nまた、国旗を掲揚するのは日中のみとすることが強く推奨されており、遅くとも午後9時までとされる。ただし、もし国が戦争状態にある場合は、夜においても国旗を掲げることが推奨されている。",
                 @"”アルフレッド・ベルンハルド・ノーベル”\n\nダイナマイトの発明で知られるスウェーデンの化学者、発明家、実業家。\n1873年から1891年まで主にパリに住んでいた。孤独な性格で、一時期はうつ病になっていたこともある。生涯独身であり、子供はいなかった。伝記によれば、生涯に3度恋愛したことがある。最初の相手はロシアの娘アレクサンドラだが、彼のプロポーズを拒絶した。",
                 @"”ザリガニパーティー”\n\n北欧諸国の夏季に行われる、ザリガニを食べ飲酒をする行事のこと。\nスウェーデンが発祥の地でフィンランドへも広まった。パーティーは、天候が優れないか、蚊が発生していることがなければ屋外で行われる。食卓には紙製テーブルクロス、前掛け、コミカルな紙製帽子が用意される。伝統的に、飲んで歌うにぎやかな行事である。また、ザリガニの身をほじくる前に、殻にたまったゆで汁を音をたててすすることが公認されている。",
                 @"”アイスホッケー”\n\nウィンタースポーツも盛んに行われており、特にアイスホッケーはサッカーを凌ぐ人気スポーツである。\n2006年はトリノオリンピックとアイスホッケー世界選手権の両方で金メダルを獲得した。世界ランキングも３位を獲得するなど強国の１つとして数えられる",
                 @"”ダーラヘスト”\n\nスウェーデン・ダーラナ地方発祥の伝統工芸品。木彫りの馬で、日本では『ダーラナホース』という名前でも紹介されています。\n古くは子供の玩具でしたが、現在はダーラナ地方の象徴、またスウェーデンそのものを象徴するものとされることがあります。",
                 @"旅人のための雑誌「Traveler's Digest」が世界の美人が住む町や国のリストを作成した結果、世界で一番美人がいる都市はスウェーデンのストックホルムであると発表しました。"];
    
    
    
    /////////////////////
    
    
    
    //ナビゲーションバーの色を変更
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.0824 green:0.3490 blue:0.6078 alpha:1.0000];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UILabel *labelTop = [[UILabel alloc] initWithFrame:CGRectZero];
    labelTop.font = [UIFont boldSystemFontOfSize:20.0];
    labelTop.textColor = [UIColor whiteColor]; // 好きな文字色にする
    self.navigationItem.titleView = labelTop;
    labelTop.text = NSLocalizedString(@"スウェーデン", @"");//好きな文字を入れる
    [labelTop sizeToFit];
    
    

    //長押しセルにする
    UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(rowButtonAction:)];
    longPressRecognizer.allowableMovement = 15;
    longPressRecognizer.minimumPressDuration = 0.6f;
    [_myTable addGestureRecognizer: longPressRecognizer];

}

//長押しされたのかチェック
-(void)rowButtonAction:(UILongPressGestureRecognizer *)gestureRecognizer {
    CGPoint p = [gestureRecognizer locationInView:self.myTable];
    NSIndexPath *indexPath = [self.myTable indexPathForRowAtPoint:p];
    if (indexPath == nil){
        NSLog(@"long press on table view");
    }else if (((UILongPressGestureRecognizer *)gestureRecognizer).state == UIGestureRecognizerStateBegan){
        //セルが長押しされた場合の処理
        NSLog(@"aaaa");
        
        //SOCIALLアクションシート
        NSString *textS = text[_myTable.indexPathForSelectedRow.row];
        NSURL* url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/bairingaru/id794291968?l=ja&ls=1&mt=8"];  // テストURL挿入
        NSArray* actItems = [NSArray arrayWithObjects: textS, url, nil];
        NSLog(@"actItems = %@",actItems);
        
        UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:actItems applicationActivities:nil];
        [self presentViewController:activityView animated:YES completion:nil];
        

    }
}





//セクションに含まれる行の数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [text count];
}


//セクションの数を返す
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}


//section番目のセクション名を返す
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sweden;
    return sweden;
}


//indexpathで指定された箇所のセルを作る
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"basis-cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (nil == cell){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:identifier];
    }
    
    
    //テキスト
    NSString *cellText =[text objectAtIndex:indexPath.row];
    cell.textLabel.text = cellText;
    //画像
    //cell.imageView.image = [UIImage imageNamed:imgArray[indexPath.row]];
    
    
    //セルデザイン
    // For even
    if (indexPath.row % 2 == 0) {
        //cell.textLabel.text = @"Color for even cell is";
        cell.detailTextLabel.text = @"white";
        cell.backgroundColor = [UIColor whiteColor];
        // does not work
    }
    // For odd
    else {
        //cell.textLabel.text = @"Color for odd cell is";
        cell.detailTextLabel.text = @"blue";
        cell.backgroundColor = [UIColor colorWithHue:0.61
                                          saturation:0.09
                                          brightness:0.99
                                               alpha:1.0];
    }
    
    return cell;
}





//セルをタップしたときの動作
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    contentsView *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentsView"];
    
    
    viewController.myStr = explain0[_myTable.indexPathForSelectedRow.row];
    viewController.swedenImg = imgs[_myTable.indexPathForSelectedRow.row];
    
    
    
    //セレクトした後に解放
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //下記コードを使用する事で、segue無しの接続ができる
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    /////////
    

    
}




//- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
//{
//    // セルの取得
//    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
//    // 最大サイズ
//    CGSize bounds = CGSizeMake(tableView.frame.size.width, tableView.frame.size.height);
//    // ラベルサイズ
//    CGSize size = [cell.textLabel.text sizeWithFont: cell.textLabel.font
//                                  constrainedToSize: bounds
//                                      lineBreakMode: UILineBreakModeCharacterWrap];
//    return size.height;
//}
//












- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end