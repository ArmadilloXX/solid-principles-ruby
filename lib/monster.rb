class Monster
  attr_reader :toughness, :damage, :notice, :gold, :exp

  def initialize (attr = {})
    @toughness = attr[:toughness]
    @damage = attr[:damage]
    @notice = attr[:notice]
    @gold = attr[:gold]
    @exp = attr[:exp]
    @dead = false
  end

  def dead?
    @dead
  end

  def kill
    @dead = true
  end
  
end