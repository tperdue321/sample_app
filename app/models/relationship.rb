class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "Users"
  belongs_to :followed, class_name: "Users"
end
