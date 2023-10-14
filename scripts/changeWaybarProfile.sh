#!/bin/bash

profiles_dir="$HOME/.config/waybar/profiles"
waybar_dir="$HOME/.config/waybar"

# プロファイルディレクトリ内のディレクトリリストを取得
profiles_list=($(find "$profiles_dir" -maxdepth 1 -type d -exec basename {} \;))

# プロファイルを選択
echo "利用可能なプロファイル:"
for i in "${!profiles_list[@]}"; do
	echo "$i: ${profiles_list[i]}"
done

read -p "プロファイル番号を選択してください: " profile_number

# 入力が整数でない場合、デフォルトの0に設定
if ! [[ "$profile_number" =~ ^[0-9]+$ ]]; then
	profile_number=0
fi

# 選択されたプロファイルディレクトリ
selected_profile="${profiles_list[$profile_number]}"

# config.jsoncとstyle.cssをコピー
if [ -d "$profiles_dir/$selected_profile" ]; then
	config_jsonc="$profiles_dir/$selected_profile/config.jsonc"
	style_css="$profiles_dir/$selected_profile/style.css"

	if [ -f "$config_jsonc" ] && [ -f "$style_css" ]; then
		# 既存のファイルをバックアップ
		if [ -f "$waybar_dir/config.jsonc" ]; then
			mv "$waybar_dir/config.jsonc" "$waybar_dir/config.jsonc.backup"
		fi
		if [ -f "$waybar_dir/style.css" ]; then
			mv "$waybar_dir/style.css" "$waybar_dir/style.css.backup"
		fi

		# シンボリックリンクを作成
		ln -s "$config_jsonc" "$waybar_dir/config.jsonc"
		ln -s "$style_css" "$waybar_dir/style.css"

		echo "プロファイルの設定が$waybar_dirにコピーされました."
	else
		echo "選択されたプロファイルディレクトリにconfig.jsoncおよびstyle.cssファイルが存在しません."
	fi
else
	echo "選択されたプロファイルディレクトリが存在しません."
fi
