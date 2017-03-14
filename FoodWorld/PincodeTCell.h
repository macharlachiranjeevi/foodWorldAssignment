//
//  PincodeTCell.h
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PincodeTCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *headerTextLbl;
@property (strong, nonatomic) IBOutlet UITextField *pincodeText;
@property (strong, nonatomic) IBOutlet UIButton *didTapOnCheckAction;

@end
