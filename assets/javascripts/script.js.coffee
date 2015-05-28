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
      name: "Cameron Sampson"
      portrait: "https://avatars0.githubusercontent.com/u/2473115?v=3&s=460"
      position: "Senior Developer"
      company:
        action: "that works at"
        name: "Federated Sample"
        link: "http://www.federatedsample.com"
      presentation: "Forget about CSS preprocessors. PostCSS transforms your CSS during build, letting you enjoy non- vendor-prefixed properties, bleeding-edge CSS4, automagic browser workarounds, and a ton of other features via JavaScript plugins. Now you can have that grass-fed, all-natural CSS you've always wanted."
      social:
        github: "https://github.com/csampson"
    },
    {
      name: "George Mauer"
      portrait: "https://avatars2.githubusercontent.com/u/66150?v=2&s=460"
      position: "Senior Developer"
      company:
        action: "that works at"
        name: "Surge"
        link: "http://www.surgeforward.com"
      presentation: "George will walk us through some of the things he's learned teaching programming to teenagers with Operation Spark. He'll be reviewing the battle-tested teaching strategies he's honed over the past sixth months and cover some stuff you'll wonder why nobody does, some stuff you'll disagree with entirely, and just plain old hard opinions of his. Good times."
      social:
        github: "https://github.com/togakangaroo"
        twitter: "https://twitter.com/togakangaroo"
    }
    # {
    #   name: "Gil Birman"
    #   portrait: "https://avatars0.githubusercontent.com/u/2136203?v=3&s=400"
    #   position: "Developer / Designer"
    #   company:
    #     action: "that works at"
    #     name: "iSeatz"
    #     link: "http://www.iseatz.com"
    #   presentation: "What if I told you that you could build native mobile apps using React? You would probably say \"dang\", right? Gil will be introducing us to React Native, a framework for building native apps using, well, React. Make ready."
    #   social:
    #     github: "https://github.com/gilbox"
    #     twitter: "https://twitter.com/gilboxme"
    # }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
