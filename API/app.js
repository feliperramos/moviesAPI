const service = require("./src/service");

async function startup() {
  console.log("Initialize server");
  try {
    console.log("service initialize successfull!");

    await service.initialize();
    await service.callApi();
  } catch (err) {
    console.log(err);

    process.exit(1);
  }
}

startup();
