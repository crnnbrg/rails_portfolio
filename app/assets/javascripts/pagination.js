$(document).ready(function() {
  $("body").on("click", "#old_projects .pagination a", function(e) {
    e.preventDefault()
    $.getScript(this.href);
    return false
  })
})
