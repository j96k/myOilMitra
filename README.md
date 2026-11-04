# myOilMitra — Executive Control Portal

The central operations & super admin portal for the **OilMitra** used cooking oil pickup network.

This portal gives the platform owner full administrative control:
- **Executive Analytics**: Total litres collected, payout records, active suppliers, CO₂ avoided, and biofuel metrics.
- **Master Loads Manager**: Real-time overview of every listing (Open, Claimed, Collected, Cancelled, Expired) with instant cancel/delete powers.
- **Live Rate Board**: Modify platform-wide buying price per litre for all oil types (Sunflower, Mustard, Soybean, Palm, Mixed, Other).
- **Operators Hub**: Provision, manage, and revoke field operator accounts without running terminal commands.
- **Top Suppliers**: Volume leaderboard and contributor ranking.

## Live App

| App | Live URL on Deployment |
| --- | --- |
| myOilMitra Super Admin Portal | `https://YOUR-MYOILMITRA.onrender.com/portal/` |
| API Docs | `https://YOUR-MYOILMITRA.onrender.com/docs` |

## Shared Data

This portal connects to the **same Neon PostgreSQL database** as `oilmitra` and `oilmitra-operators`.
- Set `DATABASE_URL` to your shared Neon connection string.
- Tables and mirrored users sync automatically.

## Sign In

Log in with your administrator username and password created in the database.
Once signed in, you have full supervisory control over both suppliers and operators.
