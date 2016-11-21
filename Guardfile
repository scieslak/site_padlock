
guard :minitest, spring: "bin/rails test", all_on_start: false do

  watch(%r{^test/.+_test\.rb$})
  watch(%r{^test/(.*)\/?test_(.*)\.rb$})

  # All tests trigered by test_helper.rb update
  watch(%r{^test/test_helper\.rb$}) { 'test' }

  # Tests trigered by routes.rb update
  watch(%r{^config/routes.rb$}) do |m|
    run_test(dir: "controllers")
  end

  # All tests trigered by fixtures update
  watch(%r{^test/fixtures/(.+)\.yml$}) { 'test' }

  # Tests trigered by model update
  watch(%r{^app/models/(?<name>.+)\.rb$}) do |m|
    run_test(match: m[:name], dir: "models")
  end

  # Tests trigered by controller update
  watch(%r{^app/controllers/(?<name>.+)\.rb$}) do |m|
    run_test(match: m[:name], dir: "controllers")
  end

  # Tests trigered by view update
  watch(%r{^app/views/(?<name>.+)/(.+)\.erb$}) do |m|
    run_test(match: "#{m[:name]}_controller", dir: "controllers")
  end

end

#=============================================================================#

# Returns array of file names matching provided name and path

def run_test(set = {})
  # Call method with set[:integration] = true to ran all integration tests
  integration_path = "test/integration/*_test.rb"

  path = ["test"]
  path << set[:dir] if set[:dir]
  path << (set[:match] ? "*#{set[:match]}_test.rb" : set[:match] = "*")

  test_files = Dir.glob(File.join(path))
  test_files << Dir.glob(integration_path) unless set[:skip_integration]
  return test_files
end
