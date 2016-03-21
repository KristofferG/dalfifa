class RenameHomeToPlayers < ActiveRecord::Migration
  def change
    change_table :players do |t|
    t.rename :home, :goals_f
    t.rename :away, :goals_a
  end
  end
end
