//
//  ServiceManger.m
//  


#import "ServiceManger.h"
#import <UIKit/UIKit.h>
static ServiceManger *serviceManager = nil;

@implementation ServiceManger

+(instancetype)sharedInstance{
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        serviceManager = [[ServiceManger alloc]init];
    });
    return serviceManager;
}

-(void)callWebService:(NSString *)urlString paramaters:(NSDictionary *)paramaters completionHandler:(void (^)(id jsonResponce))completion andErrorcompletionHandler:(void (^)(NSString *errormessage))errorMessage
{

#ifdef DEBUG
    NSLog(@"parameters = %@",paramaters);
#endif
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL * url = [[NSURL alloc] initWithString:encodedString];

    #ifdef DEBUG
    NSLog(@"url:%@",url);
    #endif
    NSMutableURLRequest * checkingData;
    
    if (paramaters) {
        NSError *error;
        NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramaters options:kNilOptions error:&error];
        checkingData =[self request:url withData:jsonData withMethodType:@"POST"];
    } else {
        checkingData =[self request:url withData:nil withMethodType:@"GET"];

    }
    
    [[session dataTaskWithRequest:checkingData completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                errorMessage(error.localizedDescription);
                if (error.code == -1009 ) {

                }
                else{

                    
                }
            });
        }
        else{
            if (data != nil) {



               
                id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];


#ifdef DEBUG
                NSLog(@"JSON RESULT : %@" , result);

#endif
               
       
                if (error) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        errorMessage (error.localizedDescription);
                    });
                }
                else{
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        completion(result);
                        
                    });
                }
            }
            else{
                NSError * err = [[NSError alloc]initWithDomain:@"Try again later" code:1000 userInfo:nil];
               // [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
                dispatch_async(dispatch_get_main_queue(), ^{
                    errorMessage (err.localizedDescription);
                });
               
            }
        }
    }] resume];
}
-(NSMutableURLRequest *)request:(NSURL *)url withData:(NSData *)JsonData withMethodType:(NSString *)Type{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:60.0];
     [request setHTTPMethod:Type];
     [request setValue: @"application/json" forHTTPHeaderField:@"Content-Type"];
    if ([Type isEqualToString:@"POST"]) {
        [request setHTTPBody:JsonData];
    }
    return request;
}



@end
