import { UserSeederService } from '@/services';
import { NextFunction, Request, Response } from 'express';

export class UserSeederController {
  
  public userSeederService = new UserSeederService();
  
  public seedUsers = async (req: Request, res: Response, next: NextFunction): Promise<any> => {
    try {
      const result = await this.userSeederService.seedUsers();
      res.status(201).json({ data: result });
    } catch (error) {
      console.log("ERORO",error)
      next(error);
    }
  };
}
