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
      500
    ).animate(
      { height: newHeight },
      500,
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
      name: "Nick Noble"
      portrait: "https://0.gravatar.com/avatar/c28b023e2f9dfbd9438843ab9c96c5b1?d=https%3A%2F%2Fidenticons.github.com%2F6813a3c9989d766784ce61be9aa00ed1.png&r=x&s=440"
      position: "Developer"
      company:
        name: "Nick Noble"
        link: "http://lkd.to/nickisnoble"
      presentation: "Nick is going to do an overview of what it means to be a front-end developer and going over his experience in dealing with clients, responsibilities, job titles, and more."
      social:
        twitter: "http://twitter.com/nickisnoble"
        github: "https://github.com/nickisnoble"
    },
    {
      name: "Joe Ellis"
      portrait: "https://0.gravatar.com/avatar/f87a617ecd9bc9f4cd613e420b75c238?d=https%3A%2F%2Fidenticons.github.com%2F3067c356701b93f393f765bed1256bfd.png&r=x&s=440"
      position: "Developer"
      company:
        name: "Audiosocket"
        link: "http://www.audiosocket.com"
      presentation: "Joe is planning on *trying* to live-code as many of CSS layout and styling tricks I've learned over the years and still constantly use, as well as hopefully hit on some newer styling tricks you may not have seen or used before."
      social:
        twitter: "http://twitter.com/notjoeellis"
        github: "http://github.com/joeellis"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html