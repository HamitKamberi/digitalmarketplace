class AssociatedPartnersController < ApplicationController
  skip_authorization_check

  def index
    all_partners_data = initialize_partners_data
    @search_query = params[:search].to_s.strip
    
    # Filter partners based on search query
    if @search_query.present?
      @partners_by_country = filter_partners(all_partners_data, @search_query)
    else
      @partners_by_country = all_partners_data
    end
    
    # Remove empty country sections
    @partners_by_country.delete_if { |country, partners| partners.empty? }
  end

  private

  def filter_partners(partners_data, query)
    filtered = {}
    
    partners_data.each do |country, partners|
      filtered[country] = partners.select do |partner|
        partner[:name].downcase.include?(query.downcase) ||
        country.downcase.include?(query.downcase) ||
        partner[:description].downcase.include?(query.downcase)
      end
    end
    
    filtered
  end

  def initialize_partners_data
    {
      "Germany" => [
        {
          name: "Partner 1 Germany",
          logo_url: "https://via.placeholder.com/150?text=Germany+1",
          description: "Leading technology partner in Germany specializing in digital solutions."
        },
        {
          name: "Partner 2 Germany",
          logo_url: "https://via.placeholder.com/150?text=Germany+2",
          description: "Expert consultancy firm providing strategic business solutions."
        },
        {
          name: "Partner 2 Germany",
          logo_url: "https://via.placeholder.com/150?text=Germany+2",
          description: "Expert consultancy firm providing strategic business solutions."
        },
        {
          name: "Partner 2 Germany",
          logo_url: "https://via.placeholder.com/150?text=Germany+2",
          description: "Expert consultancy firm providing strategic business solutions."
        }
      ],
      "North Macedonia" => [
        {
          name: "Partner 1 Macedonia",
          logo_url: "https://vezesharri.com/vsh1.png",
          description: "Innovative startup focused on digital marketplace development."
        }
      ],
      "France" => [
        {
          name: "Partner 1 France",
          logo_url: "https://via.placeholder.com/150?text=France+1",
          description: "Premium service provider with expertise in e-commerce platforms."
        },
        {
          name: "Partner 2 France",
          logo_url: "https://via.placeholder.com/150?text=France+2",
          description: "Creative agency specializing in digital branding and marketing."
        },
        {
          name: "Partner 3 France",
          logo_url: "https://via.placeholder.com/150?text=France+3",
          description: "Technology consulting firm with extensive international experience."
        }
      ],
      "Sweden" => [
        {
          name: "Partner 1 Sweden",
          logo_url: "https://via.placeholder.com/150?text=Sweden+1",
          description: "Nordic innovation hub providing cutting-edge tech solutions."
        }
      ],
      "Portugal" => [
        {
          name: "Partner 1 Portugal",
          logo_url: "https://via.placeholder.com/150?text=Portugal+1",
          description: "Business solutions provider with strong local market presence."
        },
        {
          name: "Partner 2 Portugal",
          logo_url: "https://via.placeholder.com/150?text=Portugal+2",
          description: "Digital transformation specialist for European enterprises."
        }
      ],
      "Poland" => [
        {
          name: "Partner 1 Poland",
          logo_url: "https://via.placeholder.com/150?text=Poland+1",
          description: "Software development and integration services provider."
        },
        {
          name: "Partner 2 Poland",
          logo_url: "https://via.placeholder.com/150?text=Poland+2",
          description: "Full-service digital agency with proven track record."
        }
      ],
      "Latvia" => [
        {
          name: "Partner 1 Latvia",
          logo_url: "https://via.placeholder.com/150?text=Latvia+1",
          description: "Emerging tech company focusing on marketplace innovations."
        }
      ],
      "Spain" => [
        {
          name: "Partner 1 Spain",
          logo_url: "https://via.placeholder.com/150?text=Spain+1",
          description: "Enterprise solutions and consulting firm with Mediterranean focus."
        },
        {
          name: "Partner 2 Spain",
          logo_url: "https://via.placeholder.com/150?text=Spain+2",
          description: "Digital services and infrastructure specialist."
        }
      ],
      "Switzerland" => [
        {
          name: "Partner 1 Switzerland",
          logo_url: "https://via.placeholder.com/150?text=Switzerland+1",
          description: "Premium international consulting and technology services."
        }
      ]
    }
  end
end
