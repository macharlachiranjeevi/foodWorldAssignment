//
//  BusinessHandler.m
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import "BusinessHandler.h"
#import "ServiceManger.h"
static BusinessHandler *businessHandler = nil;
static NSString * constentUrl = @"http://119.81.82.197:9090/hngeCommerceWebservice/rest/product/v2/pdp/detail";
static NSString * TRYAGINLATTER = @"TRYAGINLATTER";
@implementation BusinessHandler

+(instancetype)sharedInstance{

    static dispatch_once_t once;
    dispatch_once(&once, ^{
        businessHandler = [[BusinessHandler alloc]init];
    });
    return businessHandler;
}

-(void)ProductDetailfromServer:(NSDictionary *)inputValues completionHandler:(void (^)(NSDictionary * productDetailResponce))completion andErrorcompletionHandler:(void (^)(NSString *errormessage))errorMessage{

    [[ServiceManger sharedInstance]callWebService:constentUrl paramaters:inputValues completionHandler:^(id jsonResponce) {

        NSDictionary * keyResponce ;
        if (![keyResponce  isKindOfClass:[NSNull class]]) {
            keyResponce = (NSDictionary*)jsonResponce ;
            if ([[keyResponce objectForKey:@"status"] isEqualToString:@"Success"]) {
                NSDictionary * dataDict = [keyResponce objectForKey:@"data"];
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(dataDict);
                });
            }
            else{
                // no responce
            }


        }
        else{
            NSError * err = [[NSError alloc]initWithDomain:TRYAGINLATTER code:1000 userInfo:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                errorMessage (err.localizedDescription);
            });
        }
    } andErrorcompletionHandler:^(NSString *errormessage) {
        dispatch_async(dispatch_get_main_queue(), ^{

            errorMessage (errormessage);
        });
        
    }];

}
@end
