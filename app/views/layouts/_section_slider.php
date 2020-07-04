<section class="slider">
    <div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
            <div class="item"> 
                <img data-src="<?= Yii::$app->urlManager->baseUrl ?>/uploads/frontend/slider/slider.jpg" alt="First slide" src="<?= Yii::$app->urlManager->baseUrl ?>/uploads/frontend/slider/slider.jpg">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Curabitur sollicitudin tellus nulla, non rhoncus </h1>
                        <p>Amet egestas nisi suscipit nec. Cras ac eros viverra, hendrerit dui ut.</p>
                        <p>
                            <a class="btn btn-primary btn-lg" href="#" role="button">get started</a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="item active"> 
                <img data-src="<?= Yii::$app->urlManager->baseUrl ?>/uploads/frontend/slider/slider1.jpg" alt="Second slide" src="<?= Yii::$app->urlManager->baseUrl ?>/uploads/frontend/slider/slider1.jpg">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Metus et placerat venenatis, mauris diam ornare neque </h1>
                        <p>Odio sed lobortis mollis, lacus quam ullamcorper orci, id volutpat dolor erat vel nisl.</p>
                        <p>
                            <a class="btn btn-primary btn-lg" href="#" role="button">get started</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon carousel-control-left"></span>
        </a> 
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon carousel-control-right"></span>
        </a> 
    </div>
</section>