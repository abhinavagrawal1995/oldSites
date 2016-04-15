class ccLoadingMessage extends MovieClip
{
    var _width, w, _height, h, _xscale, _yscale, _alpha, createEmptyMovieClip, attachMovie;
    function ccLoadingMessage()
    {
        super();
        w = _width;
        h = _height;
        _xscale = 100;
        _yscale = 100;
        _alpha = 0;
        xx = 0;
        yy = 0;
        mask = this.createEmptyMovieClip("mask", 1);
        mask.beginFill(16777215, 30);
        mask.lineStyle(1, 0, 100);
        mask.moveTo(xx, yy);
        mask.lineTo(xx + w, yy);
        mask.lineTo(xx + w, yy + h);
        mask.lineTo(xx, yy + h);
        mask.lineTo(xx, yy);
        mask.endFill();
        this.attachMovie("loaderbar", lb, 2, {_x: 1, _y: 1});
    } // End of the function
    function setPercentage(p)
    {
        this[lb]._xscale = w * p;
    } // End of the function
} // End of Class
