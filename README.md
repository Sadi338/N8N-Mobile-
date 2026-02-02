# n8n on Render.com - Mobile Setup Guide

This repository contains everything you need to deploy n8n to Render.com and access it from your mobile device.

## What is n8n?

n8n is a powerful workflow automation tool that you can use to connect different apps and services together.

## Quick Setup Instructions

### 1. Fork/Create GitHub Repository

1. Create a new repository on GitHub (e.g., "n8n-render")
2. Upload these files to your repository:
   - `Dockerfile`
   - `render.yaml`
   - `README.md`

### 2. Deploy to Render.com

#### Option A: Using Blueprint (Recommended)

1. Go to [Render.com](https://render.com) and sign in
2. Click "New +" → "Blueprint"
3. Connect your GitHub account if you haven't already
4. Select your n8n repository
5. Click "Apply"
6. Set the following environment variables when prompted:
   - `WEBHOOK_URL`: `https://YOUR-APP-NAME.onrender.com/` (you'll get this URL after deployment)
   - `N8N_BASIC_AUTH_USER`: Your desired username
   - `N8N_BASIC_AUTH_PASSWORD`: Your desired password

#### Option B: Manual Setup

1. Go to [Render.com](https://render.com) and sign in
2. Click "New +" → "Web Service"
3. Connect your GitHub repository
4. Configure:
   - **Name**: Choose a name (e.g., n8n-automation)
   - **Environment**: Docker
   - **Plan**: Free
5. Add environment variables:
   - `N8N_PORT`: `5678`
   - `N8N_PROTOCOL`: `https`
   - `WEBHOOK_URL`: `https://YOUR-APP-NAME.onrender.com/`
   - `N8N_ENCRYPTION_KEY`: (generate a random string)
   - `N8N_USER_MANAGEMENT_JWT_SECRET`: (generate a random string)
   - `N8N_BASIC_AUTH_ACTIVE`: `true`
   - `N8N_BASIC_AUTH_USER`: Your desired username
   - `N8N_BASIC_AUTH_PASSWORD`: Your desired password
6. Click "Create Web Service"

### 3. Access n8n on Your Mobile

1. Wait for deployment to complete (5-10 minutes)
2. Open your mobile browser (Chrome, Safari, etc.)
3. Navigate to your Render URL: `https://YOUR-APP-NAME.onrender.com`
4. Log in with the username and password you set
5. **Add to Home Screen** (optional but recommended):
   - **iOS**: Tap the Share button → "Add to Home Screen"
   - **Android**: Tap the menu (3 dots) → "Add to Home screen"

## Important Notes

### Free Tier Limitations

- The free tier on Render.com will spin down after 15 minutes of inactivity
- It takes 30-60 seconds to spin back up when you access it
- You get 750 hours/month of runtime (enough for personal use)

### Security

- Always use strong passwords
- Your workflows and data are stored in the container
- For production use, consider upgrading to a paid plan with persistent storage

### Data Persistence

The free tier doesn't include persistent storage, so:
- **Export your workflows regularly** (Settings → Workflows → Export)
- Consider using Render's paid plans for database persistence
- Or connect to an external database (PostgreSQL, MySQL)

## Accessing from Mobile Browser

n8n works great in mobile browsers! You can:
- Create and edit workflows
- Trigger workflows manually
- View execution history
- Manage credentials

For the best mobile experience:
1. Use landscape mode for workflow editing
2. Pinch to zoom in/out on the workflow canvas
3. Use the hamburger menu (☰) to access all features

## Troubleshooting

### Can't Access the URL
- Wait 5-10 minutes after deployment
- Check Render dashboard for deployment status
- Look for errors in the logs

### Login Not Working
- Verify your username and password in environment variables
- Check that `N8N_BASIC_AUTH_ACTIVE` is set to `true`

### Workflows Not Saving
- Free tier doesn't have persistent storage by default
- Export important workflows regularly
- Consider adding a database for persistence

## Adding Database Persistence (Optional)

To keep your data between restarts:

1. Create a PostgreSQL database on Render
2. Add these environment variables:
   - `DB_TYPE`: `postgresdb`
   - `DB_POSTGRESDB_HOST`: Your Render PostgreSQL host
   - `DB_POSTGRESDB_PORT`: `5432`
   - `DB_POSTGRESDB_DATABASE`: Your database name
   - `DB_POSTGRESDB_USER`: Your database user
   - `DB_POSTGRESDB_PASSWORD`: Your database password

## Next Steps

1. Explore n8n's built-in templates
2. Connect your favorite apps and services
3. Create your first automation workflow
4. Join the [n8n community](https://community.n8n.io/)

## Resources

- [n8n Documentation](https://docs.n8n.io/)
- [n8n Community Forum](https://community.n8n.io/)
- [Render Documentation](https://render.com/docs)

## Support

If you encounter issues:
1. Check the Render logs for errors
2. Visit the n8n community forum
3. Review Render's documentation

---

Happy automating! 🚀
