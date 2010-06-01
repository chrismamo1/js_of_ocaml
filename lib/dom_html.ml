(*
XXXX events
XXXX creation (input)
*)

open Js

class type cssStyleDeclaration = object
  method background : js_string t prop
  method backgroundAttachment : js_string t prop
  method backgroundColor : js_string t prop
  method backgroundImage : js_string t prop
  method backgroundPosition : js_string t prop
  method backgroundRepeat : js_string t prop
  method border : js_string t prop
  method borderBottom : js_string t prop
  method borderBottomColor : js_string t prop
  method borderBottomStyle : js_string t prop
  method borderBottomWidth : js_string t prop
  method borderCollapse : js_string t prop
  method borderColor : js_string t prop
  method borderLeft : js_string t prop
  method borderLeftColor : js_string t prop
  method borderLeftStyle : js_string t prop
  method borderLeftWidth : js_string t prop
  method borderRight : js_string t prop
  method borderRightColor : js_string t prop
  method borderRightStyle : js_string t prop
  method borderRightWidth : js_string t prop
  method borderSpacing : js_string t prop
  method borderStyle : js_string t prop
  method borderTop : js_string t prop
  method borderTopColor : js_string t prop
  method borderTopStyle : js_string t prop
  method borderTopWidth : js_string t prop
  method borderWidth : js_string t prop
  method bottom : js_string t prop
  method captionSide : js_string t prop
  method clear : js_string t prop
  method clip : js_string t prop
  method color : js_string t prop
  method content : js_string t prop
  method counterIncrement : js_string t prop
  method counterReset : js_string t prop
  method cssText : js_string t prop
  method cursor : js_string t prop
  method direction : js_string t prop
  method display : js_string t prop
  method emptyCells : js_string t prop
  method font : js_string t prop
  method fontFamily : js_string t prop
  method fontSize : js_string t prop
  method fontStyle : js_string t prop
  method fontVariant : js_string t prop
  method fontWeight : js_string t prop
  method height : js_string t prop
  method left : js_string t prop
  method letterSpacing : js_string t prop
  method lineHeight : js_string t prop
  method listStyle : js_string t prop
  method listStyleImage : js_string t prop
  method listStylePosition : js_string t prop
  method listStyleType : js_string t prop
  method margin : js_string t prop
  method marginBottom : js_string t prop
  method marginLeft : js_string t prop
  method marginRight : js_string t prop
  method marginTop : js_string t prop
  method maxHeight : js_string t prop
  method maxWidth : js_string t prop
  method minHeight : js_string t prop
  method minWidth : js_string t prop
  method opacity : js_string t optdef prop
  method outline : js_string t prop
  method outlineColor : js_string t prop
  method outlineOffset : js_string t prop
  method outlineStyle : js_string t prop
  method outlineWidth : js_string t prop
  method overflow : js_string t prop
  method overflowX : js_string t prop
  method overflowY : js_string t prop
  method padding : js_string t prop
  method paddingBottom : js_string t prop
  method paddingLeft : js_string t prop
  method paddingRight : js_string t prop
  method paddingTop : js_string t prop
  method pageBreakAfter : js_string t prop
  method pageBreakBefore : js_string t prop
  method position : js_string t prop
  method right : js_string t prop
  method tableLayout : js_string t prop
  method textAlign : js_string t prop
  method textDecoration : js_string t prop
  method textIndent : js_string t prop
  method textTransform : js_string t prop
  method top : js_string t prop
  method verticalAlign : js_string t prop
  method visibility : js_string t prop
  method whiteSpace : js_string t prop
  method width : js_string t prop
  method wordSpacing : js_string t prop
  method zIndex : js_string t prop
end

class type event = object
  method _type : js_string t readonly_prop
  method target : element t opt readonly_prop
  method srcElement : element t opt readonly_prop
end

and mouseEvent = object
end

and element = object
  inherit Dom.element
  method id : js_string t prop
  method title : js_string t prop
  method lang : js_string t prop
  method dir : js_string t prop
  method className : js_string t prop
  method style : cssStyleDeclaration t prop

  method innerHTML : js_string t prop

  (* FIX: event? / might be undefined! *)
  method onclick : (unit -> bool t) opt prop
  method onmouseover : (unit -> bool t) opt prop
  method onmouseout : (unit -> bool t) opt prop
end

(*XXX
  let event_target (e : #event t) =
    let targ =
      match Nullable.maybe e##target with
        Some t ->
          t
      | None ->
          match Nullable.maybe e##srcElement with
            Some t -> t
           | None  -> assert false
    in
    if targ##nodeType = 3 then targ##parentNode else targ
*)

class type ['node] collection = object
  method length : int readonly_prop
  method item : int -> 'node t opt meth
  method namedItem : js_string t -> 'node t opt meth
end

class type htmlElement = element

class type headElement = object
  inherit element
  method profile : js_string t prop
end

class type linkElement = object
  inherit element
  method disabled : bool t prop
  method charset : js_string t prop
  method href : js_string t prop
  method hreflang : js_string t prop
  method media : js_string t prop
  method rel : js_string t prop
  method rev : js_string t prop
  method target : js_string t prop
  method _type : js_string t prop
end

class type titleElement = object
  inherit element
  method text : js_string t prop
end

class type metaElement = object
  inherit element
  method content : js_string t prop
  method httpEquiv : js_string t prop
  method name : js_string t prop
  method scheme : js_string t prop
end

class type baseElement = object
  inherit element
  method href : js_string t prop
  method target : js_string t prop
end

class type styleElement = object
  inherit element
  method disabled : bool t prop
  method media : js_string t prop
  method _type : js_string t prop
end

class type bodyElement = element

class type formElement = object
  inherit element
  method elements : element collection t readonly_prop
  method length : int readonly_prop
  method name : js_string t prop
  method acceptCharset : js_string t prop
  method action : js_string t prop
  method enctype : js_string t prop
  method _method : js_string t prop
  method target : js_string t prop
  method submit : unit meth
  method reset : unit meth
end

class type optGroupElement = object
  inherit element
  method disabled : bool t prop
  method label : js_string t prop
end

class type optionElement = object
  inherit element
  method form : formElement t opt readonly_prop
  method defaultSelected : bool t prop
  method text : js_string t readonly_prop
  method index : int readonly_prop
  method disabled : bool prop
  method label : js_string t prop
  method selected : bool prop
  method value : js_string t prop
end

class type selectElement = object
  inherit element
  method _type : js_string t readonly_prop
  method selectedIndex : int prop
  method value : js_string t prop
  method length : int prop
  method form : formElement t opt readonly_prop
  method options : optionElement collection t readonly_prop
  method disabled : bool t prop
  method multiple : bool t prop
  method name : js_string t prop
  method size : int prop
  method tabIndex : int prop
  method add : #element -> #element opt -> unit meth
  method remove : int -> unit meth
  method blur : unit meth
  method focus : unit meth

  method onchange : (unit -> bool t) opt prop
end

class type inputElement = object
  inherit element
  method defaultValue : js_string t prop
  method defaultChecked : js_string t prop
  method form : formElement opt readonly_prop
  method accept : js_string t prop
  method accessKey : js_string t prop
  method align : js_string t prop
  method alt : js_string t prop
  method checked : bool t prop
  method disabled : bool t prop
  method maxLength : int prop
  method name : js_string t readonly_prop (* Cannot be changed under IE *)
  method readOnly : bool t prop
  method size : int prop
  method src : js_string t prop
  method tabIndex : int prop
  method _type : js_string t prop (* FIX: Cannot be changed under IE *)
  method useMap : js_string t prop
  method value : js_string t prop
  method blur : unit meth
  method focus : unit meth
  method select : unit meth
  method click : unit meth

  method onchange : (unit -> bool t) opt prop
end

class type textAreaElement = object
  inherit element
  method defaultValue : js_string t prop
  method form : formElement t opt readonly_prop
  method accessKey : js_string t prop
  method cols : int prop
  method disabled : bool t prop
  method name : js_string t prop
  method readOnly : bool t prop
  method rows : int prop
  method tabIndex : int prop
  method _type : js_string t readonly_prop
  method value : js_string t prop
  method blur : unit meth
  method focus : unit meth
  method select : unit meth
end

class type buttonElement = object
  inherit element
  method form : formElement opt readonly_prop
  method accessKey : js_string t prop
  method disabled : bool t prop
  method name : js_string t prop
  method tabIndex : int prop
  method _type : js_string t readonly_prop
  method value : js_string t prop
end

class type labelElement = object
  inherit element
  method form : formElement t opt readonly_prop
  method accessKey : js_string t prop
  method htmlFor : js_string t prop
end

class type fieldSetElement = object
  inherit element
  method form : formElement t opt readonly_prop
end

class type legendElement = object
  inherit element
  method form : formElement t opt readonly_prop
  method accessKey : js_string t prop
end

class type uListElement = element

class type oListElement = element

class type dListElement = element

class type liElement = element

class type divElement = element

class type paragraphElement = element

class type headingElement = element

class type quoteElement = object
  inherit element
  method cite : js_string t prop
end

class type preElement = element

class type brElement = element

class type hrElement = element

class type modElement = object
  inherit element
  method cite : js_string t prop
  method dateTime : js_string t prop
end

class type anchorElement = object
  inherit element
  method accessKey : js_string t prop
  method charset : js_string t prop
  method coords : js_string t prop
  method href : js_string t prop
  method hreflang : js_string t prop
  method name : js_string t prop
  method rel : js_string t prop
  method rev : js_string t prop
  method shape : js_string t prop
  method tabIndex : int prop
  method target : js_string t prop
  method _type : js_string t prop
  method blur : unit meth
  method focus : unit meth
end

class type imageElement = object
  inherit element
  method alt : js_string t prop
  method height : int prop
  method isMap : bool t prop
  method longDesc : js_string t prop
  method src : js_string t prop
  method useMap : js_string t prop
  method width : int prop
end

class type objectElement = object
  inherit element
  method form : formElement t opt readonly_prop
  method code : js_string t prop
  method archive : js_string t prop
  method codeBase : js_string t prop
  method codeType : js_string t prop
  method data : js_string t prop
  method declare : bool t prop
  method height : js_string t prop
  method name : js_string t prop
  method standby : js_string t prop
  method tabIndex : int prop
  method _type : js_string t prop
  method useMap : js_string t prop
  method width : js_string t prop
  method document : Dom.element Dom.document t opt readonly_prop
end

class type paramElement = object
  inherit element
  method name : js_string t prop
  method _type : js_string t prop
  method value : js_string t prop
  method valueType : js_string t prop
end

class type areaElement = object
  inherit element
  method accessKey : js_string t prop
  method alt : js_string t prop
  method coords : js_string t prop
  method href : js_string t prop
  method noHref : bool t prop
  method shape : js_string t prop
  method tabIndex : int prop
  method target : js_string t prop
end

class type mapElement = object
  inherit element
  method areas : areaElement collection t readonly_prop
  method name : js_string t prop
end

class type scriptElement = object
  inherit element
  method text : js_string t prop
  method charset : js_string t prop
  method defer : bool t prop
  method src : js_string t prop
  method _type : js_string t prop
end

class type tableCellElement = object
  inherit element
  method cellIndex : int readonly_prop
  method abbr : js_string t prop
  method align : js_string t prop
  method axis : js_string t prop
  method ch : js_string t prop
  method chOff : js_string t prop
  method colSpan : int prop
  method headers : js_string t prop
  method rowSpan : int prop
  method scope : js_string t prop
  method vAlign : js_string t prop
end

class type tableRowElement = object
  inherit element
  method rowIndex : int readonly_prop
  method sectionRowIndex : int readonly_prop
  method cells : tableCellElement collection t readonly_prop
  method align : js_string t prop
  method ch : js_string t prop
  method chOff : js_string t prop
  method vAlign : js_string t prop
  method insertCell : int -> tableCellElement t meth
  method deleteCell : int -> unit meth
end

class type tableColElement = object
  inherit element
  method align : js_string t prop
  method ch : js_string t prop
  method chOff : js_string t prop
  method span : int prop
  method vAlign : js_string t prop
  method width : js_string t prop
end

class type tableSectionElement = object
  inherit element
  method align : js_string t prop
  method ch : js_string t prop
  method chOff : js_string t prop
  method vAlign : js_string t prop
  method rows : tableRowElement collection t readonly_prop
  method insertRow : int -> tableRowElement t meth
  method deleteRow : int -> unit meth
end

class type tableCaptionElement = element

class type tableElement = object
  inherit element
  method caption : tableCaptionElement t prop
  method tHead : tableSectionElement t prop
  method tFood : tableSectionElement t prop
  method rows : tableRowElement collection t readonly_prop
  method tbodies : tableSectionElement collection t readonly_prop
  method align : js_string t prop
  method border : js_string t prop
  method cellPadding : js_string t prop
  method cellSpacing : js_string t prop
  method frame : js_string t prop
  method rules : js_string t prop
  method summary : js_string t prop
  method width : js_string t prop
  method createTHead : tableSectionElement t meth
  method deleteTHead : unit meth
  method createTFoot : tableSectionElement t meth
  method deleteTFoot : unit meth
  method createCaption : tableCaptionElement t meth
  method deleteCaption : unit meth
  method insertRow : int -> tableRowElement t meth
  method deleteRow : int -> unit meth
end

type context = js_string t
let _2d_ = Js.string "2d"

type canvasPattern

class type canvasElement = object
  inherit element
  method width : int prop
  method height : int prop
  method toDataURL : js_string t meth
  method getContext : js_string t -> canvasRenderingContext2D t meth
end

and canvasRenderingContext2D = object
  method canvas : canvasElement t readonly_prop
  method save : unit meth
  method restore : unit meth
  method scale : float -> float -> unit meth
  method rotate : float -> unit meth
  method translate : float -> float -> unit meth
  method transform :
    float -> float -> float -> float -> float -> float -> unit meth
  method setTransform :
    float -> float -> float -> float -> float -> float -> unit meth
  method globalAlpha : float_prop
  method globalCompositeOperation : js_string t prop
  method strokeStyle : js_string t writeonly_prop
  method strokeStyle_gradient : canvasGradient t writeonly_prop
  method strokeStyle_pattern : canvasPattern t writeonly_prop
  method fillStyle : js_string t writeonly_prop
  method fillStyle_gradient : canvasGradient t writeonly_prop
  method fillStyle_pattern : canvasPattern t writeonly_prop
  method createLinearGradient :
    float -> float -> float -> float -> canvasGradient t meth
  method createRadialGradient :
    float -> float -> float -> float -> float -> float ->
    canvasGradient t meth
  method createPattern : imageElement t -> js_string t -> canvasPattern t meth
  method createPattern_fromCanvas :
    canvasElement t -> js_string t -> canvasPattern t meth
(*
  CanvasPattern createPattern(in HTMLVideoElement image, in DOMJs_String repetition);
*)
  method lineWidth : float_prop
  method lineCap : js_string t prop
  method lineJoin : js_string t prop
  method miterLimit : float_prop

  method shadowOffsetX : float_prop
  method shadowOffsetY : float_prop
  method shadowBlur : float_prop
  method shadowColor : js_string t prop

  method clearRect : float -> float -> float -> float -> unit meth
  method fillRect : float -> float -> float -> float -> unit meth
  method strokeRect : float -> float -> float -> float -> unit meth

  method beginPath : unit meth
  method closePath : unit meth
  method moveTo : float -> float -> unit meth
  method lineTo : float -> float -> unit meth
  method quadraticCurveTo : float -> float -> float -> float -> unit meth
  method bezierCurveTo :
    float -> float -> float -> float -> float -> float -> unit meth
  method arcTo : float -> float -> float -> float -> float -> unit meth
  method rect : float -> float -> float -> float -> unit meth
  method arc :
    float -> float -> float -> float -> float -> bool t -> unit meth
  method fill : unit meth
  method stroke : unit meth
  method clip : unit meth
  method isPointInPath : float -> float -> bool t meth

  method drawFocusRing : element t -> float -> float -> bool t -> bool t meth

  method font : js_string t prop
  method textAlign : js_string t prop
  method textBaseline : js_string t prop
  method fillText : js_string t -> float -> float -> float opt -> unit meth
  method strokeText : js_string t -> float -> float -> float opt -> unit meth
  method measureText : js_string t -> textMetrics t meth

  method drawImage :
    imageElement t -> float -> float -> unit meth
  method drawImage_scale :
    imageElement t -> float -> float -> float -> float -> unit meth
  method drawImage_full :
    imageElement t -> float -> float -> float -> float -> unit meth
  method drawImage_fromCanvas :
    canvasElement t -> float -> float -> unit meth
  method drawImage_scaleFromCanvas :
    canvasElement t -> float -> float -> float -> float -> unit meth
  method drawImage_fullFromCanvas :
    canvasElement t -> float -> float -> float -> float -> unit meth
(*
  void drawImage(in HTMLVideoElement image, in float dx, in float dy, in optional float dw, in float dh);
  void drawImage(in HTMLVideoElement image, in float sx, in float sy, in float sw, in float sh, in float dx, in float dy, in float dw, in float dh);
*)

  method createImageData : int -> int -> imageData t meth
  method getImageData : float -> float -> float -> float -> imageData t meth
  method putImageData : imageData t -> float -> float -> unit meth
end

and canvasGradient = object
  method addColorStop : float -> js_string t -> unit meth
end

and textMetrics = object
  method width : float readonly_prop
end

and imageData = object
  method width : int readonly_prop
  method height : int readonly_prop
  method data : canvasPixelArray t prop
end

and canvasPixelArray = object
  method length : int readonly_prop
end

let pixel_get = Js.Unsafe.get
let pixel_set = Js.Unsafe.set

class type document = object
  inherit [element] Dom.document
  method title : js_string t prop
  method referrer : js_string t readonly_prop
  method domain : js_string t readonly_prop
  method _URL : js_string t readonly_prop
  method body : element t prop
  method images : imageElement collection t readonly_prop
  method applets : element collection t readonly_prop
  method links : element collection t readonly_prop
  method forms : formElement collection t readonly_prop
  method anchors : element collection t readonly_prop
  method cookie : js_string t prop
end

(*XXX Should provide creation functions a la lablgtk... *)
let unsafeCreateElement (doc : document t) name =
  Js.Unsafe.coerce (doc##createElement(Js.string name))

let createHtmlElement doc : htmlElement t = unsafeCreateElement doc "html"
let createHeadElement doc : headElement t = unsafeCreateElement doc "head"
let createLinkElement doc : linkElement t = unsafeCreateElement doc "link"
let createTitleElement doc : titleElement t = unsafeCreateElement doc "title"
let createMetaElement doc : metaElement t = unsafeCreateElement doc "meta"
let createBaseElement doc : baseElement t = unsafeCreateElement doc "base"
let createStyleElement doc : styleElement t = unsafeCreateElement doc "style"
let createBodyElement doc : bodyElement t = unsafeCreateElement doc "body"
let createFormElement doc : formElement t = unsafeCreateElement doc "form"
let createOptGroupElement doc : optGroupElement t =
  unsafeCreateElement doc "optgroup"
let createOptionElement doc : optionElement t =
  unsafeCreateElement doc "option"
let createSelectElement doc : selectElement t =
  unsafeCreateElement doc "select"
(*XXX should set name and type here... *)
let createInputElement doc : inputElement t = unsafeCreateElement doc "input"
let createTextAreaElement doc : textAreaElement t =
  unsafeCreateElement doc "textArea"
let createButtonElement doc : buttonElement t =
  unsafeCreateElement doc "button"
let createLabelElement doc : labelElement t = unsafeCreateElement doc "label"
let createFieldSetElement doc : fieldSetElement t =
  unsafeCreateElement doc "fieldSet"
let createLegendElement doc : legendElement t =
  unsafeCreateElement doc "legend"
let createUlElement doc : uListElement t = unsafeCreateElement doc "ul"
let createOlElement doc : oListElement t = unsafeCreateElement doc "ol"
let createDlElement doc : dListElement t = unsafeCreateElement doc "dl"
let createLiElement doc : liElement t = unsafeCreateElement doc "li"
let createDivElement doc : divElement t = unsafeCreateElement doc "div"
let createParagraphElement doc : paragraphElement t =
  unsafeCreateElement doc "p"
let createH1Element doc : headingElement t = unsafeCreateElement doc "h1"
let createH2Element doc : headingElement t = unsafeCreateElement doc "h2"
let createH3Element doc : headingElement t = unsafeCreateElement doc "h3"
let createH4Element doc : headingElement t = unsafeCreateElement doc "h4"
let createH5Element doc : headingElement t = unsafeCreateElement doc "h5"
let createH6Element doc : headingElement t = unsafeCreateElement doc "h6"
let createQElement doc : quoteElement t = unsafeCreateElement doc "q"
let createBlockquoteElement doc : quoteElement t =
  unsafeCreateElement doc "blockquote"
let createPreElement doc : preElement t = unsafeCreateElement doc "pre"
let createBrElement doc : brElement t = unsafeCreateElement doc "br"
let createHrElement doc : hrElement t = unsafeCreateElement doc "hr"
let createInsElement doc : modElement t = unsafeCreateElement doc "ins"
let createDelElement doc : modElement t = unsafeCreateElement doc "del"
let createAnchorElement doc : anchorElement t = unsafeCreateElement doc "a"
let createImageElement doc : imageElement t = unsafeCreateElement doc "img"
let createObjectElement doc : objectElement t =
  unsafeCreateElement doc "object"
let createParamElement doc : paramElement t = unsafeCreateElement doc "param"
let createMapElement doc : mapElement t = unsafeCreateElement doc "map"
let createAreaElement doc : areaElement t = unsafeCreateElement doc "area"
let createScriptElement doc : scriptElement t =
  unsafeCreateElement doc "script"
let createTableElement doc : tableElement t = unsafeCreateElement doc "table"
let createTableCaptionElement doc : tableCaptionElement t =
  unsafeCreateElement doc "caption"
let createTableColElement doc : tableColElement t =
  unsafeCreateElement doc "col"
let createTableColgroupElement doc : tableColElement t =
  unsafeCreateElement doc "colgroup"
let createTHeadElement doc : tableSectionElement t =
  unsafeCreateElement doc "thead"
let createTFootElement doc : tableSectionElement t =
  unsafeCreateElement doc "tfoot"
let createTBodyElement doc : tableSectionElement t =
  unsafeCreateElement doc "tbody"
let createTableRowElement doc : tableRowElement t =
  unsafeCreateElement doc "tr"
let createThElement doc : tableCellElement t =
  unsafeCreateElement doc "th"
let createTdElement doc : tableCellElement t =
  unsafeCreateElement doc "td"

let createCanvasElement doc : canvasElement t =
  unsafeCreateElement doc "canvas"

type interval_id
type timeout_id

class type location = object
  method hash : js_string t prop
  method host : js_string t prop
  method hostname : js_string t prop
  method href : js_string t prop
  method pathname : js_string t prop
  method protocol : js_string t prop
  method search : js_string t prop

  method reload : unit meth
  method assign : js_string t -> unit meth
  method replace : js_string t -> unit meth
  method toJs_String : js_string t meth
end

class type history = object
end

class type undoManager = object
end

class type selection = object
end

class type window = object
  method document : document t readonly_prop
  method name : js_string t prop
  method location : location t readonly_prop
  method history : history t readonly_prop
  method undoManager : undoManager t readonly_prop
  method getSelection : selection t meth
  method close : unit meth
  method stop : unit meth
  method focus : unit meth
  method blur : unit meth

  method top : window t readonly_prop
  method parent : window t readonly_prop
  method frameElement : element t opt readonly_prop

  method onload : (unit -> unit) prop
  method onbeforeunload : (unit -> js_string t) prop

  method alert : js_string t -> unit meth
  method confirm : js_string t -> bool t meth
  method prompt : js_string t -> js_string t -> js_string t meth
  method print : unit meth

  method setInterval : (unit -> unit) -> float -> interval_id meth
  method clearInterval : interval_id -> unit meth

  method setTimeout : (unit -> unit) -> float -> timeout_id meth
  method clearTimeout : timeout_id -> unit meth
end

let window : window t = Js.Unsafe.variable "window"

let document = window##document
