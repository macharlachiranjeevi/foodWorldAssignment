//
//  productVariantTCell.h
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface productVariantTCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *headerLbl;
@property (strong, nonatomic) IBOutlet UICollectionView *iconCollectionView;
@property(strong,nonatomic) NSArray * iconAr;
@property(strong,nonatomic) NSString * veriation;
@end
