module ProjectPath
  def project_path(*paths)
    require "pathname"
    
    caller_path = File.expand_path(caller(0)[1].gsub(/\.rb.*$/, ""))
    
    Pathname(caller_path).ascend do |path|
      if File.exists?(File.join(path, "lib"))
        return File.join(path.to_s, *paths)
      end
    end
  end
  
  module_function :project_path
end