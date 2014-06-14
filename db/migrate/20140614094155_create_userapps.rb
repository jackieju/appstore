class CreateUserapps < ActiveRecord::Migration
  def self.up
    create_table :userapps do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :userapps
  end
end
