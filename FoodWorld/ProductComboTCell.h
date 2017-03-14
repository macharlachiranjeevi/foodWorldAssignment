//
//  ProductComboTCell.h
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductComboTCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *headerName;
@property (strong, nonatomic) IBOutlet UICollectionView *comboColletionView;

@end
