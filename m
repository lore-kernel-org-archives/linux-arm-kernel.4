Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306F3606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YOBO8dSK;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RKma4bAU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aD7t4GLJVbby81TfpQnz9xmfLJBk4Yr7Ks2GcMqQYGM=; b=YOBO8dSKqmNWeg
	GUPyCPuDt//wtNpeh1Uzg8KPoLmZanUwnrn7bH7x4Lg5c+fuj/vwi+2O2P/NmlGLEJ32lCAo6CHfy
	JktnSjyoMuw+0x6zx6byJtXgMfVhBpRfoI8QJxwtzQ1sJLgy5l82axrEjASmIO9xXv5sS2vj7PBA5
	NPpwBJqcDyw+TxDTsUhDQHZyiNVfWBpu/5sI3kXKX4O6fSe5eTEEhEGuMuaNsd1qlD1Yl1KEP4UgI
	iUPU5o8258jDDKAv6pPhMLYBdn5zjVpspNPQbXtQeBmf5DbGfieylT/IPZ6pI3lDXu/dfYkS+I1EU
	dpvXNaNDm5Xzc1OVghhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtVj-0000000FfOo-2yEo;
	Fri, 27 Nov 2026 10:48:59 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtVc-0000000FfJW-49x8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:48:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBgdVct0td4THrVKkUTQDNC8DNQDoU1F0LWupRNsfUOeEEga5Ov0ajqTI2+7JamKKeqp4L52VMXbfugW/WHIbY9okHqzQbwSZ0+Y5o1SLr+/J9bNCJz0Cl8RTyRIuE1xT4Ed1xAAAJLWWLdPtlD9CUJyaUGV88VRWuKssUDBthyafsS9d2QfS3iqx2Ne9FiQa2fPnXEf8bslCTsyoUytxBVCDVYyni3qmiPVqtHxUkbh1VU/2wGklt12jRvmSEerYhpHKloA83AUpy1ga9AHgIDLZPN0h1J1E/YhymnJO5z3rvSaxX8srvTxi+a7J2cO7qlDQeDt6f394IUm0Cn27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aD7t4GLJVbby81TfpQnz9xmfLJBk4Yr7Ks2GcMqQYGM=;
 b=T1olEgT/u39xrAJ0/3Q/+UEyMcXF1pTDx+g+Q/5PLrgZlqjA4am3TrpyiNXBO9hhhCFQQHxof+4uqvi4fTZudM4r7w+45QU3ebX+hoGWCZN00bMSuMQiKgqQGOdZBKk8c88I/upRlrzK5ksB0w1vFC0jMdkpxG4GxY81zpxCBgAa5ZF/1+tZ54s/uu1wgiekouM2F+38JoMZ8jjFZ5TFyLjqRHqPtJTCtV+Mothq694QG/xqvOkEjX/wBxYIqAQyJpHG8KknTWwnYeRKGqAta4rLrIDQivz2zVrb3H283A0AO69CUeTjapQuQtsIx2Ub4nTZScYM+fuAtF/8H9wlOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aD7t4GLJVbby81TfpQnz9xmfLJBk4Yr7Ks2GcMqQYGM=;
 b=RKma4bAU6C6pLdthzCqeQ5VEKh6ZDQ+JpyOg91JZ9mxcjmQRgGnUWqI2AtyEBgj2dqyjwpXnH3vby5OMZpF0MQv68QkYwfFhN0QU2anFJowdU8fOxf39bUl1dMDGNiQU7OI0JNGnFux4ENTPJ3OFOPKP1Z18zDUsrwfkj+7V+F+RBttMyiB/Jn3g2la5TS0dFXFfdyyxVVbw1IcvAmqwaPXfW71BY0p0PGwfZf4M0YsFkxk+t1RQhox0scA1J7o5+D4UF5Gxel9LRBgSlUeHc2wFUwcbmLd3SBQHbdc28niQAnSy5TnnNwTlxCeWU7r2LcdA6/Nvltx7VKiv4+DZyQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by PA4PR04MB7999.eurprd04.prod.outlook.com
 (2603:10a6:102:c0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 10:48:47 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 10:48:47 +0000
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
Subject: [PATCH 2/5] arm64: dts: ls1088ardb: add the SerDes lane to all ethernet ports
Date: Fri, 27 Nov 2026 12:48:17 +0200
Message-Id: <20261127104820.1990733-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127104820.1990733-1-ioana.ciornei@nxp.com>
References: <20261127104820.1990733-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::7) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|PA4PR04MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9d7e9f-005a-4755-25d3-08df4c7403c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|261009223027099003|18002099003|22082099003|3023799007|56012099006|11063799006|261102123227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: etGvjPG/0hlBJwwCi4V8lyCqSRTzeXEuOCe7Cw6EJbShkuyMB7YT90NV1pgdgqOqBLYf/9KnEWTnu1sCXrUFwzim9r/t+sQnxlQ2HEY69xiz+Kmymxff1xKCvYS4nyw8LbC+KIQu05mpzKzFKAKXeqTklElj+3WYNh0/ClRey5wpC2KtmoE7MiJ3W8fU/8Ux2z5Q4s4plnBkcRudpIQwIeu7vic5t4GPZIdbKemI5GYxrexYXwFEfDvfPx7Vn8dIMY9725zUqc8EN+Hp87IgwVe8DBAMQ5YP6Xmz2IG2qevxsgkvELceAuU5PHoXVcW76cNXHGpg9+SHmcymiPqtRMkRUhb7ktZjKR/tsOWacIDUZrKEZx2v/zjx6CEHcv/vkJa1tXdqmggAfz0WoK88mlIfFLzwlJcEkZj9OD4MFIx/dSk4lFJ7LHl9eisg2I1/sUtZnHrWAuWjPxCRjGeGRNTKbglFvGo0FDSsANI6fXN2UG520e4mtlBc4V6eN8K+oRPIHIFUBzucwN88+wtYNAG9UY8hym+81zwaaTHrojHm5jzkDeamGGYzd0nz3rLu+kzbiYE2OoSjydLuFkmEeypHZW55JydDO7vLHNjA2GJXXfDcjeDhNMD9e0n7O3gjgT5UWKbcm1/oUQyr5Mhgt/gn5U5td5bq+I7nVZC+fG0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(261009223027099003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9XHaq4Z31TqLhFyuIFUf55hFJREMy099Y8klBy/89smNFg7RyUmzYJRBc6W4?=
 =?us-ascii?Q?5Wb1eBIxABLsqSbc3BFjP1Nvag4ocSZgeJlUIeeJDso9SzZzK+jD49JszlRU?=
 =?us-ascii?Q?CbenlXwUrwVCxbVjy7KAwh3dRnENkrnwWHrZ7qkYtt29vs18XkUJGXraXHRk?=
 =?us-ascii?Q?t1kWTzTWdz+tkvo1pXRvlSyOypwYSJafzKDdCwd3yY1UYLB14NTvjhBYfWxg?=
 =?us-ascii?Q?73k1txvr9NW5fKnOLbU+x2vC9SOc9zl2d9VH7xdcaHHTHzZXEyjfom8D+/BZ?=
 =?us-ascii?Q?buTOMzR32dM8dK4GQBzVlQKnBHdjLVZQbP0x7L7VeHwHaACVe2kGkwOHkw6S?=
 =?us-ascii?Q?/zrU7/bn2aOrHhCts9vkstJt2NtZHviiCEKtui7Wbn6HZZiT3n6Yn5YZXQsz?=
 =?us-ascii?Q?cwKpZEywCVI+Nvf8FKiyhriv6J+Vx3VASXN/wjjatO+lOgZ8x+kwgHTRCeck?=
 =?us-ascii?Q?M7h2CP7+hsm45TWcW0GO3DQNEhVUSfqC3TJYq6vHt257wEQyIWLxpvKZHkJ1?=
 =?us-ascii?Q?2c0EKlG+adF+JOKqPrK2EqIYZtWlBh1SFiqX4pz60YoHNvQDdAxO4gngjS4B?=
 =?us-ascii?Q?/J/BTv4lJaSSlHOn8tUJvQg4Uqm3jPzTCNz0QLivD86S53bYSvEZn9Ccvwos?=
 =?us-ascii?Q?BBogSvgWwquADb+q3LW3aLW4QVA6odiY8vrFTlADFuJ1tAkXaPmHNgRPgbly?=
 =?us-ascii?Q?sdMOB1QN8aZAIjV42Jqnb6V8m6VKCg+k6m3kYBFTaZ3XdoebuDEwkNGk/l7f?=
 =?us-ascii?Q?wudb85TzSvkfHKDKhZJK7xuaKIcIkQQJp2m3DzkjMnLkw1olGFvXkhma3evC?=
 =?us-ascii?Q?2gXBfq05/43/vEup/X3RwWBESyTObO1gVsOj0LrbPXTIPAMQRJHajoPVPZkx?=
 =?us-ascii?Q?sgGN9z8IFFfbJo4wNeavMG20xsZMWqsVXWMS6nZHVeT4fOtSVxOckGzNjIkT?=
 =?us-ascii?Q?W6UFqXEdv0PrNGs38s79zKq6BB3f4X4z6mNtHKvSDtA4KnXFbG8AehWNc4rf?=
 =?us-ascii?Q?rFMLSrB3uc7q1zrQz0Zg8HcYrBOLpPNAJXvkyzzM2130QLRxiorrpx7xC+aL?=
 =?us-ascii?Q?E7gQzAs8VbVTH/68s++dJF+AkH7iaKxKuPCZqaBJG38HHlEG0d+FPd9ICqYb?=
 =?us-ascii?Q?VapttEGYaJNxy19y3BOfUEL9x4abGiSWdumHRo3qWLPD7ZrxWNd+Y6k4SnVU?=
 =?us-ascii?Q?uy/Ca7DeD38ZJmfm1zTxlMgpIBhx+JYXPbBrFtm0UCUoPu6OS2cX2lI12Ho6?=
 =?us-ascii?Q?rv+Ort59AhuiOdjcsbXUwV9jPv9gfRQOh/mm3Csu5TRIeYekYmSBERMzejw3?=
 =?us-ascii?Q?6n/OXyjfJOSn5cEUsy+4dXLwjsoGp4+UPZCdfBu7+9OdRtrx1ZxSZvUlXUXq?=
 =?us-ascii?Q?ETG/bb2HDiAJNot0qu3gXXZZ6QAmoKTA5YYO/ZM0Bz9rpzBs/fcc4++B2AXG?=
 =?us-ascii?Q?3qbtxWkB9MmZf+o1cGUsB71qX+krDPhGxQdNL9ycIAKIqcx2Z6zTsztoSeUi?=
 =?us-ascii?Q?C/OTJeCi9fmx5oqVtGpkP/y1ijETl5HAV74H5Rq7qd4urxOJB1vc+1K+xQQL?=
 =?us-ascii?Q?ms/37sP7WSmhWoeJ4QaQ92FwCH8Agmrjpb7I3vS570F5vqigTOTfFcECzgbA?=
 =?us-ascii?Q?LpbdU7HRGTx2cYXeoQ2Jo4rOTa3PF+2/BSX6noafM2MNyAxI7rhPDUxaNw/E?=
 =?us-ascii?Q?jstVMtQ0HAn1tJSiOZmbiDHfc7YZbdpUsk6qdGf+tqJiPCjb5A2G96RkN9Z+?=
 =?us-ascii?Q?SXhfi7cBPg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9d7e9f-005a-4755-25d3-08df4c7403c7
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:48:47.3695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDkf8cEOblSY1/kFL5DayRztpDq/6ihRSjvoD4anSQJtQgXnjcHUhhmjmz7rprMqnsoJF7de8ZPcPMeKN6/LWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7999
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_024853_042382_5B152D94 
X-CRM114-Status: GOOD (  10.91  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Link each DPMAC to the SerDes 1 lane it uses, so that the dpaa2-mac
driver can reconfigure the lane through the Lynx 10G SerDes driver, and
enable the SerDes 1 node.

The lane assignment corresponds to SerDes 1 protocol 0x1D, the one used
by default on this board: QSGMII on lanes A and B for DPMAC3-6 and
DPMAC7-10, and XFI on lanes C and D for DPMAC1 and DPMAC2.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index e23f5540b485..25d91f1eea29 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -26,12 +26,14 @@ &dpmac1 {
 	sfp = <&sfp_cage>;
 	managed = "in-band-status";
 	pcs-handle = <&pcs1>;
+	phys = <&serdes1_lane_c>;
 };
 
 &dpmac2 {
 	phy-handle = <&mdio2_aquantia_phy>;
 	phy-connection-type = "10gbase-r";
 	pcs-handle = <&pcs2>;
+	phys = <&serdes1_lane_d>;
 };
 
 &dpmac3 {
@@ -39,6 +41,7 @@ &dpmac3 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_0>;
+	phys = <&serdes1_lane_a>;
 };
 
 &dpmac4 {
@@ -46,6 +49,7 @@ &dpmac4 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_1>;
+	phys = <&serdes1_lane_a>;
 };
 
 &dpmac5 {
@@ -53,6 +57,7 @@ &dpmac5 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_2>;
+	phys = <&serdes1_lane_a>;
 };
 
 &dpmac6 {
@@ -60,6 +65,7 @@ &dpmac6 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_3>;
+	phys = <&serdes1_lane_a>;
 };
 
 &dpmac7 {
@@ -67,6 +73,7 @@ &dpmac7 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_0>;
+	phys = <&serdes1_lane_b>;
 };
 
 &dpmac8 {
@@ -74,6 +81,7 @@ &dpmac8 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_1>;
+	phys = <&serdes1_lane_b>;
 };
 
 &dpmac9 {
@@ -81,6 +89,7 @@ &dpmac9 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_2>;
+	phys = <&serdes1_lane_b>;
 };
 
 &dpmac10 {
@@ -88,6 +97,7 @@ &dpmac10 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_3>;
+	phys = <&serdes1_lane_b>;
 };
 
 &emdio1 {
@@ -271,6 +281,10 @@ &sata {
 	status = "okay";
 };
 
+&serdes1 {
+	status = "okay";
+};
+
 &usb0 {
 	status = "okay";
 };
-- 
2.25.1


