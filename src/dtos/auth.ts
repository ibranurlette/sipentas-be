import { IsEmail, IsString, IsNotEmpty, MinLength, MaxLength, isEmail } from 'class-validator';

export class SignUpDto {
  @IsString()
  @IsNotEmpty()
  public name: string;

  @IsString()
  @IsNotEmpty()
  public username: string;

  @IsEmail()
  @IsNotEmpty()
  public email: string;

  @IsString()
  @IsNotEmpty()
  @MaxLength(32)
  public password: string;
}


export class LoginDto {
  @IsString()
  @IsNotEmpty()
  public username: string;
  
  @IsString()
  @IsNotEmpty()
  @MaxLength(32)
  public password: string;
}

export class UpdateUserDto {
  @IsString()
  @IsNotEmpty()
  @MaxLength(32)
  public password: string;
}
