<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Каталог Язовири</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <link rel="stylesheet" type="text/css" href="styles.css" />
      </head>
      <script>
        function showDams() {
            document.getElementById('damsListContainer').style.display = "inline";
            document.getElementById('areaContainer').style.display = "none";
            document.getElementById('regionsContainer').style.display = "none";
        };
        function showArea() {
            document.getElementById('damsListContainer').style.display = "none";
            document.getElementById('areaContainer').style.display = "inline";
            document.getElementById('regionsContainer').style.display = "none";
        };
        function showRegions() {
            document.getElementById('damsListContainer').style.display = "none";
            document.getElementById('areaContainer').style.display = "none";
            document.getElementById('regionsContainer').style.display = "block";
        }
      </script>
      <body onload="showDams();">
        <h1>Язовири в България</h1>
        <hr/>
        <div id="menu">
          <button class="button" onclick="showDams();">
            Язовири
          </button>
          <button class="button" onclick="showArea();">
            По площ
          </button>
          <button class="button" onclick="showRegions();">
            По област
          </button>
        </div>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>


  <xsl:template match="/damsCatalog/damsList">
    <div id="damsListContainer" class="container">
      <div class="row">
        <xsl:for-each select="/damsCatalog/damsList/dam[@id &lt; 10]">
            <xsl:sort
                select="@id"
                data-type="number"
                order="descending"/>

            <div style="color:white;" class="dam col-lg-12 container">
                <div class="presentation col-md-4">
                  <p id="damName" style="text-align: center">
                    <xsl:value-of select="name"/>
                  </p>
<!--                  <xsl:variable name="picName" select="picture/@location"/>-->
                  <!--<img src="damImages/pic{id}.jpg"/>-->
                  <img src="{unparsed-entity-uri(picture/@location)}"/>
                </div>


                <div id="damDetail" class="col-md-3">
                    <p id="label">Име</p>
                    <p>
                      <xsl:value-of select="name"/>
                    </p>
                    <p id="label">Област</p>
                    <p>
                      <xsl:value-of select="region"/>
                    </p>
                    <p id="label">Надморска височина</p>
                    <p>
                      <xsl:value-of select="altitude"/>
                    </p>
                    <p id="label">Година на откриване</p>
                    <p>
                      <xsl:value-of select="constructionYear"/>
                    </p>
                </div>

                <div id="extraInfo" class="col-md-8">
                    <p id="label">Обем</p>
                    <p>
                      <xsl:value-of select="lake/waterVolume"/>
                    </p>
                        <p id="label">Площ</p>
                    <p>
                      <xsl:value-of select="lake/full-area"/>
                    </p>
                    <p id="label">Вид стена</p>
                    <p>
                      <xsl:value-of select="damWall/type"/>
                    </p>
                </div>
            </div>
        </xsl:for-each>
      </div>
    </div>

     <div id="areaContainer" style="display:none;" class="container">
      <div class="row">
        <xsl:for-each select="/damsCatalog/damsList/dam[@id &lt; 10]">
            <xsl:sort
                select="lake/area"
                data-type="number"
                order="descending"/>

            <div style="color:white;" class="dam col-lg-12 container">
                <div class="presentation col-md-4">
                  <p id="damName" style="text-align: center">
                    <xsl:value-of select="name"/>
                  </p>
                  <img src="{unparsed-entity-uri(picture/@location)}"/>
                </div>


                <div id="damDetail" class="col-md-3">
                    <p id="label">Име</p>
                    <p>
                      <xsl:value-of select="name"/>
                    </p>
                    <p id="label">Област</p>
                    <p>
                      <xsl:value-of select="region"/>
                    </p>
                    <p id="label">Надморска височина</p>
                    <p>
                      <xsl:value-of select="altitude"/>
                    </p>
                    <p id="label">Година на откриване</p>
                    <p>
                      <xsl:value-of select="constructionYear"/>
                    </p>
                </div>

                <div id="extraInfo" class="col-md-8">
                    <p id="label">Обем</p>
                    <p>
                      <xsl:value-of select="lake/waterVolume"/>
                    </p>
                    <p id="label">Площ</p>
                    <p>
                      <xsl:value-of select="lake/full-area"/>
                    </p>
                    <p id="label">Вид стена</p>
                    <p>
                      <xsl:value-of select="damWall/type"/>
                    </p>
                </div>
            </div>
        </xsl:for-each>
      </div>
    </div>
  </xsl:template>


  <xsl:template match="/damsCatalog/regions">
    <div id="regionsContainer" style="display:none;" class="container">
        <xsl:for-each select="/damsCatalog/regions/regionInfo">
            <div class="region container" style="display:block;">

                <xsl:variable name="regionId" select="@regionRefId"/>
        
                <div id="regionLabel" class="row">
                    <xsl:value-of select="@regionRef"/>
                </div>

                <div class="row container">
                    <xsl:for-each select="/damsCatalog/damsList/dam[regionId = $regionId]">
                        <div class="row container item">
                            <div class="presentation col-md-4">
                                <p id="damName" style="text-align: center">
                                    <xsl:value-of select="name"/>
                                </p>
                                <img src="{unparsed-entity-uri(picture/@location)}"/>
                            </div>


                            <div id="damDetail" class="col-md-3">
                                <p id="label">Име</p>
                                <p>
                                  <xsl:value-of select="name"/>
                                </p>
                                <p id="label">Област</p>
                                <p>
                                  <xsl:value-of select="region"/>
                                </p>
                                <p id="label">Надморска височина</p>
                                <p>
                                  <xsl:value-of select="altitude"/>
                                </p>
                                <p id="label">Година на откриване</p>
                                <p>
                                  <xsl:value-of select="constructionYear"/>
                                </p>
                            </div>
                            <div id="extraInfo" class="col-md-5">
                                <p id="label">Обем</p>
                                <p>
                                  <xsl:value-of select="lake/waterVolume"/>
                                </p>
                                <p id="label">Площ</p>
                                <p>
                                  <xsl:value-of select="lake/full-area"/>
                                </p>
                                <p id="label">Вид стена</p>
                                <p>
                                  <xsl:value-of select="damWall/type"/>
                                </p>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:for-each>
    </div>
  </xsl:template>

</xsl:stylesheet>
