require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "project path" do
  before do
    @project_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
  end
  
  it "should be the absolute path of the start of the project" do
    ProjectPath.project_path.should == @project_path
  end
  
  it "should join extra segments if passed an extra segment" do
    ProjectPath.project_path("foo").should == "#{@project_path}/foo"
  end
  
  it "should join many extra segments if passed an extra segment" do
    ProjectPath.project_path("foo", "bar").should == "#{@project_path}/foo/bar"
  end
end
