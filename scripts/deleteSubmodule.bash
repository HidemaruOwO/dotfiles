#!/bin/bash

submodule_path="$1"

echo "🌟 サブモジュールの削除処理を開始します 🌟"
echo

echo "Step 1/3: サブモジュールの初期化..."
git submodule deinit -f "$submodule_path"
echo "サブモジュールの初期化が完了しました ✅"
echo

echo "Step 2/3: サブモジュールの削除..."
git rm -f "$submodule_path"
echo "サブモジュールの削除が完了しました ✅"
echo

echo "Step 3/3: .git/modules 内のサブモジュールディレクトリを削除..."
rm -rf ".git/modules/$submodule_path"
echo ".git/modules 内のサブモジュールディレクトリの削除が完了しました ✅"
echo

echo "🎉 処理が完了しました！ 🎉"

