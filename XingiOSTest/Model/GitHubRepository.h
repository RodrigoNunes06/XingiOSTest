//
//  GitHubRepository.h
//  XingiOSTest
//
//  Created by Rodrigo Nunes on 11/11/17.
//  Copyright © 2017 Rodrigo Nunes Gil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GitHubRepository : NSObject

@property (strong, nonatomic, nonnull) NSString *ownerLogin;
@property (strong, nonatomic, nonnull) NSString *repoName;
@property (strong, nonatomic, nonnull) NSString *repoDescription;
@property (nonatomic) BOOL fork;

- (instancetype __nullable)initWithOwnerLogin:(NSString *__nonnull)aOwnerLogin name:(NSString *__nonnull)aName description:(NSString *__nonnull)aDescription fork:(BOOL)aFork;

@end
