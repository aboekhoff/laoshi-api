class MandarinWord < ActiveRecord::Base
  def self.search(query, mode)
    case mode
    when 'english'
      MandarinWord.where('english like ? or english like ?', "#{query}", "%#{query}%").limit(25)
    when 'chinese'
      raise "not implemented"
    else
      raise "invalid search mode"
    end
  end

end
