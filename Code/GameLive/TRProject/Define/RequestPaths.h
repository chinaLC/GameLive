//
//  RequestPaths.h
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#ifndef RequestPaths_h
#define RequestPaths_h

#define kBasePath @"http://www.quanmin.tv"
//首页推荐
#define kRecommendPath @"/json/page/app-index/info.json"
//直播列表 有所有直播
#define kGameListPath @"/json/play/list%@.json"
//某游戏直播
#define kTheGamePath @"/json/categories/%@/list%@.json"
//游戏列表
#define kAllListPath @"/json/categories/list.json"
//视频播放地址
#define kGamePlay @"http://hls.quanmin.tv/live/%@/playlist.m3u8"
//搜索
#define kSeatchPath @"/api/v1"

#endif /* RequestPaths_h */






