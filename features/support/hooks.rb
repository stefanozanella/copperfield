After('@database_hit') do |scenario|
  @db.drop_table *@db.tables
  @db.disconnect
end
