//
//  SecondViewController.m
//  sweden_dash
//
//  Created by kazuhiro on 2014/02/03.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    imgArray = @[@"1.jpg", @"2.jpg", @"3.jpeg", @"4.jpg", @"5.jpeg", @"6.jpg", @"7.jpg", @"8.jpg", @"9.jpg", @"10.jpg", @"11.jpg", @"12.jpg"];
    UIImage *im1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *im2 = [UIImage imageNamed:@"2.jpg"];
    UIImage *im3 = [UIImage imageNamed:@"3.jpg"];
    UIImage *im4 = [UIImage imageNamed:@"4.jpg"];
    UIImage *im5 = [UIImage imageNamed:@"5.jpg"];
    UIImage *im6 = [UIImage imageNamed:@"6.jpg"];
    UIImage *im7 = [UIImage imageNamed:@"7.jpg"];
    UIImage *im8 = [UIImage imageNamed:@"8.jpg"];
    UIImage *im9 = [UIImage imageNamed:@"9.jpg"];
    UIImage *im10 = [UIImage imageNamed:@"10.jpg"];
    UIImage *im11 = [UIImage imageNamed:@"11.jpg"];
    UIImage *im12 = [UIImage imageNamed:@"12.jpg"];
    imgs = [NSArray arrayWithObjects:im1, im2, im3, im4, im5, im6, im7, im8, im9,im10, im11, im12, nil];
    
    explain = @[@"【死者の日】\n\n”11月1〜2日”\n\n死者の日には家族や友人達が集い、故人への思いを馳せて語り合う。祝祭はカトリックにおける諸聖人の日である11月1日と翌日2日に行われる。地域によっては、10月31日の晩も前夜祭として祝われる。市街地はマリーゴールドの香りに包まれ、公園には露店が立ち並ぶ。11月1日は子供の魂が、2日は大人の魂が戻る日とされ、供え物がチョコレートなどのお菓子からメスカルなどの酒に変わっていく。日本のお盆に近い位置付けであるが、あくまで楽しく明るく祝うのが特徴である。死を恐怖するのではなく、逆にあざ笑うというモチーフとなっている。墓地にも派手な装飾が施され、夜間にはバンドによる演奏なども行われる。カボチャを飾り仮装をしてパーティを行うなど、ハロウィンとも共通する点が多くあり、実際にルーツは近似している部分がある。",
                @"【ロケット花火祭り】\n\n”４月”\n\n世界的にも有名なギリシャ・ヒオス島（キオス島）のイースター（復活祭）行事「ロケット花火祭り」。2つの教会同士でロケット花火を打ち合うもので、その数一晩に65,000発以上です。",
                @"【シヌルグ】\n\n”１月”\n\n毎年１月に行われるセブ島最大のお祭り「Sinulog（シヌログ）」。サント・ニーニョ（幼きイエス / Sto. Nino）を祝うシヌログ祭は9日間続きます。ビサヤ語（セブアノ語）であるシヌログは踊りを意味する言葉で、お祭り期間中にはセブ住民の華麗なるダンスを楽しめます。\n1月11日のシヌログキックオフを皮切りにパレード、コンテスト、写真展など街中でさまざまなイベントが開催されます。フィナーレのパレードは1月3週目の日曜日に開催されます。サウスバスターミナルからアビリアナスポーツセンターまで約5kmの道のりを各地から選出された50組のダンサーがパレードします！",
                @"【チーズ転がし祭り】\n\n”５月”\n\n丘の頂上から丸型のダブルグロスターチーズ(Double Gloucester cheese)が転がされ、競技者たちがそれを追いかけて丘を駆け下りる。丘のふもとに引かれたゴールラインを最初に超えた者がチーズを獲得する。\n理論上、競技者たちの目的はチーズを捕まえることであるが、一秒ほど先にスタートしたチーズの速度は時速70マイル（時速112キロメートル）にも達することがあり、観客をなぎ倒すほどの勢いを持つこの物体を捕まえることは不可能に近い。",
                @"【トマティーナ（トマト投げ祭り）】\n\n”８月”\n\nトマティーナは前夜祭から始まる。前夜祭といっても特別な催し物があるわけではないが、街はイルミネーションで飾り付けられ、大通りには屋台が立ち並び、街中には移動遊園地などもやってきて、互いに酒を飲んだりダンスをしたりして盛り上がる。\nなおトマトをぶつけられては困るものや、一部の家屋では、トマトで汚されないよう通りに面している壁をビニールシートなどで覆うことで祭りに備える。これらは市から補助金が出る。",
                @"【バーニングマン】\n\n”８〜９月”\n\nバーニング・マンは、アメリカ北西部の人里離れた荒野で年に一度、約一週間に渡って開催される。会場となるブラックロック砂漠は、ネバダ州リノ市の約150km北北東に位置する乾湖である。\n各参加者は、この「プラーヤ」(Playa)と呼ばれる何もない塩類平原に街を作り上げ、新たに出会った隣人たちと共同生活を営み、そこで自分を表現しながら生き抜く。そして一週間後、すべてを無に還す。この実験的な地域社会は、みずからを架空の都市「ブラックロック・シティ」と呼称している。",
                @"【水かけ祭り（ソンクラーン）】\n\n”４月１３〜１５日”\n\nもともとは、純粋に新年のお祝いであり、家族が一堂に集って共同で仏像のお清めを行ったり、年輩の家族のお清めを行う期間であったが、ソンクラーンが一年でもっとも暑い時期に行われることなどから、特に若年層を中心に、単なる水掛け祭りに変質している。\nこの「祭り」においては見ず知らずの相手にさえ水を掛け合う。この場合、水を掛けるところは手のみに限定されず、水をかける行為自体「敬意を払う」ため無礼講状態となる（ただし、僧侶には水をかけない）。水の掛け合いには水鉄砲を用いる。他にも、家の前に水の入ったドラム缶を置くあるいは家の前までホースを延長させ、道行く人に水をかけたり、ピックアップトラックの積み荷部分に水の入ったドラム缶を載せ、町中の人に水をかけまわっている例もある。",
                @"【リオのカーニバル】\n\n”２月”\n\nカーニバル（謝肉祭）は世界中のカトリックの国の祭りで現在も行われており、以前は特にリスボンのカーニバルなども有名です。\nリオのカーニヴァルは世界中で最も熱狂的といわれており、この期間世界中から集まる見物客で市内は２倍にも３倍にも膨らむともいわれております。官公庁も休みとなり、リオの住人は大人、子供も各々の衣装を身に着け、お金の無い人も有る人もそれぞれ４日間狂ったように楽しみます。また、他州・外国からもカーニヴァルに参加する人がたくさんいます。",
                @"【メガボンバー】\n\n”３〜５月”\n\nこのお祭りは爆薬をテープでしっかりと括りつけて鉄板らしきものをめがけて思い切り振り下ろすというもので、毎年2万人ほどのヒトが参加するそうです。\n参加者の中には、振り下ろした際の爆風で吹き飛ばされる人も多く、怪我防止のために武装する事がお勧めされます",
                @"【牛追い祭り（サンフェルミン）】\n\n”７月６〜１４日”\n\nサン・フェルミンは9日間の間行われます。この期間中、牛追いだけではなく、毎日朝はやくから夜中の12時まで、ダンスや行進など、様々な催し物が開催されます。\nちなみにこの牛追い、スペイン語で「エンシエロ」囲い込むという意味の名前で呼ばれており、もともとこの牛追いは闘牛で使われる牛を闘牛場まで運ぶことが本来の目的だったと言われています。",
                @"【オレンジ投げ祭り（イブレアカーニバル）】\n\n”３月２〜４日”\n\nパレードなど通常のカーニバルもありますがメインイベントは期間中最後の3日間にはオレンジを投げあう「オレンジ合戦」が催されます。\n起源は中世の独裁君主に、民衆が一揆を起こしたという歴史に由来しているそうです。合戦は街区ごとに9チームに分かれ、5カ所の広場で繰り広げられます。",
                @"【スイカ祭り】\n\n”２月”\n\n世界中のスイカ好きが集まる世界でも類をみないお祭り、それが「スイカ祭り」"];
    
    
    
    
    
    //ナビゲーションバーの色を変更
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2667 green:0.5216 blue:0.9608 alpha:1.0000];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UILabel *labelTop = [[UILabel alloc] initWithFrame:CGRectZero];
    labelTop.font = [UIFont boldSystemFontOfSize:20.0];
    labelTop.textColor = [UIColor whiteColor]; // 好きな文字色にする
    self.navigationItem.titleView = labelTop;
    labelTop.text = NSLocalizedString(@"omaturi navi",);//好きな文字を入れる
    [labelTop sizeToFit];

}




//セルの数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return imgs.count;
}

//セルの中身
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    CollectionViewCell *customCell = (CollectionViewCell *)cell;
    
    //customCell.userImageView.image =
    //customCell.nameLabel.text = [text objectAtIndex:indexPath.item];
    customCell.userImageView.image = [imgs objectAtIndex:indexPath.item];
    
//    if (indexPath.item == 2 ) {
//        customCell.nameLabel.text = @"culture";
//    }else{
//        customCell.nameLabel.text = @"meal";
//    }
    
    return customCell;

    
}



//セルを押した時の挙動
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    contentsView *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentsView"];
    
    
    viewController.myStr = [explain objectAtIndex:indexPath.item];
    viewController.swedenImg = [imgs objectAtIndex:indexPath.item];
  
    
    //セレクトした後に解放
    //[collectionView deselectAtIndexPath:indexPath animated:YES];
    //下記コードを使用する事で、segue無しの接続ができる
    [self.navigationController pushViewController:viewController animated:YES];
 
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
