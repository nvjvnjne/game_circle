# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ログインデータ
Admin.create!(email: 'game@game.com', password: '123456')

users = User.create!(
  [
    {email: 'jack@test.com', password: 'password', nickname: 'Jack', introduction: 'よろしくお願いします！', fav_game: 'ポケモンシリーズ', is_deleted: false},
    {email: 'stella@test.com', password: 'password', nickname: 'Stella', introduction: '可愛いキャラクターが好きです！', fav_game: '星のカービィ', is_deleted: false},
    {email: 'maria@test.com', password: 'password', nickname: 'Maria', introduction: 'RPGが好きです！', fav_game: 'FFシリーズ', is_deleted: false},
    {email: 'mii@test.com', password: 'password', nickname: 'Mii', introduction: 'やりたいゲームを探しています！', fav_game: 'パズルゲーム(テトリスなど！)', is_deleted: false},
    {email: 'card@test.com', password: 'password', nickname: 'Card', introduction: 'カードゲームにハマっています！', fav_game: '遊戯王！', is_deleted: false},
    {email: 'steve@test.com', password: 'password', nickname: 'Steve', introduction: 'おすすめの対戦格闘ゲーム教えてください！！', fav_game: 'ストリートファイター', is_deleted: false},
    {email: 'yamada@test.com', password: 'password', nickname: 'Yamada', introduction: '最近ゲームにハマりました！', fav_game: 'まだ無いです１', is_deleted: false},
    {email: 'suzuki@test.com', password: 'password', nickname: 'Suzuki', introduction: '友達に勧められて始めました！', fav_game: 'スプラトゥーン', is_deleted: false},
    {email: 'tanaka@test.com', password: 'password', nickname: 'Tanaka', introduction: '最近話題のゲームを知りたいです！', fav_game: 'スマホゲームなど！', is_deleted: false},
    {email: 'santa@test.com', password: 'password', nickname: 'Santa', introduction: '配達系のゲーム知ってますか？！', fav_game: 'Fortnite', is_deleted: false},
    {email: 'kenta@test.com', password: 'password', nickname: 'Kenta', introduction: 'ゲームに夢中！', fav_game: 'Fatal Fury'},
    {email: 'shiori@test.com', password: 'password', nickname: '詩織', introduction: 'ゲームのこともっと知りたい！', fav_game: 'ライザのアトリエシリーズ', is_deleted: false},
    {email: 'keiichi@test.com', password: 'password', nickname: '圭一', introduction: '最近switch買いました！', fav_game: 'マリオカート', is_deleted: false},
    {email: 'mai@test.com', password: 'password', nickname: '舞', introduction: '好きなRPG教えてください！', fav_game: 'まだ見つかってない！', is_deleted: false},
    {email: 'gouda@test.com', password: 'password', nickname: '剛田', introduction: '力こそ全て！', fav_game: 'リングフィットアドベンチャー', is_deleted: false},
    {email: 'eve@test.com', password: 'password', nickname: 'イブ', introduction: 'RPGが大好き！', fav_game: 'FFⅦ', is_deleted: false}
  ]
)