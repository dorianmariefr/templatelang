require "kemal"
require "template"

get "/" do
  File.read("public/index.html")
end

get "/api/template" do |env|
  input = env.params.query.fetch("input", "")
  context = env.params.query.fetch("context", "")
  Template.render(input, context)
end

post "/api/template" do |env|
  input = env.params.body.fetch("input", "")
  context = env.params.body.fetch("context", "")
  Template.render(input, context)
end

get "/api/code" do |env|
  input = env.params.query.fetch("input", "")
  Code.evaluate(input).to_s
end

post "/api/code" do |env|
  input = env.params.body.fetch("input", "")
  Code.evaluate(input).to_s
end

Kemal.run
