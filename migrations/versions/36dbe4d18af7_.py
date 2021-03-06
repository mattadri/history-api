"""empty message

Revision ID: 36dbe4d18af7
Revises: 61bd619f8182
Create Date: 2020-01-31 21:16:34.106310

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

# revision identifiers, used by Alembic.
revision = '36dbe4d18af7'
down_revision = '61bd619f8182'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('event_reference')
    op.drop_table('event_period')
    op.add_column('event', sa.Column('event_end_day', sa.Integer(), nullable=True))
    op.add_column('event', sa.Column('event_end_era_fk', sa.Integer(), nullable=True))
    op.add_column('event', sa.Column('event_end_month_fk', sa.Integer(), nullable=True))
    op.add_column('event', sa.Column('event_end_year', sa.Integer(), nullable=True))
    op.add_column('event', sa.Column('event_start_day', sa.Integer(), nullable=True))
    op.add_column('event', sa.Column('event_start_era_fk', sa.Integer(), nullable=True))
    op.add_column('event', sa.Column('event_start_month_fk', sa.Integer(), nullable=True))
    op.add_column('event', sa.Column('event_start_year', sa.Integer(), nullable=True))
    op.add_column('event', sa.Column('reference_fk', sa.Integer(), nullable=True))
    op.create_foreign_key(None, 'event', 'era', ['event_end_era_fk'], ['id'])
    op.create_foreign_key(None, 'event', 'month', ['event_start_month_fk'], ['id'])
    op.create_foreign_key(None, 'event', 'reference', ['reference_fk'], ['id'])
    op.create_foreign_key(None, 'event', 'era', ['event_start_era_fk'], ['id'])
    op.create_foreign_key(None, 'event', 'month', ['event_end_month_fk'], ['id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'event', type_='foreignkey')
    op.drop_constraint(None, 'event', type_='foreignkey')
    op.drop_constraint(None, 'event', type_='foreignkey')
    op.drop_constraint(None, 'event', type_='foreignkey')
    op.drop_constraint(None, 'event', type_='foreignkey')
    op.drop_column('event', 'reference_fk')
    op.drop_column('event', 'event_start_year')
    op.drop_column('event', 'event_start_month_fk')
    op.drop_column('event', 'event_start_era_fk')
    op.drop_column('event', 'event_start_day')
    op.drop_column('event', 'event_end_year')
    op.drop_column('event', 'event_end_month_fk')
    op.drop_column('event', 'event_end_era_fk')
    op.drop_column('event', 'event_end_day')
    op.create_table('event_period',
    sa.Column('id', sa.INTEGER(), nullable=False),
    sa.Column('created', postgresql.TIMESTAMP(), autoincrement=False, nullable=True),
    sa.Column('modified', postgresql.TIMESTAMP(), autoincrement=False, nullable=True),
    sa.Column('period_start_day', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('period_start_month_fk', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('period_start_year', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('period_start_era_fk', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('period_end_day', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('period_end_month_fk', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('period_end_year', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('period_end_era_fk', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('event_fk', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['event_fk'], ['event.id'], name='event_period_event_fk_fkey'),
    sa.ForeignKeyConstraint(['period_end_era_fk'], ['era.id'], name='event_period_period_end_era_fk_fkey'),
    sa.ForeignKeyConstraint(['period_end_month_fk'], ['month.id'], name='event_period_period_end_month_fk_fkey'),
    sa.ForeignKeyConstraint(['period_start_era_fk'], ['era.id'], name='event_period_period_start_era_fk_fkey'),
    sa.ForeignKeyConstraint(['period_start_month_fk'], ['month.id'], name='event_period_period_start_month_fk_fkey'),
    sa.PrimaryKeyConstraint('id', name='event_period_pkey')
    )
    op.create_table('event_reference',
    sa.Column('id', sa.INTEGER(), nullable=False),
    sa.Column('created', postgresql.TIMESTAMP(), autoincrement=False, nullable=True),
    sa.Column('modified', postgresql.TIMESTAMP(), autoincrement=False, nullable=True),
    sa.Column('reference_fk', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['reference_fk'], ['reference.id'], name='event_reference_reference_fk_fkey'),
    sa.PrimaryKeyConstraint('id', name='event_reference_pkey')
    )
    # ### end Alembic commands ###
