class ccImageDisplay extends ccGraphicComponentBaseClass
{
    var lmAlpha, loaderw, loaderh, transition, isloading, xmlnode, bkdobdr, offset, w, igallery, h, getNextHighestDepth, attachMovie, loadingMessage, mycaption, drawSolidBox, format1, format2, currentimage, currentimagelink, getURL, doclickfullsize, did, oldimage, newimage, scaletofit, candocaption, aaa, obj, _height, _width, aspratio;
    function ccImageDisplay()
    {
        super();
        lmAlpha = 70;
        loaderw = 100;
        loaderh = 10;
        transition = 0;
        isloading = false;
        if (xmlnode != undefined)
        {
            this.parseXMLnode();
        } // end if
        if (bkdobdr == true)
        {
            offset = 1;
        }
        else
        {
            offset = 0;
        } // end else if
        if (loaderw > w)
        {
            loaderw = w;
        } // end if
        if (igallery.dontshowloadingbar == false)
        {
            loadingMessage = this.attachMovie("ccLoadingMessage", _root.getMovieName("ccLoadingMessage"), this.getNextHighestDepth(), {_x: (w - loaderw) / 2, _y: (h - loaderh) / 2, _width: loaderw, _height: loaderh});
        } // end if
    } // End of the function
    function createCaption()
    {
        xx = 0;
        yy = 12;
        sH2 = 50;
        sW2 = igallery.display._width;
        mycaption = this.attachMovie("blank", _root.getMovieName("junk"), this.getNextHighestDepth());
        this.drawSolidBox(mycaption, 0, 0, sW2, sH2, igallery.captionfontbkcolor, 80, 0, 0, 0, false, igallery.cats.catgradclr, 80, igallery.cats.catgradangle);
        mycaption._y = -50;
        if (igallery.dontshowimagenumber == false)
        {
            format1 = new TextFormat();
            format1.color = igallery.captionfontcolor;
            format1.italic = true;
            format1.size = igallery.captionfontsize;
            format1.font = igallery.captionfont;
            format1.align = "left";
            mycaption.createTextField("mainlabel2", mycaption.getNextHighestDepth(), xx + 5, 0, sW2 - 10, 16);
            mycaption.mainlabel2.multiline = false;
            mycaption.mainlabel2.wordWrap = true;
            mycaption.mainlabel2.border = false;
            mycaption.mainlabel2.text = "Image 01 of 01";
            mycaption.mainlabel2.setTextFormat(format1);
        } // end if
        if (igallery.dontshowimagenumber == true)
        {
            sH2 = sH2 + 12;
            yy = 0;
        } // end if
        format2 = new TextFormat();
        format2.color = igallery.captionfontcolor;
        format2.bold = false;
        format2.size = igallery.captionfontsize;
        format2.font = igallery.captionfont;
        format2.align = "left";
        mycaption.createTextField("mainlabel", mycaption.getNextHighestDepth(), xx + 5, yy, sW2 - 10, sH2);
        mycaption.mainlabel.multiline = true;
        mycaption.mainlabel.wordWrap = true;
        mycaption.mainlabel.border = false;
        mycaption.mainlabel.text = "fffffff";
        mycaption.mainlabel.setTextFormat(format2);
    } // End of the function
    null[] = !(igallery.catsShowing == false && currentimage != undefined && currentimagelink != "") ? (if (!(igallery.catsShowing == false && doclickfullsize && currentimage != undefined)) goto 294, function ()
    {
        if (igallery.catsShowing == false && doclickfullsize && currentimage != undefined)
        {
        } // end if
    }) : ("onPress");
    function loadImage(s, i, n, nn, l)
    {
        if (s == "" || s == undefined)
        {
            return;
        } // end if
        currentimage = s;
        currentimagelink = l;
        if (igallery.alwaysshowcaption == true)
        {
            this.doRollOut();
        } // end if
        did = false;
        isloading = true;
        if (oldimage != undefined)
        {
            oldimage.removeMovieClip();
        } // end if
        if (newimage != undefined)
        {
            oldimage = newimage;
        } // end if
        if (igallery.dontshowloadingbar == false)
        {
            loadingMessage.setPercentage(1);
            tweenl1 = new mx.transitions.Tween(loadingMessage, "_alpha", mx.transitions.easing.Regular.easeInOut, 0, lmAlpha, 5, false);
        } // end if
        newimage = this.attachMovie("imageLoader", _root.getMovieName("image"), this.getNextHighestDepth(), {_width: w - offset - offset, _height: h - offset - offset, _x: offset, _y: offset, _imageVA: "center", _imageHA: "center", _scaleToFit: scaletofit, _aspRatio: true, _customLoader: true, _loaderHandler: "customLoaderHandler", _fileLoadedHandler: "customLoadedHandler", imageURL: s, _alpha: 100});
        if (i != undefined && i != "")
        {
            candocaption = true;
        }
        else
        {
            candocaption = false;
        } // end else if
        mycaption.mainlabel.text = i;
        mycaption.mainlabel.setTextFormat(format2);
        if (igallery.dontshowimagenumber == false)
        {
            mycaption.mainlabel2.text = "Image " + n + " of " + nn;
            mycaption.mainlabel2.setTextFormat(format1);
        } // end if
        if (mycaption.getDepth() < newimage.getDepth())
        {
            newimage.swapDepths(mycaption);
        } // end if
        if (igallery.dontshowloadingbar == false)
        {
            if (loadingMessage.getDepth() < newimage.getDepth())
            {
                newimage.swapDepths(loadingMessage);
            } // end if
        } // end if
        if (_root.unreg == true)
        {
            if (aaa.getDepth() < newimage.getDepth())
            {
                newimage.swapDepths(aaa);
            } // end if
        } // end if
        if (igallery.alwaysshowcaption == true)
        {
            this.doRollOver();
        } // end if
    } // End of the function
    function customLoadedHandler(image)
    {
    } // End of the function
    function customLoaderHandler(image)
    {
        if (igallery.dontshowloadingbar == false)
        {
            loadingMessage.setPercentage(image._percentLoaded);
        } // end if
        if (image._percentLoaded == 100)
        {
            isloading = false;
            tween = new mx.transitions.Tween(oldimage, "_alpha", mx.transitions.easing.Regular.easeInOut, 100, 0, 10, false);
            tween.onMotionFinished = function ()
            {
                obj.removeMovieClip();
            };
            switch (transition)
            {
                case 0:
                {
                    tweeny = new mx.transitions.Tween(image, "_alpha", mx.transitions.easing.Regular.easeInOut, 0, 100, 10, false);
                    break;
                } 
                case 1:
                {
                    tweeny = new mx.transitions.Tween(image, "_y", mx.transitions.easing.Regular.easeInOut, image._height * -1, 1, 20, false);
                    break;
                } 
                case 2:
                {
                    tweeny = new mx.transitions.Tween(image, "_y", mx.transitions.easing.Regular.easeInOut, _height, 1, 20, false);
                    break;
                } 
                case 3:
                {
                    tweeny = new mx.transitions.Tween(image, "_x", mx.transitions.easing.Regular.easeInOut, image._width * -1, 0, 20, false);
                    break;
                } 
                case 4:
                {
                    tweeny = new mx.transitions.Tween(image, "_x", mx.transitions.easing.Regular.easeInOut, _width, 0, 20, false);
                    break;
                } 
            } // End of switch
            if (igallery.dontshowloadingbar == false)
            {
                tweenl = new mx.transitions.Tween(loadingMessage, "_alpha", mx.transitions.easing.Regular.easeInOut, lmAlpha, 0, 5, false);
            } // end if
        } // end if
    } // End of the function
    function onRollOver()
    {
        if (igallery.alwaysshowcaption == true)
        {
            return;
        } // end if
        this.doRollOver();
    } // End of the function
    function onRollOut()
    {
        if (igallery.alwaysshowcaption == true)
        {
            return;
        } // end if
        this.doRollOut();
    } // End of the function
    function doRollOver()
    {
        if (igallery.catsShowing == false && candocaption)
        {
            tween1 = new mx.transitions.Tween(mycaption, "_y", mx.transitions.easing.Regular.easeInOut, mycaption._y, 0, 10, false);
        } // end if
    } // End of the function
    function doRollOut()
    {
        if (igallery.catsShowing == false && candocaption)
        {
            tween2 = new mx.transitions.Tween(mycaption, "_y", mx.transitions.easing.Regular.easeInOut, mycaption._y, mycaption._height * -1, 10, false);
        } // end if
    } // End of the function
    function parseXMLnode()
    {
        if (xmlnode != undefined)
        {
            if (xmlnode.attributes.scaletofit != undefined)
            {
                if (xmlnode.attributes.scaletofit == "t")
                {
                    scaletofit = true;
                }
                else
                {
                    scaletofit = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.aspratio != undefined)
            {
                if (xmlnode.attributes.aspratio == "t")
                {
                    aspratio = true;
                }
                else
                {
                    aspratio = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.loaderw != undefined)
            {
                loaderw = Number(xmlnode.attributes.loaderw);
            } // end if
            if (xmlnode.attributes.transition != undefined)
            {
                transition = Number(xmlnode.attributes.transition);
            } // end if
            if (xmlnode.attributes.doclickfullsize != undefined)
            {
                if (xmlnode.attributes.doclickfullsize == "t")
                {
                    doclickfullsize = true;
                }
                else
                {
                    doclickfullsize = false;
                } // end if
            } // end if
        } // end else if
    } // End of the function
} // End of Class
