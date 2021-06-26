class CreateUrlViews < ActiveRecord::Migration[6.1]
  def change
    create_table :url_views do |t|
      t.references :url, index: true
      t.string :remote_ip
      t.timestamps
    end
  end
end
