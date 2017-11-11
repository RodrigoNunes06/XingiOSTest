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
#import "GitHubRemoteService.h"

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
    [self loadDataWithParameter:nil];
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

- (void)loadDataWithParameter:(NSDictionary *__nullable)aParameters {
    GitHubRemoteService *dataSource = [GitHubRemoteService new];
    
    [dataSource getRepositoriesForUser:@"xing" parameters:aParameters onSuccess:^(NSArray<GitHubRepository *> * _Nullable repositoryArray) {
        [self.repositoryArray addObjectsFromArray:repositoryArray];
        [self.collectionView reloadData];
    } onError:^(NSError * _Nullable error) {
        [self showAlertViewControllerWithErrorMessage:error];
    }];
}

- (void)showAlertViewControllerWithErrorMessage:(NSError *)errorMessage {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Opps!" message:[NSString stringWithFormat:@"%@",errorMessage] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:closeAction];
    [self showViewController:alert sender:self];
}

- (void)setCellBackgroundColor:(CollectionViewCell *)aCell withFork:(BOOL)aFork {
    if (aFork) {
        aCell.backgroundColor = [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:1.0];
    } else {
        aCell.backgroundColor = [UIColor whiteColor];
    }
}

#pragma mark - CollectionView Datasource

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CollectionViewCell getCellReuseIdentifier] forIndexPath:indexPath];
    
    GitHubRepository *repositoryObject = [self.repositoryArray objectAtIndex:indexPath.item];
    
    if (repositoryObject.repoDescription != nil) {
        cell.descriptionLabel.text = repositoryObject.repoDescription;
    }
    if (repositoryObject.repoName != nil) {
        cell.nameLabel.text = repositoryObject.repoName;
    }
    if (repositoryObject.ownerLogin != nil) {
        cell.ownerLoginLabel.text = repositoryObject.ownerLogin;
    }
    
    [self setCellBackgroundColor:cell withFork:repositoryObject.fork];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.repositoryArray count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width/1.5, self.view.frame.size.height/3);
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item + 1 == [self.repositoryArray count]) {
        [self loadDataWithParameter:@{@"page": @([self.repositoryArray count]/30 + 1)}];
    }
}


@end
