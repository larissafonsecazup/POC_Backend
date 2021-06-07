Quando('chamar realizar o login com o usuário {string} e a senha {string}') do |username, password|
  binding.pry()
  username = AwsSecrets.get_secret["username_1"]
  password = AwsSecrets.get_secret["password_1"]
  login = LoginService.new
  login.initialize_body(username, password)
  @response = login.do_login
end

Então('recebo o código de retorno {string}') do |response|
  expect(@response.code).to eq(response)
  log("\n\nO response code foi: #{@response.code}")
  log("\n\nA resposta da requisição: #{@response}")
end