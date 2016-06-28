$ ->
   # $("h1").fitText(1, { maxFontSize: "40px" } )

  tabs = $("[data-tab]")
  stash = $("[data-behavior=stash]")
  mainContainer = $("[data-behavior=main-container]")
  contentContainer = $("[data-behavior=content-container]")

  tabs.click ->
    oldTab = (tabs.filter -> $(this).hasClass('active')).data "tab"
    newTab = $(this).data "tab"

    oldContent = $("[data-content=" + oldTab + "]")
    newContent = $("[data-content=" + newTab + "]")

    tabs.removeClass "active"
    $(this).addClass "active"

    newHeight = newContent.actual("height")

    contentContainer.animate(
      { opacity: 0 },
      300
    ).animate(
      { height: newHeight },
      300,
      ->
        oldContent.hide()
        newContent.show()
    ).animate({
      opacity: 1
    })

  gravatar = (email) ->
    "http://www.gravatar.com/avatar/" + md5(email)

  people = [
    {
      name: "Gant Laborde"
      portrait: "https://avatars1.githubusercontent.com/u/997157?v=3&s=400"
      presentation: "Gant will show us how to handle React Native in a quick and easy manner and will use technologies discussed in past talks to create a React Native quickstarter."
      social:
        github: "https://github.com/gantman"
        twitter: "https://twitter.com/GantLaborde"
    },
    {
      name: "Hannah Rhodes"
      portrait: "https://pbs.twimg.com/profile_images/728299841814585344/B2mW5UAc.jpg"
      presentation: "An insight into the process of visual communication and a challenge to the all-too-common misconception that graphic design is simply an exercise in ‘making things pretty"
      social:
        twitter: "https://twitter.com/hannah__rhodes"
        globe: "http://www.hannah-rhodes.com"
    },
    {
      name: "Flynn Zaiger"
      portrait: "https://pbs.twimg.com/profile_images/3090992312/c05f64452f7cfde08eeff09e9ab9a42e.jpeg"
      presentation: "Making something pretty, and making something effective, are two entirely different things. Flynn will cover how to keep things looking good, while also ensuring there are visual cues and elements that help users know what to click (and why they should click it!)"
      social:
        twitter: "https://twitter.com/flynnzaiger"
        globe: "http://www.onlineoptimism.com"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
