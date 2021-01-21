class Cipher
  LOWERCASE_ALPHABET = ('a'..'z').to_a
  UPPERCASE_ALPHABET = ('A'..'Z').to_a

  def self.rotate(string, rotation)
    lower = LOWERCASE_ALPHABET.zip(LOWERCASE_ALPHABET.rotate(rotation)).to_h
    upper = UPPERCASE_ALPHABET.zip(UPPERCASE_ALPHABET.rotate(rotation)).to_h

    new_alphabet = lower.merge(upper)

    string.chars.map do |current_char|
      if current_char.match?(/[a-zA-Z]/)
        new_alphabet[current_char]
      else
        current_char
      end
    end.join
  end
end
