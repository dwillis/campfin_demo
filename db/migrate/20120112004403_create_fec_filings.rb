class CreateFecFilings < ActiveRecord::Migration
  def change
    create_table :fec_filings do |t|
      t.string :committee_name
      t.date :date_coverage_from
      t.date :date_coverage_to
      t.string :committee_id
      t.string :report_title
      t.string :fec_uri
      t.string :form_type
      t.boolean :amended
      t.string :amended_uri
      t.boolean :original_filing
      t.string :original_uri
      t.boolean :paper

      t.timestamps
    end
  end
end
