//
//  SameitemsTCell.h
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SameitemsTCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic , weak)IBOutlet UICollectionView *sameItemCollView;
@end
