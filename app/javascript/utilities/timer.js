document.addEventListener('turbolinks:load', function() {
    var timeLeftObject = document.querySelector('.time-left')

    if (timeLeftObject) {
        var redirectUrl = timeLeftObject.dataset.redirectUrl
        var timeLeftShow = document.querySelector('.time-left-show')
        setInterval(checkTestTime, 1000, timeLeftObject, redirectUrl, timeLeftShow);
    }
})

function checkTestTime(timeLeftObject, redirectUrl, timeLeftShow){
    var timeLeft = timeLeftObject.dataset.timeLeft

    console.log('time left =' + timeLeft)
    console.log('redirect Url =' + redirectUrl)
    if(timeLeft <= 0){
        document.location.href = redirectUrl
    }
    timeLeftShow.textContent = timeLeftObject.dataset.timeLeft
    timeLeftObject.dataset.timeLeft -= 1
}