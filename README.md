
[![pipeline status](https://gitlab.baifu-tech.net/ios/BFUMeng/badges/master/pipeline.svg)](https://gitlab.baifu-tech.net/ios/BFUMeng/commits/master)

# 友盟SDK整合

友盟統計及推播SDK整合包

## Install

- 若還有沒有安裝過Cocoapods, 請先安裝[Cocoapods](https://cocoapods.org/)

### Profile

- 若專案沒有podfile 請先於iOS專案目錄下執行以下指令

```
pod init
```

- 打開你的podfile, 在最上方加入以下source(如下圖黃色框框)

```
source 'git@gitlab.baifu-tech.net:ios/PrivatePodRepo.git'
source 'https://cdn.cocoapods.org/'
```

- 加入以下pod(如下圖)

```
pod 'BFUMeng', '~> 2.0.1'
```

![](Images/Podfile.png)

- 於iOS專案目錄下執行以下指令

```
pod install --repo-update
```

### 程式碼

- 打開專案找到AppDelegate.m的檔案
- 加入`#import <BFUMeng/BFUMeng.h>`
- 加入`[BFUService initWithAppKey:@"5f17a9ddc3bf3749c2b4c561" launchOptions:launchOptions];`(需使用友盟提供的AppKey)

```objc
#import <BFUMeng/BFUMeng.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [BFUService initWithAppKey:@"5f17a9ddc3bf3749c2b4c561" launchOptions:launchOptions];
    
    return YES;
}

@end
```

- iOS 10以下要支援推播還需要加上以下程式碼在AppDelegate

```
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler {
    [BFUService receiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}
```

## React Native Bridge

[React Native Bridge 安裝手冊](Documents/ReactNativeInstall.md)

[React Native Bridge API文件](Documents/ReactNativeAPI.md)

