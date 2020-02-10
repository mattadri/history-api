"""empty message

Revision ID: 8105c2996b93
Revises: 6515e5b10cad
Create Date: 2020-01-04 17:48:53.916338

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '8105c2996b93'
down_revision = '6515e5b10cad'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('author_reference_relationship',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('reference_fk', sa.Integer(), nullable=True),
    sa.Column('author_fk', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['author_fk'], ['reference_author.id'], ),
    sa.ForeignKeyConstraint(['reference_fk'], ['reference.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.drop_constraint('reference_author_reference_fk_fkey', 'reference_author', type_='foreignkey')
    op.drop_column('reference_author', 'reference_fk')
    op.add_column('reference_published', sa.Column('reference_fk', sa.Integer(), nullable=True))
    op.create_foreign_key(None, 'reference_published', 'reference', ['reference_fk'], ['id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'reference_published', type_='foreignkey')
    op.drop_column('reference_published', 'reference_fk')
    op.add_column('reference_author', sa.Column('reference_fk', sa.INTEGER(), autoincrement=False, nullable=True))
    op.create_foreign_key('reference_author_reference_fk_fkey', 'reference_author', 'reference', ['reference_fk'], ['id'])
    op.drop_table('author_reference_relationship')
    # ### end Alembic commands ###
