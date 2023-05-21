import React, { Suspense} from "react";
import "./App.scss";

const TopNavComponent = React.lazy(() => import("TopNav/TopNav"));
const LeftNavComponent = React.lazy(() => import("LeftNav/LeftNav"));
const ItemDetailsComponent = React.lazy(() =>import("ItemDetails/ItemDetails"));
// import {} from "@mf-types/"

export default function () {
    return (
        <Suspense fallback={<div>Loading...</div>}>
            <section>
                <TopNavComponent />
                <div className="flex">
                    <LeftNavComponent />
                    <ItemDetailsComponent />
                </div>
            </section>
        </Suspense>
    )
}