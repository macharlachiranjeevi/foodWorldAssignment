//
//  SameitemsTCell.m
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import "SameitemsTCell.h"
#import "SameitemCCell.h"
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
    [_sameItemCollView registerClass:[SameitemCCell class] forCellWithReuseIdentifier:@"SameitemCCell" ];
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



    // [cell.contentView addSubview:discLbl];




    return cell;

}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(80, 35);
}
@end
