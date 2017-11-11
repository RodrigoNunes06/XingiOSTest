//
//  GitHubRemoteService.h
//  XingiOSTest
//
//  Created by Rodrigo Nunes on 11/11/17.
//  Copyright © 2017 Rodrigo Nunes Gil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GitHubRepository.h"

@interface GitHubRemoteService : NSObject

- (void)getRepositoriesForUser:(NSString * __nonnull)aUser parameters:(NSDictionary * __nullable)aParameters onSuccess:(void (^_Nullable)(NSArray <GitHubRepository *> * _Nullable repositoryArray))successBlock onError:(void(^_Nullable)(NSError * _Nullable error))errorBlock;


@end
