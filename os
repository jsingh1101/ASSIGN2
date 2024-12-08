%!PS-Adobe-3.0
%%Creator: (ImageMagick)
%%Title: (os)
%%CreationDate: (2024-12-08T03:11:33+00:00)
%%BoundingBox: 57 391 93 409
%%HiResBoundingBox: 57 391 93 409
%%DocumentData: Clean7Bit
%%LanguageLevel: 1
%%Orientation: Portrait
%%PageOrder: Ascend
%%Pages: 1
%%EndComments

%%BeginDefaults
%%EndDefaults

%%BeginProlog
%
% Display a color image.  The image is displayed in color on
% Postscript viewers or printers that support color, otherwise
% it is displayed as grayscale.
%
/DirectClassPacket
{
  %
  % Get a DirectClass packet.
  %
  % Parameters:
  %   red.
  %   green.
  %   blue.
  %   length: number of pixels minus one of this color (optional).
  %
  currentfile color_packet readhexstring pop pop
  compression 0 eq
  {
    /number_pixels 3 def
  }
  {
    currentfile byte readhexstring pop 0 get
    /number_pixels exch 1 add 3 mul def
  } ifelse
  0 3 number_pixels 1 sub
  {
    pixels exch color_packet putinterval
  } for
  pixels 0 number_pixels getinterval
} bind def

/DirectClassImage
{
  %
  % Display a DirectClass image.
  %
  systemdict /colorimage known
  {
    columns rows 8
    [
      columns 0 0
      rows neg 0 rows
    ]
    { DirectClassPacket } false 3 colorimage
  }
  {
    %
    % No colorimage operator;  convert to grayscale.
    %
    columns rows 8
    [
      columns 0 0
      rows neg 0 rows
    ]
    { GrayDirectClassPacket } image
  } ifelse
} bind def

/GrayDirectClassPacket
{
  %
  % Get a DirectClass packet;  convert to grayscale.
  %
  % Parameters:
  %   red
  %   green
  %   blue
  %   length: number of pixels minus one of this color (optional).
  %
  currentfile color_packet readhexstring pop pop
  color_packet 0 get 0.299 mul
  color_packet 1 get 0.587 mul add
  color_packet 2 get 0.114 mul add
  cvi
  /gray_packet exch def
  compression 0 eq
  {
    /number_pixels 1 def
  }
  {
    currentfile byte readhexstring pop 0 get
    /number_pixels exch 1 add def
  } ifelse
  0 1 number_pixels 1 sub
  {
    pixels exch gray_packet put
  } for
  pixels 0 number_pixels getinterval
} bind def

/GrayPseudoClassPacket
{
  %
  % Get a PseudoClass packet;  convert to grayscale.
  %
  % Parameters:
  %   index: index into the colormap.
  %   length: number of pixels minus one of this color (optional).
  %
  currentfile byte readhexstring pop 0 get
  /offset exch 3 mul def
  /color_packet colormap offset 3 getinterval def
  color_packet 0 get 0.299 mul
  color_packet 1 get 0.587 mul add
  color_packet 2 get 0.114 mul add
  cvi
  /gray_packet exch def
  compression 0 eq
  {
    /number_pixels 1 def
  }
  {
    currentfile byte readhexstring pop 0 get
    /number_pixels exch 1 add def
  } ifelse
  0 1 number_pixels 1 sub
  {
    pixels exch gray_packet put
  } for
  pixels 0 number_pixels getinterval
} bind def

/PseudoClassPacket
{
  %
  % Get a PseudoClass packet.
  %
  % Parameters:
  %   index: index into the colormap.
  %   length: number of pixels minus one of this color (optional).
  %
  currentfile byte readhexstring pop 0 get
  /offset exch 3 mul def
  /color_packet colormap offset 3 getinterval def
  compression 0 eq
  {
    /number_pixels 3 def
  }
  {
    currentfile byte readhexstring pop 0 get
    /number_pixels exch 1 add 3 mul def
  } ifelse
  0 3 number_pixels 1 sub
  {
    pixels exch color_packet putinterval
  } for
  pixels 0 number_pixels getinterval
} bind def

/PseudoClassImage
{
  %
  % Display a PseudoClass image.
  %
  % Parameters:
  %   class: 0-PseudoClass or 1-Grayscale.
  %
  currentfile buffer readline pop
  token pop /class exch def pop
  class 0 gt
  {
    currentfile buffer readline pop
    token pop /depth exch def pop
    /grays columns 8 add depth sub depth mul 8 idiv string def
    columns rows depth
    [
      columns 0 0
      rows neg 0 rows
    ]
    { currentfile grays readhexstring pop } image
  }
  {
    %
    % Parameters:
    %   colors: number of colors in the colormap.
    %   colormap: red, green, blue color packets.
    %
    currentfile buffer readline pop
    token pop /colors exch def pop
    /colors colors 3 mul def
    /colormap colors string def
    currentfile colormap readhexstring pop pop
    systemdict /colorimage known
    {
      columns rows 8
      [
        columns 0 0
        rows neg 0 rows
      ]
      { PseudoClassPacket } false 3 colorimage
    }
    {
      %
      % No colorimage operator;  convert to grayscale.
      %
      columns rows 8
      [
        columns 0 0
        rows neg 0 rows
      ]
      { GrayPseudoClassPacket } image
    } ifelse
  } ifelse
} bind def

/DisplayImage
{
  %
  % Display a DirectClass or PseudoClass image.
  %
  % Parameters:
  %   x & y translation.
  %   x & y scale.
  %   label pointsize.
  %   image label.
  %   image columns & rows.
  %   class: 0-DirectClass or 1-PseudoClass.
  %   compression: 0-none or 1-RunlengthEncoded.
  %   hex color packets.
  %
  gsave
  /buffer 512 string def
  /byte 1 string def
  /color_packet 3 string def
  /pixels 768 string def

  currentfile buffer readline pop
  token pop /x exch def
  token pop /y exch def pop
  x y translate
  currentfile buffer readline pop
  token pop /x exch def
  token pop /y exch def pop
  currentfile buffer readline pop
  token pop /pointsize exch def pop
  x y scale
  currentfile buffer readline pop
  token pop /columns exch def
  token pop /rows exch def pop
  currentfile buffer readline pop
  token pop /class exch def pop
  currentfile buffer readline pop
  token pop /compression exch def pop
  class 0 gt { PseudoClassImage } { DirectClassImage } ifelse
  grestore
  showpage
} bind def
%%EndProlog
%%Page:  1 1
%%PageBoundingBox: 57 391 93 409
DisplayImage
57 391
36 18
12
36 18
0
0
403F3F3F3F3F3F3F3F50983688E13489E03582C4376E913C4B483F3F3F3F3F3F3F3F3F3F3F3F3E
5AAF348AE03668643F3F3F3F3F3F3F3F423C68CA348ADD385A483F3F433C6BD13489D93856433F
41743787E134829E3C413F3F3F413D63C2348ADF3761563F3F423C68CA34403F3F3F3F3F3F3F3F
3F413E4E77396AAB377ED53489E23484AA3B45403F3F3F3F3F3F3F3F3F3E5AAF348AE03668643F
3F3F3F3F3F3F3F423C68CA348ADD3759463F3F433C6BD13489D93856433F42753887E134819D3C
413F3F3F413D63C2348ADF3761563F3F423C68CA34403F3F3F3F3F3F3F3F43493E403F3F3F3F3F
3F483C6ED33489D03852423F3F3F3F3F3F3F3F3F3E5AAF348AE03668643F3F3F3F3F3F3F3F423C
68CA348ADD3759463F3F433C6BD13489D93856433F4062397EDF3488C2394C423F40523B75DA34
8ADF3761563F3F423C68CA34403F3F3F3F3F3F413E5FB8357DB4386A963A67A23782DF3488BD3A
4A413F3F473C5D9838699B3875CC348AE0357BAB39699B3965743D40423C68CA348ADD3759463F
3F433C6BD13489D93856433F3F433D67C73489E13581BD3877CB3489E1348ADF3761563F3F423C
68CA34403F3F3F3F3F3F403E518B3778C63585DB3489DD3480BB385D5E3E3F3F3F404D3A76DE34
8AE2348AE2348AE2348AE2348AE234819D3C41423C68CA348ADD3759463F3F433C6BD13489D938
56433F3F3F3F425E3B70C43587DD357DAC396DC2348ADE3761553F3F423C68CA34403F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F42483E
413F3F3F3F3F3F463C6BCE3489DB385A493F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F53A03582C43773AA3774C435
89E13485B43B48413F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F4C83387BCD3587DE3488D9357BAE3955513F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F

%%PageTrailer
%%Trailer
%%EOF
