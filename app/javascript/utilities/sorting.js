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

document.addEventListener('turbolinks:load', function() {
    var control = document.querySelector('.sort-by-title')

    if(control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
    var table = document.querySelector('table')

    // NodeList
    // https://developer.mozilla.org/ru/docs/Web/API/NodeList
    var rows = table.querySelectorAll('tr')
    var sortedRows = []

    //select all table rows except the first one which is the header
    for (var i = 1; i < rows.length; i++) {
        sortedRows.push(rows[i])
    }

    if(this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc)
        this.querySelector('.octicon-arrow-up').classList.remove('hide')
        this.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
        sortedRows.sort(compareRowsDesc)
        this.querySelector('.octicon-arrow-up').classList.add('hide')
        this.querySelector('.octicon-arrow-down').classList.remove('hide')
    }

    var sortedTable = document.createElement('table')

    sortedTable.classList.add('table')
    sortedTable.appendChild(rows[0])

    for (var i = 0; i < sortedRows.length; i++) {
        sortedTable.appendChild(sortedRows[i])
    }

    table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
    var testTitle1 = row1.querySelectorAll('td')[2].textContent
    var testTitle2 = row2.querySelectorAll('td')[2].textContent

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0

}

function compareRowsDesc(row1, row2) {
    var testTitle1 = row1.querySelectorAll('td')[2].textContent
    var testTitle2 = row2.querySelectorAll('td')[2].textContent

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0

}