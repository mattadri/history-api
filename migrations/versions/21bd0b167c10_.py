"""empty message

Revision ID: 21bd0b167c10
Revises: 78cb1aa81086
Create Date: 2020-06-04 10:49:49.576351

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '21bd0b167c10'
down_revision = '78cb1aa81086'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint('brainstorm_thought_position_key', 'brainstorm_thought', type_='unique')
    op.drop_constraint('brainstorm_topic_position_key', 'brainstorm_topic', type_='unique')
    op.drop_constraint('brainstorm_topic_thought_position_key', 'brainstorm_topic_thought', type_='unique')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_unique_constraint('brainstorm_topic_thought_position_key', 'brainstorm_topic_thought', ['position'])
    op.create_unique_constraint('brainstorm_topic_position_key', 'brainstorm_topic', ['position'])
    op.create_unique_constraint('brainstorm_thought_position_key', 'brainstorm_thought', ['position'])
    # ### end Alembic commands ###
