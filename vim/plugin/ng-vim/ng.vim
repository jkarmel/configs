ruby <<EOF
module VIM
  def self.full_text
    lines.join '\n'
  end

  def self.lines
    (1..$curbuf.length).map { |i| $curbuf[i]}
  end

  def self.add_at_cursor(string)
    cursor_row, cursor_col = $curwin.cursor
    cur_line = $curbuf[cursor_row]
    $curbuf[cursor_row] = cur_line[0..cursor_col] + string + ' '+ cur_line[cursor_col..-1]
    $curwin.cursor = [cursor_row, cursor_col + string.length + 2]
  end
end

class NG
  def self.import(service)
    if previous_imports?
      self.string_line = string_line + ', "' + service + '"'
      self.arguments_line = arguments_line.split(')')[0] + ',   ' + service + ') ->'
    else
      self.string_line = '"' + service +'"'
      self.arguments_line = '(' + service + ') ->'
    end
    VIM.add_at_cursor service
  end

  def self.string_line
    $curbuf[angular_line + 1]
  end

  def self.string_line=(string)
    $curbuf[angular_line + 1] = string
  end

  def self.arguments_line
    $curbuf[angular_line + 2]
  end

  def self.arguments_line=(string)
    $curbuf[angular_line + 2] = string
  end

  def self.angular_line
    VIM.lines.find_index { |l| l.start_with? "angular.module"} + 2
  end

  def self.previous_imports?
    string_line.start_with? '"'
  end

end
EOF

function! NGImport(service)
ruby <<EOF
  NG.import VIM::evaluate('a:service')
EOF
endfunction
