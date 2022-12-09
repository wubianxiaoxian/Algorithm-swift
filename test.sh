# 扫描文件夹中的 playground 文件
playground_files=$(find . -name "*.playground")

# 创建 readme.md 文件
touch readme.md

# 在 readme.md 文件中输出 markdown excel 格式的文件列表
echo "| Name | Link |" >> readme.md
echo "|------|------|" >> readme.md

for file in $playground_files
do
    # 使用超链接形式输出文件名
    echo "| $file | [Link]($file) |" >> readme.md
done

