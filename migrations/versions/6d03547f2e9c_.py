"""empty message

Revision ID: 6d03547f2e9c
Revises: 69e0bfdd0ed7
Create Date: 2020-09-28 10:46:19.229517

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '6d03547f2e9c'
down_revision = '69e0bfdd0ed7'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('chart_dataset_data', sa.Column('z_data', sa.Float(), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('chart_dataset_data', 'z_data')
    # ### end Alembic commands ###