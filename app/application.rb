class Application
  def call(env)
    resp = Rack::Response.new
      if req.path.match(/items\/.+/)
        desired_item = req.path.split("/").last
        found_item = Item.all.detect {|x| x.name == desired_item}
        resp.write found_item
      else
        resp.status = 404
        resp.write "Route not found."
      end
    resp.finish
  end
end
