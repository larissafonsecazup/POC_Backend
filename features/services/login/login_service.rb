class LoginService
  include HTTParty
  base_uri CONFIG['base_url']
  format :json
  headers "Content-Type" => "application/json"

  def initialize_body(username, password)
    json = JSON.parse(File.read('./features/contracts/Login/login_body.json'))
    json["username"] = username
    json["password"] = password
    @body = json.to_json
  end

  def do_login()
    self.class.post("#{$login_resource}",:body => @body)
  end
end