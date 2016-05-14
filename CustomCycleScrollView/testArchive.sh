#! /bin/bash
echo "准备开始打ipa包...................."
#工程环境路径workspace_path=.#项目名称project_name=CustomCycleScrollView
#build的路径build_path=$workspace_path
echo "第一步，进入项目工程文件: $build_path"
cd $build_path
echo "第二步，执行build clean命令"
xcodebuild clean
echo "第三步，执行编译生成.app命令"
xcodebuild
echo "在项目工程文件内生成一个build子目录，里面有${project_name}.App程序"
echo "第四步, 导出ipa包"
#.app生成后的路径app_name_path=$build_path/build/Release-iphoneos/${project_name}.app#.ipa生成后的路径ipa_name_path=$build_path/build/Release-iphoneos/${project_name}.ipa
#生成ipa包xcrun -sdk iphoneos PackageApplication -v $app_name_path -o $ipa_name_path
echo "制作ipa包完成......................."