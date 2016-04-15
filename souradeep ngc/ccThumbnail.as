class ccThumbnail extends ccGraphicComponentBaseClass
{
    var isloaded, thumbimgw, thumbimgh, thumbimgx, thumbimgy, thumbimgscale, thumbimgaspect, getNextHighestDepth, attachMovie, newimage, igallery, w, h, myloadingMessage, imagecaption, thumbholder, thumbfxfade, thumbalpha, tweenAlpha, thumbhlight, highlightOutline, _alpha, _x, _y, bigimage, getURL, imagelink, numimages, imgnum, createEmptyMovieClip, highlightclr, highlightwidth;
    function ccThumbnail()
    {
        super();
        isloaded = false;
        this.createHighlightOutline();
        newimage = this.attachMovie("imageLoader", _root.getMovieName("image"), this.getNextHighestDepth(), {_width: thumbimgw, _height: thumbimgh, _x: thumbimgx, _y: thumbimgy, _imageVA: "center", _imageHA: "center", _scaleToFit: thumbimgscale, _aspRatio: thumbimgaspect, _customLoader: true, _loaderHandler: "customLoaderHandler", imageURL: "", _alpha: 0});
        lw = thumbimgw - 10;
        if (lw < 5)
        {
            lw = thumbimgw;
        } // end if
        if (igallery.dontshowloadingbar == false)
        {
            myloadingMessage = this.attachMovie("ccLoadingMessage", _root.getMovieName("ccLoadingMessage"), this.getNextHighestDepth(), {_x: (w - lw) / 2, _y: (h - 10) / 2, _width: lw, _height: 10});
            myloadingMessage._alpha = 100;
        } // end if
    } // End of the function
    function loadimage(s)
    {
        if (isloaded == false)
        {
            newimage.loadImage(s);
            isloaded = true;
        } // end if
    } // End of the function
    function customLoadedHandler(image)
    {
    } // End of the function
    function customLoaderHandler(image)
    {
        if (igallery.dontshowloadingbar == false)
        {
            myloadingMessage.setPercentage(image._percentLoaded);
        } // end if
        if (image._percentLoaded == 100)
        {
            tweeny = new mx.transitions.Tween(image, "_alpha", mx.transitions.easing.Regular.easeInOut, 0, 100, 10, false);
            if (igallery.dontshowloadingbar == false)
            {
                tweenl = new mx.transitions.Tween(myloadingMessage, "_alpha", mx.transitions.easing.Regular.easeInOut, 70, 0, 5, false);
            } // end if
        } // end if
    } // End of the function
    function onRollOver()
    {
        igallery.showThumbnailCaption(imagecaption);
        if (thumbholder.istweening)
        {
            return;
        } // end if
        if (igallery.overclicksnd != undefined && igallery.canDoSounds)
        {
            igallery.overclicksnd.start();
        } // end if
        if (thumbfxfade)
        {
            this.tweenAlpha(thumbalpha, 100, 5);
        } // end if
        if (thumbhlight)
        {
            tween11 = new mx.transitions.Tween(highlightOutline, "_alpha", mx.transitions.easing.Regular.easeInOut, 0, 100, 5, false);
        } // end if
    } // End of the function
    function onRollOut()
    {
        if (thumbholder.istweening)
        {
            return;
        } // end if
        if (thumbfxfade)
        {
            this.tweenAlpha(_alpha, thumbalpha, 5);
        } // end if
        if (thumbhlight)
        {
            tween12 = new mx.transitions.Tween(highlightOutline, "_alpha", mx.transitions.easing.Regular.easeInOut, highlightOutline._alpha, 0, 5, false);
        } // end if
    } // End of the function
    function onRelease()
    {
        _x = _x - 1;
        _y = _y - 1;
    } // End of the function
    function onReleaseOutside()
    {
        _x = _x - 1;
        _y = _y - 1;
    } // End of the function
    function onPress()
    {
        _x = _x + 1;
        _y = _y + 1;
        if (igallery.doclickfullsize)
        {
        } // end if
        if (igallery.doplay)
        {
            trace ("dddd");
            igallery.playbtn.onPress();
        } // end if
    } // End of the function
    function createHighlightOutline()
    {
        highlightOutline = this.createEmptyMovieClip(_root.getMovieName("highlightoutline"), this.getNextHighestDepth());
        highlightOutline._alpha = 0;
        highlightOutline.beginFill(0, 0);
        highlightOutline.lineStyle(highlightwidth, highlightclr, 100);
        highlightOutline.moveTo(0, 0);
        highlightOutline.lineTo(w, 0);
        highlightOutline.lineTo(w, h);
        highlightOutline.lineTo(0, h);
        highlightOutline.endFill(0, 0);
    } // End of the function
} // End of Class
