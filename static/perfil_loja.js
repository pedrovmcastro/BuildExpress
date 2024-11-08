//Perfil da Loja

document.addEventListener('DOMContentLoaded', function() {

    const mudarLogoSpan = document.getElementById("mudar-logo-span");
    if (mudarLogoSpan) {

        mudarLogoSpan.onclick = function() {
            document.getElementById("ed-logo").click();
        }

        // Atualiza a imagem após a escolha de um arquivo
        document.getElementById("ed-logo").onchange = function(event) {

            // Exibe a imagem selecionada no lugar do texto "Adicionar logo"
            const file = event.target.files[0];
            if (file) {
                console.log("Arquivo selecionado:", file);
                // Cria um URL para o arquivo selecionado
                const reader = new FileReader();
                reader.onload = function(e) {
                    console.log("Entrou no onload")
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.className = 'img-fluid rounded-circle';
                    img.width = 180; // Ajuste para a largura desejada
                    img.height = 180; // Ajuste para a altura desejada

                    // Substitui a imagem existente pela nova
                    const logoImg = document.getElementById('img-logo-perfil');
                    if (logoImg) {
                        console.log("achou o img-logo-perfil");
                        logoImg.src = img.src; // Atualiza a imagem existente diretamente
                    } else {
                        console.log("Elemento img-logo-perfil não encontrado!");
                    }
                };
                reader.readAsDataURL(file); // Lê o arquivo como url
            } else {
                console.log("Nenhum arquivo foi selecionado");
            }
        }

    }

    // Ao clicar no texto "Adicionar logo", o input de upload é acionado
    document.getElementById("logo-circle").onclick = function() {
        document.getElementById("id_logo").click();
    };

    // Atualiza a imagem após a escolha de um arquivo
    document.getElementById("id_logo").onchange = function(event) {
        // Exibe a imagem selecionada no lugar do texto "Adicionar logo"
        const file = event.target.files[0];
        if (file) {
            //Cria um URL para o arquivo selecionado
            const reader = new FileReader();
            reader.onload = function(e) {
                const img = document.createElement('img');
                img.src = e.target.result
                img.className = 'img-fluid';
                img.width = 100;
                img.height = 100;

                //Substitui o conteúdo do círculo pela imagem
                const logoCircle = document.getElementById('logo-circle');
                logoCircle.innerHTML = ""; //Limpa o conteúdo anterior
                logoCircle.appendChild(img); //Adiciona a nova imagem
            };
            reader.readAsDataURL(file); //Lê o arquivo como url 
        }
    };
});