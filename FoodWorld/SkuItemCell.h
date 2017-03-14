//
//  SkuItemCell.h
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface SkuItemCell : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource>
- (IBAction)DidTapOnShareAction:(id)sender;
- (IBAction)didTapOnWishList:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imr_product;
@property (strong, nonatomic) IBOutlet UILabel *lbl_time;
@property (strong, nonatomic) IBOutlet UICollectionView *col_skuitems;
@property (strong, nonatomic) IBOutlet UILabel *lbl_productName;
@property (strong, nonatomic) IBOutlet UILabel *lbl_discount;
@property (strong, nonatomic) IBOutlet UILabel *lbl_mrp;
@property (strong, nonatomic) IBOutlet UILabel *lbl_offer;
@property(strong,nonatomic) NSArray * skuListImageAr;

@end
