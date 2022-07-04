document.addEventListener('DOMContentLoaded', () => {
    const cardArray = [
        { name: 'img1', img: 'images/img1.png'},
        { name: 'img1', img: 'images/img1.png'},
        { name: 'img2', img: 'images/img2.png'},
        { name: 'img2', img: 'images/img2.png'},
        { name: 'img3', img: 'images/img3.png'},
        { name: 'img3', img: 'images/img3.png'},
        { name: 'img4', img: 'images/img4.png'},
        { name: 'img4', img: 'images/img4.png'},
        { name: 'img5', img: 'images/img5.png'},
        { name: 'img5', img: 'images/img5.png'},
        { name: 'img6', img: 'images/img6.png'},
        { name: 'img6', img: 'images/img6.png'},
        { name: 'img7', img: 'images/img7.png'},
        { name: 'img7', img: 'images/img7.png'},
        { name: 'img9', img: 'images/img9.png'},
        { name: 'img9', img: 'images/img9.png'},

        { name: 'img1', img: 'images/img1.png'},
        { name: 'img1', img: 'images/img1.png'},
        { name: 'img2', img: 'images/img2.png'},
        { name: 'img2', img: 'images/img2.png'},
        { name: 'img3', img: 'images/img3.png'},
        { name: 'img3', img: 'images/img3.png'},
        { name: 'img4', img: 'images/img4.png'},
        { name: 'img4', img: 'images/img4.png'},
        { name: 'img5', img: 'images/img5.png'},
        { name: 'img5', img: 'images/img5.png'},
        { name: 'img6', img: 'images/img6.png'},
        { name: 'img6', img: 'images/img6.png'},
        { name: 'img7', img: 'images/img7.png'},
        { name: 'img7', img: 'images/img7.png'},
        { name: 'img9', img: 'images/img9.png'},
        { name: 'img9', img: 'images/img9.png'},

        { name: 'img1', img: 'images/img1.png'},
        { name: 'img1', img: 'images/img1.png'},
        { name: 'img2', img: 'images/img2.png'},
        { name: 'img2', img: 'images/img2.png'},
        { name: 'img3', img: 'images/img3.png'},
        { name: 'img3', img: 'images/img3.png'},
        { name: 'img4', img: 'images/img4.png'},
        { name: 'img4', img: 'images/img4.png'},
        { name: 'img5', img: 'images/img5.png'},
        { name: 'img5', img: 'images/img5.png'},
        { name: 'img6', img: 'images/img6.png'},
        { name: 'img6', img: 'images/img6.png'},
        { name: 'img7', img: 'images/img7.png'},
        { name: 'img7', img: 'images/img7.png'},
        { name: 'img9', img: 'images/img9.png'},
        { name: 'img9', img: 'images/img9.png'},

        { name: 'img1', img: 'images/img1.png'},
        { name: 'img1', img: 'images/img1.png'},
        { name: 'img2', img: 'images/img2.png'},
        { name: 'img2', img: 'images/img2.png'},
        { name: 'img3', img: 'images/img3.png'},
        { name: 'img3', img: 'images/img3.png'},
        { name: 'img4', img: 'images/img4.png'},
        { name: 'img4', img: 'images/img4.png'},
        { name: 'img5', img: 'images/img5.png'},
        { name: 'img5', img: 'images/img5.png'},
        { name: 'img6', img: 'images/img6.png'},
        { name: 'img6', img: 'images/img6.png'},
        { name: 'img7', img: 'images/img7.png'},
        { name: 'img7', img: 'images/img7.png'},
        { name: 'img9', img: 'images/img9.png'},
        { name: 'img9', img: 'images/img9.png'},
    ]

    cardArray.sort(() => 0.5 - Math.random())

    const grid = document.querySelector('.grid')
    const resultDisplay = document.querySelector('#result')
    var cardsChosen = []
    var cardsChosenID = []
    var cardsWon = []

    // create board
    function createBoard() {
        for (let i=0;i<cardArray.length;i++) {
            var card = document.createElement('img')
            card.setAttribute('src', 'images/img8.png')
            card.setAttribute('data-id', i)
            card.addEventListener('click', flipCard)
            grid.appendChild(card)
        }
    }

    // check for matches
    function checkForMatch() {
        var cards = document.querySelectorAll('img')
        const optionOneID = cardsChosenID[0]
        const optionTwoID = cardsChosenID[1]
        if (cardsChosen[0] === cardsChosen[1] && optionOneID !== optionTwoID) {
            cards[optionOneID].setAttribute('src', 'images/img10.png')
            cards[optionTwoID].setAttribute('src', 'images/img10.png')
            cardsWon.push(cardsChosen)
        } else {
            cards[optionOneID].setAttribute('src', 'images/img8.png')
            cards[optionTwoID].setAttribute('src', 'images/img8.png')
        }
        cardsChosen = []
        cardsChosenID = []
        resultDisplay.textContent = cardsWon.length
        if (cardsWon.length === cardArray.length/2) {
            resultDisplay.textContent = 'Congratulations! You found them all!'
        }
    }

    //flip card
    function flipCard() {
        var cardID = this.getAttribute('data-id')
        cardsChosen.push(cardArray[cardID].name)
        cardsChosenID.push(cardID)
        this.setAttribute('src', cardArray[cardID].img)
        if (cardsChosen.length === 2) {
            setTimeout(checkForMatch, 500)
        }
    }


    createBoard()
});