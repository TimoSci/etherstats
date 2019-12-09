module Format

  def hex_to_sci(x)
    '%.2e' % x.to_i(16)
  end

  def hex_to_sci2(x)
    '2%.f' % x.to_i(16)
  end

end
