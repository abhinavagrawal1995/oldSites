class ccCatagoryThumbnail extends ccGraphicComponentBaseClass
{
    var catfontclr, catfontsize, catfont, catimgw, w, getNextHighestDepth, createTextField, heading, catname, h, mytext, cattext, catimgh, catimage, attachMovie, dohighlight, igallery, catsound, catlink, highlightOutline, createEmptyMovieClip, highlightclr, highlightwidth;
    function ccCatagoryThumbnail()
    {
        super();
        myformat = new TextFormat();
        myformat.color = catfontclr;
        myformat.bold = true;
        myformat.size = catfontsize;
        myformat.font = catfont;
        format2 = new TextFormat();
        format2.color = catfontclr;
        format2.bold = false;
        format2.size = catfontsize;
        format2.font = catfont;
        p = 10;
        tx = catimgw + p + p;
        ty = 5;
        tw = w - tx - 10;
        this.createTextField("heading", this.getNextHighestDepth(), tx, ty, tw, 20);
        heading.multiline = false;
        heading.wordWrap = false;
        heading.border = false;
        heading.text = catname;
        heading.setTextFormat(myformat);
        this.createTextField("mytext", this.getNextHighestDepth(), tx, ty + catfontsize + 2, tw, h);
        mytext.multiline = true;
        mytext.wordWrap = true;
        mytext.border = false;
        mytext.text = cattext;
        mytext.setTextFormat(format2);
        newimage = this.attachMovie("imageLoader", _root.getMovieName("image"), this.getNextHighestDepth(), {_width: catimgw, _height: catimgh, _x: p, _y: p, _imageVA: center, _imageHA: center, _scaleToFit: true, _aspRatio: true, imageURL: catimage});
        if (dohighlight)
        {
            this.createHighlightOutline();
        } // end if
    } // End of the function
    function onPress()
    {
        igallery.toggleCatagories();
        igallery.showThumbnails(catlink, catsound);
        this.onRollOut();
    } // End of the function
    function onRollOver()
    {
        if (dohighlight)
        {
            tween11 = new mx.transitions.Tween(highlightOutline, "_alpha", mx.transitions.easing.Regular.easeInOut, 0, 100, 5, false);
        } // end if
    } // End of the function
    function onRollOut()
    {
        if (dohighlight)
        {
            tween12 = new mx.transitions.Tween(highlightOutline, "_alpha", mx.transitions.easing.Regular.easeInOut, highlightOutline._alpha, 0, 5, false);
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
