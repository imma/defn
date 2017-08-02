use_inline_resources

def load_current_resource
  @current_resource = Chef::Resource::Defn.new(@new_resource.name)
  @current_resource.exists = ::File.exist?("#{@new_resource.name}.txt")
end

action :create do
  if !@current_resource.exists
    converge_by("Creating #{fqname(new_resource.name)}") do
      resp = create_facet
      @new_resource.updated_by_last_action(resp)
    end
  else
    Chef::Log.error 'Facet already exists, not creating.'
  end
end

action :delete do
  if @current_resource.exists
    converge_by("Deleting #{fqname(new_resource.name)}") do
      resp = delete_facet
      @new_resource.updated_by_last_action(resp)
    end
  else
    Chef::Log.error "Can't find #{fqname(new_resource.name)}, not deleting"
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
