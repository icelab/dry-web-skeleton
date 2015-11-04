require "active_support/core_ext/class/subclasses"

# Load all the page classes
Dir["#{File.dirname(__FILE__)}/../pages/*.rb"].each(&method(:require))

# Add a helper method for accessing each page class, with a name to match. A
# `_page` suffix is added for clarity, and to avoid name collisions, e.g.
#
# MyFriendsPage -> TestPageHelpers#my_friends_page
# MyFavorites   -> TestPageHelpers#my_favorites
module TestPageHelpers
  SitePrism::Page.descendants.each do |page_class|
    page_helper_name = page_class.name.underscore
    page_helper_name += "_page" unless page_helper_name =~ /_page$/

    define_method(page_helper_name) do
      page_class.new
    end
  end
end
