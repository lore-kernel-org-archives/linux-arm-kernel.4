Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB860606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gPS9YmCL;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=MQWjNrUD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ke2l/NITUtdsH5sLdztU0LH39XMho81LihL4fiv644A=; b=gPS9YmCLWxh5VY4Rxdp+8SyiAK
	ZNaCyjldioQo56/zTycgLlE/mOR+ttTdi3p6BpTVwpo6W4AMpZhSII47IoziaR9TUxxNSJB/tkVvd
	obUM9WQ35A+h39Kdmn7lE15WFmC1Xq7v/zTThcSJmKtRBGg6+B+mIR5zzq+yOyv/2Qg5FB9J3a3jR
	GZZLjBkxq+szKmnhN/1cEIu1MhI8NwM31kMVgbuaKm0wma4/GMem2LTnekfkuJiT2Uv0v9qkvD6dm
	7mnGHS/JnxgJUozgw6G4YcZ4cRdTYl34Q4xtk6cLBPyVHbG7rwd2zgcM68TvARV4dS0reWBy0xBUw
	DP9WMXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtVj-0000000FfOQ-1Nkl;
	Fri, 27 Nov 2026 10:48:59 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtVY-0000000FfGP-1TbI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:48:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPoe7B4kpWkCcRl5s1WB7Sos+SEu8aHFmZDOcJm6wIfYuxImvNAmVxLK8fCtBZoaNipYKiGtrrbMT8XCwMMUQJLaGyTr9gxGVcz62411JiE1lM2nkzrZQd3Vm6t0vlDZiDFDpzTou1VMb3/m1y8VlwgaDOy+m6oL+fQNRmblsIr0jkz3LbFuSonrJ92oZBoh4siDzAxputvTI6mb6dvZGXbv4fGo3MoVk/Mgr5qCPYhK23cBr8DKxR7oZjTVH47HEJASr4n3B3Dakf4kzimCnTTl6NdGPpZdLF6qMmI+pw7Llck3oZb2FPC+cYfdwuuQixQxllkVZxmXaUYS7re4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ke2l/NITUtdsH5sLdztU0LH39XMho81LihL4fiv644A=;
 b=BH86yqKnIym5ZJQaA+6liHo4E+tAU9ecw+tkgdyXcdFhMXEDyLGrAhH3gchX5FxWlkdysZOOdhfaLHqvSrPnORehjqvNyv7BnCx/XohPFDgtJ6Vk0hngFmcJ+hPZOAb6fdWlsXX0hsOA+uZhfWYC1/4kYu7qFUsm0cY6hfHiOKMx+BoQ54e+75TIZ+UEgMbWrSD+SQm5ObrRlsiUGrFRDss2+TUW41SHSre7t19rNuswateiQ95QfXEmpuQN8eOSYs8EGB1CB4lzU65RioWtP9PuS1tevYmchL61yLiKO2OkbHPO50lOmlbzReoqUIc+1cGtnUU2IFFfEH9sUlUGxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ke2l/NITUtdsH5sLdztU0LH39XMho81LihL4fiv644A=;
 b=MQWjNrUDl4gK7bTHhuFou76bKxKVzfqECU5tj5XxPfLPR6fjkaqNEPR60sovPlM1+EMSwxZPo6df52sYL/E6fvIcBuQ+wWtQ5hnlopDV76XOzRa1jrHmMAlkKnykQ/6QxFCOCra0rEyYg3w2xNUBnUA4xeDEPk2zLRSlmqhFQAXufG6b+qsXD79shLJlZCdOX+keJQEoOefzwMbHIZ9p2oCMR4pVdLcOWQWn9S3HIG0MNLOIud0tZnF5PPTfdgO/gkJMuUFBXw/tOWo+0kx9xZ6+cfPxfUBFMvoAUA8aZeo4MfKJmWLTL+AqFZ1zZor1cm7dwZzr0vlfZ+Qeej1NCg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by GVXPR04MB10270.eurprd04.prod.outlook.com
 (2603:10a6:150:1c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 10:48:43 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 10:48:43 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev
Cc: kernel@pengutronix.dd,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: ls1088ardb, ls208xa-qds: wire up SerDes lanes and SFP+ cages
Date: Fri, 27 Nov 2026 12:48:15 +0200
Message-Id: <20261127104820.1990733-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::18) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|GVXPR04MB10270:EE_
X-MS-Office365-Filtering-Correlation-Id: 91add1a1-b416-4534-8d9e-08df4c740158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|11063799006|261009223027099003|18002099003|3023799007|10067099003|56012099006|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: +sVJD8iXqWTi7iOnQfe0n2za6FClHZudRFjptXPhw8iOEsAcIhVp/uJjenHC6P/Hx0B68ScrWTlWLTJTOP6LJUNXAdPN5utZzOmFjFinuVKJ9DxyX1lAZ30yTmd+zJBRXi4Mt8yMjwlcBigIWRn6C0FwvxG7/vaPej522XYpRQoMpgTzv0WnnNE+dQxUIc0g+88LYnqFUkySueEfYdbE2SHrLiJTL7ELmA0/rxgNwATyC4L1ArrmTZD+rKEJkTpMT2O32jlUMY7Hr4h4SnXzyF9IUsn+fhZeYrQUUqniyD9h110VhajizI1LVMkWNyY+6uE2alODO0GJivxczQxxtN6vlzfVV162D8BlQfjNt0G5cx+b5BVLeRDK8ooCBm4MLZLuOtrQuiP4AejN4soye8PEmApdRdeUpMwoD4ce3OSUhf2m8Eog6YN3hFWP4beMPX+NtNviFN0K85HVvFxK57UrutbJK3TUWfVW0/v2YEQaA+J7y5AtUnsZgkDiQ4xf3Yf9+dq4TNpgCIJpBKFVyI7vIIIK3c6QxfsZOJpOR8eWv8W0MrwVgIzYbJGmfExPnFFGtwhSO6k8+GdYIw0Z3qksM7k/HpJENo3RDqKA1vfXNd6AfgjwH3H7bKPAmxZt1TI6p764vntZwug7Z+/vlDd/R5zbq8BH/2lYD3wfPMc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(11063799006)(261009223027099003)(18002099003)(3023799007)(10067099003)(56012099006)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P45/YRnLzmBds4tAXkKd8Fi1dkocH0KTXiiskt2s4zbi2arpNWw3xetj4wV8?=
 =?us-ascii?Q?p0b4LsvxDE9jUrZFzb2ovP8UJpPxxoFqwxM1vVazy0gKuu4yw91KhI5HqqEZ?=
 =?us-ascii?Q?3Gt3aGklAytKHvmI883FI02zBbSSTuZBtxJtZdRvOmF4UES1qDl1eD5z9tm2?=
 =?us-ascii?Q?Nk0pvc1tVGlk08cyYef53GuG/RyNO6hXskZHPIJiajlfbr3/S0ToMd30/5B1?=
 =?us-ascii?Q?HPQVyLEtvF/GIVHQRd/zjJyNlA+M140hlqQDgzsYmtnkdbCMlscAJVXhPzc9?=
 =?us-ascii?Q?JeQdnkHkiPtNCuOQ2K6mxeMUByvJlX8Zpw5I4tau5AqZGX8Fzwa9YuYr6eAf?=
 =?us-ascii?Q?vSu4oVN1XizRra5CvWF4O4iwuufFzzEKSQA1gRG8fO3yPMwrqtldkq/pFyn4?=
 =?us-ascii?Q?Hs+DvGp+gGjTeI8oJaujVgUakO7zbS94H1gY884FHfFA8+X61O9tnjRPjGaB?=
 =?us-ascii?Q?dOU2TRbEXrmWCU4MagzpZcVDFdqyo9dZKTW9bdv/LRLeQDY/2KZL7rbOTJ4p?=
 =?us-ascii?Q?e1dXMrlsSTu8f36r/G/t8K+OWWiqlPhWAQ/pEyqNNXtBqJyFsS621aMKsdgo?=
 =?us-ascii?Q?8n7Xopaw8eutaLxwXrN3z/GUBCQ/CcXefLVf/xD3z8XKoXJnRwp2NX04laUN?=
 =?us-ascii?Q?3GdNFQI9TBJyQ5d+Q1ZLf56RQjnUtrYO1g9oQCcD5tT+CVd/U01rTVCcgfi7?=
 =?us-ascii?Q?KZUe33zgsc7OIiZBpI0GA+uo6l2Nbkj1db7lrpeHCPivDNKWTtXtpHQFi9gD?=
 =?us-ascii?Q?qWpMs8kr3La/yHEfNqdJ/6Pmc7l/qNdr5yK9MQtc1HckFdfHMCLr0MmzcJn5?=
 =?us-ascii?Q?mGKR0+0aeIN6BBHt4pgFQzZTLVwnXJBHHD6sx1X0LAwkaeF9PFKi0L6wM3Qe?=
 =?us-ascii?Q?yc2cemywlgbQWl5JWwPojOsji5So9JVHQTmkjxNW4oabxYtw/e1qEalP19Gz?=
 =?us-ascii?Q?Xmg6i0CwoFKJZtQHzVbqLLv6icjqeRf1W8h6GrzBFmOMw4ocNsRXjY3gcMpn?=
 =?us-ascii?Q?9oUVdzpAFJm6nFUh2RGGQvejXf61JYTCNnbcgEWbh7g9jts45YxadeXJWaDi?=
 =?us-ascii?Q?d5fGbgeh9Gqnacy8E86iWrf1SN3w3w4vjZWF0Fs4BEHoniEpBTY6Bo2cTUYK?=
 =?us-ascii?Q?1WQHFJM9mBijncEc+z6+LxyVSOEHgHulYliFiahGwxs8o+O0zUiHzfCLxNk7?=
 =?us-ascii?Q?XOgqHFZJMgy5ZMzQqDUhn7BFpHvyhS4mcE0TcXn1+VOrE3FKjkRWIj5oOoYP?=
 =?us-ascii?Q?Ju/47uYmfMgYJ2dWNyctJhryKNbcgYJS+pnzbEhGIHVfJhQFqSm/ctJx3w0d?=
 =?us-ascii?Q?YmMsf6mQWIGjOAMFiqQs1tqsMXBxsIV59TV0Q2z+vHpXms2WBU/nCNGOU/6L?=
 =?us-ascii?Q?OMy8/y9fW13arfQAOjs7mbiGZlvvYi1gtQdoxu0IvOklJWbY7xnAnfoFpfqX?=
 =?us-ascii?Q?bt5+mDrb8Ip5ybx77sX98ZvDxSHK6q5+2jAvhrIYKHlR9l5HscnGG3rGJSXN?=
 =?us-ascii?Q?ZnK7IpHuZqVCCZ/hRNDm6G++yVP/8WuzXELs3jr2nFwCJrmRuolXmesrrVfT?=
 =?us-ascii?Q?B5GPnNZyfuW68Q5omqLBXqs2zT9VBKQ311z7kF1P/9Qe82yjNhhZFqaMFA6w?=
 =?us-ascii?Q?XoBTsG6f3MF0Kz+theN7A44qXS0rYVNhoZmQYfJ/n1fDnHZ0JJ3FhgOgTNdN?=
 =?us-ascii?Q?emE2YPFdD3i67fWdV0Lp0YT8t2O8WOSYn687fhXiKkQnzRAZ0pu4xqH8Gqdb?=
 =?us-ascii?Q?uA0Ek5dvSQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91add1a1-b416-4534-8d9e-08df4c740158
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:48:43.3532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4iREE9VdpyYNUSrGatE5KmLmyaJY0/nutZ0gWIlssOLsyjHAfvAUufAxg0zxzHYk91sCNusZ9G3QXkMi/HZiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10270
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_024848_401493_2A6ADE28 
X-CRM114-Status: GOOD (  11.11  )
X-Spam-Score: -1.1 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Lynx 10G SerDes driver can reconfigure SerDes lanes at runtime, and
the TI DS125DF111 retimer driver can configure retimers along the way.
This series updates the DTs of the LS1088ARDB and LS208xAQDS boards so
that they can make use of these drivers.

On the LS1088ARDB, describe the SFP cage of DPMAC1, link all DPMACs to
their SerDes 1 lanes, and describe the TI DS125DF111 retimer that sits
between lane C and the SFP cage.

On the LS208xAQDS, describe the eight on-board SFP+ cages. Their lanes
are routed to the cages only with certain RCW protocols and DIP switch
settings, so the DPMAC nodes are updated in a separate overlay for
SerDes 1 protocol 0x2A. The resulting fsl-ls2088a-qds-sfp-retimer-bypass.dtb
targets the setup in which the on-board retimers are bypassed.

Patch 3/5 depends on the "dt-bindings: phy: lynx: allow downstream phys
on the lane nodes" commit, which is accepted in the linux-phy tree and
is already in linux-next. Without it, CHECK_DTBS reports 'phys' as
unevaluated on the SerDes lane node.

Ioana Ciornei (5):
  arm64: dts: ls1088ardb: describe the on-board SFP cage
  arm64: dts: ls1088ardb: add the SerDes lane to all ethernet ports
  arm64: dts: ls1088ardb: describe the on-board TI retimer
  arm64: dts: ls208xa-qds: describe the on-board SFP+ cages
  arm64: dts: ls208xa-qds: add overlay for on-board SFP+ cages

 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  55 +++++++++
 .../fsl-ls208xa-qds-sd1-2a-sfp+.dtso          |  91 ++++++++++++++
 .../boot/dts/freescale/fsl-ls208xa-qds.dtsi   | 111 ++++++++++++++++++
 4 files changed, 261 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds-sd1-2a-sfp+.dtso

-- 
2.25.1


