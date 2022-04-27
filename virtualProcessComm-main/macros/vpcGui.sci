function vpcGui()
    //Coneção com o Banco de 
    bdVpcConect();

    dimensaoTela = get(0, "screensize_px");
    //Cria a Figura Principal
    mainFig = figure('layout', 'gridbag',...//plotGraph = createWindow();
                      'closerequestfcn','vpcGuiClose',...
                      'toolbar', 'none',...
                      'menubar', 'none',...
                      'visible','off',...
                      'backgroundcolor',[0.94 0.94 0.94],...
                      'tag','mainFig',...
                      'figure_name','Ambiente de Virtualização da Comunicação de Processos');
    set('mainFig','axes_size',[dimensaoTela(3)-300, dimensaoTela(4)-300]);
    //Coloca a tela no centro do monitor
    dimensaoFig = get('mainFig','figure_size');            
    set('mainFig','figure_position',..
                   [((dimensaoTela(1)+dimensaoTela(3)-dimensaoFig(1))/2);...
                    ((dimensaoTela(2)+dimensaoTela(4)-dimensaoFig(2))/2)-20]);
    ///////////////////////////////////////////////////////////////////////////////////////
    //Organização dos Frames
    // A tela terá 3 frames sendo cada um uma linha onde a informação será apresentada
    createFirstFrame(mainFig);
    createSecondFrame(mainFig);
    createThirdFrame(mainFig);
    mainFig.visible = 'on';     
endfunction

function createFirstFrame(mainFig)
   ///////////////////////////////////////////////////////////////////////////////////////
   //Elementos da 1º Linha de itens na tela
    l1Frame = uicontrol(mainFig,'layout', 'gridbag',..
                'style', 'frame',..
                'constraints', createConstraints("gridbag",[1, 1, 1, 1], [1, 0.05], "both"));
   //Texto com a palavra Protocolo
    uicontrol(l1Frame,...
        'Style','text',...
        'HorizontalAlignment','right',...//Orientação do texto deste encapsulamento        
        'constraints', createConstraints("gridbag", [1, 1, 1, 1], [0.1, 1], "horizontal", "center"),...
        'String','Protocolo:');
    //Popupmenu para seleção dos Processos
    uicontrol(l1Frame,...
        'Tag','protocol',...    
        'Style','popupmenu',...
        'Margins', [0 10 0 10],...//Cria um espaço em branco [top esquerda abaixo direita]        
        'constraints', createConstraints("gridbag", [2, 1, 1, 1], [0.5, 1], "horizontal", "center"),...
        'Callback','vpcReactInterface(''protocol'',''ui'',''mainFig'')',...
        'callback_type',10,...    
        'String',bdVpcGet('protocolString'),...
        'Value',bdVpcGet('protocol'));
    //Espaço para distanciar dos novos elementos
    uicontrol(l1Frame,...
        'Style','text',...
        'constraints', createConstraints("gridbag", [3, 1, 1, 1], [0.05, 1], "horizontal", "center"), ..
        'String',' ');
   //Texto com a palavra Processo
    uicontrol(l1Frame,...
        'Style','text',...
        'HorizontalAlignment','right',...//Orientação do texto deste encapsulamento        
        'constraints', createConstraints("gridbag", [4, 1, 1, 1], [0.1, 1], "horizontal", "center"),...
        'String','Processos:');
    //Popupmenu para seleção dos Processos
    uicontrol(l1Frame,...
        'Tag','process',...    
        'Style','popupmenu',...
        'Margins', [0 10 0 10],...//Cria um espaço em branco [top esquerda abaixo direita]        
        'constraints', createConstraints("gridbag", [5, 1, 1, 1], [0.5, 1], "horizontal", "center"),...
        'Callback','vpcReactInterface(''process'',''ui'',''mainFig'')',...
        'callback_type', 10,...    
        'String',bdVpcGet('processString'),...
        'Value',bdVpcGet('process'));
    //Botão para criar um novo Processo
    uicontrol(l1Frame,...
        'Tag','BNewProc',...
        'Style', 'pushbutton',...
        'String','New',...
        'Callback','vpcReactInterface(''BNewProc'',''process'',''mainFig'')',...
        'callback_type', 10,...
        'constraints', createConstraints("gridbag", [6, 1, 1, 1], [0.1, 1], "horizontal", "center"), ..
        'BackgroundColor',[0.00,0.00,1.00]);
    //Espaço para distanciar dos novos elementos
    uicontrol(l1Frame,...
        'Style','text',...
        'constraints', createConstraints("gridbag", [7, 1, 1, 1], [0.05, 1], "horizontal", "center"), ..
        'String',' ');
    //Botão para deletar o Processo corrente
    uicontrol(l1Frame,...
        'Tag','BDelProc',...
        'Style', 'pushbutton',...
        'String','Delete',...
        'Callback','vpcReactInterface(''BDelProc'',''process'',''mainFig'')',...
        'callback_type', 10,...    
        'constraints', createConstraints("gridbag", [8, 1, 1, 1], [0.1, 1],"horizontal", "center"), ..
        'BackgroundColor',[1.00,1.00,0.00]);
    //Espaço para distanciar dos novos elementos
    uicontrol(l1Frame,...
        'Style','text',...
        'constraints', createConstraints("gridbag", [9, 1, 1, 1], [0.2, 1], "horizontal", "center"), ..
        'String',' ');        
    //Texto com a palavra Dispositivos
    uicontrol(l1Frame,...
        'Style','text',...
        'HorizontalAlignment','right',...//Orientação do texto deste encapsulamento        
        'constraints', createConstraints("gridbag", [10, 1, 1, 1], [0.3, 1], "horizontal", "center"),...
        'String','Dispositivos:');
    //Popupmenu para seleção de um Dispositivo
    uicontrol(l1Frame,...
        'Tag','disp',...    
        'Style','popupmenu',...
        'Margins', [0 10 0 10],...//Cria um espaço em branco [top esquerda abaixo direita]        
        'constraints', createConstraints("gridbag", [11, 1, 1, 1], [0.5, 1], "horizontal", "center"),...
        'Callback','vpcReactInterface(''disp'',''ui'',''mainFig'')',...
        'callback_type', 10,...
        'String',bdVpcGet('dispString'),...
        'Value',bdVpcGet('disp'));
    //Botão para criar um novo Dispositivo
    uicontrol(l1Frame,...
        'Tag','BNewDisp',...
        'Style', 'pushbutton',...
        'String','New',...
        'Callback','vpcReactInterface(''BNewDisp'',''disp'',''mainFig'')',...
        'callback_type', 10,...
        'constraints', createConstraints("gridbag", [12, 1, 1, 1], [0.1, 1], "horizontal", "center"), ..
        'BackgroundColor',[0.00,0.00,1.00]);
    //Espaço para distanciar dos novos elementos
    uicontrol(l1Frame,...
        'Style','text',...
        'constraints', createConstraints("gridbag", [13, 1, 1, 1], [0.05, 1], "horizontal", "center"), ..
        'String',' ');
    //Botão para deletar um dispositivo corrente
    uicontrol(l1Frame,...
        'Tag','BDelDisp',...
        'Style', 'pushbutton',...
        'String','Delete',...
        'Callback','vpcReactInterface(''BDelDisp'',''disp'',''mainFig'')',...
        'callback_type', 10,...    
        'constraints', createConstraints("gridbag", [14, 1, 1, 1], [0.1, 1],"horizontal", "center"), ..
        'BackgroundColor',[1.00,1.00,0.00]);
    //Espaço para distanciar dos novos elementos
    uicontrol(l1Frame,...
        'Style','text',...
        'constraints', createConstraints("gridbag", [15, 1, 1, 1], [0.2, 1], "horizontal", "center"), ..
        'String',' ');    
endfunction

function createSecondFrame(mainFig)
    global %VirtualProcessCommPath
    ///////////////////////////////////////////////////////////////////////////////////////        
    //Elementos da segunda linha da tela (ocupa a maioria da tela)
    l2Frame = uicontrol(mainFig,'layout', 'gridbag', ...
                'style', 'frame', ...
                'constraints', createConstraints("gridbag", [1, 2, 1, 1], [1, 0.9], "both"));
    //Esta linha terá duas colunas 
    c1Frame = uicontrol(l2Frame,'layout', 'gridbag',...
                              'Scrollable', %T,...
                              'tag','c1Frame',...    
                              'style', 'frame',..
                              'constraints', createConstraints("gridbag",[1, 1, 1, 1],...
                                                               [0.5, 1], "both"));
    c2Frame = uicontrol(l2Frame,'layout', 'gridbag', ...
                              'Scrollable', %T,...

                              'style', 'frame', ...
                              'constraints', createConstraints("gridbag", [2, 1, 1, 1],...
                                                               [0.5, 1], "both"));
    //Esta função construe os elementos graficos da primeira coluna da Segunda Linha
    vpcGuiTrmsView(c1Frame); 
    //Elemento grafico da Segunda coluna da Segunda Linha
    uicontrol(c2Frame,...//'BackgroundColor',[1,1,1],...
         'tag','image',...
         'HorizontalAlignment','center',...//Orientação do texto deste encapsulamento
         'Style','text',...
         'constraints', createConstraints("gridbag",[1, 1, 1, 1],[1, 1],"both","center"),...
         'String',bdVpcGet("image")); 
endfunction

function createThirdFrame(mainFig)
    ///////////////////////////////////////////////////////////////////////////////////////
    //Elementos da Treceira Linha
    l3Frame = uicontrol(mainFig,'layout', 'gridbag', ...
                'style', 'frame', ...
                'constraints', createConstraints("gridbag", [1, 3, 1, 1], [1, 0.05],...
                                                 "horizontal","lower",[0,0],[10, 50]));
    c11Frame = uicontrol(l3Frame,...
               'layout', 'gridbag', ...
               'style', 'frame', ...
               'Relief','groove',...
               'Margins', [0 10 0 10],...
               'constraints', createConstraints("gridbag", [1, 2, 5, 1], [1, 1], "both"));
    uicontrol(c11Frame,...
           'HorizontalAlignment','center',...//Orientação do texto deste encapsulamento
           'Style','text',...
           'Margins', [0 0 0 0],...//Cria um espaço em branco [top esquerda abaixo direita]
           'constraints',createConstraints('gridbag',[3, 1, 5, 1],[0.1, 1],'horizontal','right'),...
           'String','Serial Port Configuration');             
    uicontrol(c11Frame,...
           'Tag','tPort',...
           'HorizontalAlignment','right',...//Orientação do texto deste encapsulamento
           'Style','text',...
           'Margins', [5 5 5 5],...//Cria um espaço em branco [top esquerda abaixo direita]
           'constraints', createConstraints("gridbag", [1, 2, 1, 1], [0.05, 1], "horizontal", "right", [0, 0], [10 35]),...
           'String','Porta: '); 
    uicontrol(c11Frame,...
           'Tag','porta',...
           'HorizontalAlignment','center',..//Orientação do texto deste encapsulamento
           'Style','edit',...
           'String',bdVpcGet('porta'),...
           'Callback','vpcReactInterface(''porta'')',...
           'callback_type', 10,...    
           'Margins', [0 0 0 5],...//Cria um espaço em branco [top esquerda abaixo direita]
           'constraints', createConstraints("gridbag", [2, 2, 1, 1], [0.6, 1], "horizontal", "left", [0, 0], [10 25])); 
    uicontrol(c11Frame,...
           'Tag','tBaudRate',...    
           'HorizontalAlignment','right',...//Orientação do texto deste encapsulamento
           'Style','text',...
           'Margins', [0 0 0 5],...//Cria um espaço em branco [top esquerda abaixo direita]
           'constraints', createConstraints("gridbag", [3, 2, 1, 1], [0.05, 1], "horizontal", "right", [0, 0], [10 35]),...
           'String','BaudRate: '); 
    uicontrol(c11Frame,...
           'Tag','baudRate',...
           'HorizontalAlignment','center',...//Orientação do texto deste encapsulamento
           'Style','edit',...
           'String',bdVpcGet('baudRate'),...
           'Callback','vpcReactInterface(''baudRate'')',...
           'callback_type', 10,...    
           'Margins', [0 0 0 5],...//Cria um espaço em branco [top esquerda abaixo direita]
           'constraints', createConstraints("gridbag", [4, 2, 1, 1], [0.6, 1], "horizontal", "left", [0, 0], [25 25]));      
    uicontrol(c11Frame,...
           'Tag','tDataBits',...
           'HorizontalAlignment','right',...//Orientação do texto deste encapsulamento
           'Style','text',...
           'Margins', [0 0 0 5],...//Cria um espaço em branco [top esquerda abaixo direita]
           'constraints', createConstraints("gridbag", [5, 2, 1, 1], [0.05, 1], "horizontal", "right", [0, 0], [10 35]),...
           'String','Data Bits: '); 
    uicontrol(c11Frame,...
           'Tag','dataBits',...
           'HorizontalAlignment','center',..//Orientação do texto deste encapsulamento
           'Style','edit',...
           'String',bdVpcGet('dataBits'),...
           'Callback','vpcReactInterface(''dataBits'')',...
           'callback_type', 10,...    
           'Margins', [0 0 0 5],...//Cria um espaço em branco [top esquerda abaixo direita]
           'constraints', createConstraints("gridbag", [6, 2, 1, 1], [0.6, 1], "horizontal", "left", [0, 0], [10 25])); 
    uicontrol(c11Frame,...
           'Tag','tParity',...    
           'HorizontalAlignment','right',...//Orientação do texto deste encapsulamento
           'Style','text',...
           'Margins', [0 0 0 5],...//Cria um espaço em branco [top esquerda abaixo direita]
           'constraints', createConstraints("gridbag", [7, 2, 1, 1], [0.05, 1], "horizontal", "right", [0, 0], [10 35]),...
           'String','Paridade: '); 
    uicontrol(c11Frame,...
           'Tag','paridade',...
           'HorizontalAlignment','center',...//Orientação do texto deste encapsulamento
           'Style','edit',...
           'String',bdVpcGet('paridade'),...
           'Callback','vpcReactInterface(''paridade'')',...
           'callback_type', 10,...    
           'Margins', [0 0 0 5],...//Cria um espaço em branco [top esquerda abaixo direita]
           'constraints', createConstraints("gridbag", [8, 2, 1, 1], [0.6, 1], "horizontal", "left", [0, 0], [10 25]));       
    uicontrol(c11Frame,...
           'Tag','tStopBits',...    
           'HorizontalAlignment','right',...//Orientação do texto deste encapsulamento
           'Style','text',...
           'Margins', [0 0 0 5],...//Cria um espaço em branco [top esquerda abaixo direita]
           'constraints', createConstraints("gridbag", [9, 2, 1, 1], [0.05, 1], "horizontal", "right", [0, 0], [10 35]),...
           'String','Stop Bits: '); 
    uicontrol(c11Frame,...
           'Tag','stopBits',...
           'HorizontalAlignment','center',...//Orientação do texto deste encapsulamento
           'Style','edit',...
           'String',bdVpcGet('stopBits'),...
           'Callback','vpcReactInterface(''stopBits'')',...
           'callback_type', 10,...    
           'Margins', [0 0 0 5],...//Cria um espaço em branco [top esquerda abaixo direita]
           'constraints', createConstraints("gridbag", [10, 2, 1, 1], [0.6, 1], "horizontal", "left", [0, 0], [10 25]));    
    uicontrol(c11Frame,...
        'Style','text',...
        'constraints', createConstraints("gridbag", [11, 2, 1, 1], [1, 1], "horizontal", "center"), ..
        'String',' ');
    uicontrol(c11Frame,...
        'Tag','BConectar',...
        'Style','pushbutton',...
        'String','Conectar',...
        'Callback','vpcGuiConectar',...
        'constraints', createConstraints("gridbag", [12, 2, 1, 1], [0.1, 1], "horizontal", "center"), ..
        'BackgroundColor',[0.00,1.00,0.00]);
    uicontrol(c11Frame,...
        'Style','text',...
        'constraints', createConstraints("gridbag", [13, 2, 1, 1], [0.05, 1], "horizontal", "center"), ..
        'String',' ');
    uicontrol(c11Frame,...
        'Tag','BDesconectar',...
        'Enable','off',...
        'Style','pushbutton',...
        'String','Desconectar',...
        'Callback','vpcGuiDesconectar',...
        'callback_type', 12,...
        'constraints', createConstraints("gridbag", [14, 2, 1, 1], [0.1, 1],"horizontal", "center"), ..
        'BackgroundColor',[1.00,0.00,0.00]);
    uicontrol(c11Frame,...
        'Style','text',...
        'constraints', createConstraints("gridbag", [15, 2, 1, 1], [1, 1], "horizontal", "center"), ..
        'String',' ');                
endfunction