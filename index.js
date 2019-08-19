#!/usr/bin/env node
const express = require("express")
const bodyParser = require("body-parser")

const app = express()
app.use(bodyParser.json())

const port =  process.env.APP_PORT || 3000

// HTTP endpoints
app.get("/time", (req, res) => {
    res.json({
	epoch: Date.now()
    })
})

app.get("/health", (req, res) => {
    res.json({
	"ok": true
    })
})

app.listen(port, () => console.log(`Listening on port ${port}`))
