## Функциональные требования

### Управление пользователями и социальные связи  
- Пользователь может зарегистрироваться через e-mail/пароль или Steam.  
- Пользователь может войти в систему и восстановить пароль по e-mail.  
- Пользователь может редактировать свой профиль: никнейм, e-mail, пароль и аватар.  
- Пользователь может настраивать тему, язык и дату.  
- Пользователь может добавлять и удалять друзей, просматривать их статус.  

### Уведомления  
- Пользователь может получать уведомления о событиях (новые матчи, друзья, достижения).  
- Пользователь может просматривать список уведомлений и помечать их как прочитанные.  

### Турниры и команды  
- Пользователь может просматривать список лиг и турниров с датами и призовым фондом.  
- Пользователь может просматривать команды с указанием их региона и названия.  
- Пользователь может просматривать состав команды и периоды, когда конкретный игрок входил в состав команды.  

### Матчи и ключевые события  
- Пользователь может просматривать список матчейи их основный характеристики: дата, длительность, карта, режим, результат, ссылка на реплей. 
- Пользователь может просматривать матч более подробно, а именно основные моменты игры:  
  - убийства: кто убил, кого и когда
  - разрушения строений: какая команда, какое строение и когда
  - подбор рун: кто, какую руну и когда подобрал 
  - убийства Рошана: какая команда и когда  
- Пользователь может просматривать участников матча и кто на каком герое играл
- Пользователь может просматривать сводную статистику игрока в матче: K/D/A, GPM, XPM, урон по разным типам, лечение.  
- Пользователь может просматривать историю покупок предметов: что и когда куплено.  

### Герои и сборки  
- Пользователь может просматривать список героев: имя и основной атрибут
- Пользователь может изучать топ-сборки предметов и талантов с их процентом побед в матчах 
- Пользователь может просматривать агрегированную статистику конкретного героя за период: количество матчей, побед, средние GPM/XPM 

### Достижения  
- Пользователь может просматривать список возможных достижений: название и описание
- Пользователь может просматривать свои полученные достижения с датами получения 

### Поиск и фильтрация данных  
- Пользователь может искать игроков по нику или Steam ID
- Пользователь может искать матчи по дате, турнирам и героям
- Пользователь может сортировать матчи по длительности, результату и другим параметрам  

### Дополнительная аналитика и прогнозы  
- Платформа может анализировать данные матчей и выдавать прогнозы на основе текущих трендов, статистики героев и игроков.  
- Пользователь может получать рекомендации по сборкам и стратегиям на основе актуальных трендов.  

### Интеграция с внешними API  
- Система интегрируется с Dota 2 API для автоматического получения информации о матчах, игроках и статистике.  
- Система может автоматически обновлять данные при появлении новых публичных обновлений или по расписанию.  

### Интерфейс администрирования  
- Администратор может удалять нарушающий правила контент.  
- Администратор может блокировать и удалять неактивные аккаунты.  
- Администратор может редактировать информацию о турнирах и событиях.  

```plantuml
@startuml

enum MatchType{
    RANKED
    UNRANKED
    CUSTOM
}

enum Language{
    RUSSIAN
    ENGLISH
    GERMAN
}

class users {
  + user_id: PK
  --
  + email: VARCHAR(255)
  + password_hash: VARCHAR(255)
  + created_at: DateTime
}

class user_settings {
  + user_id: PK, FK(users)
  --
  + theme: VARCHAR(50)
  + language: Language
  + date_format: VARCHAR(20)
}

class friendships {
  + user_id1: FK(users)
  + user_id2: FK(users)
  --
  + status: VARCHAR(20)
  + created_at: DateTime
}

class notifications {
  + notification_id: PK
  --
  + user_id: FK(users)
  + type: VARCHAR(50)
  + is_read: Boolean
  + created_at: DateTime
}

class player_profiles {
  + profile_id: PK
  --
  + user_id: FK(users)
  + steam_id: VARCHAR(50)
  + nickname: VARCHAR(100)
  + mmr: Integer
}

class leagues {
  + league_id: PK
  --
  + name: VARCHAR(100)
}

class tournaments {
  + tournament_id: PK
  --
  + name: VARCHAR(255)
  + league_id: FK(leagues)
  + start_date: Date
  + end_date: Date
  + prize_pool: Decimal
}

class teams {
  + team_id: PK
  --
  + name: VARCHAR(255)
  + region: VARCHAR(100)
}

class matches {
  + match_id: PK
  --
  + tournament_id: FK(tournaments)
  + date: DateTime
  + duration: Time
  + map: VARCHAR(100)
  + mode: MatchType
  + result: VARCHAR(50)
  + replay_url: VARCHAR
}

class kill_events {
  + event_id: PK
  --
  + match_id: FK(matches)
  + killer_id: FK(player_profiles)
  + victim_id: FK(player_profiles)
  + timestamp: DateTime
}

class tower_events {
  + event_id: PK
  --
  + match_id: FK(matches)
  + team_id: FK(teams)
  + structure: VARCHAR(50)
  + timestamp: DateTime
}

class rune_events {
  + event_id: PK
  --
  + match_id: FK(matches)
  + player_id: FK(player_profiles)
  + rune_type: VARCHAR(50)
  + timestamp: DateTime
}

class roshan_events {
  + event_id: PK
  --
  + match_id: FK(matches)
  + team_id: FK(teams)
  + timestamp: DateTime
}

class players_in_match {
  + match_id: FK(matches)
  + profile_id: FK(player_profiles)
  --
  + team_id: FK(teams)
  + hero_id: FK(heroes)
}

class match_player_stats {
  + stat_id: PK
  --
  + match_id: FK(matches)
  + profile_id: FK(player_profiles)
  + kills: Integer
  + deaths: Integer
  + assists: Integer
  + gpm: Integer
  + xpm: Integer
  + dmg_physical: Integer
  + dmg_magical: Integer
  + dmg_pure: Integer
  + healing: Integer
}

class items {
  + item_id: PK
  --
  + name: VARCHAR(100)
  + cost: Integer
  + rarity: VARCHAR(20)
}

class match_item_purchase {
  + purchase_id: PK
  --
  + match_id: FK(matches)
  + profile_id: FK(player_profiles)
  + item_id: FK(items)
  + purchase_time: DateTime
}

class heroes {
  + hero_id: PK
  --
  + name: VARCHAR(100)
  + primary_attr: VARCHAR(20)
}

class hero_builds {
  + build_id: PK
  --
  + hero_id: FK(heroes)
  + items_seq: Text
  + talents_seq: Text
  + win_rate: Float
}

class hero_stats {
  + stat_id: PK
  --
  + hero_id: FK(heroes)
  + period_start: Date
  + period_end: Date
  + matches_played: Integer
  + wins: Integer
  + avg_gpm: Float
  + avg_xpm: Float
}

class achievements {
  + achievement_id: PK
  --
  + name: VARCHAR(255)
  + description: Text
}

class player_achievements {
  + pa_id: PK
  --
  + profile_id: FK(player_profiles)
  + achievement_id: FK(achievements)
  + unlocked_at: DateTime
}

class team_members {
  + team_id: FK(teams)
  + profile_id: FK(player_profiles)
  --
  + start_date: Date
  + end_date: Date
}

' Relationships (22)
users           "1"  <-- "0..1" user_settings
users           "1"  <-- "*"    friendships
users           "1"  <-- "*"    notifications
users           "1"  <-- "*"    player_profiles
leagues         "1"  <-- "*"    tournaments
teams           "1"  <-- "*"    tournaments
teams           "1"  <-- "*"    matches
matches         "1"  <-- "*"    kill_events
matches         "1"  <-- "*"    tower_events
matches         "1"  <-- "*"    rune_events
matches         "1"  <-- "*"    roshan_events
matches         "1"  <-- "*"    players_in_match
players_in_match "1" <-- "*"    match_player_stats
players_in_match "1" <-- "*"    match_item_purchase
heroes          "1"  <-- "*"    players_in_match
heroes          "1"  <-- "*"    hero_builds
heroes          "1"  <-- "*"    hero_stats
hero_builds     "1"  <-- "*"    match_item_purchase
items           "1"  <-- "*"    match_item_purchase
achievements    "1"  <-- "*"    player_achievements
player_profiles "1"  <-- "*"    player_achievements
teams           "1"  <-- "*"    team_members
player_profiles "1"  <-- "*"    team_members

user_settings "1" --> "1" Language
matches "1" --> "1" MatchType

@enduml
```