class CreateCyborgs < ActiveRecord::Migration
  def self.up
    create_table :cyborgs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :cyborgs
  end
end
