module Cedict
  COMMENT_REGEX = /#/
  ENTRY_REGEX = /(\S*) (\S*) \[(.*)\] \/(.*)\//
  BATCH_SIZE = 10000

  def self.load(path="lib/assets/cedict_ts.u8")
    File.foreach(path).each_slice(BATCH_SIZE) do |lines|
      puts "loading #{lines.length} entries"
      ActiveRecord::Base.transaction do
        lines.each do |line|
          next if COMMENT_REGEX =~ line || !(match = ENTRY_REGEX.match(line))
          MandarinWord.create(
            simplified: match[1],
            traditional: match[2],
            pinyin: match[3].from_pinyin,
            pretty_pinyin: match[3].to_pinyin,
            english: match[4]
          )
        end
      end
    end
  end

end
