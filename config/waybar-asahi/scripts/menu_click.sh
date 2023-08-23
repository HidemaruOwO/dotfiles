#!/bin/bash

# # hyprctlを使用してアクティブなウィンドウの情報を取得
# WINDOW_INFO=$(hyprctl activewindow)

# # ウィンドウクラスを抽出
# WINDOW_CLASS=$(echo "$WINDOW_INFO" | grep "class:" | awk '{print $2}')

# case $WINDOW_CLASS in
#     firefox)
#         echo "" # このアイコンはフォントに依存します。
#         ;;
#     Code)
#         echo "" # このアイコンはフォントに依存します。
#         ;;
#     org.wezfurlong.wezterm)
#         echo "" # このアイコンはフォントに依存します。
#         ;;
#     *)
#         echo ""
#         ;;
# esac

#!/bin/bash

# アクティブなウィンドウの情報を取得
WINDOW_INFO=$(hyprctl activewindow)

# ウィンドウクラスを抽出
WINDOW_CLASS=$(echo "$WINDOW_INFO" | grep "class:" | awk '{print $2}')

# クリックされたメニューに応じてアクションを実行
case $1 in
"Finder")
    if [[ $WINDOW_CLASS == "Code" ]]; then
        echo "新しいタブを開く"

        ACTION_TYPE=$2

        if [[ $ACTION_TYPE == "click" ]]; then
            code
        fi

    elif [[ $WINDOW_CLASS == "firefox" ]]; then
        echo "新しいタブを開く"
        ACTION_TYPE=$2

        if [[ $ACTION_TYPE == "click" ]]; then
            firefox --new-tab
        fi
        # Firefoxに対するアクションを追加
    elif [[ $WINDOW_CLASS == "org.wezfurlong.wezterm" ]]; then
        echo "Wezterm..."
        # Weztermに対するアクションを追加
    else
        echo "Finder"
        # デフォルトのアクションを追加
    fi
    ;;
"File")
    if [[ $WINDOW_CLASS == "Code" ]]; then
        echo "サイドバーの切り替え"
        # Visual Studio Codeに対するアクションを追加
    elif [[ $WINDOW_CLASS == "firefox" ]]; then
        echo "ページをリロード"
        # Firefoxに対するアクションを追加
    elif [[ $WINDOW_CLASS == "org.wezfurlong.wezterm" ]]; then
        echo "Wezterm..."
        # Weztermに対するアクションを追加
    else
        echo "File"
        # デフォルトのアクションを追加
    fi
    ;;
"Edit")
    if [[ $WINDOW_CLASS == "Code" ]]; then
        echo "検索と置換"
        # Visual Studio Codeに対するアクションを追加
    elif [[ $WINDOW_CLASS == "firefox" ]]; then
        echo "ページをブックマーク"
        # Firefoxに対するアクションを追加
    elif [[ $WINDOW_CLASS == "org.wezfurlong.wezterm" ]]; then
        echo "Wezterm..."
        # Weztermに対するアクションを追加
    else
        echo "Edit"
        # デフォルトのアクションを追加
    fi
    ;;
"View")
    if [[ $WINDOW_CLASS == "Code" ]]; then
        echo "定義へ移動."
        # Visual Studio Codeに対するアクションを追加
    elif [[ $WINDOW_CLASS == "firefox" ]]; then
        echo "ページ内検索"
        # Firefoxに対するアクションを追加
    elif [[ $WINDOW_CLASS == "org.wezfurlong.wezterm" ]]; then
        echo "Wezterm..."
        # Weztermに対するアクションを追加
    else
        echo "View"
        # デフォルトのアクションを追加
    fi
    ;;
"Go")
    if [[ $WINDOW_CLASS == "Code" ]]; then
        echo "選択部のコメント化"
        # Visual Studio Codeに対するアクションを追加
    elif [[ $WINDOW_CLASS == "firefox" ]]; then
        echo "履歴を開く"
        # Firefoxに対するアクションを追加
    elif [[ $WINDOW_CLASS == "org.wezfurlong.wezterm" ]]; then
        echo "Wezterm..."
        # Weztermに対するアクションを追加
    else
        echo "Go"
        # デフォルトのアクションを追加
    fi
    ;;
"Window")
    if [[ $WINDOW_CLASS == "Code" ]]; then
        echo "ドキュメントの整形"
        # Visual Studio Codeに対するアクションを追加
    elif [[ $WINDOW_CLASS == "firefox" ]]; then
        echo "開発者ツールの切り替え"
        # Firefoxに対するアクションを追加
    elif [[ $WINDOW_CLASS == "org.wezfurlong.wezterm" ]]; then
        echo "Wezterm..."
        # Weztermに対するアクションを追加
    else
        echo "Window"
        # デフォルトのアクションを追加
    fi
    ;;
"Help")
    if [[ $WINDOW_CLASS == "Code" ]]; then
        echo "ターミナルの切り替え"
        # Visual Studio Codeに対するアクションを追加
    elif [[ $WINDOW_CLASS == "firefox" ]]; then
        echo "ズームイン/アウト"
        # Firefoxに対するアクションを追加
    elif [[ $WINDOW_CLASS == "org.wezfurlong.wezterm" ]]; then
        echo "Wezterm..."
        # Weztermに対するアクションを追加
    else
        echo "Help"
        # デフォルトのアクションを追加
    fi
    ;;
# 他のメニューに対する条件も追加
*)
    # デフォルトのアクションを実行
    ;;
esac