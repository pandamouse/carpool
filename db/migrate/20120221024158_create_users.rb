class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login,			:null=>false
      t.string :first_name,		:null=>false
      t.string :last_name,		:null=>false
      t.string :email,			:null=>false
      t.string :crypted_password,	:null=>false
      t.string :password_salt,       	:null=>false
      t.string :persistence_token,   :null => false                # required
      t.string :single_access_token, :null => false                # optional, see Authlogic::Session::Params
      t.string :perishable_token,    :null => false                # optional, see Authlogic::Session::Perishability

# Magic columns, just like ActiveRecord's created_at and updated_at. These are automatically maintained by Authlogic if they are present.
t.integer :login_count,         :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
t.integer   :failed_login_count,  :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
t.datetime  :last_request_at                                    # optional, see Authlogic::Session::MagicColumns
t.datetime  :current_login_at                                   # optional, see Authlogic::Session::MagicColumns
t.datetime  :last_login_at                                      # optional, see Authlogic::Session::MagicColumns
t.string    :current_login_ip                                   # optional, see Authlogic::Session::MagicColumns
t.string    :last_login_ip                                      # optional, see Authlogic::Session::MagicColumns
      t.boolean :obsolete,	:default=>false

      t.timestamps
    end
  end
end
