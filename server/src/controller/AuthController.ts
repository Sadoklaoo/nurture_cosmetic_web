import { Request, Response } from "express";
import * as jwt from "jsonwebtoken";
import { getRepository } from "typeorm";
import config from "../config/config";
import { validate } from "class-validator";
import { json } from "body-parser";
import { Admin } from "../entities/Admin";
import { Client } from "../entities/Client";
import { User } from "../entities/User";
const clientTwilio = require("twilio")(config.accountSid, config.authToken);
var randomize = require("randomatic");

class AuthController {
  static login = async (req: Request, res: Response) => {
    //Check if username and password are set
    // Type account to determinate if its : CLIENT OR ADMIN OR MANAGER
    let { email, password, typeAccount } = req.body;

    let token;

    console.log(req.body);

    //console.log("Phone Number  : "+email+" Password : " + password+ " Type Account " +typeAccount);
    if (!(email && password && typeAccount)) {
      res.status(400).send();
    }

    let user;
    if (typeAccount == "ADMIN") {
      //Get user from database
      const adminRepository = getRepository(Admin);
      try {
        user = await adminRepository.findOneOrFail({ where: { email } });
        token = jwt.sign(
          {
            userId: user.id,
            email: user.email,
            userName: user.firstName,
            role: user.role,
          },
          config.jwtSecret,
          { expiresIn: "1000h" }
        );
      } catch (error) {
        res.status(401).send();
        console.log("Wrong email");
        return;
      }
    } else if (typeAccount == "CLIENT") {
      //Get user from database
      const clientRepository = getRepository(Client);
      try {
        user = await clientRepository.findOneOrFail({ where: { email } });
        token = jwt.sign(
          {
            userId: user.id,
            email: user.email,
            userName: user.firstName,
            role: user.role,
          },
          config.jwtSecret,
          { expiresIn: "1000h" }
        );
      } catch (error) {
        res.status(402).send();
        console.log("Wrong email");
        return;
      }
    }
    if (!user) {
      res.status(401).send();
    }
    //Check if encrypted password match
    if (!user.checkIfUnencryptedPasswordIsValid(password)) {
      console.log("Wrong password");
      res.status(403).send("Wrong password");
      return;
    }
    //Sing JWT, valid for 1 hour

    let jsonResponse: any = { token: token, expiresIn: "1000h" };
    //Send the jwt in the response
    console.log(jsonResponse);

    res.status(200).json(jsonResponse);
  };

  /**
   * Compares two Date objects and returns e number value that represents
   * the result:
   * 0 if the two dates are equal.
   * 1 if the first date is greater than second.
   * -1 if the first date is less than second.
   * @param date1 First date object to compare.
   * @param date2 Second date object to compare.
   */
  public static compareDate(date1: Date, date2: Date): number {
    // With Date object we can compare dates them using the >, <, <= or >=.
    // The ==, !=, ===, and !== operators require to use date.getTime(),
    // so we need to create a new instance of Date with 'new Date()'
    let d1 = new Date(date1);
    let d2 = new Date(date2);

    // Check if the dates are equal
    let same = d1.getTime() === d2.getTime();
    if (same) return 0;

    // Check if the first is greater than second
    if (d1 > d2) return 1;

    // Check if the first is less than second
    if (d1 < d2) return -1;
  }

  static loginWeb = async (req: Request, res: Response) => {
    //Check if username and password are set
    // Type account to determinate if its : CLIENT OR ADMIN OR MANAGER
    let { email, password } = req.body;
    let token;
    console.log(req.body);
    //console.log("Phone Number  : "+email+" Password : " + password+ " Type Account " +typeAccount);
    if (!(email && password)) {
      res.status(400).send();
    }
    let user;
    //////if (typeAccount=="ADMIN")
    //Get user from database
    const adminRepository = getRepository(Admin);

    user = await adminRepository.findOne({ where: { email } });

    if (user) {
      try {
        token = jwt.sign(
          {
            userId: user.id,
            email: user.email,
            userName: user.firstName,
            role: user.role,
          },
          config.jwtSecret,
          { expiresIn: "1000h" }
        );
      } catch (error) {
        res.status(401).send();
        console.log("Wrong email");
        return;
      }
    }

    if (!user) {
      res.status(401).send();
    }
    //Check if encrypted password match
    if (!user.checkIfUnencryptedPasswordIsValid(password)) {
      console.log("Wrong password");
      res.status(403).send("Wrong password");
      return;
    }
    //Sing JWT, valid for 1 hour

    let jsonResponse: any = { token: token, role: user.role };
    //Send the jwt in the response
    console.log(jsonResponse);

    res.status(200).json(jsonResponse);
  };

  static sendRequestCode = async (req: Request, res: Response) => {
    //Get parameters from the body
    let { phoneNumber } = req.body;
    let client: Client;
    const clientRepository = getRepository(Client);
    client = await clientRepository.findOne({
      where: { phoneNumber: phoneNumber, verified: false },
    });

    if (client) {
      console.log("Exist");
      let requestcode = randomize("0", 4);
      client.requestCode = requestcode;

      try {
        await clientRepository.save(client);
        clientTwilio.messages
          .create({
            body: "Open fidelity app and  use your code " + requestcode,
            from: "+12058131475",
            to: "+216" + phoneNumber,
          })
          .then((message) => console.log(message.sid));
      } catch (e) {
        res.status(400).send("a problem has been occured in saving client");
        return;
      }
      res.status(201).send("New request code is sent");
      return;
    } else {
      client = new Client();
      console.log("doestnexist");
      client.phoneNumber = phoneNumber;
      let requestcode = randomize("0", 4);
      client.requestCode = requestcode;
      client.role = "CLIENT";

      try {
        await clientRepository.save(client);
        clientTwilio.messages
          .create({
            body: "Open fidelity app and  use your code " + requestcode,
            from: "+12058131475",
            to: "+216" + phoneNumber,
          })
          .then((message) => console.log(message.sid));
        res.status(201).send("New client saved Now enter verify Code");
      } catch (e) {
        res.status(401).send("Phone Number already in use");
        return;
      }

      console.log("Message sent");
      //If all ok, send 201 response
    }

    //Validade if the parameters are ok
    /*    const errors = await validate(client);
       if (errors.length > 0) {
         res.status(400).send(errors);
         return;
       } */

    //Try to save. If fails, the phoneNumber is already in use
  };

  

  //! VerifyCode Function
  static checkRequstCode = async (req: Request, res: Response) => {
    //Get values from the body
    const { phoneNumber, requestCode } = req.body;
    let client: Client;
    //Try to find client on database
    const clientRepository = getRepository(Client);

    try {
      client = await clientRepository.findOneOrFail({
        where: { phoneNumber: phoneNumber, verified: false },
      });
    } catch (error) {
      res.status(400).send("Please verify your phone Number");
      return;
    }
    if (client.requestCode == requestCode) {
      client.requestCode = null;
      client.verified = true;
      clientRepository.save(client);
      console.log(client);
      res.status(200).send("Code verified");
      return;
    } else {
      res.status(403).send("Please verify code");
    }
  };

  static changePassword = async (req: Request, res: Response) => {
    //Get ID from JWT
    const id = res.locals.jwtPayload.userId;
    let user: User;
    //Get parameters from the body
    const { oldPassword, newPassword, typeAccount } = req.body;
    console.log(req);
    if (!(oldPassword && newPassword)) {
      res.status(403).send();
    }

    if (typeAccount == "ADMIN") {
      //Get user from database
      const adminRepository = getRepository(Admin);
      try {
        user = await adminRepository.findOneOrFail({ where: { id } });
        //!HERE
        //Check if old password matchs
        if (!user.checkIfUnencryptedPasswordIsValid(oldPassword)) {
          res.status(401).send("Old password doesnt match");
          return;
        }

        //Validate de model (password lenght)
        user.password = newPassword;
        const errors = await validate(user);
        if (errors.length > 0) {
          res.status(400).send(errors);
          return;
        }
        //Hash the new password and save
        user.hashPassword();
        adminRepository.save(user);
        res.status(200).send("Password updated");
        //!END HERE
      } catch (error) {
        res
          .status(401)
          .send("Problem occured with Token , please retry later or reconnect");
        return;
      }
    } else if (typeAccount == "CLIENT") {
      //Get user from database
      const clientRepository = getRepository(Client);
      try {
        user = await clientRepository.findOneOrFail({ where: { id } });
        //!HERE
        //Check if old password matchs
        if (!user.checkIfUnencryptedPasswordIsValid(oldPassword)) {
          res.status(401).send("Old password doesnt match");
          return;
        }

        //Validate de model (password lenght)
        user.password = newPassword;
        const errors = await validate(user);
        if (errors.length > 0) {
          res.status(400).send(errors);
          return;
        }
        //Hash the new password and save
        user.hashPassword();
        clientRepository.save(user);
        res.status(200).send("Password updated");
        //!END HERE
      } catch (error) {
        res
          .status(401)
          .send("Problem occured with Token , please retry later or reconnect");
        return;
      }
    }
  };
}
export default AuthController;
