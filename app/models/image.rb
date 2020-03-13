# == Schema Information
#
# Table name: images
#
#  id             :bigint           not null, primary key
#  imageable_type :string           not null
#  img_src        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_id   :bigint           not null
#
# Indexes
#
#  index_images_on_imageable_type_and_imageable_id  (imageable_type,imageable_id)
#

class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end
