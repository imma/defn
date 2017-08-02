use_inline_resources

def load_current_resource
  @current_resource = Chef::Resource::Defn.new(@new_resource.name)
  @current_resource.exists = ::File.exist?(fqname(@new_resource.name))
end

action :create do
  if !@current_resource.exists
    converge_by("Creating #{fqname(new_resource.name)}") do
      resp = create_facet
      @new_resource.updated_by_last_action(resp)
    end
  end
end

action :delete do
  if @current_resource.exists
    converge_by("Deleting #{fqname(new_resource.name)}") do
      resp = delete_facet
      @new_resource.updated_by_last_action(resp)
    end
  end
end

require 'fileutils'

def fqname(fname)
  ::File.join(ENV['HOME'], "#{fname}.txt")
end

def create_facet
  ::File.open(fqname(new_resource.name), 'w').close
end

def delete_facet
  ::FileUtils.rm(fqname(new_resource.name))
end
