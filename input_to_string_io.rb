module InputToStringIo
  # TODO: Get method working with a StringIo
  def input_to_string_io(*args)
    args.each { |input| @test_io.puts(input) }
    @test_io.rewind

    $stdin = @test_io
  end
end
