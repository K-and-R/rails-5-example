if Role.count > 0
  puts "Not creating Roles, since the table seems to be complete."
else
  puts 'Creating Roles.'
  %w(admin).each do |role|
    Role.find_or_create_by(name: role)
  end
end
