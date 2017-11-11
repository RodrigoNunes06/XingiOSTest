//
//  GitHubRemoteService.m
//  XingiOSTest
//
//  Created by Rodrigo Nunes on 11/11/17.
//  Copyright © 2017 Rodrigo Nunes Gil. All rights reserved.
//

#import "GitHubRemoteService.h"
#import "GitHubRepository.h"
#import "AFNetworking.h"


@implementation GitHubRemoteService

- (void)getRepositoriesForUser:(NSString * __nonnull)aUser parameters:(NSDictionary * __nullable)aParameters onSuccess:(void (^)(NSArray <GitHubRepository *> *repositoryArray))successBlock onError:(void(^)(NSError *error))errorBlock {
    
    NSString *url = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos",aUser];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:aParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock([self mapRequiredFieldsWithArray:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
    
}

#pragma mark - Private methods

- (NSMutableArray<GitHubRepository *>* __nullable)mapRequiredFieldsWithArray:(NSArray *)response {
    NSMutableArray<GitHubRepository *>* repositoryArray = [NSMutableArray new];
    
    for (NSDictionary *dictionary in response) {
        
        NSString *name = [dictionary objectForKey:@"name"];
        NSString *description = [dictionary objectForKey:@"description"];
        BOOL fork = [[dictionary objectForKey:@"fork"] boolValue];
        NSString *ownerLogin = [[dictionary objectForKey:@"owner"] objectForKey:@"login"];
        
        if ([name isKindOfClass:[NSNull class]]) {
            name = @"No name available.";
        }
        
        if ([description isKindOfClass:[NSNull class]]) {
            description = @"No available description.";
        }
        
        if ([ownerLogin isKindOfClass:[NSNull class]]) {
            ownerLogin = @"Owner login not available";
        }
        
        GitHubRepository *repositoryObject = [[GitHubRepository alloc] initWithOwnerLogin:ownerLogin name:name description:description fork:fork];
        
        [repositoryArray addObject:repositoryObject];
    }
    return repositoryArray;
}

@end
