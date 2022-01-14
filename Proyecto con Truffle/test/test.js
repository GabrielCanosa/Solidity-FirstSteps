const Hola = artifacts.require("Hola");

contract('Hola', accounts => {
    it('Obtener mensaje', async () => {
        // instance es el contrato desplegado
        let instance = await Hola.deployed();
        // Estoy llamando al metodo getMessage del contrato y pasandole la primera cuenta (por ejmplo de Ganache)
        const message = await instance.getMessage.call({from: accounts[0]});

        assert.equal(message, 'Hola Mundo');
    });

    it('Cambiar mensaje', async () => {
        let instance = await Hola.deployed();

        const transaccion = await instance.setMessage('Adios Mundo', {from: accounts[1]});

        const message = await instance.getMessage.call();

        assert.equal(message, 'Adios Mundo');
    });
})