Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAA2606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tgNBP+t1;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Tr7qj6+i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q5+9ChIdKx8Au9fqttZifyIR4dVkSOON4tDmDlSBxaI=; b=tgNBP+t1vxAInd
	JtPbAuiZBIqPsQEtto/wbyPekyW2A4Flc9e/1cGOEiYMPDxpEmrc37ksJ9ApV048qm3Bglf79C20u
	pqfnrQ5GM1GlWxIGEEH3z8lxow69R75tbB+eAoldUC7wBbjw/OsiZlFDW7YqWkLbc9L6KoAAlG21U
	Mp4BqurQ9iqknTf7a5QoFYsSLrFuuuVhjkhA1aT337USVBbYGW9Yf/rcNs623mKGIiRz51B++Mmsx
	BJA1WsJPV26CHcnHKRhBee70moZ95pWe+QNhtXASjiHrNhAhrdseniBeX5JTniCBvM4Jfht8jwTaQ
	pAMWb62hF5vxdiz5CaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBpi-00000009m2U-35Tz;
	Wed, 25 Nov 2026 12:10:42 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBpe-00000009m0g-0Ejq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:10:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEl9PI7OlIltPu/nFcne/7AX8ls6VpYGSznQetXHpFTJq4Fdxrm+9N0etFqNBpvpw6DIw8YJTE8h5rsORbUvWoUTl7t/PsUFHx7UFWzwX0BX8Rg1CBJXwSJgPVhaRcWs5FJGT2HP7h3zapgzoL0x3nQj8tbiW38fe2ScwQpdhbj7PZpWHjbaHfIbuxkZf9omwc1h3Kq/d+kMFl9imD96s2r27DXWSIaNve2nVqWHfhn5B5xWjIQb/WHrJ5zRhO5Y1bCQntzISwBjMnY/iVbn0aKEq4KEMWhli8YV7v0+86Npfy9YuS9nKmQChHm5A2cbGEmdFMy2voi4HBZ+3Nuqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5+9ChIdKx8Au9fqttZifyIR4dVkSOON4tDmDlSBxaI=;
 b=DT/dXpqchgG+kR3qtHkoVzJZ8H31Rhk35jBBOgt3bctEUnPVi2zr+8XD3rhAQJerKt2FEx+B5AaQcetdh1Yolictm/SmB1dWEq/KbCXd40wX3al9O5GmMF/pLqm3aM+qS3NaZ8UvWVKlZiuwyF+LvWbb9pzsCBmqlVv36IO4f1MHEO1AWC2B4cyxiagrNiFM1hj6ZZuqbeHuVOdO/x4PrFgPw+X46VAV4fzkz1L4QSSZE61fiP99lSc73/wJdvIyON6gRDuT44/0Koq3Q+S/q53BhNDPJnE2JO/BTZQjQ7QXlWAMC1TQ0zxmRTozjd98UlBCP9evq6PNCNDhVtbJ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5+9ChIdKx8Au9fqttZifyIR4dVkSOON4tDmDlSBxaI=;
 b=Tr7qj6+iQ1uAykglYmJD1ga3+ECUKrCkWYuZVOkM/T65l/iS41xLDxZF2IoVd6qsC2uAwrwH451Cq/UESlxcLFIur/zL45KFKPrrDIdaGH/enWMHnt9FzCmCCX3THrdGPSFv5F2EQDL0Saq50899O+0TvtJFbj/JIm4RL1uU0T4LZK/jcC+JgvVn8N2kuRm/vHvOrN4BbPK6Rf9u/UPP3zuwaoIXVPsA0tdRsc5Jf5ldRDHhrSt6UpJh+EYZwl7fjX7Im7djn0gCy3nKgiwBp2fMvMV2iaoM7XbXJn83+JeKFPfGZOMPG3SbvEJjaSswF1T68J85Q4dNHsWIa1LpGQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by BR0PR04MB904472.eurprd04.prod.outlook.com (2603:10a6:2c8:67::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 12:10:32 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 12:10:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 2/4] pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
Date: Wed, 25 Nov 2026 20:07:33 +0800
Message-ID: <20261125120733.29433-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261122205136.138173-3-dario.binacchi@amarulasolutions.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|BR0PR04MB904472:EE_
X-MS-Office365-Filtering-Correlation-Id: b683a596-ef31-4882-8952-08df4aed1a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|19092799006|23010399003|22082099003|18002099003|261026121527099003|56012099006|261028144727099003|261022105027099003|10067099003|261026140227099003|11063799006;
X-Microsoft-Antispam-Message-Info: VbP4L86JwqTcdH+/r+ptptezIQjjTNONe2hjSceQFuAOT5avn1fYehrpD1lRzijZcYlxpIqdDPlD4/J0DC7l1ZVF0NmiO7Vj/F3H3GKaPV1Ho26s6DtYpolla39udNWAIyHr0iiWmdbVwsEW3SWBxRWjbBZanubdy/FJA0znvaxnsmVu+NBDIOMLSeD6aj5on0zQursQBSGtj0EIOb26piBwc8LUHj9jGV6RZbzNkj0+0deAVrJO9SrupHzYqBFdcy5vFGiAp3u+9MXQnt+EpzrkN9REmD5Ha+SHUjXbCvSwYsI1JVqFXkaH8JjzAgOwbFTd/B7k+b7X5sDlDaQRnB4EfPaedzqbdCJcDH//HMZUmN/WMpziYS2NUOELiGteD3t3EWPtl5Zu3EJA8I7lJeePS41TXb3NA9lJsQBT9JEBf9Wi7SziLkbuCMOgw3AjHma5tY243L4C/Ytf9OA3fT6IHlI8oOfoK0hNqt31jCDoAaSMKOedVf2GpI22OjM35PgJXBSj5C2ATSyX/eYhqH/FMVCxB4XF02ymwddDDUd7DL79FKEDuX1HoMWgewa95CQoiL16v99wohNh5f2hI6rjUQ4XARFm/g/pDQodqiigqTwJTEFpQmqf98t01bYDhxNirkVwprDP28j2ylWoSLX2w6DZF8mCgsmAst5Pifs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(19092799006)(23010399003)(22082099003)(18002099003)(261026121527099003)(56012099006)(261028144727099003)(261022105027099003)(10067099003)(261026140227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jMN84BbruXBSXAGR+mYrDJOUMOgME1uJGmnU04zRJ2vJ6mx5YhhJDrCAVqkF?=
 =?us-ascii?Q?7ohnBE9bpPnJ8HuUjZ541/GIGFy44NMwdpf+paUvP7F0AKhrf8K5f1SigcDQ?=
 =?us-ascii?Q?Rp5Wy01xRiGofevmvGB6XkemhsCAOiHcGzQQina+BBkCkfz6lWIjlmbOvTeg?=
 =?us-ascii?Q?bUh2bWltZDndaYKg+kdAxkZ8hwqkm9q2MHy7fpZq/V13IVPcfpXthwcSv5WR?=
 =?us-ascii?Q?kXwfhAT5ubbRmJLXVLzIfmHVgyJhsb0YfKhhcfpB02kWCOegL/7JA/YtlsYr?=
 =?us-ascii?Q?ZPR8OXgNkwG7/Ry9tI13wZUjCwy4+FrvQMi3UXd1NgscT6ekulfDARi4GagI?=
 =?us-ascii?Q?Ckyh2j6p3OuY7xCVJttDFa27eE+B9RQlmgS6xAsU/Tz0eyPrJIk4uHjLdL5K?=
 =?us-ascii?Q?GhunwLTL2djTZ9YXYm6eD2hqVZBkkUy8S/c/ng8XlXOJxxtErCbN8d7wISB2?=
 =?us-ascii?Q?ClvNCTL8h0t+L1hBlrnxjE/fLx4qbsUl73KCvcmJQKBjAh8QNGhSq8gQPncJ?=
 =?us-ascii?Q?rpkg93mzcKl29OwCKiytKDSynXzM7h0rRwMOtX1edJiF4yEE9mr1/GMjZEbH?=
 =?us-ascii?Q?T7yz71Vgqk1zFz6fNMHr4j39PRmDRXFRfy6j1yxwUbujo58F795pPDLHdHZ5?=
 =?us-ascii?Q?krQpbSx3Ri/I2yQZwDdrE4z0jcrBEioRWCjdG+urYRZx4Edv7JtRS1UuIqqU?=
 =?us-ascii?Q?wAUJq2uPGLWaxNvOYOSNxVd8IbVQgR7FcvfuQV0XuM+uB82JbX9THzQSGtAd?=
 =?us-ascii?Q?C1t1JIuK74677X0MuLLnBLZb2enYngI2P2efEnraLSrTyvbTSbGO9RgE755+?=
 =?us-ascii?Q?BLcOA+FprSiT2u+aEgPdjqzRnqEJiOTznUp6Opbgq8C4O1YnKP1HFSSncj5d?=
 =?us-ascii?Q?oOgvu8HlJhRvjXe962UKqtpD/D8aKp6r83fIrSegndCWHEgbvbE4+oGgLAcp?=
 =?us-ascii?Q?1A8P4UsfcHGYfqICbj8XKgmhl8cxVoIA4qzv+BBUDgtVTdnlfKA+MoKYXAuj?=
 =?us-ascii?Q?O78MaXmOHbLtWrFnCwWrRMayq27g8VD0PgDAhVpNKw5qxizy8M7auhmegI/g?=
 =?us-ascii?Q?i3DILFeAGBotiszQDJSHUT9Bdvh4TEaWa8lPcF6HmtULIUPgW58bmZebAQCA?=
 =?us-ascii?Q?scvWj8V4wIbvl1zzedHoNIa8FU/AjxSHIJl7cfnxdJ/ybsjE9tq4nQImj+ap?=
 =?us-ascii?Q?J4Ju2BKEyIqn8Tt4O7vxShnCqoARFPodsXbQnYJ21E2x3rQ2iZTp069bfc9e?=
 =?us-ascii?Q?jZz0ybrKLojLNoxkMW+oWkKD2KyEVFtSre9vIbkNpplOEmE6qkWbzrJMb5la?=
 =?us-ascii?Q?A+R5eApxAKaF/IzUQEr4RU30VLAq8DcGzqb64is7sbnU8JPL0WEW+hNGjm/e?=
 =?us-ascii?Q?wlXR5v/hMiM07qBpj+5HJLpZu+/0NrKi+Ztl3EfH6I3J1LLdUsnj2jKx1ZZe?=
 =?us-ascii?Q?oSw9aseDuWais49FWEqykRYJghYrG3cVydZ98964kyZhuqoQpmvbrQuJf4MN?=
 =?us-ascii?Q?fv0h+BRbtQCO6f/oj4AKcgmcweWItuZ1F0jEl/6pxholnPkFERmFaPk60Ylf?=
 =?us-ascii?Q?QN1SrZOPEtVkV1x5H/7bbbGQ+WMHFcWN1YLT6IDgnGggdoehudgV+KnCO4lG?=
 =?us-ascii?Q?1gkYO/S8yr7aCprHNKeN3T9DGR5/Z3NJayE5ofXo0gjyu1gN4fo5RE9sUTDQ?=
 =?us-ascii?Q?4YHb23XsU6fqbGuACWsoY62F98AqwikMXs0I1xYR1GFIUcFjs71FHC403Yjt?=
 =?us-ascii?Q?BHgrcy65rH27kvvKHQcaQYkPBkTFmu+twDqN371mrEuFeAK/3O2W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b683a596-ef31-4882-8952-08df4aed1a17
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 12:10:32.1730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJSF6fqTB2SJ2bzhe5jg8lvXHpAy85HjTNACHcD6TM1AfAyV0SEzjvt8k7ja9GgKgQnKHg+0GK4ujpOCiRfbCVIiJ3518Y1vOUZDFw8JuCG6s5U2L/1RDQ9Pqf82LXjx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB904472
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_041039_815713_2C68E756 
X-CRM114-Status: GOOD (  11.86  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 22 Nov 2026 21:51:11 +0100 Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The PGC domains are all registered as off, so a domain left on by the
> bootloader, e.g. DISPMIX to show a splash screen, is powered up again
> by its first consumer. On the i.MX8MN this turns the display off and
> hangs the system.
> 
> The GPC does not report the power state of a domain, but the ADB400
> bridge acknowledges the power-up handshake only while the domain is
> powered. Use it to register as on the domains left on by the
> bootloader.
> 
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 

Reviewed-by: Peng Fan <peng.fan@nxp.com>

