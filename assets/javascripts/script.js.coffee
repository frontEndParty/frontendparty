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
      name: "Cameron Sampson"
      portrait: "http://i.imgur.com/Q7jraJ4.gif?1"
      position: "Senior Developer"
      company:
        action: "at"
        name: "Lucid"
        link: "http://luc.id"
      presentation: "2016 is being called the year of virtual reality. The Oculus Rift, Google Cardboard, Gear VR, and other such devices have the potential to change the way we consume digital content, the web included. Come and learn the basics of WebVR, an early standard for making in-browser VR experiences. GET HYPE."
      social:
        github: "https://github.com/csampson"
        globe: "http://cameronsampson.com"
    },
    {
      name: "George Mauer"
      portrait: "https://avatars2.githubusercontent.com/u/66150?v=2&s=460"
      position: "Senior Developer"
      company:
        action: "at"
        name: "Surge"
        link: "http://www.surgeforward.com"
      presentation: "Everyone loves their model-binding, fluxes, and uni-directional data-flows. But remember the days when good ol' forms were the bee's knees? They can be again! George covers how modern browsers make the humble form a legitimate competitor to all those highfalutin' libraries and such."
      social:
        github: "https://github.com/togakangaroo"
        twitter: "https://twitter.com/togakangaroo"
    },
    {
      name: "Bryan Joseph"
      portrait: "https://pbs.twimg.com/profile_images/653657268030849024/QGbCSidG_400x400.png"
      position: "Senior Developer"
      company:
        action: "at"
        name: "Surge"
        link: "http://www.surgeforward.com"
      presentation: "Bryan goes over options for JavaScript linting using ESLint, as well as covering another code-shaming tool called standard."
      social:
        github: "https://github.com/bryanjos"
        twitter: "https://twitter.com/bryanjos"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
