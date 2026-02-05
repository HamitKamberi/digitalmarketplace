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
      "Germany 🇩🇪" => [
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
      "North Macedonia 🇲🇰" => [
        {
          name: "Vezë Sharri",
          logo_url: "https://vezesharri.com/vsh1.png",
          description: "A local producer focused on high-quality agricultural products and sustainable food production."
        },
        {
          name: "Arbëria Design",
          logo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBAA3Ashhujrml_I8xcA7o5WlU9MLlAlpb1g&s",
          description: "A creative design studio providing graphic design, branding, and visual communication services."
        },
        {
          name: "Unifrigo",
          logo_url: "https://scontent.fskp1-2.fna.fbcdn.net/v/t39.30808-1/463632657_1041592301310891_3075034825132254038_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=102&ccb=1-7&_nc_sid=2d3e12&_nc_ohc=a3qsP9Z3Sz0Q7kNvwF1h3Je&_nc_oc=Adk1dsGQQDytiuCObtjQO33UICLILVoZP29XKhEew5D4ynKM4SzhY6bYKNRKsKqqNAE&_nc_zt=24&_nc_ht=scontent.fskp1-2.fna&_nc_gid=5OfWjiiF8wVuT4RGyVx5-g&oh=00_AfsxlqfjkEpt1jUE1FlvRbaUrj9dLx8Wi9mAZrCxzROrOw&oe=698A5B29",
          description: "A company specializing in refrigeration, cold storage, and temperature-controlled logistics solutions."
        },
        {
          name: "Gostivar Municipality",
          logo_url: "https://gostivari.gov.mk/042/wp-content/uploads/2024/10/logogv-300x99.png",
          description: "A local government authority responsible for public services, local development, and community well-being in the Municipality of Gostivar."
        },
        {
          name: "Center for Development of the Polog Planning Region",
          logo_url: "https://rdcpolog.mk/web/wp-content/uploads/2021/01/old-rdclogo-1.png",
          description: "A regional development body supporting strategic planning, economic growth, and inter-municipal cooperation in the Polog region."
        },
        {
          name: "Foundation Metamorphosis",
          logo_url: "https://metamorphosis.org.mk/wp-content/themes/metamorphosis/assets/images/logo-header_new.svg",
          description: "A civil society organization promoting democracy, digital rights, good governance, and social innovation."
        },
        {
          name: "Center for Equal Opportunities ''Ladybug''",
          logo_url: "https://www.mollekuqja.mk/wp-content/uploads/2024/10/fav.png",
          description: "A non-profit organization working to promote gender equality, social inclusion, and equal opportunities for vulnerable groups."
        },
        {
          name: "Citizens' association INSTITUTE FOR MEDIA AND ANALYTICS IMA Skopje",
          logo_url: "https://ima.mk/wp-content/uploads/2023/11/ima-logo-last-1-1.png",
          description: "A research-oriented civil society organization focused on media analysis, public policy research, and evidence-based advocacy."
        },
      ],
      "France 🇫🇷" => [
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
      "Sweden 🇸🇪" => [
        {
          name: "Partner 1 Sweden",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        }
      ],
      "Portugal 🇵🇹" => [
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
      "Poland 🇵🇱" => [
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
      "Latvia 🇱🇻" => [
        {
          name: "Partner 1 Latvia",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description."
        }
      ],
      "Spain 🇪🇸" => [
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
      "Switzerland 🇨🇭" => [
        {
          name: "Partner 1 Switzerland",
          logo_url: "https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png",
          description: "Description"
        }
      ]
    }
  end
end
