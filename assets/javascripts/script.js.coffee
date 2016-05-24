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
      name: "Greg Baraghimian"
      portrait: "https://avatars1.githubusercontent.com/u/6858318?v=3&s=400"
      presentation: "Greg will take us through a deeper dive into flexbox - how to implement some common and not-so-common layout patterns."
      social:
        github: "https://github.com/itsgreggreg"
    },
    {
      name: "Cameron Sampson"
      portrait: "https://avatars0.githubusercontent.com/u/2473115?v=3&s=400"
      presentation: "AngularJS v2 is right around the corner. Come and learn about the next major version of the framework and if that Angular v1 app you have laying around will survive into next year (get rekt)."
      social:
        github: "https://github.com/csampson"
        globe: "http://cameronsampson.com"
    },
    {
      name: "Steven Achord"
      portrait: "https://pbs.twimg.com/profile_images/679784710592057344/ZOW39xpn.jpg"
      presentation: "Nowadays most Designers and Developers have something akin to \"UX/UI\" on their LinkedIn profile, but what is UX, really? Steven will explore the skills of great User Experience Designers, the psychology that drives users, how the process looks, and some of the tools involved."
      social:
        twitter: "https://twitter.com/stevenachord"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
