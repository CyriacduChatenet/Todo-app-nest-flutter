import {
  Injectable,
  NotFoundException,
  UnauthorizedException,
} from '@nestjs/common';

import { SignupUserInputDTO } from './dto/signup-user.dto';
import { UpdateUserDTO } from './dto/update-user.dto';
import { UserRepository } from './user.repository';

@Injectable()
export class UserService {
  constructor(private readonly userRepository: UserRepository) {}

  create(createUserDto: SignupUserInputDTO) {
    try {
      return this.userRepository.createUser(createUserDto);
    } catch (err) {
      throw new UnauthorizedException(err);
    }
  }

  findAll(queries) {
    try {
      return this.userRepository.findAllUser(queries);
    } catch (err) {
      throw new NotFoundException(err);
    }
  }

  findOneByEmail(email: string) {
    try {
      return this.userRepository.findOneUserByEmail(email);
    } catch (err) {
      throw new NotFoundException(err);
    }
  }

  update(id: string, updateUserDto: UpdateUserDTO) {
    try {
      return this.userRepository.updateUser(id, updateUserDto);
    } catch (err) {
      throw new UnauthorizedException(err);
    }
  }

  remove(id: string) {
    try {
      return this.userRepository.removeUser(id);
    } catch (err) {
      throw new UnauthorizedException(err);
    }
  }
}
