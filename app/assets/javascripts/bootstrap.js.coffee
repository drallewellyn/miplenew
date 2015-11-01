jQuery ->
  $(document).ready ->
    $("a[rel~=popover], .has-popover").popover()
    $("a[rel~=tooltip], .has-tooltip").tooltip()

$ ->
  $('#masonry-container').imagesLoaded ->
    $('#masonry-container').masonry-item
      itemSelector: '.masonry-well'
      isFitWidth: true
