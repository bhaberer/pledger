class Indiegogo < Pledger::Project

  # Hackey method to get all the pledges from indiegogo's lame feed because they
  # don't have an API.
  def self.get_all
    url = "http://www.indiegogo.com/project/partial/#{@project_id}?count=100&partial_name=activity_pledges"
    doc = Nokogiri::HTML(open(url))

    pledges = []
    doc.css('.pledge').each do |pledge|
      begin
        name = pledge.css('.pledge-name span').text
        amount = pledge.css('.pledge-amount .notranslate .currency span').text
        level = pledge.css('.pledge-amount .perk-received').text

        pledges << Pledge.new(name, amount, level)
      end
    end

    return pledges
  end
end
