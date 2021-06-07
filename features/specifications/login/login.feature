#language: pt
  #utf-8
  @login
  Funcionalidade: testar o fluxo de login

    @login_sucesso
    Cenário: Login com informações corretas
      Quando chamar realizar o login com o usuário "username_1" e a senha "password_1"
      Então recebo o código de retorno "200"

    @login_incorreto
    Cenário: Login com informações corretas
      Quando chamar realizar o login com o usuário "wrong" e a senha "wrong"
      Então recebo o código de retorno "401"

    @user_enumeration
    Cenário: Login com informações corretas
      Quando chamar realizar o login com o usuário "username_1" e a senha "wrong"
      Então recebo o código de retorno "401"