import "reflect-metadata";
import { createConnection, Connection } from "typeorm";
import * as express from "express";
import * as bodyParser from "body-parser";
import * as helmet from "helmet";
import * as cors from "cors";
import * as multer from "multer";
import routes from "./routes";
import CategoryController from "./controller/CategoryController";


const elastic = require('elasticsearch');
const elasticClient = elastic.Client({
  host:'localhost:9200'
});



const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./uploads/");
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});
const upload = multer({ storage: storage });
const port = 3000;
//Connects to the Database -> then starts the express
createConnection()
  .then(async (connection) => {
    // Create a new express application instance
    const app = express();
    // Call midlewares
    app.use(cors());
    app.use(helmet());
    app.use(bodyParser.json());
    //Set all routes from routes folder
    app.use("/", routes);
    app.use('/images',express.static('./uploads/'));


    app.post("/uploads", upload.single("image"), function (req, res) {
      if (!req.file) {
        console.log("Your request doesn’t have any file");
        return res.send({
          success: false,
        });
      } else {
        console.log("Your file has been received successfully");
        return res.send({
          success: true,
        });
      }
    });

    app.post('/upload',upload.single('filedata'),async(req,res)=>{
      const{filename :image} = req.file
      let id =req.body.id;
      CategoryController.updatePicture(image,id);
     
      console.log(image);
      return res.send("SUCCESS");
    })
    app.listen(process.env.PORT || port, () => {
      console.log("Server started on port "+port);
    });
  })
  .catch((error) => console.log(error));
