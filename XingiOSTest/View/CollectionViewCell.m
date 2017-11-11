//
//  CollectionViewCell.m
//  XingiOSTest
//
//  Created by Rodrigo Nunes on 11/11/17.
//  Copyright © 2017 Rodrigo Nunes Gil. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setText];
        [self setStyle];
    }
    
    return self;
}

- (void)setText {
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.frame.size.width, 20)];
    self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.frame.size.width, 100)];
    self.ownerLoginLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 60, self.frame.size.width, 20)];
    
    [self.nameLabel setTextAlignment:NSTextAlignmentCenter];
    [self.nameLabel setNumberOfLines:0];
    [self.descriptionLabel setTextAlignment:NSTextAlignmentCenter];
    [self.descriptionLabel setNumberOfLines:0];
    [self.ownerLoginLabel setTextAlignment:NSTextAlignmentCenter];
    
    [self addSubview:self.nameLabel];
    [self addSubview:self.descriptionLabel];
    [self addSubview:self.ownerLoginLabel];
}

- (void)setStyle {
    // border radius
    [self.layer setCornerRadius:30.0f];
    
    // border
    [self.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.layer setBorderWidth:1.5f];
    
    // drop shadow
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowOpacity:0.8];
    [self.layer setShadowRadius:3.0];
    [self.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
}

+ (NSString * __nonnull)getCellReuseIdentifier {
    return @"repositoryCell";
}
@end
