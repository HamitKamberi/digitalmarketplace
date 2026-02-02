class InternshipContactsController < ApplicationController
  before_action :authenticate_user!
  skip_authorization_check

  def index
    @contacts_by_country = {
      "Germany" => {
        flag: "🇩🇪",
        contacts: [
          { name: "Hans Mueller", email: "hans.mueller@example.com", phone: "+49 30 1234567" },
          { name: "Anna Schmidt", email: "anna.schmidt@example.com", phone: "+49 30 1234568" }
        ]
      },
      "North Macedonia" => {
        flag: "🇲🇰",
        contacts: [
          { name: "Hamit Kamberi", email: "hamit.kamberi@example.com", phone: "+389 2 3456789" },
          { name: "Dardan Hoxha", email: "dardan.hoxha@example.com", phone: "+389 2 3456790" }
        ]
      },
      "France" => {
        flag: "🇫🇷",
        contacts: [
          { name: "Pierre Dupont", email: "pierre.dupont@example.com", phone: "+33 1 42 34 56 78" },
          { name: "Marie Laurent", email: "marie.laurent@example.com", phone: "+33 1 42 34 56 79" }
        ]
      },
      "Sweden" => {
        flag: "🇸🇪",
        contacts: [
          { name: "Erik Andersson", email: "erik.andersson@example.com", phone: "+46 8 123 45 67" },
          { name: "Sofia Bergman", email: "sofia.bergman@example.com", phone: "+46 8 123 45 68" }
        ]
      },
      "Portugal" => {
        flag: "🇵🇹",
        contacts: [
          { name: "João Silva", email: "joao.silva@example.com", phone: "+351 21 123 4567" },
          { name: "Carla Oliveira", email: "carla.oliveira@example.com", phone: "+351 21 123 4568" }
        ]
      },
      "Poland" => {
        flag: "🇵🇱",
        contacts: [
          { name: "Krzysztof Nowak", email: "krzysztof.nowak@example.com", phone: "+48 22 123 4567" },
          { name: "Magdalena Kowalski", email: "magdalena.kowalski@example.com", phone: "+48 22 123 4568" }
        ]
      },
      "Latvia" => {
        flag: "🇱🇻",
        contacts: [
          { name: "Janis Ozols", email: "janis.ozols@example.com", phone: "+371 67 234 567" },
          { name: "Ingrid Berzina", email: "ingrid.berzina@example.com", phone: "+371 67 234 568" }
        ]
      },
      "Spain" => {
        flag: "🇪🇸",
        contacts: [
          { name: "Carlos García", email: "carlos.garcia@example.com", phone: "+34 91 123 4567" },
          { name: "Isabel Rodriguez", email: "isabel.rodriguez@example.com", phone: "+34 91 123 4568" }
        ]
      },
      "Switzerland" => {
        flag: "🇨🇭",
        contacts: [
          { name: "Peter Müller", email: "peter.muller@example.com", phone: "+41 44 123 4567" },
          { name: "Sophie Schmid", email: "sophie.schmid@example.com", phone: "+41 44 123 4568" }
        ]
      }
    }
  end
end
