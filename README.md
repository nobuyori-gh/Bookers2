<Start>
ユーザーに関するモデルUserとカラムname（ユーザー名）作成
ログイン画面作成　devise/sessions/new.html.erb
ユーザー登録画面作成　devise/registrations/new.html.erb
gemインストール　refile（ファイルをアップロードできるようになる）、refile-mini_magick（アップロードされた画像のリサイズを行う）
Userモデルにカラム追加　introduction（自己紹介文）,profile_image_id（「refiie」による画像保存用）
Userモデルのカラムに文字数制限追加　name 2~20文字、introduction 1~50文字
投稿用データモデルBookとカラムtitle（本のタイトル）,body（感想）,user_id（投稿者のid）を作成
