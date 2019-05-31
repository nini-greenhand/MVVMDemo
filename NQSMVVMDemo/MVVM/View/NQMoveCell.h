//
//  NQMoveCell.h
//  NQSMVVMDemo
//
//  Created by CQKJ on 2019/5/30.
//  Copyright © 2019 CQKJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^selectCell)(NSIndexPath *indexPath);


@interface NQMoveCell : UITableViewCell
+ (NSString *)cellReuseIdentifier;

- (void)renderWithModel:(id)model;

@property (weak, nonatomic) IBOutlet UIImageView *coverImage;

@property (weak, nonatomic) IBOutlet UILabel *titleL;

@end

NS_ASSUME_NONNULL_END
