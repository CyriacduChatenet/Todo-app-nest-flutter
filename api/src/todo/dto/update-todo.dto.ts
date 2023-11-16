import { PartialType } from '@nestjs/mapped-types';

import { CreateTodoDto } from './create-todo.dto';

export class UpdateTodoDto extends PartialType(CreateTodoDto) {
  title: string;
  content?: string;
  completed?: boolean;
}
