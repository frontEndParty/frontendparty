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
      name: "Chris Boyd"
      portrait: "https://avatars0.githubusercontent.com/u/127873?s=400"
      position: "Founder"
      company:
        action: "of"
        name: "Apptitude"
        link: "http://apptitudenola.com/"
      presentation: "Chris recently completed a project for the Houston Zoo aimed at kids. He will highlight the different plugins he used for motion including Spritely.net, which enables dynamic character and background animations in pure HTML and JavaScript."
      social:
        twitter: "https://twitter.com/chrisboyddotnet"
        github: "https://github.com/frsh"
    },
    {
      name: "Marc Cenac"
      portrait: "https://avatars0.githubusercontent.com/u/547446?s=400"
      position: "Senior Java Developer"
      company:
        action: "that works at"
        name: "GE Capital"
        link: "http://www.nolajobs.gecapital.com/"
      presentation: "We all know that we need to be better about testing, Marc is going to walk us through how GE implements browser based testing. He will talk through controlling the browser with the WebDriver API and how to harness the new features of TestNG."
      social:
        twitter: "https://twitter.com/marcusthebrown"
        github: "https://github.com/marcusthebrown"
    },
    {
      name: "Alex Dragoset"
      portrait: "https://avatars3.githubusercontent.com/u/1760910?s=400"
      position: "Software Developer"
      company:
        action: "that works at"
        name: "Archon"
        link: "http://archoninfosys.com/"
      presentation: "PostBox is a communication plugin for the popular Knockout.js. Alex is going to highlight how PostBox allows View Models to share data without maintaining direct reference to each other."
      social:
        
        github: "https://github.com/adragoset"
    }
  ]
  console.log people
  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html