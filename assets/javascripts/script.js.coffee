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
      name: "Brian Berlin"
      portrait: "https://avatars2.githubusercontent.com/u/333595?v=3&s=400"
      position: "Co-Founder"
      company:
        action: "that works at"
        name: "GradSquare"
        link: "http://www.gradsquare.com"
      presentation: "Ampersand.js is a highly modular, loosely coupled, non-frameworky framework. Composed of tiny modules, Ampersand is able to leverage the power of npm and browserify/webpack to build advanced applications, while maximizing simplicity in the increasingly complex world of front-end application development. Learn some conventions and how to harness the flexibility of Ampersand to solve real problems presented by today's web apps."
      social:
        github: "https://github.com/brianberlin"
        twitter: "https://twitter.com/brianberlin"
    },
    {
      name: "Ralph Schindler"
      portrait: "https://pbs.twimg.com/profile_images/596165883040559107/98GYCvRy.jpg"
      position: "Sr. Software Engineer"
      company:
        action: "that works at"
        name: "Offers.com"
        link: "http://offers.com"
      presentation: "We've seen an overview of OAuth2 workflow previously, in this talk we'll look at OAuth2 in practice with a few different technologies at play: A ReactJS+Flux+ReactRouter front-end application, a PHP backend application and authorization courtesy of github.com OAuth2 web browser workflow."
      social:
        github: "https://github.com/ralphschindler"
        twitter: "https://twitter.com/ralphschindler"
    },
    {
      name: "Jay Casteel"
      portrait: "https://pbs.twimg.com/profile_images/532662763290509312/IjkLc2yB.jpeg"
      position: "Lead Developer"
      company:
        action: "that works at"
        name: "Skuba Design Studio"
        link: "http://skubadesign.com"
      presentation: "We will explore discovery phase UX documentation and when it's appropriate for a project. Also we will examine how to build solid User Personas, User Journeys and Task Grids that will inform a strong UI over a project lifecycle."
      social:
        twitter: "https://twitter.com/jay_casteel"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
