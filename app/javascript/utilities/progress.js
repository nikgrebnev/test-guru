document.addEventListener('turbolinks:load', function() {
    var progressbar = document.querySelector('.progress-js-bar')
    var dataprogress = document.querySelector('.progress-value')

    if(progressbar && dataprogress) {
        var progress_val = dataprogress.dataset.progress
        progressbar.style = "width: " + progress_val + "%"
        console.log(progress_val)
    }
})
