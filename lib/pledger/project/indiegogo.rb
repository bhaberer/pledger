module Pledger
  class Indiegogo < Pledger::Project

    # Hackey method to get all the pledges from indiegogo's lame feed because they
    # don't have an API.
    def pledges
      url = "http://www.indiegogo.com/project/partial/#{@project_id}?count=100&partial_name=activity_pledges"
      doc = Nokogiri::HTML(open(url))

      pledges = []
      doc.css('.pledge').each do |pledge|
        begin
          name = pledge.css('.pledge-name span').text
          amount = pledge.css('.pledge-amount .notranslate .currency span').text
          level = pledge.css('.pledge-amount .perk-received').text

          pledges << Pledger::Pledge.new(name, amount, level)
        end
      end

      return pledges
    rescue Timeout::Error, OpenURI::HTTPError
      puts 'Timed out trying to get pledges, retrying...'
      return self.pledges
    end

    def total
      url = "http://www.indiegogo.com/projects/#{@project_id}"
      doc = Nokogiri::HTML(open(url))
      begin
        return doc.css('.money-raised span span span').first.text
      end
    end

  end
end
