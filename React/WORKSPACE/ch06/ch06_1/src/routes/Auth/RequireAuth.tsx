import { useEffect, type FC, type PropsWithChildren } from "react";
import { useAuth } from "../../contexts";
import { useNavigate } from "react-router-dom";

type RequireAuthProps = {};

const RequireAuth: FC<PropsWithChildren<RequireAuthProps>> = ({ children }) => {
  const { loggedUser } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    if (!loggedUser) navigate("/");
  }, [loggedUser, navigate]);

  return <>{children}</>;
};
export default RequireAuth;
