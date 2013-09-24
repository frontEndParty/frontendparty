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
      name: "Brian Berlin & Billy Brown"
      portrait: "https://1.gravatar.com/avatar/25ac4fd8b6595e2b4c12c6621eb44e5b?d=https%3A%2F%2Fidenticons.github.com%2F3ba39e4fbba4fdc9f440d7fa031fefbe.png&s=400"
      position: "Developers"
      company:
        name: "3Coasts"
        link: "http://www.3coasts.com/"
      presentation: "Brian and Billy are going to walk us through their new redesign of 3Coasts.com and give us some insight as their ideas and concepts behind the whole process."
      social:
        twitter: "http://twitter.com/thr33coasts"
        github: "https://github.com/3coasts"
    },
    {
      name: "Brandi Hopkins"
      portrait: "https://si0.twimg.com/profile_images/3570387979/aa10e3d2bf3fee1b5d68d5a291cb85fa.jpeg"
      position: "Copy / Technical Writer"
      company:
        name: "Brandi Hopkins"
        link: "http://brandihopkins.wordpress.com/"
      presentation: "Brandi will talk on unified content strategy to show how to best organize your content and ensure you're always delivering clear and consistent messaging on your site."
      social:
        twitter: "http://twitter.com/bloggerbrandi"
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