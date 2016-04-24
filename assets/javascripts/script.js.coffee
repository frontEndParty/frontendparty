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
      name: "Marc Cenac"
      portrait: "https://avatars1.githubusercontent.com/u/547446?v=3&s=400"
      presentation: "MQTT is a lightweight pub/sub messaging protocol designed for Internet of Things (IoT) devices and low-bandwidth, high-latency or unreliable networks.  It runs on top of the TCP/IP networking stack and since we cannot open a TCP connection directly from the browser, I'll show an example Javascript client connecting to an MQTT broker over WebSockets."
      social:
        github: "https://github.com/marcusthebrown"
    },
    {
      name: "Emily Ashley"
      portrait: "https://avatars3.githubusercontent.com/u/15912063?v=3&s=400"
      presentation: "5 minute overview of the Anatomy of a Webmap and tools available to make them sparkle. We'll end with a super-quick tutorial on leaflet.js - the leading open-source JavaScript library for mobile-friendly interactive maps. Beginner friendly! "
      social:
        github: "https://github.com/emilyashley"
    },
    {
      name: "Jay Bienvenu"
      portrait: "https://avatars0.githubusercontent.com/u/5308164?v=3&s=400"
      presentation: "An introduction and overview on Aurelia, a new framework for single-page web applications."
      social:
        github: "https://github.com/jbnv"
    },
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
