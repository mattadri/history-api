"""empty message

Revision ID: 78cb1aa81086
Revises: c8cd56bead4a
Create Date: 2020-06-04 10:45:41.423535

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '78cb1aa81086'
down_revision = 'c8cd56bead4a'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('brainstorm_thought', sa.Column('position', sa.Integer(), nullable=True))
    op.create_unique_constraint(None, 'brainstorm_thought', ['position'])
    op.add_column('brainstorm_topic', sa.Column('position', sa.Integer(), nullable=True))
    op.create_unique_constraint(None, 'brainstorm_topic', ['position'])
    op.add_column('brainstorm_topic_thought', sa.Column('position', sa.Integer(), nullable=True))
    op.create_unique_constraint(None, 'brainstorm_topic_thought', ['position'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'brainstorm_topic_thought', type_='unique')
    op.drop_column('brainstorm_topic_thought', 'position')
    op.drop_constraint(None, 'brainstorm_topic', type_='unique')
    op.drop_column('brainstorm_topic', 'position')
    op.drop_constraint(None, 'brainstorm_thought', type_='unique')
    op.drop_column('brainstorm_thought', 'position')
    # ### end Alembic commands ###
