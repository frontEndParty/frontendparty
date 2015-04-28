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
      name: "Kurtis Rainbolt-Greene"
      portrait: "https://pbs.twimg.com/profile_images/498698236240994305/FJObh3bl.jpeg"
      position: "Ruby Artisan"
      company:
        action: "that works at"
        name: "Difference Engineers"
        link: "http://www.kurtisrainboltgreene.name"
      presentation: "Kurtis will talk all about HTML5 and give us an introduction into HTML5 semantics and history."
      social:
        github: "http://github.com/krainboltgreene"
        twitter: "http://twitter.com/krainboltgreene"
    },
    {
      name: "Marc Cenac"
      portrait: "https://pbs.twimg.com/profile_images/76358438/BG_-_Marc1.jpg"
      position: "Software Engineer"
      company:
        action: "that works at"
        name: "Unified Social"
        link: "http://www.unifiedsocial.com/"
      presentation: "Marc will go overview the basics of OAuth including a little history and different types of Oauth implementations to give you a better understanding of how OAuth works and how you can use it."
      social:
        twitter: "https://twitter.com/marcusthebrown"
        github: "https://github.com/marcusthebrown"
    },
    {
      name: "Bryan Joseph"
      portrait: "https://pbs.twimg.com/profile_images/465494740553592832/qXJ0j7vO.jpeg"
      position: "Senior Developer"
      company:
        action: "that works at"
        name: "Surge"
        link: "http://www.surgeforward.com/"
      presentation: "Brian gives us a peek into how to compile a language to JavaScript, compilation process, and the tools needed."
      social:
          twitter: "https://twitter.com/bryanjos"
          github: "https://github.com/bryanjos"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
