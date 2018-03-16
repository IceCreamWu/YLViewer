//
//  YLIndexController.m
//  YLViewer
//
//  Created by wuyonglin on 2018/3/15.
//  Copyright © 2018年 IceCreamWu. All rights reserved.
//

#import "YLIndexController.h"
#import "YLIndexModel.h"
#import "YLIndexCell.h"
#import "YLVideoController.h"

static NSString *const YLIndexCellID = @"YLIndexCell";

@interface YLIndexController ()<UITableViewDataSource, UITableViewDelegate>

/* 数据 */
@property (nonatomic, strong) NSArray<YLIndexModel *> *indexModels;

/* 列表视图 */
@property (nonatomic, strong) UITableView *indexTableView;

@end

@implementation YLIndexController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    
    /* 创建UI */
    [self.view addSubview:self.indexTableView];
    
    /* 加载数据 */
    [self reloadIndexData];
}

#pragma mark - 数据加载
- (void)reloadIndexData {
    @weakify(self)
    [YLIndexModel fetchLocalDataWithCompletion:^(NSArray<YLIndexModel *> *models) {
        @strongify(self)
        self.indexModels = models;
        [self.indexTableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.indexModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YLIndexCell *cell = [tableView dequeueReusableCellWithIdentifier:YLIndexCellID];
    cell.model = self.indexModels[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return YLIndexCellHeight;
}

#pragma mark - Getter
- (UITableView *)indexTableView {
    if (!_indexTableView) {
        _indexTableView = ({
            CGRect frame = CGRectMake(0, 0, self.view.width, self.view.height);
            UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
            tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            tableView.dataSource = self;
            tableView.delegate = self;
            tableView.separatorColor = UIColorHex(EDEDED);
            tableView.separatorInset = UIEdgeInsetsZero;
            [tableView registerClass:[YLIndexCell class] forCellReuseIdentifier:YLIndexCellID];
            tableView;
        });
    }
    return _indexTableView;
}

@end
