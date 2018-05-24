Gem::Specification.new do |s|
  s.name = "inspectr"
  s.version = "0.0.0"
  s.date = "2018-05-24"
  s.summary = "Inspectr client for Ruby"
  s.authors = ["adpajer", "amoskyler", "jameschan1", "pzaich", "sasso", "vokatch"]
  s.files = Dir['lib/**/*.rb']
  s.require_paths = ["lib"]
  s.add_dependency("aws-sdk-sqs", "~> 1.3", ">= 1.3.0")
end
