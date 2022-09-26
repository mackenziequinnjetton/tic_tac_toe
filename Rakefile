require 'rake/testtask'

task default: %w[test]

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.test_files = FileList['spec/*_test.rb']
  t.verbose = true
end
