class Benedict

  def self.generate(words)
    sanitised = Benedict.sanitise(words)
    passwords_year = Benedict.passwords_year(sanitised)
    passwords_number = Benedict.passwords_number(sanitised)
    combined = passwords_year + passwords_number
    combined
  end

  def self.sanitise(words)
    sanitised = []
    words.each { |word| sanitised.push(word.downcase.capitalize) }
    return sanitised
  end

  def self.passwords_year(words)
    passwords = []
    # Place words by year into passwords
    words.each do |word|
      (1900..2018).to_a.each do |year|
        passwords.push("#{word}#{year}")
      end
    end
    passwords
  end

  def self.passwords_number(words)
    passwords = []
    # Place words with one or two numbers on the end into passwords
    words.each do |word|
      (0..9).to_a.each do |n1|
        passwords.push("#{word}#{n1}")
        (0..9).to_a.each do |n2|
          passwords.push("#{word}#{n1}#{n2}")
        end
      end
    end
    passwords
  end

  def self.save(words)
    formatted = words.join("\n")
    output_file = File.open('passwords.txt', 'w')
    output_file.write formatted
    output_file.close
  end

end
