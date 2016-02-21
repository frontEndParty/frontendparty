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
      name: "Paul Christmann"
      portrait: "https://pbs.twimg.com/profile_images/51654869/Photo_2.jpg"
      position: "Software Engineer That Does Things"
      company:
        action: "at"
        name: "Oseberg"
        link: "https://www.oseberg.io"
      presentation: "Paul will talk about Oseberg's journey in replacing his company's old .NET desktop with an Angular / Electron, the lessons learned, and hopefully show off a quick little demo of their current progress."
    },
    {
      name: "Sia Karamalegos"
      portrait: "https://avatars1.githubusercontent.com/u/4777393?v=3&s=400"
      position: "Teacher / CEO"
      company:
        action: "at"
        name: "Tech Talent South/Clio + Calliope"
        link: "http://www.siakaramalegos.github.io"
      presentation: "Sia is going to teach us how to use the power of Bootstrap helper classes to help re-brand a website, including two demos for static and Rails sites."
      social:
        github: "https://github.com/siakaramalegos"
        twitter: "https://twitter.com/thegreengreek"
    },
    {
      name: "Greg (sorry, no one knows Greg's last name)"
      portrait: "https://avatars1.githubusercontent.com/u/6858318?v=3&s=400"
      position: "Freelance Developer"
      presentation: "Greg is going to give us a rundown on Elm, a new front-end programming language, and what it means to program in a 'functionally reactive' way."
      social:
        github: "https://github.com/itsgreggreg/"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
