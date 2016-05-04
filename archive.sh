#! /bin/bash


#git init
#git remote add origin $GIT_PATH
#git pull origin master
#或
#git clone $GIT_PATH


#工程文件夹路径
PROJECT_PATH=./
#项目名称
PROJECT_NAME=CustomCycleScrollView
#git地址
GIT_PATH=https://github.com/FannCyii/CIProject.git

#传入版本号
#if !$1;then
#    VERSION=10000
#else
#    VERSION=$1
#if
VERSION=$1
#进入工程根目录
cd $PROJECT_PATH

# 打包使用的证书 替换为你们的证书名字
CODE_SIGN_IDENTITY="${PROJECT_NAME}"

# 打包使用的描述文件 这描述文件的名字不是自己命名的那个名字，而是对应的8b11ac11-xxxx-xxxx-xxxx-b022665db452这个名字
PROVISIONING_PROFILE="9caa6332-ea24-40f1-880d-5ee7c4b3828d"

#.ipa输出路径
rm -fr IPA_TARGET
mkdir IPA_TARGET
IPA_PATH=`pwd`
IPA_PATH=$IPA_PATH"/IPA_TARGET"
echo ".ipa输出路径 ${IPA_PATH}"


# info.plist文件的位置
info_plist=${IPA_PATH}/${PROJECT_NAME}-Info.plist

# 下面是读取.plist文件的位置然后修改版本号和build号，这点没有使用xcodebuild提供的命令，在上面也有叙述
# 修改版本号
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $version_string" ${info_plist}

# 修改build号
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $build_number" ${info_plist}

# 开发者账号 生成yeemiao.app, 在PROJECT_NAME路径下面
#xcodebuild -workspace ${workspace_path}.xcworkspace -scheme ${scheme_name} -configuration Release clean -sdk iphoneos build CODE_SIGN_IDENTITY="${CODE_SIGN_IDENTITY}" PROVISIONING_PROFILE="${PROVISIONING_PROFILE}" SYMROOT="${build_path}"
xcodebuild -project ${PROJECT_NAME}.xcodeproj -target ${PROJECT_NAME} -configuration Release

#含cocoapod
#xcodebuild -workspace ${PROJECT_NAME}.xcworkspace -scheme ${PROJECT_NAME} -configuration Release

# 生成.ipa, 在ipa_path路径下面
xcrun -sdk iphoneos -v PackageApplication build/Release-iphoneos/${PROJECT_NAME}.app -o ${IPA_PATH}/${PROJECT_NAME}_ios_${VERSION}.ipa

echo "**********************"
echo "auto archive finished!"
echo "**********************"











