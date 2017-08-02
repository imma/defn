# see https://docs.chef.io/custom_resources.html
#
actions :create, :delete

default_action :create

attribute :facet, name_attribute: true, kind_of: String, required: true

attr_accessor :exists
