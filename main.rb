require_relative 'functions'

response = menu
while response != '2'
  case response
  when '1' then populate_database
  end

  response = menu
end
