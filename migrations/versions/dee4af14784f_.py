"""empty message

Revision ID: dee4af14784f
Revises: 407b35b5a0cc
Create Date: 2019-12-24 12:03:54.622445

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'dee4af14784f'
down_revision = '407b35b5a0cc'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint('culture_culture_period_fk_fkey', 'culture', type_='foreignkey')
    op.drop_column('culture', 'culture_period_fk')
    op.add_column('culture_period', sa.Column('culture_fk', sa.Integer(), nullable=True))
    op.create_foreign_key(None, 'culture_period', 'culture', ['culture_fk'], ['id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'culture_period', type_='foreignkey')
    op.drop_column('culture_period', 'culture_fk')
    op.add_column('culture', sa.Column('culture_period_fk', sa.INTEGER(), autoincrement=False, nullable=True))
    op.create_foreign_key('culture_culture_period_fk_fkey', 'culture', 'culture_period', ['culture_period_fk'], ['id'])
    # ### end Alembic commands ###
