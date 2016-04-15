class ccButton extends ccGraphicComponentBaseClass
{
    var fnt, fntsize, fntclr, fntbold, fntitalic, toggle, toggletxt, txt, up, showtext, hint, xmlnode, h, w, getNextHighestDepth, createTextField, mainlabel, mainlabel2, action, igallery, btnup, btndown, _x, _y, _height, _width, upicon, createEmptyMovieClip, attachMovie, downicon, upimage, downimage;
    function ccButton()
    {
        super();
        fnt = "Arial";
        fntsize = 10;
        fntclr = 16777215;
        fntbold = false;
        fntitalic = false;
        toggle = false;
        toggletxt = "";
        txt = "";
        up = true;
        showtext = false;
        hint = "";
        if (xmlnode != undefined)
        {
            this.parseXMLnode();
        } // end if
        if (showtext)
        {
            var _loc3 = new TextFormat();
            _loc3.color = fntclr;
            _loc3.bold = fntbold;
            _loc3.italic = fntitalic;
            _loc3.size = fntsize;
            _loc3.font = fnt;
            _loc3.align = "center";
            this.createTextField("mainlabel", this.getNextHighestDepth(), 0, (h - fntsize - 2) / 2 - 2, w, h);
            mainlabel.multiline = false;
            mainlabel.wordWrap = false;
            mainlabel.border = false;
            mainlabel.text = txt;
            mainlabel.setTextFormat(_loc3);
            format3 = new TextFormat();
            format3.color = fntclr;
            format3.bold = fntbold;
            format3.italic = fntitalic;
            format3.size = fntsize;
            format3.font = fnt;
            format3.align = "center";
            this.createTextField("mainlabel2", this.getNextHighestDepth(), 0, (h - fntsize - 2) / 2 - 2, w, h);
            mainlabel2._visible = false;
            mainlabel2.multiline = false;
            mainlabel2.wordWrap = false;
            mainlabel2.border = false;
            mainlabel2.text = toggletxt;
            mainlabel2.setTextFormat(format3);
        } // end if
        if (action == "showcatagories")
        {
            igallery.catbtn = this;
        } // end if
        if (action == "togglesounds")
        {
            igallery.sndbtn = this;
        } // end if
        if (action == "toggleplaypause")
        {
            igallery.playbtn = this;
        } // end if
    } // End of the function
    function setToggleUp()
    {
        if (toggle)
        {
            up = true;
            if (showtext == false)
            {
                btnup._alpha = 100;
            } // end if
            if (showtext == false)
            {
                btndown._alpha = 0;
            } // end if
            if (showtext)
            {
                mainlabel._visible = true;
            } // end if
            if (showtext)
            {
                mainlabel2._visible = false;
            } // end if
        } // end if
    } // End of the function
    function setToggleDown()
    {
        if (toggle)
        {
            up = false;
            if (showtext == false)
            {
                btnup._alpha = 0;
            } // end if
            if (showtext == false)
            {
                btndown._alpha = 100;
            } // end if
            if (showtext)
            {
                mainlabel._visible = false;
            } // end if
            if (showtext)
            {
                mainlabel2._visible = true;
            } // end if
        } // end if
    } // End of the function
    function onPress()
    {
        _x = _x + 1;
        _y = _y + 1;
        if (toggle)
        {
            if (up)
            {
                this.setToggleDown();
            }
            else
            {
                this.setToggleUp();
            } // end if
        } // end else if
        if (action == "showcatagories")
        {
            igallery.toggleCatagories();
            return;
        } // end if
        if (action == "togglesounds")
        {
            igallery.toggleSounds();
            return;
        } // end if
        if (action == "toggleplaypause")
        {
            igallery.togglePlay();
            return;
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
    function onRollOver()
    {
        if (action == "showcatagories")
        {
            igallery.showHint(1, _x, _y, _width, _height);
        } // end if
        if (action == "togglesounds")
        {
            igallery.showHint(2, _x, _y, _width, _height);
        } // end if
        if (action == "toggleplaypause")
        {
            igallery.showHint(3, _x, _y, _width, _height);
        } // end if
    } // End of the function
    function onRollOut()
    {
        if (action == "showcatagories")
        {
            igallery.hideHint(1);
        } // end if
        if (action == "togglesounds")
        {
            igallery.hideHint(2);
        } // end if
        if (action == "toggleplaypause")
        {
            igallery.hideHint(3);
        } // end if
    } // End of the function
    function setUpButtonIcons()
    {
        if (action == "showcatagories")
        {
            if (upicon != undefined && upicon != "")
            {
                temp = this.createEmptyMovieClip("btnup", this.getNextHighestDepth());
                temp._x = 2;
                this.loadIcon(upicon, temp);
            }
            else
            {
                this.attachMovie("cats", "btnup", this.getNextHighestDepth(), {_x: 2, _y: 0});
            } // end else if
            if (downicon != undefined && downicon != "")
            {
                temp = this.createEmptyMovieClip("btndown", this.getNextHighestDepth());
                temp._x = 2;
                temp._alpha = 0;
                this.loadIcon(downicon, temp);
            }
            else
            {
                this.attachMovie("cats", "btndown", this.getNextHighestDepth(), {_x: 2, _y: 0, _alpha: 0});
            } // end else if
            return;
        } // end if
        if (action == "togglesounds")
        {
            if (upicon != undefined && upicon != "")
            {
                temp = this.createEmptyMovieClip("btnup", this.getNextHighestDepth());
                temp._x = 2;
                this.loadIcon(upicon, temp);
            }
            else
            {
                this.attachMovie("speakeron", "btnup", this.getNextHighestDepth(), {_x: 2, _y: 0});
            } // end else if
            if (downicon != undefined && downicon != "")
            {
                temp = this.createEmptyMovieClip("btndown", this.getNextHighestDepth());
                temp._x = 2;
                temp._alpha = 0;
                this.loadIcon(downicon, temp);
            }
            else
            {
                this.attachMovie("speakeroff", "btndown", this.getNextHighestDepth(), {_x: 2, _y: 0, _alpha: 0});
            } // end else if
            return;
        } // end if
        if (action == "toggleplaypause")
        {
            if (upicon != undefined && upicon != "")
            {
                temp = this.createEmptyMovieClip("btnup", this.getNextHighestDepth());
                temp._x = 2;
                this.loadIcon(upicon, temp);
            }
            else
            {
                this.attachMovie("play", "btnup", this.getNextHighestDepth(), {_x: 2, _y: 0});
            } // end else if
            if (downicon != undefined && downicon != "")
            {
                temp = this.createEmptyMovieClip("btndown", this.getNextHighestDepth());
                temp._x = 2;
                temp._alpha = 0;
                this.loadIcon(downicon, temp);
            }
            else
            {
                this.attachMovie("pause", "btndown", this.getNextHighestDepth(), {_x: 2, _y: 0, _alpha: 0});
            } // end else if
            return;
        } // end if
    } // End of the function
    function loadIcon(i, m)
    {
        var myMCL = new MovieClipLoader();
        myMCL.onLoadStart = function (targetMC)
        {
            var _loc1 = myMCL.getProgress(targetMC);
        };
        myMCL.loadClip(i, m);
    } // End of the function
    function parseXMLnode()
    {
        if (xmlnode != undefined)
        {
            if (xmlnode.attributes.toggletxt != undefined)
            {
                toggletxt = xmlnode.attributes.toggletxt;
            } // end if
            if (xmlnode.attributes.upimage != undefined)
            {
                upimage = xmlnode.attributes.upimage;
            } // end if
            if (xmlnode.attributes.downimage != undefined)
            {
                downimage = xmlnode.attributes.downimage;
            } // end if
            if (xmlnode.attributes.txt != undefined)
            {
                txt = xmlnode.attributes.txt;
            } // end if
            if (xmlnode.attributes.action != undefined)
            {
                action = xmlnode.attributes.action;
            } // end if
            if (xmlnode.attributes.fnt != undefined)
            {
                fnt = xmlnode.attributes.fnt;
            } // end if
            if (xmlnode.attributes.upicon != undefined)
            {
                upicon = xmlnode.attributes.upicon;
            } // end if
            if (xmlnode.attributes.downicon != undefined)
            {
                downicon = xmlnode.attributes.downicon;
            } // end if
            if (xmlnode.attributes.fntsize != undefined)
            {
                fntsize = Number(xmlnode.attributes.fntsize);
            } // end if
            if (xmlnode.attributes.fntclr != undefined)
            {
                fntclr = Number(xmlnode.attributes.fntclr);
            } // end if
            if (xmlnode.attributes.fntbold != undefined)
            {
                if (xmlnode.attributes.fntbold == "t")
                {
                    fntbold = true;
                }
                else
                {
                    fntbold = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.fntitalic != undefined)
            {
                if (xmlnode.attributes.fntitalic == "t")
                {
                    fntitalic = true;
                }
                else
                {
                    fntitalic = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.toggle != undefined)
            {
                if (xmlnode.attributes.toggle == "t")
                {
                    toggle = true;
                }
                else
                {
                    toggle = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.showtext != undefined)
            {
                if (xmlnode.attributes.showtext == "t")
                {
                    showtext = true;
                }
                else
                {
                    showtext = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.hint != undefined)
            {
                hint = xmlnode.attributes.hint;
            } // end if
            if (!showtext)
            {
                this.setUpButtonIcons();
            } // end if
        } // end if
    } // End of the function
} // End of Class
