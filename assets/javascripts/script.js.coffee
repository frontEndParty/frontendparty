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
      name: "Ron Domingue"
      portrait: "https://pbs.twimg.com/profile_images/610855505255206912/Phlo9sKS.jpg"
      position: "Illustrator & Designer"
      company:
        action: "at"
        name: "Ron Domingue"
        link: "http://www.rondomingue.com"
      presentation: "Ron will talk about how the sharing of his personal design projects has lead to bigger and better work and some unexpected opportunities along the way."
      social:
        github: "https://github.com/rondomingue"
        twitter: "https://twitter.com/rondomingue"
    },
    {
      name: "Joe Ellis"
      portrait: "https://pbs.twimg.com/profile_images/477465782679396352/PDIr2leM.png"
      position: "Full Stack Engineer"
      company:
        action: "at"
        name: "Olark"
        link: "http://www.olark.com"
      presentation: "Joe Ellis will talk about Redux (https://github.com/rackt/redux), which is an easier and fun functional Flux / React alternative for creating single page applications."
      social:
        github: "https://github.com/joeellis"
        twitter: "https://twitter.com/notjoeellis"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
