//
//  DiscrptionTCell.h
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscrptionTCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *Col_disc;
@property (strong, nonatomic) IBOutlet UILabel *Lbl_disc;

@end
