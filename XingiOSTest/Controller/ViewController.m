//
//  ViewController.m
//  XingiOSTest
//
//  Created by Rodrigo Nunes on 11/11/17.
//  Copyright © 2017 Rodrigo Nunes Gil. All rights reserved.
//

#import "ViewController.h"
#import "GitHubRepository.h"
#import "CollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic, nonnull) UICollectionView *collectionView;
@property (strong, nonatomic, nullable) NSMutableArray<GitHubRepository *> *repositoryArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.repositoryArray = [NSMutableArray new];
    [self setUpCollectionView];
}

- (void)setUpCollectionView {
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    self.collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    
    [layout setMinimumLineSpacing:10];
    [layout setMinimumInteritemSpacing:10];
    [layout setSectionInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];

    [self.collectionView setBackgroundColor:[UIColor lightGrayColor]];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:[CollectionViewCell getCellReuseIdentifier]];
    
    [self.view addSubview:self.collectionView];
}

#pragma mark - CollectionView Datasource

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CollectionViewCell getCellReuseIdentifier] forIndexPath:indexPath];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.repositoryArray count];
}




@end
