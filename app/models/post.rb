class Post < ActiveRecord::Base
   # /// 1
   validates :title, :presence => true
   validates :body, :presence => true
end
