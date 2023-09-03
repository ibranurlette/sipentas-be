import { Router } from 'express';
import { UserSeederController, PpksSeederController } from '@/controllers';
import { Routes } from '@interfaces/routes.interface';

export class SeedersRoute implements Routes {
  public path = '/seeders';
  public router = Router();
  public userSeederController = new UserSeederController();
  public ppksSeederController = new PpksSeederController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.get(`${this.path}/users`, this.userSeederController.seedUsers);
    this.router.get(`${this.path}/categorie-ppks`, this.ppksSeederController.seedCategoriPpks);
    this.router.get(`${this.path}/ragam-ppks`, this.ppksSeederController.seedRagamPpks);
  }
}
