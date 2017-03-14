//
//  SameitemCCell.h
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SameitemCCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *sameImge;
@property (strong, nonatomic) IBOutlet UILabel *nameLbl;
@property (strong, nonatomic) IBOutlet UILabel *quantityLbl;
@property (strong, nonatomic) IBOutlet UILabel *pricelbl;
@property (strong, nonatomic) IBOutlet UILabel *disculbl;

@end
