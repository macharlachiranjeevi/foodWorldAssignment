//
//  ProductComboTCell.m
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import "ProductComboTCell.h"
#import "ProcutComboCollCell.h"
@implementation ProductComboTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)layoutSubviews{
    _comboColletionView.delegate = self;
    _comboColletionView.dataSource = self;
    [_comboColletionView registerClass:[ProcutComboCollCell class] forCellWithReuseIdentifier:@"ProcutComboCollCell" ];
    [_comboColletionView reloadData];
}

// mark - collection view methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 5;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ProcutComboCollCell *cell = (ProcutComboCollCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"ProcutComboCollCell" forIndexPath:indexPath];

   

   // [cell.contentView addSubview:discLbl];




    return cell;

}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(80, 35);
}
@end
