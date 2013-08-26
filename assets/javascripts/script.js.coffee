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
      name: "George Mauer"
      portrait: "http://a0.twimg.com/profile_images/1691786596/2011-12-13_16.55.47.jpg"
      position: "Developer Extraordinaire"
      company:
        name: "togakangaroo"
        link: "http://twitter.com/togakangaroo"
      presentation: "George will be presenting on a new Javascript widget he's created to help assisting in preserving state across page components."
      social:
        twitter: "http://twitter.com/togakangaroo"
        github: "http://github.com/togakangaroo"
    },
    {
      name: "Nick Noble"
      portrait: "https://2.gravatar.com/avatar/c28b023e2f9dfbd9438843ab9c96c5b1?d=https%3A%2F%2Fidenticons.github.com%2F6813a3c9989d766784ce61be9aa00ed1.png&s=400"
      position: "Creative Director"
      company:
        name: "Lanyap Creative"
        link: "http://lanyapcreative.com/"
      presentation: "Nick is going to give us an in-depth intro into color theory and understanding how color works in design, on the web, and on your screen."
      social:
        twitter: "http://twitter.com/nickisnoble"
        github: "https://github.com/nickisnoble"
    },
    {
      name: "Mark D'Arensbourg"
      portrait: "http://a0.twimg.com/profile_images/1730242318/marksaw.jpeg"
      position: "Front-End Developer"
      company:
        name: "Archon Information Systems"
        link: "http://archoninfosys.com/"
      presentation: "Mark is going to us the low-down on gruntjs, a fantastic task runner for helping automate repetitive front-end related work."
      social:
        twitter: "http://twitter.com/mdarens"
        github: "http://github.com/mdarens"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html