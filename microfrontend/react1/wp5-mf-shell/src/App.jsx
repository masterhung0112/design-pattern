import React, { Suspense} from "react";
import "./App.scss";

export default function () {
    return (
        <Suspense fallback={<div>Loading...</div>}>
            <section>
                <div className="flex">

                </div>
            </section>
        </Suspense>
    )
}