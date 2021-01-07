module Orders
  class OrganizerCreateOrder
    include Interactor::Organizer
  
    organize CreateOrder, ShowLastOrder
  end
end