# frozen_string_literal: true

require "rdoc/task"
RDoc::Task.new(rdoc: "rdoc", clobber_rdoc: "rdoc:clean", rerdoc: "rdoc:force") do |rdoc|
  rdoc.rdoc_dir = ENV["RDOC_DIR"] || "html"
  rdoc.rdoc_files
    .include("README.md", "lib/**/*.rb", "ext/**/*.c")
    .exclude("lib/nokogiri/css/tokenizer.rb")
    .exclude("lib/nokogiri/css/parser.rb")
    .exclude("ext/nokogiri/test_global_handlers.c")
  rdoc.options << "--embed-mixins"
  rdoc.options << "--main=README.md"
  rdoc.options << "--show-hash"
end

task clean: "rdoc:clean"
