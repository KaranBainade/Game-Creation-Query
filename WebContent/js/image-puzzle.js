var timerFunction;

var imagePuzzle = {
    stepCount: 0,
    startTime: new Date().getTime(),
    startGame: function (images, gridSize) {
        this.setImage(images, gridSize);
        $('#playPanel').show();
        $('#sortable').randomize();
        this.enableSwapping('#sortable li');
        this.stepCount = 0;
        this.startTime = new Date().getTime();
        this.tick();
    },
    tick: function () {
        var now = new Date().getTime();
        var elapsedTime = parseInt((now - imagePuzzle.startTime) / 1000, 10);
        var time = $('#timerPanel').text(elapsedTime);
        //console.log(' Time :: '+elapsedTime)
        timerFunction = setTimeout(imagePuzzle.tick, 1000);
    },
    enableSwapping: function (elem) {
        $(elem).draggable({
            snap: '#droppable',
            snapMode: 'outer',
            revert: "invalid",
            helper: "clone"
        });
        $(elem).droppable({
            drop: function (event, ui) {
                var $dragElem = $(ui.draggable).clone().replaceAll(this);
                $(this).replaceAll(ui.draggable);

                currentList = $('#sortable > li').map(function (i, el) { return $(el).attr('data-value'); });
                if (isSorted(currentList))
                    $('#actualImageBox').empty().html($('#gameOver').html());
                	//$('#actualImageBox').empty().html($('#gameOver').html($('#feedBackComment').html()));
                else {
                    var now = new Date().getTime();
                    imagePuzzle.stepCount++;
                    var x = $('.stepCount').text(imagePuzzle.stepCount);
                    var y = $('.timeCount').text(parseInt((now - imagePuzzle.startTime) / 1000, 10));
                    
                    
                    //console.log(" stepCount :: "+$(".stepCount").val()+" Time count ::  "+$(".timeCount").val());
                }

                imagePuzzle.enableSwapping(this);
                imagePuzzle.enableSwapping($dragElem);
            }
        });
    },

    setImage: function (images, gridSize) {
        //console.log(gridSize);
        gridSize = gridSize || 4; // If gridSize is null or not passed, default it as 4.
       // console.log(gridSize);
        var percentage = 100 / (gridSize - 1);
        var image = images[Math.floor(Math.random() * images.length)];
        
        $('#imgQuestion').html(image.question);//to add question dynamically
        $('#imgTitle').html(image.title);
        $('#actualImage').attr('src', image.src);
        $('#sortable').empty();
        for (var i = 0; i < gridSize * gridSize; i++) {
            var xpos = (percentage * (i % gridSize)) + '%';
            var ypos = (percentage * Math.floor(i / gridSize)) + '%';
            var li = $('<li class="item" data-value="' + (i) + '"></li>').css({
                'background-image': 'url(' + image.src + ')',
                //'background-size': (gridSize * 100) + '%',
                'background-size':'auto',
                'background-position': xpos + ' ' + ypos,
                'width': 501 / gridSize,
                'height': 699 / gridSize,
                 'border': '1px solid rgb(36, 33, 33)',
            	'box-sizing': 'border-box'
                
            });
            $('#sortable').append(li);
        }
        $('#sortable').randomize();
    }
};

function isSorted(arr) {
    for (var i = 0; i < arr.length - 1; i++) {
        if (arr[i] != i)
            return false;
    }
    return true;
}
$.fn.randomize = function (selector) {
    var $elems = selector ? $(this).find(selector) : $(this).children(),
        $parents = $elems.parent();

    $parents.each(function () {
        $(this).children(selector).sort(function () {
            return Math.round(Math.random()) - 0.5;
        }).remove().appendTo(this);
    });
    return this;
};