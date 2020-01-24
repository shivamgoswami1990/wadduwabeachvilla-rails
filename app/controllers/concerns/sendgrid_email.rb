module SendgridEmail
    include SendGrid
    def send_contact_email(name, email, message)
        require 'sendgrid-ruby'

        data = JSON.parse('{
          "personalizations": [
            {
              "to": [
                {
                  "email": "Shiv.goswami@actewagl.com.au"
                }
              ],
              "dynamic_template_data": {
                "name": "%#{name}%",
                "email": "%#{email}%",
                "message": "%#{message}%"
              }
            }
          ],
          "from": {
            "email": "wadduwabeachvillas@gmail.com",
            "name": "Wadduwa Beach Villas"
          },
          "template_id": "d-d0d04acbc4364a2480709361300863a1"
        }'.gsub('%#{name}%', name).gsub('%#{email}%', email).gsub('%#{message}%', message))
        sg = SendGrid::API.new(api_key: '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')
        begin
          response = sg.client.mail._("send").post(request_body: data)
        rescue Exception => e
          puts e.message
        end
        return response.status_code
      end

      module_function :send_contact_email
end