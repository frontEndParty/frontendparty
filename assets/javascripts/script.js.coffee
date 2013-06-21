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
      portrait: "http://a0.twimg.com/profile_images/2540530485/me2.png"
      position: "Developer"
      company:
        name: "iSeatz"
        link: "http://www.iseatz.com/"
      presentation: "Cameron will dive into the CSS spec and show us the secrets and ideas behind understanding the CSS Visual Formatting Model."
      social:
        twitter: "http://twitter.com/vaerros"
        github: "http://github.com/csampson"
    },
    {
      name: "Lee Martin"
      portrait: gravatar "hi@leemartin.com"
      position: "Lead Everything"
      company:
        name: "Lee Martin"
        link: "http://www.leemartin.com/"
      presentation: "Having built sites for the biggest names in rock, Lee gives us a tour of his most useful tricks surrounding server-side image processing."
      social:
        twitter: "http://twitter.com/leemartin"
        facebook: "https://www.facebook.com/pages/Lee-Martin/201792563187610"
    },
    {
      name: "Dylan Staley"
      portrait: gravatar "staley.dylan@gmail.com"
      position: "Digital Product Development Lead"
      company:
        name: "Baton Rouge Business Report"
        link: "http://www.businessreport.com"
      presentation: "Dylan will show us the magic of static site generation, and how you can build a simple (but powerful!) content-management system with Prose.io and GitHub."
      social:
        twitter: "http://twitter.com/dstaley"
        github: "http://github.com/dstaley"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html