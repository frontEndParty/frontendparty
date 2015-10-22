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
      name: "Jacqui Nelson"
      portrait: ""
      position: "Application Developer"
      company:
        action: "at"
        name: "Mudbug Media"
        link: "https://www.mudbugmedia.com/"
      presentation: "What is jQuery? How does jQuery relate to JavaScript? When should or shouldn't one use it? This introduction to jQuery will answer these basic questions and more."
      social:
        github: "https://github.com/SpaceOtterInSpace"
        twitter: "https://twitter.com/spaceotterin"
    },
    {
      name: "Greg"
      portrait: ""
      position: "Beast Master"
      company:
        action: "at"
        name: "Etufé LLC"
        link: "http://etufe.com/"
      presentation: "Learn what Meteor means for frontend development. Write your front end and back end at the same time."
      social:
        github: "https://github.com/itsgreggreg"
        twitter: ""
    },
    {
      name: "Dionne Grayson"
      portrait: ""
      position: "Design Mentor"
      company:
        action: "at"
        name: "Young Creative Agency"
        link: "http://youngcreativeagency.org/"
      presentation: "Delight and Inspire."
      social:
        github: ""
        twitter: "https://twitter.com/djpunchntag"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
