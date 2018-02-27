require_relative "test_helper"
require 'fileutils'
class StageTest < Minitest::Test
  def test_it_gets_new_template_files
    FileUtils.rm_rf('tmp')
    ::Stage::Create.new('tmp')
  end
end
