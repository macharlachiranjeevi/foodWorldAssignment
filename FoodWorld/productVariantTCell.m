//
//  productVariantTCell.m
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import "productVariantTCell.h"
#import "IconCollectionViewCell.h"

@implementation productVariantTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _iconCollectionView.delegate = self;
    _iconCollectionView.dataSource = self;
    [_iconCollectionView  registerNib:[UINib nibWithNibName:@"IconCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"IconCollectionViewCell"];
    [_iconCollectionView reloadData];


}
// mark - collection view methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _iconAr.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    IconCollectionViewCell *cell = (IconCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"IconCollectionViewCell" forIndexPath:indexPath];

//    "name": "PEACH",
//    "code": "#FFDAB9",

    NSDictionary * dict = [_iconAr objectAtIndex:indexPath.row];
    if ([_veriation isEqualToString:@"F"]) {
    cell.circleLbl .layer.cornerRadius = cell.circleLbl.frame.size.height/2;
    cell.circleLbl.clipsToBounds = YES;
    cell.circleLbl.backgroundColor   = [self colorFromHexString:[dict objectForKey:@"code"]];
    cell.titleLbl.text = [dict objectForKey:@"name"];
    }
    if ([_veriation isEqualToString:@"V"]) {
        cell.circleLbl .layer.cornerRadius = cell.circleLbl.frame.size.height/2;
        cell.circleLbl.clipsToBounds = YES;
        cell.circleLbl.text = [dict objectForKey:@"volume"]  ;
        cell.circleLbl.layer.borderColor   = [UIColor grayColor].CGColor;
        cell.circleLbl.layer.borderWidth = 1;
        cell.circleLbl.font = [ UIFont systemFontOfSize:12];
        [cell.titleLbl setHidden:YES];
    }

    return cell;

}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(69, 84);
}

- (UIColor *)colorFromHexString:(NSString *)hexString
{
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

- (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length
{
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

@end
