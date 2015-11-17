require "inflecto"
require "site_prism"

# Load all the page classes
Dir[SPEC_ROOT.join("pages/**/*.rb").to_s].each(&method(:require))

# Add a helper method for accessing each page class, with a name to match. A
# `_page` suffix is added for clarity, and to avoid name collisions, e.g.
#
# MyFriendsPage -> TestPageHelpers#my_friends_page
# MyFavorites   -> TestPageHelpers#my_favorites
module TestPageHelpers
  (ObjectSpace.each_object(SitePrism::Page).to_a  - SitePrism::Page).each do |page_class|
    page_helper_name = Inflecto.underscore(page_class.name)
    page_helper_name += "_page" unless page_helper_name =~ /_page$/

    define_method(page_helper_name) do
      page_class.new
    end
  end
end
