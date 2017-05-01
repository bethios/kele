require 'httparty'
require 'json'
require 'roadmap'

class Kele
  include HTTParty
  include Roadmap

  base_uri "https://www.bloc.io/api/v1/"

  def initialize(email, password)
    response = self.class.post(api_url("sessions"), body: { email: email, password: password })
    raise 'Invalid email or password' if response.code == 404
    @auth_token = response["auth_token"]

  end

  def get_me
    # my id 24534
    response = self.class.get(api_url("users/me"), headers: { "authorization" => @auth_token })
    @user = JSON.parse(response.body)
    @user_id = @user["current_enrollment"]["id"]
  end

  def get_mentor_availability(mentor_id)
    # caila's mentor id 2348651
    response = self.class.get(api_url("mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token }).to_a
    available = []
    response.each do |timeslot|
      if timeslot["booked"] == nil
        available.push(timeslot)
      end
    end
    puts available
  end

  def get_messages(page = 'all')
    if page == 'all'
      response = self.class.get(api_url("message_threads"), headers: { "authorization" => @auth_token})
    else
      response = self.class.get(api_url("message_threads?page=#{page}"), headers: { "authorization" => @auth_token })
    end

    @messages = JSON.parse(response.body)
  end

  def create_message(sender_email, recipient_id, stripped_text, subject )
    response = self.class.post(api_url("messages"), headers: { "authorization" => @auth_token },
               body: { sender: sender_email, recipient_id: recipient_id, stripped_text: stripped_text, subject: subject })
    response.success? puts "message sent!"
  end

  private

  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end

end
