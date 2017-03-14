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
   // [_comboColletionView registerClass:[ProcutComboCollCell class] forCellWithReuseIdentifier:@"ProcutComboCollCell" ];
    [_comboColletionView registerNib:[UINib nibWithNibName:@"ProcutComboCollCell" bundle:nil] forCellWithReuseIdentifier:@"ProcutComboCollCell"];

    [_comboColletionView reloadData];
}

// mark - collection view methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _productComboListarry.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ProcutComboCollCell *cell = (ProcutComboCollCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"ProcutComboCollCell" forIndexPath:indexPath];

    cell.layer.borderColor= [UIColor lightGrayColor].CGColor;
    cell.layer.borderWidth = 1;

    NSDictionary * dict = [_productComboListarry objectAtIndex:indexPath.row ];


    cell.firstImage.layer.borderColor= [UIColor lightGrayColor].CGColor;
    cell.firstImage.layer.borderWidth = 1;
    cell.secondImage.layer.borderColor= [UIColor lightGrayColor].CGColor;
    cell.secondImage.layer.borderWidth = 1;

    [ cell.firstImage sd_setImageWithURL:[NSURL URLWithString: [[dict objectForKey:@"sku1"] objectForKey:@"skuImageUrl"]] placeholderImage:[UIImage imageNamed:@""]];
    [cell.secondImage sd_setImageWithURL:[NSURL URLWithString: [[dict objectForKey:@"sku2"] objectForKey:@"skuImageUrl"]] placeholderImage:[UIImage imageNamed:@""]];
     cell.FistProductName.text = [[dict objectForKey:@"sku1"] objectForKey:@"skuName"];
     cell.secondProductName.text=[[dict objectForKey:@"sku2"] objectForKey:@"skuName"];
    //cell.fquantity.text =[[dict objectForKey:@"sku1"] objectForKey:@"skuImageUrl"] ;//
     //cell.secondquantity.text=[[dict objectForKey:@"sku1"] objectForKey:@"skuImageUrl"];
     cell.discu_lbl.text= [NSString stringWithFormat:@"Rs%@",[dict objectForKey:@"finalPrice"] ];
    NSAttributedString * title =
    [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Rs%@",[dict objectForKey:@"totalPrice"] ]
                                    attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];

    cell.mrplbl.attributedText= title;

     cell.offerLbl.text = [NSString stringWithFormat:@"%@%% Off", [[dict objectForKey:@"sku1"] objectForKey:@"skuOfferPrice"]];
     //UIButton *addcartBtn;
   

   // [cell.contentView addSubview:discLbl];




    return cell;

}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(362, 244);
}
@end
