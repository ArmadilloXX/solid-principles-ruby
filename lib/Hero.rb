class Hero
  attr_reader :strength, :health, :stealth, :actions, :exp, :gold

  def initialize(attr = {})
    @strength = attr[:strength] || 3
    @health = attr[:health] || 10
    @stealth = attr[:stealth] || 1
    @actions = attr[:actions] || {}

    own_actions
    @gold = 0
    @exp = 0
    @fled = false
  end

  def own_actions
    @actions.each_pair { |key, action| action.assign_owner(self) }
  end

  def activate_action (action_name, target)
    actions[action_name].activate(target)
  end

  def damage(hit)
    @health -= hit
  end

  def gain_gold(amount)
    @gold += amount
  end

  def gain_exp(amount)
    @exp += amount
  end

  def dead?
    @health <= 0
  end

  def fled?
    @fled
  end

  def flee
    @fled = true
  end

  def reset_flee
    @fled = false
  end


end