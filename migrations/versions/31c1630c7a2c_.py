"""empty message

Revision ID: 31c1630c7a2c
Revises: bfb5d8811922
Create Date: 2020-03-13 18:31:13.430756

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '31c1630c7a2c'
down_revision = 'bfb5d8811922'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_unique_constraint(None, 'tag', ['label'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'tag', type_='unique')
    # ### end Alembic commands ###
