class CreatePgViewsForSearch < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute <<-SQL
    CREATE VIEW searches AS
      SELECT  theses.id AS searchable_id, theses.title AS term,
              CAST ('Thesis' AS varchar) AS searchable_type 
      FROM theses 
      UNION 
      SELECT  documentations.id AS searchable_id, documentations.paper_excerpt AS term, 
              CAST ('Documentation' AS varchar) AS searchable_type 
      FROM documentations
      UNION 
      SELECT  people.id AS searchable_id, people.last AS term, 
              CAST ('Person' AS varchar) AS searchable_type 
      FROM people
      UNION
      SELECT  people.id AS searchable_id, people.first AS term, 
              CAST ('Person' AS varchar) AS searchable_type 
      FROM people
    SQL
  end

  def down
    ActiveRecord::Base.connection.execute <<-SQL
      DROP VIEW searches
    SQL
  end
end
