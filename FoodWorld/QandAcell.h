//
//  QandAcell.h
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QandAcell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *qandatbl;
@property (strong, nonatomic) IBOutlet UIButton *showBtn;

@end
