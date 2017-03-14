//
//  BusinessHandler.h
//  FoodWorld
//
//  Created by chiranjeevi macharla on 14/03/17.
//  Copyright © 2017 Chiranjeevi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusinessHandler : NSObject
+(instancetype)sharedInstance;

-(void)ProductDetailfromServer:(NSDictionary *)inputValues completionHandler:(void (^)(NSDictionary * productDetailResponce))completion andErrorcompletionHandler:(void (^)(NSString *errormessage))errorMessage;

@end
