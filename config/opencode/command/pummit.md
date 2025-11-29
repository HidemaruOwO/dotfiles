---
description: pummit CLI ツールを使って、絵文字ベースのコミットメッセージで変更をコミットします
agent: build
---

# pummit でコミットする

pummit CLIはgitコマンドのラッパーで、絵文字を使ったコミットメッセージを簡単に生成できます。

このコマンドは変更されたファイルを論理的なグループに分類し、それぞれに適切な絵文字ベースのメッセージを付けて pummit CLI を使用してGitにコミットします。

## 処理フロー

1. 変更されたファイルの取得
   - `git status --short` を実行して現在の変更を取得する
   - 変更がなければ「変更はありませんでした。」と通知して終了する

2. 差分の解析
   - 各ファイルの変更内容（追加、削除、修正）を確認する
   - ファイルパスと拡張子を取得する

3. ファイルの分類
   - ファイルパス、拡張子、変更内容に基づいてカテゴリ分けする
   - 複数のカテゴリに当てはまる場合は、最もインパクトの大きいものを選ぶ

4. コミットコマンドの生成
   - 各グループごとに `git add` と `pummit` を組み合わせたコマンドを作成する
   - コマンドを実行する

## 分類ロジックとエイリアス対応表

| Category      | Alias            | Detection Criteria                                          |
| ------------- | ---------------- | ----------------------------------------------------------- |
| Feature       | `sparkles`       | 新規ファイル追加、新機能の実装                              |
| Bug Fix       | `bug`            | ファイル名に `fix` / `bug` を含むもの、既存コードのバグ修正 |
| Refactoring   | `recycle`        | 機能変更を伴わないコード整理・構造変更                      |
| Documentation | `books`          | `.md`, `.txt`, `README`, `docs/` 配下のファイル             |
| Configuration | `wrench`         | 設定ファイル（`.json`, `.yaml`, `.toml`, `.config.*`）      |
| Tests         | `rotating_light` | `test/`, `tests/`, `*_test.*`, `*.test.*`                   |
| Deletion      | `fire`           | ファイルの削除のみ                                          |
| WIP           | `construction`   | 途中作業の変更、コメントだらけの状態                        |

## コミットメッセージ生成ルール

- 簡潔な英語で書くこと（Add, Fix, Update, Remove など命令形で開始）
- 具体的に書き、何を変更したかがすぐに分かるようにする
- 50文字以内の短いサブジェクトにおさめる
- 複数ファイルの場合は、共通の目的ごとにまとめる

## 実行例

```bash
# 機能追加
git add src/new_feature.rs && pummit sparkles "Add user authentication feature"

# バグ修正
git add src/validator.rs && pummit bug "Fix boundary condition in input validation"

# ドキュメント更新
git add README.md docs/setup.md && pummit books "Update installation and setup instructions"

# 設定変更
git add .opencode/settings.json && pummit wrench "Configure custom build settings"

# リファクタリング
git add src/utils.rs src/helpers.rs && pummit recycle "Refactor utility functions for better readability"
```

## 重要な注意事項

- グルーピングの妥当性をチェックし、不自然なグループ分けがあれば指摘すること
- パスワードや API キーなどの機密情報が検出された場合は警告すること
- 変更ファイル数が 5 個以上の大きな変更の場合は、コミットを分割することを提案する

## カスタマイズオプション

必要に応じて、次のような追加エイリアスも利用できます。

- `tada` - 初回コミット、大きなリリース
- `art` - UI やスタイルの改善
- `zap` - パフォーマンスの改善
- `lock` - セキュリティ修正
- `arrow_up` / `arrow_down` - 依存関係のアップグレード / ダウングレード
- `package` - パッケージや依存関係の更新
- `green_heart` - CI/CD の修正
- `pencil` - 誤字脱字の修正
- `rewind` - 変更のリバート
