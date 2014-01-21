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
      name: "Alex Hertz"
      portrait: "https://0.gravatar.com/avatar/a128174635f04408ff842a9254d8a6e3?d=https%3A%2F%2Fidenticons.github.com%2Fbe3005ccfafec1f154717e6337e05192.png&r=x&s=440"
      position: "UI/UX Designer"
      company:
        name: "Alex Hertz"
        link: "http://designbyah.com/"
      presentation: "Alex is going to cover designing in the browser: tools, techniques, and ways to work around common headaches starting out."
      social:
        twitter: "http://twitter.com/alhertz"
        github: "https://github.com/alhertz"
    },
    {
      name: "Dominique Saulet"
      portrait: "https://2.gravatar.com/avatar/cff3d645f15e1ecb35d9b9f831bd1c68?d=https%3A%2F%2Fidenticons.github.com%2F699bc5204a45bad88dc353c2f79ec710.png&r=x&s=440"
      position: "Manager of Software Development"
      company:
        name: "iSeatz"
        link: "http://www.iseatz.com/"
      presentation: "Dom will show us how to use specialized and complementary tools to maximize time and effort when building software prototypes."
      social:
        twitter: "http://twitter.com/neuronicnobody"
        github: "http://github.com/neuronicnobody"
    },
    {
      name: "Torrie Adams"
      portrait: "https://pbs.twimg.com/profile_images/3676691656/0df548a94594627177c27e4be7c3a22d.jpeg"
      position: "Product Manager"
      company:
        name: "Kickboard"
        link: "http://www.kickboardforteachers.com/"
      presentation: "Torrie will walk us through usability horror stories and best practices for making front-ends that even the most idiotic of users can navigate."
      social:
        twitter: "http://twitter.com/clearlytorrie"
    }    
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html