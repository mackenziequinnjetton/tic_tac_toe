module InputToStringIo
  def input_to_string_io(*args)
    string_io = StringIO.new

    args.each { |input| string_io.puts input }
    string_io.rewind

    string_io
  end
end
