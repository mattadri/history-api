"""empty message

Revision ID: ba007c1742fc
Revises: d0a95315e8c8
Create Date: 2020-04-16 15:37:54.034151

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'ba007c1742fc'
down_revision = 'd0a95315e8c8'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('essay',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('title', sa.String(), nullable=False),
    sa.Column('abstract', sa.Text(), nullable=True),
    sa.Column('essay', sa.Text(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('essay_note',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('note', sa.String(), nullable=True),
    sa.Column('reference_chapter', sa.String(), nullable=True),
    sa.Column('reference_page', sa.Integer(), nullable=True),
    sa.Column('essay_fk', sa.Integer(), nullable=True),
    sa.Column('reference_fk', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['essay_fk'], ['essay.id'], ),
    sa.ForeignKeyConstraint(['reference_fk'], ['reference.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('essay_reference',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('chapter', sa.String(), nullable=True),
    sa.Column('page', sa.Integer(), nullable=True),
    sa.Column('essay_fk', sa.Integer(), nullable=True),
    sa.Column('reference_fk', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['essay_fk'], ['essay.id'], ),
    sa.ForeignKeyConstraint(['reference_fk'], ['reference.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('essay_reference')
    op.drop_table('essay_note')
    op.drop_table('essay')
    # ### end Alembic commands ###
