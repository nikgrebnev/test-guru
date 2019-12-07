document.addEventListener('turbolinks:load', function() {
    var timeLeftObject = document.querySelector('.time-left')

    if (timeLeftObject) {
        setInterval(checkTestTime, 1000);
    }
})

function checkTestTime(){
    var timeLeftObject = document.querySelector('.time-left')

    var timeLeft = timeLeftObject.dataset.timeLeft
    var redirectUrl = timeLeftObject.dataset.redirectUrl
    var timeLeftShow = document.querySelector('.time-left-show')


//    console.log('time left =' + timeLeft)
//    console.log('redirect Url =' + redirectUrl)
    if(timeLeft <= 0){
        document.location.href = redirectUrl
    }
    timeLeftShow.textContent = timeLeftObject.dataset.timeLeft
    timeLeftObject.dataset.timeLeft -= 1

}