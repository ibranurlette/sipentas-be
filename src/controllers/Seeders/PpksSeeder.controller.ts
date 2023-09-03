import { PpksSeederService } from '@/services';
import { NextFunction, Request, Response } from 'express';

export class PpksSeederController {
  
  public ppksSeederService = new PpksSeederService();
  
  public seedCategoriPpks = async (req: Request, res: Response, next: NextFunction): Promise<any> => {
    try {
      const result = await this.ppksSeederService.categoriePpks();
      res.status(201).json({ data: result });
    } catch (error) {
      next(error);
    }
  };

  public seedRagamPpks = async (req: Request, res: Response, next: NextFunction): Promise<any> => {
    try {
      const result = await this.ppksSeederService.ragamPpks();
      res.status(201).json({ data: result });
    } catch (error) {
      next(error);
    }
  };

}
