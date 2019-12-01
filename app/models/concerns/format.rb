module Format

  def hex_to_sci(x)
    '%.2e' % x.to_i(16)
  end

end
