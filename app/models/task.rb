# == Schema Information
#
# Table name: tasks
#
#  id          :integer         not null, primary key
#  description :string(255)
#  inputs      :string(255)
#  outputs     :string(255)
#  owner       :string(255)
#  ri          :string(255)
#  status      :string(255)
#  project     :string(255)
#  discipline  :string(255)
#  need_date   :date
#  created_at  :datetime<a href="#"></a>
#  updated_at  :datetime
#

class Task < ActiveRecord::Base
   attr_accessible :description, :inputs, :outputs, :owner, :ri, :status,
                   :project, :discipline, :need_date
                   
   validates :description, :presence => true,
                           :length => {:maximum => 120}
   validates :owner,       :presence => true
   validates :project,     :presence => true
   validates :discipline,  :presence => true,
                           :length => {:is => 2}

end
