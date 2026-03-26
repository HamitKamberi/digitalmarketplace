class InternshipContactsController < ApplicationController
  before_action :authenticate_user!
  skip_authorization_check

  def index
    @contacts_by_country = {
      "Germany" => {
        flag: "🇩🇪",
        contacts: [
          { name: "HSO", email: "incomings@hs-offenburg.de" },        
        ]
      },
      "North Macedonia" => {
        flag: "🇲🇰",
        contacts: [
          { name: "SEEU", email: "s.alija@seeu.edu.mk" }
        ]
      },
      "France" => {
        flag: "🇫🇷",
        contacts: [
          { name: "ECAM", email: "exchange@ecam.fr" }
        ]
      },
      "Sweden" => {
        flag: "🇸🇪",
        contacts: [
          { name: "MIUN", email: "chalengeeeu@miun.se" },
        ]
      },
      "Portugal" => {
        flag: "🇵🇹",
        contacts: [
          { name: "UEL", email: "pending ..." },
        ]
      },
      "Poland" => {
        flag: "🇵🇱",
        contacts: [
          { name: "UWM", email: "a.jablonska@uwm.edu.pl" },
        ]
      },
      "Latvia" => {
        flag: "🇱🇻",
        contacts: [
          { name: "LBTU", email: "erasmus@lbtu.lv"}
        ]
      },
      "Spain" => {
        flag: "🇪🇸",
        contacts: [
          { name: "UEV", email: "laura.bertolin@universidadeuropea.es" },
          { email: "isabel.rodriguez@example.com" }
        ]
      },
      "Switzerland" => {
        flag: "🇨🇭",
        contacts: [
          { name: "FHNW", email: "mirjam.schmitz@fhnw.ch "},
        ]
      }
    }
  end
end
