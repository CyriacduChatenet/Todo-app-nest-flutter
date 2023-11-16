import { DataSource, DeleteResult, Repository } from 'typeorm';

import { User } from './entities/user.entity';
import { InjectDataSource } from '@nestjs/typeorm';
import { UpdateUserDTO } from './dto/update-user.dto';
import { SignupUserInputDTO } from './dto/signup-user.dto';

export class UserRepository extends Repository<User> {
  constructor(@InjectDataSource() datasource: DataSource) {
    super(User, datasource.createEntityManager());
  }

  async createUser(signupUserDto: SignupUserInputDTO): Promise<User> {
    const user = this.create({ ...signupUserDto } as User);
    return await this.save(user);
  }

  async saveUser(user: User) {
    return await this.save(user);
  }

  async findAllUser(queries) {
    let { page, limit, sortedBy, username, email, roles } = queries;
    page = page ? +page : 1;
    limit = limit ? +limit : 10;

    const query = this.createQueryBuilder('user').leftJoinAndSelect(
      'user.todos',
      'todos',
    );

    if (sortedBy) {
      query.orderBy('user.created_at', sortedBy);
    } else {
      query.orderBy('user.created_at', 'DESC');
    }

    if (username) {
      query.andWhere('user.username LIKE :username', { username });
    }

    if (email) {
      query.andWhere('user.email LIKE :email', { email });
    }

    if (roles) {
      query.andWhere('user.roles = :roles', { roles });
    }

    return {
      page: page,
      limit: limit,
      total: await query.getCount(),
      data: await query
        .skip((page - 1) * limit)
        .take(limit)
        .getMany(),
    };
  }

  async findOneUserByEmail(email: string): Promise<User> {
    return await this.createQueryBuilder('user')
      .leftJoinAndSelect('user.todos', 'todos')
      .where('user.email = :email', { email })
      .getOne();
  }

  async updateUser(id: string, signupUserDto: UpdateUserDTO | unknown) {
    return await this.update(id, signupUserDto);
  }

  async removeUser(id: string): Promise<DeleteResult> {
    return await this.softDelete(id);
  }
}
