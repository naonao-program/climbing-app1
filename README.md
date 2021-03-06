# テーブル設計
## usersテーブル
| Column                  | Type     | Options                 |
| ----------------------- | -------- | ----------------------- |
| email                   | string   | null:false,unique:true  |
| password                | string   | null:false              |
| nickname                | string   | null:false              |
| boulder_gym_grade_id    | integer  | null:false              |
| lead_gym_grade_id       | integer  | null:false              |
| boulder_rock_grade_id   | integer  | null:false              |
| lead_rock_grade_id      | integer  | null:false              |
| gender_id               | integer  | null:false              |
| region_id               | integer  | null:false              |
| age_id                  | integer  | null:false              |


### Association
- has_many :rock_information
- has_many :gym_information
- has_many :comments

## rock_informationテーブル
| Column              | Type           | Options                 |
| ------------------- | --------       | ----------------------- |
| name                | string         | null:false              |
| region_id           | integer        | null:false              |
| rock_quality_id     | integer        | null:false              |
| address             | string         | null:false              |
| season1_id          | integer        | null:false              |
| season2_id          | integer        | null:false              |
| night_id            | integer        | null:false              |
| grade_sense_id      | integer        | null:false              |
| people_day_id       | integer        | null:false              |
| people_time_id      | integer        | null:false              |
| people_vibe_id      | integer        | null:false              |
| other               | text           |                         |
<!-- | image          | Active Storage |                         | -->

### Association
- belongs_to :user
- has_many :comments

## gym_informationテーブル
| Column              | Type           | Options                 |
| ------------------- | --------       | ----------------------- |
| name                | string         | null:false              |
| region_id           | integer        | null:false              |
| address             | string         | null:false              |
| grade_sense_id      | integer        | null:false              |
| people_day_id       | integer        | null:false              |
| people_time_id      | integer        | null:false              |
| people_vibe_id      | integer        | null:false              |
| clerk_vibe_id       | integer        | null:false              |
<!-- | image          | Active Storage |                         | -->

### Association
- belongs_to :user
- has_many :comments


## commentsテーブル
| Column                 | Type           | Options                 |
| ---------------------- | --------       | ----------------------- |
| user_id                | integer        |                         |
| rock_information_id    | integer        |                         |
| gym_information_id     | integer        |                         |
| text                   | text           | null:false              |

### Association
- belongs_to :user
- belongs_to :rock_information
- belongs_to :gym_information