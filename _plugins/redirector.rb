module Jekyll

  class RedirectPage < Page
    def initialize(site, base, dir)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['dest_url'] = "http://fr.nicosphere.net/#{@dir}/"
    end
  end

  class RedirectGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category_index'

        f = File.new('_plugins/redirect.txt', 'r')
        redirects = []
        while (l = f.gets)
          redirects.push(l.strip)
        end
        dir = site.config['category_dir'] || 'categories'
        redirects.each do |redirection|
          write_category_index(site, File.join(redirection))
        end
      end
    end

    def write_category_index(site, dir)
      index = RedirectPage.new(site, site.source, dir)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end

end
