//
//  SameitemsTCell.m
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import "SameitemsTCell.h"
#import "SameitemCCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation SameitemsTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)layoutSubviews{
    _sameItemCollView.delegate = self;
    _sameItemCollView.dataSource = self;
  _similarItemListArry =  @[@"http://119.81.82.197:9090/hngeCommerceWebservice/rest/image/PDP/536163_1.jpg",
    @"http://119.81.82.197:9090/hngeCommerceWebservice/rest/image/PDP/536163_2.jpg",
    @"http://119.81.82.197:9090/hngeCommerceWebservice/rest/image/PDP/536163_1.jpg",
     @"http://119.81.82.197:9090/hngeCommerceWebservice/rest/image/PDP/536163_2.jpg"];

    [_sameItemCollView reloadData];
}

// mark - collection view methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _similarItemListArry.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    SameitemCCell *cell = (SameitemCCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"SameitemCCell" forIndexPath:indexPath];

    [ cell.sameImge sd_setImageWithURL:[NSURL URLWithString: [_similarItemListArry objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@""]];
    cell.sameImge.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.sameImge.layer.borderWidth = 1;
    cell.nameLbl.text = @"product";
    cell.quantityLbl.text = @"200Ml";
  NSAttributedString * text =   [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Rs300" ]
                                    attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
    cell.disculbl.attributedText = text;
    cell.pricelbl.text = @"Rs250";

   


    // [cell.contentView addSubview:discLbl];




    return cell;

}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(191, 168);
}
@end
