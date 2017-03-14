//
//  productVariantTCell.m
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import "productVariantTCell.h"
#import "IconCollectionViewCell.h"
@implementation productVariantTCell

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
    _iconCollectionView.delegate = self;
    _iconCollectionView.dataSource = self;
    [_iconCollectionView  registerNib:[UINib nibWithNibName:@"IconCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"IconCollectionViewCell"];
    [_iconCollectionView reloadData];


}
// mark - collection view methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 5;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    IconCollectionViewCell *cell = (IconCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"IconCollectionViewCell" forIndexPath:indexPath];

    cell.circleLbl .layer.cornerRadius = cell.circleLbl.frame.size.height/2;
    cell.circleLbl.clipsToBounds = YES;
    cell.circleLbl.backgroundColor = [UIColor orangeColor];
    cell.titleLbl.text = @"work";




    return cell;

}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(69, 84);
}
@end
