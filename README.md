# Database design


## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index unique: true|
|email|text|null: false, add_index unique: true|

### Association
- has_many :projects, supporters, reportComments, reportHandclaps, supportCommentReplies, supportCommentHandclaps, courses, products

validates :name, email, presence: true


## projects table

|Column|Type|Options|
|------|----|-------|
|title|string|null: false, add_index|
|headingMovie|string|null: false, handle movie and image files|
|contentHtml|text|null: false|
|contentImage|string||
|deadline|time|null: false, add_index|
|projectType_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association
- has_many :tags, through: :project_tag
- has_many :projectTags
- has_many :supporters, reports, supportComments, couses, products
- belongs_to :user, :projectType

validates :title, :headingMovie, :contentHtml, :deadline, presence: true


## suporters table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user, :project


## projectTypes table

|Column|Type|Options|
|------|----|-------|
|type|string|null: false, add_index unique: true|

### Association
- has_many :projects

validates :type, presence: true


## projectTags table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|
|tag_id|references|foreign_key: true|


### Association
- belongs_to :project, :tag


## tags table

|Column|Type|Options|
|------|----|-------|
|tag|string|null: false, add_index unique: true|

### Association
- has_many :projects through: :project_tags
- has_many :projectTags

validates :tag, presence: true


## reports table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|
|title|string|null: false|
|content|text||
|image|string||

### Association
- belongs_to :project
- has_many :reportComments, reportHandclaps

validates :title, presence: true


## reportComments table

|Column|Type|Options|
|------|----|-------|
|report_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|comment|text||

### Association
- belongs_to :report, :user

validates :comment, presence: true


## reportHandclaps table

|Column|Type|Options|
|------|----|-------|
|report_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association
- belongs_to :report, :user


## supportComments table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|comment|text||

### Association
- belongs_to :project
- has_many :supportCommentReples, supportCommentHandclaps

validates :comment, presence: true


##supportCommentReples table

|Column|Type|Options|
|------|----|-------|
|supportComment_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|comment|text||

### Association
- belongs_to :supportComment, :user

validates :comment, presence: true


## supportCommentHandclaps table

|Column|Type|Options|
|------|----|-------|
|supportComment_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association
- belongs_to :supportComment, :user


## courses table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|
|price|integer|null: false|
|amount|integer|null: false|
|title|string|null: false|
|image|string|null: false|
|content|text|null: false|
|schedule|time|null: false|

### Association
- has_many :users, through: :userCouse
- has_many :userCouses
- belongs_to :project

validates :price, :amount, :title, :schedule, presence: true


## userCourses table
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|course_id|references|foreign_key: true|

### Association
- belongs_to :user, :course


## products table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|
|price|integer|null: false|
|amount|integer|null: false|
|title|string|null: false|
|image|string|null: false|
|content|text|null: false|
|schedule|time|null: false|
|lawNotificationHtml|text|null: false|

### Association
- has_many :users through: :userProduct
- has_many :userProducts
- belongs_to :project

validates :price, :amount, :title, :schedule, :lawNotificationHtml, presence: true


## userProducts table
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|product_id|references|foreign_key: true|

### Association
- belongs_to :user, :product


