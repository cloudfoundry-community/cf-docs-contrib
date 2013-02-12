###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :markdown_engine, :redcarpet
set :markdown, :layout_engine => :erb, 
               :tables => true, 
               :autolink => true,
               :smartypants => true,
               :fenced_code_blocks => true

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

# For syntax highlighting .. middleman-syntax
activate :syntax

# For breadcrumbs .. mostly from https://github.com/multiscan/middleman-navigation but modified slightly
helpers do
  class Middleman::Sitemap::Page
    def banner_url
      p= "/" + app.images_dir + "/banner/" + self.path.gsub(/\.html$/, ".jpg")
      unless File.exists?(app.source_dir+p)
        p = self.parent ? self.parent.banner_url : "/" + app.images_dir + "/banner/default.jpg"
      end
      return p
    end
    def nonav?
      self.data && self.data[:nonav]
    end
    def hidden?
      self.data && self.data['hidden'] || File.basename(self.path, ".html")[-1]=="_" || File.basename(self.path, ".html")[0]=="_" || File.basename(File.dirname(self.path))[0]=="_"
    end
    def label
      self.data && self.data['menu_title'] || self.parent.nil? ? "home" : File.basename(self.directory_index? ? File.dirname(self.path) : self.path, ".html").gsub("_", " ")
    end
    def weight
      self.data && self.data['weight'] || 0
    end
  end

  def banner_img(opts={:width=>700, :height=>120})
    image_tag current_page.banner_url, opts
  end

  # create a list item containing the link to a given page.
  # If page is the current one, only a span is Class "selected" is added if the page is the current one.
  def menu_item(page, options={:li_class=>''})
    _options = {
      :selected => {:class => "active"},
      :wrapper => "%s"
    }
    options = _options.merge(options)
    mylabel = options[:label] || page.data.title  #this needed to be changed from page.label to page.data.title
    if page==current_page
      options[:li_class] += ' ' + options[:selected][:class]
      link = content_tag :span, mylabel
    else
      link = link_to(mylabel, "/"+page.path)
    end
    link = options[:wrapper] % link
    return content_tag :li, link, :class => options[:li_class].strip
  end

  # create an <ul> list with links to all the childrens of the current page
  def children_nav(options={})
    p = current_page
    return nil unless p.directory_index?
    return nil if p.nonav?
    c = p.children.delete_if{ |m| m.hidden? }
    return nil if c.empty?
    i = 0;
    menu_content = c.sort{ |a,b| a.weight <=> b.weight }.map{ |cc|
      i += 1
      item_class = (i == 1) ? 'first' : ''
      item_class += ' last' if c.length == i
      options[:li_class] = item_class
      menu_item(cc, options)
    }.join("\n")
    options.delete(:li_class)
    options.delete(:wrapper)
    return content_tag :ul, menu_content, options
  end

  # create an <ul> list with links to all the parent pages down to the root
  def trail_nav()  # removed sep
    p = current_page
    res=Array.new
    res << menu_item(p)
    while p=p.parent
      # removed sep
      res << menu_item(p)
    end
    return res.reverse.join(" ") #removed <ul> tags
  end
end