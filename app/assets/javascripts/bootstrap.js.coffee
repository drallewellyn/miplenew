jQuery ->
  $(document).ready ->
    $("a[rel~=popover], .has-popover").popover()
    $("a[rel~=tooltip], .has-tooltip").tooltip()

$container = $('#masonry-container')
# initialize Isotope
$container.isotope
  resizable: false
  masonry: columnWidth: $container.width() / 5
# update columnWidth on window resize
$(window).smartresize ->
  $container.isotope masonry: columnWidth: $container.width() / 5
  return
