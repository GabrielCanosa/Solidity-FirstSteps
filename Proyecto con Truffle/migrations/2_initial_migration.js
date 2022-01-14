const Hola = artifacts.require("Hola");

module.exports = function (deployer) {
  deployer.deploy(Hola);
};
