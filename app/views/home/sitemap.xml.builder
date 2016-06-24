base_url = "http://#{request.host_with_port}/"

xml.instruct! :xml, :version=>"1.0"
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9', 'xmlns:image' => 'http://www.google.com/schemas/sitemap-image/1.1', 'xmlns:video' => 'http://www.google.com/schemas/sitemap-video/1.1' do
  xml.url do
    xml.loc base_url
  end
  xml.url do
    xml.loc base_url+'aboutus'
    xml.changefreq "weekly"
    xml.priority "0.5"
  end
  xml.url do
    xml.loc base_url+'contactus'
    xml.changefreq "weekly"
    xml.priority "0.5"
  end
  xml.url do
    xml.loc base_url+'gallery'
    xml.changefreq "weekly"
    xml.priority "0.5"
  end
  xml.url do
    xml.loc base_url+'donation'
    xml.changefreq "weekly"
    xml.priority "0.5"
  end
  xml.url do
    xml.loc base_url+'shopevents'
    xml.changefreq "weekly"
    xml.priority "0.5"
  end
end