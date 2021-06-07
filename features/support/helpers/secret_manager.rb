module AwsSecrets
  def get_secret
    secret_name = 'POC_Backend'
    region_name = 'us-east-1'

    client = Aws::SecretsManager::Client.new(region: region_name)

    begin
      get_secret_value_response = client.get_secret_value(secret_id: secret_name)
    rescue Aws::SecretsManager::Errors::DecryptionFailure => e
      # Secrets Manager can't decrypt the protected secret text using the provided KMS key.
      # Deal with the exception here, and/or rethrow at your discretion.
      raise
    rescue Aws::SecretsManager::Errors::InternalServiceError => e
      # An error occurred on the server side.
      # Deal with the exception here, and/or rethrow at your discretion.
      raise
    rescue Aws::SecretsManager::Errors::InvalidParameterException => e
      # You provided an invalid value for a parameter.
      # Deal with the exception here, and/or rethrow at your discretion.
      raise
    rescue Aws::SecretsManager::Errors::InvalidRequestException => e
      # You provided a parameter value that is not valid for the current state of the resource.
      # Deal with the exception here, and/or rethrow at your discretion.
      raise
    rescue Aws::SecretsManager::Errors::ResourceNotFoundException => e
      # We can't find the resource that you asked for.
      # Deal with the exception here, and/or rethrow at your discretion.
      raise
    else
      # This block is ran if there were no exceptions.

      # Decrypts secret using the associated KMS CMK.
      # Depending on whether the secret is a string or binary, one of these fields will be populated.
      if get_secret_value_response.secret_string
        JSON.parse(get_secret_value_response.secret_string)
      else
        decoded_binary_secret = Base64.decode64(get_secret_value_response.secret_binary)
        JSON.parse(get_secret_value_response.secret_string)
      end
    end
  end
end

World AwsSecrets

