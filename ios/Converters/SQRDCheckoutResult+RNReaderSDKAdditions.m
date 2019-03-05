/*
Copyright 2018 Square Inc.
 
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
 
    http://www.apache.org/licenses/LICENSE-2.0
 
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

#import "SQRDCheckoutResult+RNReaderSDKAdditions.h"
#import "SQRDTender+RNReaderSDKAdditions.h"
#import "SQRDMoney+RNReaderSDKAdditions.h"
#import "RNReaderSDKDateFormatter.h"


@implementation SQRDCheckoutResult (RNReaderSDKAdditions)

- (NSDictionary *)jsonDictionary
{
    NSMutableArray *jsTenders = [[NSMutableArray alloc] init];
    for (SQRDTender *tender in self.tenders) {
        [jsTenders addObject:[tender jsonDictionary]];
    }

    return @{
        @"transactionId" : self.transactionID,
        @"transactionClientId" : self.transactionClientID,
        @"locationId" : self.locationID,
        @"createdAt" : [RNReaderSDKDateFormatter iso8601StringFromDate:self.createdAt],
        @"totalMoney" : [self.totalMoney jsonDictionary],
        @"totalTipMoney" : [self.totalTipMoney jsonDictionary],
        @"tenders" : jsTenders,
    };
}

@end
