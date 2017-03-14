//
//  ProcutComboCollCell.h
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProcutComboCollCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *firstImage;
@property (strong, nonatomic) IBOutlet UIImageView *secondImage;
@property (strong, nonatomic) IBOutlet UILabel *FistProductName;
@property (strong, nonatomic) IBOutlet UILabel *fquantity;
@property (strong, nonatomic) IBOutlet UILabel *secondProductName;
@property (strong, nonatomic) IBOutlet UILabel *secondquantity;
@property (strong, nonatomic) IBOutlet UILabel *discu_lbl;
@property (strong, nonatomic) IBOutlet UILabel *mrplbl;
@property (strong, nonatomic) IBOutlet UILabel *offerLbl;
@property (strong, nonatomic) IBOutlet UIButton *addcartBtn;
- (IBAction)didTapOnAddCartAcion:(id)sender;

@end
