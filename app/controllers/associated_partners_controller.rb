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
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        },
        {
          name: "Partner 2 Germany",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        },
        {
          name: "Partner 2 Germany",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        }
      ],
      "North Macedonia" => [
        {
          name: "Partner 1 Macedonia",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        }
      ],
      "France" => [
        {
          name: "Partner 1 France",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        },
        {
          name: "Partner 2 France",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        },
        {
          name: "Partner 3 France",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        }
      ],
      "Sweden" => [
        {
          name: "Partner 1 Sweden",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        }
      ],
      "Portugal" => [
        {
          name: "Partner 1 Portugal",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        },
        {
          name: "Partner 2 Portugal",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        }
      ],
      "Poland" => [
        {
          name: "Partner 1 Poland",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        },
        {
          name: "Partner 2 Poland",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        }
      ],
      "Latvia" => [
        {
          name: "Partner 1 Latvia",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description."
        }
      ],
      "Spain" => [
        {
          name: "Partner 1 Spain",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        },
        {
          name: "Partner 2 Spain",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        }
      ],
      "Switzerland" => [
        {
          name: "Partner 1 Switzerland",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        }
      ]
    }
  end
end
