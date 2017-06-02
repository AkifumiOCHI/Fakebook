class Topic < ActiveRecord::Base
  validates :title, :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :picture, PictureUploader

  paginates_per 10

  scope :index_all, -> {
  select(:id, :title, :content, :created_at, :user_id, :updated_at, :picture) #フィールドごとにレコードを取得
  .order(updated_at: :desc) #created_atカラムの降順に並び替え
  .includes(:user) #ユーザを事前に取得してN+1防止
  }
end
