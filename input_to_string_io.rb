module InputToStringIo
  # TODO: Get method working with a StringIo
  def input_to_string_io(*args)
    string_io = StringIO.new

    args.each { |input| string_io.puts(input) }
    string_io.rewind

    string_io
    # $stdin = @test_io
  end
end
