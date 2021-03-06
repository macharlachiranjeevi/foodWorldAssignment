//
//  ViewController.m
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import "ViewController.h"
#import "BusinessHandler.h"
#import "SkuItemCell.h"
#import "RatingTbleCell.h"
#import "productVariantTCell.h"
#import "PincodeTCell.h"
#import "DiscrptionTCell.h"
#import "QandAcell.h"
#import "ProductComboTCell.h"
#import "SameitemsTCell.h"
#import "MBProgressHUD.h"
#import <SDWebImage/UIImageView+WebCache.h>
 static NSString *firstCell = @"SkuItemCell";
 static NSString *secondCell = @"RatingTbleCell";
 static NSString *thirdCell = @"productVariantTCell";
 static NSString *fourthCell = @"PincodeTCell";
 static NSString *fifthcell = @"DiscrptionTCell";
 static NSString *sixthCell = @"QandAcell";
 static NSString *SevenCell = @"ProductComboTCell";
 static NSString *eightcell = @"SameitemsTCell";
@interface ViewController ()
{
    NSDictionary * sku_itemDict ;
    NSDictionary * productVariantList;
    NSArray * volumeArray;
    NSArray * productFacetList;
    NSArray * questionList;
    NSArray * productComboList;
    NSArray * similarItemList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_Tbl_productDetail registerNib:[UINib nibWithNibName:firstCell bundle:nil] forCellReuseIdentifier:firstCell];
    [_Tbl_productDetail registerNib:[UINib nibWithNibName:secondCell bundle:nil] forCellReuseIdentifier:secondCell];
      [_Tbl_productDetail registerNib:[UINib nibWithNibName:thirdCell bundle:nil] forCellReuseIdentifier:thirdCell];
      [_Tbl_productDetail registerNib:[UINib nibWithNibName:fourthCell bundle:nil] forCellReuseIdentifier:fourthCell];
    [_Tbl_productDetail registerNib:[UINib nibWithNibName:fifthcell bundle:nil] forCellReuseIdentifier:fifthcell];
    [_Tbl_productDetail registerNib:[UINib nibWithNibName:SevenCell bundle:nil] forCellReuseIdentifier:SevenCell];
    [_Tbl_productDetail setAllowsSelection:NO];

    [self getProductDetailsFromService];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)getProductDetailsFromService{
    NSDictionary *postObj = @{@"appType":@"iOS",@"appVersion":@"2.3.4",@"skuId":@"536163",@"pinCode":@"560097",@"loggedInUserId":@"hngtest.rupanjan@gmail.com",@"deviceId":@""};
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
[[BusinessHandler sharedInstance]ProductDetailfromServer:postObj completionHandler:^(NSDictionary *productDetailResponce) {
    NSLog(@"responce from Ser%@",productDetailResponce);

    sku_itemDict  = [productDetailResponce objectForKey:@"skuItem"];
    productVariantList = [productDetailResponce objectForKey:@"productVariantList"];
    volumeArray = [[[productDetailResponce objectForKey:@"productVariantList"]objectForKey:@"flavours"] valueForKeyPath:@"@unionOfArrays.volumes"];

    productFacetList = [productDetailResponce objectForKey:@"productFacetList"];
         questionList= [productDetailResponce objectForKey:@"questionList"] ;

    productComboList = [productDetailResponce objectForKey:@"productComboList"];
    similarItemList = [productDetailResponce objectForKey:@"similarItemList"];
    [_Tbl_productDetail reloadData];
[MBProgressHUD hideHUDForView:self.view animated:YES];

} andErrorcompletionHandler:^(NSString *errormessage) {
    NSLog(@"errormessage %@",errormessage);
[MBProgressHUD hideHUDForView:self.view animated:YES];
}];
}

// mark -tableview Methods


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{


    switch (indexPath.section) {
        case 0:
        {
            SkuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:firstCell];

            if (cell == nil)
            {
               cell = [[NSBundle mainBundle] loadNibNamed:firstCell owner:self options:nil].lastObject;
            }
            [cell.imr_product sd_setImageWithURL:[NSURL URLWithString:[[sku_itemDict objectForKey:@"skuImageUrls"]firstObject]] placeholderImage:[UIImage imageNamed:@""]];
            cell.lbl_productName.text = [sku_itemDict objectForKey:@"skuName"];
           // cell.lbl_time.text = [sku_itemDict objectForKey:@"skuBrandName"];
            cell.lbl_discount.text = [NSString stringWithFormat:@"Rs%@",[sku_itemDict objectForKey:@"skuPrice"]];
            NSAttributedString * title =
            [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Rs%@",[sku_itemDict objectForKey:@"skuTotalPrice"] ]
                                            attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
            cell.lbl_mrp.attributedText = title;
            cell.lbl_offer.text = [NSString stringWithFormat:@"%@%%Off", [sku_itemDict objectForKey:@"skuOfferPrice"]];
            cell.skuListImageAr =  [sku_itemDict objectForKey:@"skuImageUrls"];
            [cell.col_skuitems reloadData];
            return cell;
        }
            break;
        case 1:
        {
            RatingTbleCell *cell = [tableView dequeueReusableCellWithIdentifier:secondCell];

            if (cell == nil)
            {
                cell = [[NSBundle mainBundle] loadNibNamed:secondCell owner:self options:nil].lastObject;
            }


            cell.ratingLbl.text = [NSString stringWithFormat:@"%@ User Reviews",[sku_itemDict objectForKey:@"skuAverageRating"]];
            return cell;
        }
            break;
        case 2:
        {
          productVariantTCell*cell = [tableView dequeueReusableCellWithIdentifier:thirdCell];
            

            if (cell == nil)
            {
                cell = [[NSBundle mainBundle] loadNibNamed:thirdCell owner:self options:nil].lastObject;
            }
            cell.iconAr = [productVariantList objectForKey:@"shades"];
            [cell.iconCollectionView reloadData];

            //cell.textLabel.text = @"My Text";
            return cell;
        }
            break;
        case 3:
        {
            productVariantTCell*cell = [tableView dequeueReusableCellWithIdentifier:thirdCell];

            if (cell == nil)
            {
                cell = [[NSBundle mainBundle] loadNibNamed:thirdCell owner:self options:nil].lastObject;
            }
            cell.headerLbl.text = @"Flavours";
             cell.veriation = @"F";
            cell.iconAr = [productVariantList objectForKey:@"flavours"];
            [cell.iconCollectionView reloadData];

            //cell.textLabel.text = @"My Text";
            return cell;
        }
            break;
        case 4:
        {
            productVariantTCell*cell = [tableView dequeueReusableCellWithIdentifier:thirdCell];

            if (cell == nil)
            {
                cell = [[NSBundle mainBundle] loadNibNamed:thirdCell owner:self options:nil].lastObject;
            }

           // volumeArray
            cell.headerLbl.text = @"Volume";
            cell.veriation = @"V";
            cell.iconAr = volumeArray;
            [cell.iconCollectionView reloadData];

            //cell.textLabel.text = @"My Text";
            return cell;
        }
            break;
        case 5:
        {
            PincodeTCell*cell = [tableView dequeueReusableCellWithIdentifier:fourthCell];

            if (cell == nil)
            {
                cell = [[NSBundle mainBundle] loadNibNamed:fourthCell owner:self options:nil].lastObject;
            }
          
            return cell;
        }
            break;
        case 6:
        {
            DiscrptionTCell *cell = [tableView dequeueReusableCellWithIdentifier:fifthcell];

            if (cell == nil)
            {
                cell = [[NSBundle mainBundle] loadNibNamed:fifthcell owner:self options:nil].lastObject;
            }

            cell.discArray = productFacetList;

            cell.Lbl_disc.text = [[productFacetList objectAtIndex:indexPath.row] objectForKey:@"content"];
            cell.Lbl_disc.font = [ UIFont systemFontOfSize:13];
             [cell.Col_disc reloadData];

            //cell.textLabel.text = @"My Text";
            return cell;
        }
            break;
case 7:
        {
            QandAcell *cell = [tableView dequeueReusableCellWithIdentifier:sixthCell];

            cell.questionListAr = questionList;

            [cell.qandatbl reloadData ];

            //cell.textLabel.text = @"My Text";
            return cell;
        }
            break;
        case 8:
        {
            ProductComboTCell *cell = [tableView dequeueReusableCellWithIdentifier:SevenCell];
            cell.productComboListarry = productComboList;
            [cell.comboColletionView reloadData ];
            return cell;
        }
            break;

        case 9:
        {
            SameitemsTCell*cell = [tableView dequeueReusableCellWithIdentifier:eightcell];
            //cell.similarItemListArry= similarItemList;
            [cell.sameItemCollView reloadData ];
            return cell;
        }
            break;


        default:
            return nil;
            break;
    }


}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    switch (indexPath.section) {
        case 0:
             return 331;
            break;
        case 1:
            return 44;
            break;
        case 2:
            return 120;
            break;
        case 3:
            return 120;
            break;
        case 4:
            return 120;
            break;
        case 5:
            return 70;
            break;
        case 6:
            return 95;
            break;
        case 7:
            return 337;
            break;
        case 8:
            return 289;
            break;
        case 9:
            return 216;
            break;
        default:
            return 0;
            break;
    }


}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
