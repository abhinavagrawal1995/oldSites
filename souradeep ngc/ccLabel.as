class ccLabel extends ccGraphicComponentBaseClass
{
    var fnt, fntsize, fntclr, fntbold, fntitalic, toggle, toggletxt, txt, xmlnode, format2, myname, action;
    function ccLabel()
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
        if (xmlnode != undefined)
        {
            this.parseXMLnode();
        } // end if
        format2 = new TextFormat();
        format2.color = fntclr;
        format2.bold = fntbold;
        format2.italic = fntitalic;
        format2.size = fntsize;
        format2.font = fnt;
        format2.align = "center";
    } // End of the function
    function settext(s)
    {
    } // End of the function
    function parseXMLnode()
    {
        if (xmlnode != undefined)
        {
            if (xmlnode.attributes.myname != undefined)
            {
                myname = xmlnode.attributes.myname;
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
            } // end if
        } // end else if
    } // End of the function
} // End of Class
