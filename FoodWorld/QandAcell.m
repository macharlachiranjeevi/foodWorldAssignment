//
//  QandAcell.m
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import "QandAcell.h"
#import "ListofQandATableViewCell.h"
@implementation QandAcell

-(void)layoutSubviews{
    _qandatbl.delegate = self;
    _qandatbl.dataSource = self;
    _showBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _showBtn.layer.borderWidth = 1;

    [_qandatbl reloadData];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _questionListAr.count;    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    ListofQandATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListofQandATableViewCell"];

    NSDictionary * dict = [ _questionListAr objectAtIndex:indexPath.row];
    cell.lblQa.text = [NSString stringWithFormat:@"Q:%@",[dict objectForKey:@"question"]];

    cell.lblA .text = [NSString stringWithFormat:@"A:%@",[dict objectForKey:@"defaultAnswer"]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewAutomaticDimension;
}

@end
