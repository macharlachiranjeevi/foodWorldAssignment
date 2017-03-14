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
    [_Col_disc registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"_Col_disc" ];
    [_Col_disc reloadData];


}
// mark - collection view methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 5;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = (UICollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"_Col_disc" forIndexPath:indexPath];

    UILabel * discLbl = [[ UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    discLbl.text = @"chiranjeevi";
    discLbl.font = [ UIFont boldSystemFontOfSize:15];

    [cell.contentView addSubview:discLbl];




    return cell;

}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(80, 35);
}
@end
