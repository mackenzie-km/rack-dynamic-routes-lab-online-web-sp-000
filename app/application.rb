class Application
  def call(env)
    resp = Rack::Response.new
      if resp.path.match(/items\/.+/)
        desired_item = resp.path.split("/").last
        found_item = Item.all.detect {|x| x.name == desired_item}
        resp.write found_item
    resp.finish
  end
end
