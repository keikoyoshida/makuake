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
|heading_movie|string|null: false, handle movie and image files|
|content_html|text|null: false|
|content_image|string||
|deadline|time|null: false, add_index|
|project-type_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|

### Association
- has_many :tags, through: :project_tag
- has_many :projectTags
- has_many :supporters, reports, supportComments, couses, products
- belongs_to :user, :projectType, :category

validates :title, :headingMovie, :contentHtml, :deadline, presence: true


## suporters table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user, :project


## project_types table

|Column|Type|Options|
|------|----|-------|
|type|string|null: false, add_index unique: true|

### Association
- has_many :projects

validates :type, presence: true


## categories table

|Column|Type|Options|
|------|----|-------|
|category|string|null: false, add_index unique: true|

### Association
- has_many :projects

validates :category, presence: true


## project_tags table

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


## report_comments table

|Column|Type|Options|
|------|----|-------|
|report_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|comment|text||

### Association
- belongs_to :report, :user

validates :comment, presence: true


## report_handclaps table

|Column|Type|Options|
|------|----|-------|
|report_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association
- belongs_to :report, :user


## support_comments table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|comment|text||

### Association
- belongs_to :project
- has_many :supportCommentReples, supportCommentHandclaps

validates :comment, presence: true


##support_comment_reples table

|Column|Type|Options|
|------|----|-------|
|support_comment_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|comment|text||

### Association
- belongs_to :supportComment, :user

validates :comment, presence: true


## support_comment_handclaps table

|Column|Type|Options|
|------|----|-------|
|support_comment_id|references|foreign_key: true|
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
- has_many :userCouses, courseOrProductOptions, shippingAddresses
- belongs_to :project

validates :price, :amount, :title, :schedule, presence: true


## user_courses table
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
|law_notification_html|text|null: false|

### Association
- has_many :users through: :userProduct
- has_many :userProducts, courseOrProductOptions, shippingAddresses
- belongs_to :project

validates :price, :amount, :title, :schedule, :lawNotificationHtml, presence: true


## user_products table

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|product_id|references|foreign_key: true|

### Association
- belongs_to :user, :product


## courseOrProductOptions table

|Column|Type|Options|
|------|----|-------|
|course_id|references|foreign_key: true|
|project_id|references|foreign_key: true|
|option_id|references|foreign_key: true|

### Association
- belongs_to :product, :course, :option

validates :course_or_product, presence: true
private
def course_or_product
  course.id.presence or product.id.presence
end


## options table
|Column|Type|Options|
|------|----|-------|
|option|string|null: false|

## Association
- has_many :courseOrProductOptions

validates :option, presence: true


## shipping_addresses table
|Column|Type|Options|
|------|----|-------|
|course_id|references|foreign_key: true|
|project_id|references|foreign_key: true|
|payment_method_id|references|foreign_key: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|phone_number|integer|null: false|
|zip_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|

## Association
- belongs_to :product, :course, :paymentMethod

validates :course_or_product, presence: true
private
def course_or_product
  course.id.presence or product.id.presence
end
validates :firstName, :familyName, :firstNameKana, :familyNameKana, :phoneNumber, :zipCode, :prefecture, :city, :houseNumber, presence: true


## payment_methods table

|Column|Type|Options|
|------|----|-------|
|payment_method|string|null: false, add_index unique: true|

## Association
- has_many :shippingAddresses

validates :paymentMethod, presence: true
