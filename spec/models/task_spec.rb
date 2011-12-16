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
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Task do

  before (:each) do
    @attr = { :description => "This is a task", :inputs => "", :outputs => "",
              :owner => "Scott", :ri => "AJ", :status => "New",
              :project => "NewGen", :discipline => "SE", :need_date => "Jan 1, 2012" }
  end

  it "should create a new instance given valid attributes" do
     Task.create!( @attr )
  end

  it "should require a description" do
    no_descr_task = Task.new( @attr.merge( :description => "" ) )
    no_descr_task.should_not (be_valid)
  end # end descr presence block
  
  long_descr = ("1234567890" * 12) + "1"
  
  it "should require a description w/ max length 120" do
    descr_len_task = Task.new( @attr.merge( :description => long_descr ) )
    descr_len_task.should_not (be_valid)
  end
  
  it "should require an owner name" do
    no_owner_task = Task.new( @attr.merge(:owner => "") )
    no_owner_task.should_not( be_valid )
  end
  
  it "should require a project name" do
    no_proj_task = Task.new( @attr.merge(:project => "") )
    no_proj_task.should_not be_valid
  end
  
  it "should require a discipline" do
    no_dis_task = Task.new( @attr.merge(:discipline => "") )
    no_dis_task.should_not be_valid
  end
  
  it "should require a discipline w/ lenght = 2" do
    disc_len_task = Task.new( @attr.merge(:discipline => "SES") )
    disc_len_task.should_not be_valid
  end
  
  # To test uniqueness, need to add values to the database (use Task.create!())
  # so a subsequent task w/ same value will generate an error
  # Also use db indices w/ any value that needs to be unique so uniqueness
  # can be tested at the db level
  # (6.2.4 in rails tutorial - ruby.railstutorial.org)

end # end describe task block
