//
//  SkuItemCell.m
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import "SkuItemCell.h"

@implementation SkuItemCell

-(void)layoutSubviews{
    [super layoutSubviews];
    _col_skuitems.delegate = self;
    _col_skuitems.dataSource = self;
    [_col_skuitems registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"col_skuitems" ];
    [_col_skuitems reloadData];
    

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)DidTapOnShareAction:(id)sender {
}

- (IBAction)didTapOnWishList:(id)sender {
}
// mark - collection view methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return [_skuListImageAr count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = (UICollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"col_skuitems" forIndexPath:indexPath];
    UIImageView *img = [[ UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
   [ img sd_setImageWithURL:[NSURL URLWithString: [_skuListImageAr objectAtIndex:indexPath.row]]
           placeholderImage:[UIImage imageNamed:@""]];
    img.layer.borderColor = [ UIColor lightGrayColor].CGColor;
    img.layer.borderWidth = 1;
    [cell.contentView addSubview:img];
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(50, 50);
}

@end
