module SendgridEmail
    include SendGrid
    def send_contact_email(name, email, message)
        require 'sendgrid-ruby'

        data = {
          "personalizations": [
            {
              "to": [
                {
                  "email": "wadduwabeachvilla@gmail.com"
                },
                {
                  "email": "wadduwabeachvilla@outlook.com"
                },
              ],
              "dynamic_template_data": {
                "name": name,
                "email": email,
                "message": message
              }
            }
          ],
          "from": {
            "email": "wadduwabeachvillas@gmail.com",
            "name": "Wadduwa Beach Villas"
          },
          "template_id": "d-d0d04acbc4364a2480709361300863a1"
        }
        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        begin
          response = sg.client.mail._("send").post(request_body: data)
        rescue Exception => e
          puts e.message
        end
        return response.status_code
      end

      module_function :send_contact_email
end