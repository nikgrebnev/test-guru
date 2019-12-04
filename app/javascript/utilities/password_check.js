document.addEventListener('turbolinks:load', function() {
    var control = document.querySelector('.password-check')
    var control1 = document.querySelector('.password-first')

    if(control) { control.addEventListener('input', checkPassword) }
    if(control1) { control1.addEventListener('input', checkPassword) }
})

function checkPassword()
{
    var pwd = document.querySelector('.password-first').value
    var pwd1 = document.querySelector('.password-check').value

    if(pwd1.length > 0)
    {
        if( pwd == pwd1 )
        {
            console.log ('pwd=pwd1')
            document.querySelector('.octicon-alert').classList.add('hide')
            document.querySelector('.octicon-check').classList.remove('hide')
        }else{
            console.log ('pwd != pwd1')
            document.querySelector('.octicon-alert').classList.remove('hide')
            document.querySelector('.octicon-check').classList.add('hide')


        }
    } else {
        console.log ('pwd1 empty')
        document.querySelector('.octicon-alert').classList.add('hide')
        document.querySelector('.octicon-check').classList.add('hide')
    }

}
