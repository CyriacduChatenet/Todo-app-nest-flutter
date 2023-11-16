import {
  Injectable,
  NotFoundException,
  UnauthorizedException,
} from '@nestjs/common';

import { CreateTodoDto } from './dto/create-todo.dto';
import { UpdateTodoDto } from './dto/update-todo.dto';
import { TodoRepository } from './todo.repository';

@Injectable()
export class TodoService {
  constructor(private todoRepository: TodoRepository) {}
  create(createTodoDto: CreateTodoDto) {
    try {
      return this.todoRepository.createTodo(createTodoDto);
    } catch (err) {
      throw new UnauthorizedException(err);
    }
  }

  findAll() {
    try {
      return this.todoRepository.findAllTodos();
    } catch (err) {
      throw new NotFoundException(err);
    }
  }

  findOne(id: string) {
    try {
      return this.todoRepository.findOneTodoById(id);
    } catch (err) {
      throw new NotFoundException(err);
    }
  }

  update(id: string, updateTodoDto: UpdateTodoDto) {
    try {
      return this.todoRepository.updateTodoById(id, updateTodoDto);
    } catch (err) {
      throw new UnauthorizedException(err);
    }
  }

  remove(id: string) {
    try {
      return this.todoRepository.removeTodoById(id);
    } catch (err) {
      throw new UnauthorizedException(err);
    }
  }
}
