Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C11606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IiwG0VuX;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KL6S5TzN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pvwlKMFDfy0gKjVWBWujRhMdwMC6xXnPDQef+jvhtR4=; b=IiwG0VuXCoyLpaCpBaPkc1FFPa
	OorSnZV/UNJjxZeqNAt88uh9fhGE3Lol0qkrgNK5TQgECE8jW0tMiY5o3QxpBreyqyg9n08+nNsY6
	6UTQhlZImw/51gxZHnMUz15vPmFxvogVGNTbwEJHRBQuu15VJygqF4dcQXA0oEPcPund/xsQYIas5
	vdoB1Proe12X69ay4tNClsltw67qR6lshTXmHavZtas2OT8s9NFCi1lpbN2iJaBjVkV0Uz0rJR6xt
	mHUD1WQHbokHrnrKZpd1Ow3NcNT9hZs0wyD8hWApTlntE8Ra/d/pWYIcL1GMeig4FnTWYcMiw3ibr
	XVkWDiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwK1-0000000GIt8-47Sn;
	Fri, 27 Nov 2026 13:49:05 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwK0-0000000GIsO-09oE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:49:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s50cixInloFupOoUQx/uLAvWKCCC+TXlJNn5E83god8KkQSE5C83Wl3yoChpOyhB1oLngZLN16kzG9L6SMQ525v01CCezvt6UrhuTilV0KgEr65/gBEEJNyuooLqgsbrQGw/NjpbWCdhzFsT2lWd3qf2M0nqIuVAIj7fNUPJKW/PBXeYt4KD3P7dLoGnY9yN3mbbivI0GjgdOHit/+m+FFHoS5eSkEPzJCrJzW61xFxEHEfvc/1Ry6wuebXLgGsgUicEZ4QtRNzyRuPhXbd8BodSiJ7YepOL9QjPoqykTlOobLDhAHmFcjs7PVXT2V3ewk+IcKcm55DUQKy/rJneow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvwlKMFDfy0gKjVWBWujRhMdwMC6xXnPDQef+jvhtR4=;
 b=hxoGk9+hrFt0Fmw2I20Y684zfkc43qJYMn99+ysC+v4jgFVlHGg+h1Wa+whQANtK5PQ/gXtCsFk5IpH3r5ghbq+T4qKx1la2TUWndgaBLczIKLvFair7jqzvO/XEn8atYEMbr/+MSmAwMS2uTmkDwcuJDP2AO9ibcNCDeJ/hFqXjYXD0F1QjKCjx2xhFB6FKUYQ2VAA8mfxOnz1S+eMetwzvfGC6+PmGVe0oZgyx+W95VZhKePYw8++hlwkmSonM4GR5+fK4wPAH6TlqQUXHwgvTeTKrHAmeNxP1m+MGLvE5p+aOJGA4gcYgRe8GP1N69Fu0GE4gn0zUbDPp4rLsMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvwlKMFDfy0gKjVWBWujRhMdwMC6xXnPDQef+jvhtR4=;
 b=KL6S5TzNt1ySup6HIV4dE0YQd6aMYjYcw6vBNxojyyl7Jkf0ZJ52V9dgPQyfCBPoxHXLpic4QCrchn2h0T0ZovHgAQFbTRoHHPrNnIw0yry05nUTDBedqt31OGwBA5dHtp5J3onP3teomnNAsmLpLQSJnpufhqpnNmfts8trvXeLwqPvcbavbGpUCNLG9fm8XdHNYPnvWScvMhaQxF5LRRpoRiCBYjeYrq6tOzXIDVHONIuTFIQogAtonz72rlDqKmyjzfG1Zu+O2fWYEqC3mj2wwIKSFamgswHHfn8Fib7UVnfKUQ4ckYKFOvQYpMHVyBeqBG86IehACEBWApsh/w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PAXPR04MB8175.eurprd04.prod.outlook.com (2603:10a6:102:1bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Fri, 27 Nov
 2026 13:48:58 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 13:48:57 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fugang Duan <fugang.duan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH] arm64: dts: imx8qm-mek: configure ENET0 pad compensation for fec1
Date: Fri, 27 Nov 2026 15:52:36 +0200
Message-ID: <20261127135237.2153934-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P251CA0028.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::17) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PAXPR04MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 5898b5b7-9fa1-41c6-4ff0-08df4c8d2f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|18002099003|3023799007|261009223027099003|261021121427099003|56012099006|261022105027099003|261026140227099003|261102123227099003|261022075727099003|261028144727099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: SY2gwa53MtYhPYNIeQbES6BDy+b1qxpbJJnC5BA46dt1hGNQOdKsfm+3Oj1lj8UZncScVY2SACfBuJvJp9z5KxOifRGfgxAuFYRHOPPPICcZ12EKFm8iSiGQCssH3HqQ+gCBF4+n5HorWdzjj/MsqX8f19E91r+qojwcrM0BdXvfmdqy48GKhlzED1hJFCYUg1jFWSjiNLHC27WwbPwRr79GlvoAWaaS5EkMNsN1dUWctVwtNQPMS/hzsxW+awnBAUEpyctOAbI/KohvyonkKohNqRGhhis+JtaC2OKOBvgBDkjywVmoiabLpnPWdVWA+P/1MeciIDTOwmB0FYniwL6rubtNGMTTvi8TB04piAcKFC2AArvflsPRTN0ceA+QM2+boQwZW46DUV8Jp0u15fQT/AS+z7w2dfkHJY2oxWcmvEWSbnk0xK0fNy6thdrChAIo07WWV3Rn2RB8thDwnx4ngi2xUhigxnPbla7XG6NYpnWVydFNzqR/zOwBbrcnHEtdkbseGwCib9Lufydh8S8IAHZBH5a9KJqWMZuvU31ByA9HFeXiHmVg9qiHiV2hntDZIQ7ZvV7AmsMrvDbe6LFSylnK6SqQrPb2BLvPGI9aVtFhw3HqMEebdEg4MafzdKO0R5HXtKDI8WbVPuYf+okE2+B4EApjgej0CG5BNnQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(18002099003)(3023799007)(261009223027099003)(261021121427099003)(56012099006)(261022105027099003)(261026140227099003)(261102123227099003)(261022075727099003)(261028144727099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YP6h+UnLgysNxWmWsC9JY3MuepfJ0Vkn8G142YW0G5zNECNZztkw1GGmsLfS?=
 =?us-ascii?Q?YhkCfFeWS/ehS6M2nb6uR7uLeKJZJfJJgud9kKD7T9EWVKIpICLgY3M94B3k?=
 =?us-ascii?Q?NGKX7H/JW7lWC7vehFQcQMK9cMdBWJOJktPJhyYMu7+vxH8sv0g2h529vrMM?=
 =?us-ascii?Q?cj4LpDYWvb3HSM2abPHVyLXLCTU8Ek+/XKYulLKpcaVBSAxsyHjDQYpP1n3E?=
 =?us-ascii?Q?sBuWts+tQZ5pD9ozfdR+2Q4hNg4t7c8DPmPEcynCtJCywYDpKUw8CDTOrUj6?=
 =?us-ascii?Q?wQ6lwDd+CFtEmr8T0dH/7zuh6L1pwmTyQ84YEmAkCkbjybqr4/0D8688ED+O?=
 =?us-ascii?Q?/zODIhMw4G0qLtIA6dfmHWIUYruz7hSO+tT8jsEU+HaITgBVl6dpWoMYctXQ?=
 =?us-ascii?Q?8QR3Lp2+K3MHv8p3IjgX5nVIuaSNcLNV75w2cyiJMZNEyEGseO2S8+ld9FVA?=
 =?us-ascii?Q?dJjzPyig0saetllyknuKrUER0GzV1nFrJeVAzOofJRJxJi2RFH+1tj81dPXc?=
 =?us-ascii?Q?d8nrA1BPbG2JBWAM8OLDp3eUO9mC5lqKtTQptT+jb2Ic8sIt+vTxU1fGFcoL?=
 =?us-ascii?Q?VMhxiz3Emir4wixrlVLF6iqtQNejWFHf92oIHvtiADMD0JANhl1WoLSwtFVo?=
 =?us-ascii?Q?Odb+4QQIzHhF8itjxxShTt4BIxxzwtcMl5ebqgCGkZ5wpZtvKWAaBcFvYkXh?=
 =?us-ascii?Q?1ayuHJcEUqCg5Rs/YetBsmJevu8SCicM1pn+VRes4Rt7EMkjK/mmbPGrm9cj?=
 =?us-ascii?Q?0y/PA+6EoLBfQsM9/OYGfvcwe0dz5KeUt/qhR7DQsyJZc0YfXupcqaR5Z2D4?=
 =?us-ascii?Q?yGNpsZYOu/RVXKRvergpEnovmawJe8RzzqKVi5rP9hjY4+iG6HszDPXgR9k6?=
 =?us-ascii?Q?uVSMLRtalBm20gaDasag3Hn1liuONjQlBQlK2d+HbKbg4rJWQzqCl/uMJRiL?=
 =?us-ascii?Q?GrkQJCvpEQEto9yrM/212lRS0DQVOboivtJbPhdDgzTNUyF/d7qCJ3UVoQwA?=
 =?us-ascii?Q?jinsp2y+cgeK6AE0srUymjkcCN4/ICcuPDaQ7ySvXhLAZT7lDdytRdkmAy+U?=
 =?us-ascii?Q?TDuyZq/a6PeiOb7TyoXGFvQYspOVGxDryA8qeXrmjdejGQ4g+xUZsUlDxWWp?=
 =?us-ascii?Q?teIm9Vukt5XoM1jo7HrvVjwZqSoRMbr+1AlqudNv1mRzJ7RmyMyCkAT6vz1T?=
 =?us-ascii?Q?cdvrD+WZIADMn//C5ZRh3CC9plXFGPghQXLvG4oiinu5wFgC+WkQ5Iz9pyCv?=
 =?us-ascii?Q?nrxVf1FlqkXDOHuG/+a6p1Ye+XkclWF/WUJAUkP64gjxKBhexC9DIT9l2Cpf?=
 =?us-ascii?Q?LE9LBZzUnq2WSxdC7ZIqIoYQggRBs7aLLj+Q4b+WZcBl61jA+h2Pf+Su+sW7?=
 =?us-ascii?Q?YJ8kvesL6OvkhKzfeCgs5m/qGTXEWn600t6neFpNl1qep2dUIPDDnU14aE5V?=
 =?us-ascii?Q?P9dFTMghPmox0dkuxWmp1IQzhSduDzoBIfrN4YzpZe/aNXy8FOTLiug2n1ys?=
 =?us-ascii?Q?xDS91eb83Ijza0rOD/AEuifll15Jh91IPnyxGNLh35O8p4Wab9H0jEEha2uR?=
 =?us-ascii?Q?2AouU5aq/Jm9EoWwXZMR79Ww2zYBHbStKxr9l7mgugzFKisZIlfjBYuK35E4?=
 =?us-ascii?Q?tl3QDR/ObSXUJ1q3ahv4FmzM53RMn1EaX7mi2gP8DWvCjqKqWO0Uy4lh11yO?=
 =?us-ascii?Q?fMm+PaSFHzaX3ifZMA7jcWdbhW8Lo5hpj61DEKq3Sw/wKICaov0d/zDajML1?=
 =?us-ascii?Q?ThhZhtFINA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5898b5b7-9fa1-41c6-4ff0-08df4c8d2f48
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 13:48:57.8329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNCBMmO5Fi7SD01QlF6Rn5KDPtWzSLXSP3hDdc46qXS/26bjrkqxRsoy2Ju6yi9hoRQrKRTZ5aLGYqYIiD8IhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_054904_095218_AD3B5BC4 
X-CRM114-Status: GOOD (  10.69  )
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

From: Fugang Duan <fugang.duan@nxp.com>

The i.MX8QM ENET0 pads used by fec1 support 1.8V or 3.3V operation,
and their compensation control pad (COMP_CTL_GPIO_1V8_3V3_ENET_ENETB)
must match the I/O supply. For 1.8V or 3.3V the datasheet requires
PSW_OVR = 0 and COMP = 0b000.

The fec1 pinctrl group never configures this pad, so its state depends
on the boot firmware. fec2 already sets the equivalent ENETA pad to
0x000014a0, which programs COMP = 0b000 with no override bits set.

On the MEK, the ENET0 pads are supplied from VCC_ENET0_1V8, so use the
same value for fec1 to configure the pad group explicitly.

Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index baf4dbb5cab08..613130cbc8474 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -1075,6 +1075,7 @@ IMX8QM_ESAI0_TX5_RX0_AUD_ESAI0_TX5_RX0			0xc6000040
 
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
+			IMX8QM_COMP_CTL_GPIO_1V8_3V3_ENET_ENETB_PAD		0x000014a0
 			IMX8QM_ENET0_MDC_CONN_ENET0_MDC				0x06000020
 			IMX8QM_ENET0_MDIO_CONN_ENET0_MDIO			0x06000020
 			IMX8QM_ENET0_RGMII_TX_CTL_CONN_ENET0_RGMII_TX_CTL	0x06000020
-- 
2.45.2


