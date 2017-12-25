if Role.count > 0
  puts "Not creating Roles, since the table seems to be complete."
else
  puts 'Creating Roles.'
  %w(admin).each do |role|
    Role.find_or_create_by(name: role)
  end
end

File.open(File.expand_path('../default_users.yml', __FILE__), 'r') do |file|
  YAML::load(file).each do |user_attrs|
    # Clean up user_attrs
    user_attrs.symbolize_keys!
    user_attrs[:admin] = !(
      user_attrs[:admin].nil? ||
      user_attrs[:admin] == '' ||
      user_attrs[:admin] == 'no' ||
      user_attrs[:admin] == 'false' ||
      user_attrs[:admin] == 0
    )
    is_admin = user_attrs.delete(:admin)
    # Create user
    User.find_or_initialize_by(email: user_attrs[:email]) do |u|
      puts "== Creating new user account for #{user_attrs[:name]} <#{user_attrs[:email]}>" << ( is_admin ? ' as admin' : '' )
      # We need to set each attribute individually because encrypted_password cannot be set by mass assignment ...and should remain that way.
      user_attrs.each {|k,v| u[k]=v}
      # We aren't validating these passwords
      u.skip_validation_for :password
      u.save!
      u.roles = [Role.find_by(name: 'admin')] if is_admin
    end
  end
end
