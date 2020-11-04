## 感想がつらつら書けてシェアできるアプリ
### 作業環境
- WSL(ubuntu)
- Ruby 2.5.1(Rbenv2.5.1)
- Rails 5.2.4
- RSpec 3.7(少しずつテスト導入したい)  
  
## 詳細
映画や本などの作品鑑賞後、感想を書いてシェアできるアプリ。  
鑑賞して消費するだけでなく、読みたい人、観たい人と感想を共有できたら楽しそうだと思ったので。  
## テーブル一覧
### impressionsテーブル

|キー|カラム名|データ型|制約 or オプション|
|:----|:----|:----|:----|
|PK|ID| | |
| |title|string|null: false|
| |description|text|null: false|
|FK|user_id|reference|foreign_key: true|
|FK|category_id|reference|foreign_key: true|
​
​
### usersテーブル
​
|キー|カラム名|データ型|制約 or オプション|
|:----|:----|:----|:----|
|PK|ID| | |
| |name|string|null: false|
| |email|string|null: false|
| |password_digest|string|null: false|
| |admin|boolean|default: false, null: false|
​
### categoriesテーブル
​
|キー|カラム名|データ型|制約orオプション|
|:----|:----|:----|:----|
|PK|ID| | |
| |name|string|null: false|
​
## エンドポイント表
​
|HTTP verb|URL|Controller#Action|機能名|
|:----|:----|:----|:----|
|get|/impressions|impressions#index|感想一覧機能|
|get|/impressions/new|impressions#new|感想作成入力機能|
|get|/impressions/id|impressions#show|感想詳細機能|
|post|/impressions|impressions#create|感想作成機能|
|get|/impressions/id/edit|impressions#edit|感想更新入力機能|
|patch|/impressions/id|impressions#update|感想更新機能|
|delete|/impressions/id|impressions#destroy|感想削除機能|
|get|admin/users|admin/users#index|ユーザー一覧機能|
|get|admin/users/new|admin/users#new|ユーザー作成入力機能|
|post|admin/users|admin/users#create|ユーザー作成機能|
|delete|admin/users/id|admin/users#destroy|ユーザー削除機能|
|get|/login|sessions#new|ログイン情報入力機能|
|post|/login|sessions#create|ログイン情報認証機能|
|desete|/logout|sessions#destroy|ログアウト機能|
​
