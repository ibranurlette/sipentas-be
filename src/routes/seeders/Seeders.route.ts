import { Router } from 'express';
import { UserSeederController } from '@/controllers';
import { Routes } from '@interfaces/routes.interface';

export class SeedersRoute implements Routes {
  public path = '/seeders';
  public router = Router();
  public userSeederController = new UserSeederController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.get(`${this.path}/users`, this.userSeederController.seedUsers);
  }
}
