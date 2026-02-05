import { createContext, useContext } from "react";
import type { FC, PropsWithChildren } from "react";
import { useWindowResize } from "../hooks/useWindowResize";

type ContextType = {
  breakpoint: string;
};

const defaultContextValue: ContextType = {
  breakpoint: "",
};
export const ResponsiveContext =
  createContext<ContextType>(defaultContextValue);

type ResponsiveProvideProps = {};
export const ResponsiveProvider: FC<
  PropsWithChildren<ResponsiveProvideProps>
> = ({ children, ...props }) => {
  const [width] = useWindowResize();
  const breakpoint =
    width < 640
      ? "sm"
      : width < 768
        ? "md"
        : width < 1024
          ? "lg"
          : width < 1280
            ? "xl"
            : "2xl";
  const value = {
    breakpoint,
  };
  return <ResponsiveContext.Provider value={value} children={children} />;
};

export const useResponsive = () => {
  const { breakpoint } = useContext(ResponsiveContext);
  return breakpoint;
};
