// llamada al contrato

const notas = artifacts.require('notas');

contract('notas', accounts => {
    it('1. Funcion evaluar', async () => {
        let instance = await notas.deployed();

        const tx = await instance.evaluar('Matematicas', '123', 7, { from: accounts[0] })

        // console.log(accounts[0])
        console.log(tx)

        const nota_alumno = await instance.verNotas.call('Matematicas', '123', { from: accounts[1] });

        // assert.equal(nota_alumno, 8, 'Se esperaba un 8 y se ha recibido un ' + nota_alumno);
        assert.equal(nota_alumno, 7);
    });

    it('2. Funcion verRevisiones', async () => {
        let instance = await notas.deployed();

        const tx = await instance.evaluar('Matematicas', '456', 2, { from: accounts[0] })

        const revision = await instance.revision('Matematicas', '456');

        const revisiones = await instance.verRevisiones('Matematicas');

        assert.equal(revisiones[0], '456');
    });
});