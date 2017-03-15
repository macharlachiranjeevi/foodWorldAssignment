//
//  DiscrptionTCell.m
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import "DiscrptionTCell.h"

@implementation DiscrptionTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _Col_disc.delegate = self;
    _Col_disc.dataSource = self;
    [_Col_disc registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Col_disc" ];
    [_Col_disc reloadData];


}
// mark - collection view methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _discArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = (UICollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Col_disc" forIndexPath:indexPath];
[[[cell contentView] subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
   UILabel *  discLbl = [[ UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    NSDictionary * dict =[_discArray objectAtIndex:indexPath.row];
    discLbl.text = [dict  objectForKey:@"title"];
    discLbl.font = [ UIFont boldSystemFontOfSize:15];
    [cell.contentView addSubview:discLbl];
    return cell;

}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(100, 35);
}
@end
