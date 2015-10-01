class Zoki < Restaurant

  def initialize
    @page_url = nil
    @name = "Zoki"
  end

  def menu
    [
      {text: "čevapi 5"},
      {text: "čevapi 10"},
      {text: "čevapi špikani 5"},
      {text: "čevapi špikani 10"},
      {text: "pleskavica"},
      {text: "pleskavica špikana"},
      {text: "prebranac"},
      {text: "vješalica"},
      {text: "mešano na žaru"},
      {text: "suđukice"},
      {text: "lepinja"},
      {text: "šoPska solata"},
      {text: "priloge: ajvar, čebula, kajmak"}
    ]
  end

end
