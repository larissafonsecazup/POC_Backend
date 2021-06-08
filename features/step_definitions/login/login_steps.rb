Quando('chamar realizar o login com o usuário {string} e a senha {string}') do |username, password|
  #binding.pry()
  username = get_secret[username]
  password = get_secret[password]
  login = LoginService.new
  login.initialize_body(username, password)
  @response = login.do_login
end

Então('recebo o código de retorno {int}') do |response|
  log("\n\nA resposta da requisição: #{@response}")
  log("\n\nO response code foi: #{@response.code}")
  expect(@response.code).to eq(response)
end