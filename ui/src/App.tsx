import React from "react";
import Button from "@mui/material/Button";
import { createDockerDesktopClient } from "@docker/extension-api-client";
import { Alert, Stack, TextField, Typography } from "@mui/material";
import adminUI from './images/re_admin-ui.png';


const client = createDockerDesktopClient();

function useDockerDesktopClient() {
  return client;
}

export function App() {
  const ddClient = useDockerDesktopClient();

  const login = async () => {
    ddClient.host.openExternal(
      `https://localhost:8443/#/login`
    );
  };

  return (
    <>
      <Typography variant="h3">Redis Enterprise Docker Extension Demo</Typography>
      <Typography variant="body1" color="text.secondary" sx={{ mt: 2 }}>
        Clicking the image below will trigger a login flow. 
        Please use Email/Username and Password as shown in the image below to Sign In to Redis Enterprise Admin UI.
      </Typography>
      <Stack direction="row" alignItems="start" spacing={2} sx={{ mt: 4 }}>
        <div>
          <img style={{ width: 800, height: 500 }} src={adminUI} alt="Redis Enterprise Admin UI" onClick={login}/>
        </div>
      </Stack>
      <Alert severity="warning">Redis Enterprise Docker containers are currently only supported for development and test environments, not for production.</Alert>
    </>
  );
}