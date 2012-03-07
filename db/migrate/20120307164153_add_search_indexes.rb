class AddSearchIndexes < ActiveRecord::Migration
  def up
    execute "
    create index documentations_paper_excerpt_index on documentations using gin(to_tsvector('english', paper_excerpt));
    create index theses_title_index on theses using gin(to_tsvector('english', title));
    create index people_last_index on people using gin(to_tsvector('english', last));
    create index people_first_index on people using gin(to_tsvector('english', first));"
  end

  def down
    execute "
    drop index documentations_paper_excerpt_index;
    drop index theses_title_index;
    drop index people_last_index;
    drop index people_first_index;"
  end
end
