# File name: application_record.rb
# Class name: ApplicationRecord
# Description: All models in turn inherit from ApplicationRecord for access AR
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
