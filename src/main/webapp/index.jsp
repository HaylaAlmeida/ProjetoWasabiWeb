<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="firstHeader.html"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/index.css">
    <title>Restaurante Wasabi</title>
</head>
<body>
<main>
    <div class="presentation">
        <div>
            <div class="info">
                <span class="v51_13">Restaurante Wasabi</span>
                <span class="v51_15">Restaurante de<strong> COMIDA JAPONESA</strong>, de boa qualidade, preços acessíveis e o melhor: com <strong>DELIVERY</strong>! Registre-se e peça já.</span>
                <span class="v52_69" > <a href="registro.jsp">Registrar</a></span></div>
            <div class="imagem"></div>
        </div>
    </div>
</main>
</body>
</html>

<br/><br/>
<style>* {
    box-sizing: border-box;
}
body {
    font-size: 14px;
}
a {
    color: #CBB26A;
}
.presentation {
    margin: auto;
    width: 100%;
    height: 677px;
    background-size: cover;
    opacity: 1;
    position: absolute;
    top: 14rem;
    overflow: hidden;
}
.info {

    width: 740px;
    height: 583px;
    background: #222;
    opacity: 1;
    position: relative;
    top: 94px;
    left: 872px;
    overflow: hidden;
}
.v51_13 {
    width: 468px;
    color: rgba(255,255,255,1);
    position: absolute;
    top: 65px;
    left: 183px;
    font-family: DM Serif Display;
    font-weight: normal;
    font-size: 64px;
    opacity: 1;
    text-align: left;
}
.v51_15 {
    width: 412px;
    color: rgba(255,255,255,1);
    position: absolute;
    top: 255px;
    left: 183px;
    font-size: 32px;
    opacity: 1;
    text-align: justify;
}
.v52_69 {
    width: 136px;
    color: rgba(203,178,106,1);
    position: relative;
    top: 494px;
    left: 467px;
    font-family: Roboto;
    font-weight: bold;
    font-size: 32px;
    opacity: 1;
    text-align: left;
}
.imagem {
    width: 711px;
    height: 473px;
    background: url("/img/capa.png");
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    opacity: 1;
    position: absolute;
    top: 0px;
    left: 300px;
    overflow: hidden;
}
</style>