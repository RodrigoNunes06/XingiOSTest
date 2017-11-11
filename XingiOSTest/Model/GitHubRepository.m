//
//  GitHubRepository.m
//  XingiOSTest
//
//  Created by Rodrigo Nunes on 11/11/17.
//  Copyright © 2017 Rodrigo Nunes Gil. All rights reserved.
//

#import "GitHubRepository.h"

@implementation GitHubRepository

- (instancetype __nullable)initWithOwnerLogin:(NSString *__nonnull)aOwnerLogin name:(NSString *__nonnull)aName description:(NSString *__nonnull)aDescription fork:(BOOL)aFork {
    self = [super init];
    
    if (self) {
        _ownerLogin = aOwnerLogin;
        _repoName = aName;
        _repoDescription = aDescription;
        _fork = aFork;
    }
    
    return self;
}

@end
