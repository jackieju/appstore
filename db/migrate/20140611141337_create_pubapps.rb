class CreatePubapps < ActiveRecord::Migration
  def self.up
    create_table :pubapps do |t|
        t.string :appid
        t.string :name
        t.string :desc
        t.integer :uid
        t.string :ver
        t.text  :prop
        t.integer :type
        t.integer :cat1
        t.integer :cat2
        t.integer :cat3
        
      t.timestamps
    end
    
    add_index(:pubapps, ["appid"], {:unique=>true})
    add_index(:pubapps, ["name"], {:unique=>true})
  end

  def self.down
    drop_table :pubapps
  end
end
