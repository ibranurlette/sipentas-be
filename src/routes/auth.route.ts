import { Router } from 'express';
import { AuthController } from '@controllers/auth.controller';
import { SignUpDto, LoginDto } from '@dtos/auth';
import { Routes } from '@interfaces/routes.interface';
import { AuthMiddleware } from '@middlewares/auth.middleware';
import { ValidationMiddleware } from '@middlewares/validation.middleware';

export class AuthRoute implements Routes {
  public path = '/';
  public router = Router();
  public auth = new AuthController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.post(`${this.path}signup`, ValidationMiddleware(SignUpDto, 'body'), this.auth.signUp);
    this.router.post(`${this.path}login`, ValidationMiddleware(LoginDto, 'body'), this.auth.logIn);
    this.router.post(`${this.path}logout`, AuthMiddleware, this.auth.logOut);
  }
}
