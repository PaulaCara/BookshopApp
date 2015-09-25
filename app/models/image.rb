class Image < ActiveRecord::Base
  mount_uploader :filename, ImageUploader
  belongs_to :product
  validates :filename, presence: true
  validate :file_size
  after_create :set_path

  def file_size
    if filename.size.to_f > (0.5).megabytes.to_f
      self.errors.add(:filename, "You cannot upload a file greater than #{(0.5).megabytes.to_f}MB")
    end
  end

  private

  def set_path
    update_attribute(:path, '/public/uploads/image')
  end
end
