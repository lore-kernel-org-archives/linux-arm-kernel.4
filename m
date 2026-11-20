Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAD9606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 03:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QjTARLu1;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HA/ovXiN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+X/XwHQALGGUqZX1BsoTZ62CUo0+4f25RIxhNEK1Pkc=; b=QjTARLu1sYB4T8
	O07A04+aVaBbpj8hSvhZlv8IGAdUJnurYlcXPGjjjHM/RnC7Trax079ex4IC+q7yUIYlkSoEZ2yNl
	ckATKjTsm+TgiEMcc/gySQQ6Wg7g5RiQlLrKW4Mr9spy4ahwdVa7oqx7NgqDNWATPLBXtfoFBrRpd
	eF31JZGnxI4t8LRyMoy+12NkTYFCdJekYxgSuNwCROJ+hfTQF2f3R5hEhtByjuxV3J2eZ3As2uD7m
	S/edmqTHYXOdGK1MRPyItJ+lV3MoFikvoeESSOWT4plT/ZkB5IMX9yI6ghMQx7wsHCdmnWe9qPCOj
	Cfy+1Fst5d7/yZq0hm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUF7I-0000000DwFQ-37Md;
	Fri, 20 Nov 2026 03:16:48 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUF7D-0000000DwCa-1CPH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 03:16:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTRTgxX6o9Mz41/I2bpBYwJ8f5zl8jmAFQvYEku+CT6gk+RwUp6TJc2afeN2Agir1rJLzyuA1n7BR9nRhUdv2tw2RScwT6c9O54T1xI0aygJPY4KkfxWovdA5/dO2Qi2tdUh+AolS/rqTVetOW+32cn634PRGcVBMUgbv4R8HNoGt9HX1zbECf/mhoDS2VRvtY9xZYtA9EYhWq5+s1PEh5/zsR/EMS5P6d51v1pBYOvn0/iV9OxQGmxbI894YTae51seWfxfKOp+yiaL/X0BfO0BR5X4QcD64g56o+XqleR9+YjJ6JZs1zQA/WGbNbcpHIYcpFvzXNFaVslIeFXosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+X/XwHQALGGUqZX1BsoTZ62CUo0+4f25RIxhNEK1Pkc=;
 b=SRYF+6TEUehrnsbfJRbFhHH7GG3cr1yLIL01Y/Rr+sbNvUdwsF1NObAIrz5njBH+sHNLA6akfAUuwM9PsSjJVXyDSTNk7D6kf/Z+3RPVUbUPQTn/5lyUrsYukQocoBwasGVbM0ErWtDnP7+7c/bJiWwnXc0I0/hOng22zRYEcuDua7e7fOCtv7Yl+vZs3/r3UbK69KX3Er6jfrz7GxAPTrRmHh6yFib2d1U0ZfH9SOq+q8ieZKIVj1PVwFmfukZanqsiDTq8klj8NXwm0F26ND8OMAij6/6okqhUVOtl9+rQsgGXGmN3601wWSM261tpE6AumwB6DuKL29blvYWnmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+X/XwHQALGGUqZX1BsoTZ62CUo0+4f25RIxhNEK1Pkc=;
 b=HA/ovXiNF3xfSKubjqm5kX7XMWAG89Zz80S4wI0op/fZ+PSi6sUQPHnkfodFSKPqXGIFfhPlAK5i0Xx7reOp+iFsbadLl0BtNlMopKw0ZbCu41Sd1SiizyqLL3koGudvOjSKqxgEVxgYBirwqBvAWcI57fB+I1win1COvZXMQHfx1iho2XVcQhqEBIoS6OM6KwWJPcKeYGSnVsbhZsr2TnHOLuQfnZqsTRrgl1fEirKPYCsexKILZhe4AtyIUA8qx3Vgcz5YPQDrAumo3sZaFaS5uBComEPdySvnw9ym6HKh2gtu4EByoXVNsz7Mu0U6SDxm9yxXKdQwMQeQkRFHQQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 03:16:38 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 03:16:38 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	chancel.liu@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/7] arm64: dts: imx943-evk: Add num-channels to DMIC codec node
Date: Fri, 20 Nov 2026 11:18:50 +0800
Message-Id: <20261120031853.1175454-5-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: ba4906bf-9eb5-4084-4269-08df46b4b0b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|261009223027099003|921020|11063799006|56012099006|261102123227099003|261021121427099003|261026140227099003|261022105027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info: mvIwhEfuPKe+qkLpSVfN/poFnJYQdzyi445uxDlYthEWrEUReIYHHqtGCfMMTETXLAyc47YPKFCwpjudaIObV+NROAGyGdyfRBb2mWEHyxjwEGtHmX8voxxW07HkXlNAjIhXv/Hr9FdEB7On/in6/jnh4EMX1+PWqwPca3HLtxr/hMywqGLgLEOlO5rtpq5vSOjM4VGVSxo8jaFvFC694zHACY8EdHlXRfw2/5oxudFet8YSRIUFC1H0TwgYepA3D1396hz4o+Twi2P9bpi+MOepsKiVu0P/NESSLmOrsgm+9zmqyRoykOS0ooezb4eYVfl9kcc+8ulhgw6cy8SqVEuv5gtE/GRg/W4HU0yUFE2/AaZOygqVlBaJqvYhhgMRdRPGPGsCJPBMn3ZyuLKgIHNk8EyeMYtZEe2vDNAQd0vjjr8FFBlA9exFgXziTs6dUMuC5efcl/UDKd+zeXL9RAbCxCJ39E0Q0QgsC8v6AlizNu2Q92+RWbgAgYH7cCdrXGG4UzMuXXGEo9JIiPgTg5eQu/kZsIRMu9gQtGaBw2pjDB6AsP7V5aEZM1I4g+xKmIz+914efyezKreDOaBZw/zlZx1fTJJMA4gzKzpJxv3wLnHbEbxHSV83v6Hy6XPkzDxRQ+POMsfvWHzFNXU0d1H2slw3exkyKsqsMKuuW7z90cAIxQ+Aft0X+uV4ufsH51iSO2SDpA8hhgwn8Fa1uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(921020)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261026140227099003)(261022105027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NSl1O4dMQi4Q9cUReQ3GEgipTFMWr9UsbciSkkPkXovr9+x6CyW44slB84KN?=
 =?us-ascii?Q?Op2by+y63Wy+z+73sYO0V1qcx2jINgdjnjft7xJTpHKGSrvcxCONieR3lw4M?=
 =?us-ascii?Q?g2PetqSbN837ofm+CzCT+hVQoppFiz8W8h/ep37nY9J2I/ahzoaX2Xrr/gSM?=
 =?us-ascii?Q?TaVL7/Ca4nHCsjWbhobb/+CcRhsh7c/61ryQXAHvcTGizQpLXhwmEo0RPskL?=
 =?us-ascii?Q?6t9jrzNh58SsXVzoUxeVltYAUVqKsZnd1zoxdA7B9tSHcyjYK4sr9O+twtvN?=
 =?us-ascii?Q?52rX4AhyKvm5S35a84aZfGqjCnwJL9eW3lh7+XnawK9ta9Iu6hIk86t2Xays?=
 =?us-ascii?Q?dBrH0qy6oZBdrUvmNp9zycxcgw68EcC/psSCnD7gXFlAy9nozUboXEARHq+C?=
 =?us-ascii?Q?tPnSi/K5uqtSioJiY6t+E0T0f4M8xWgNnjzvpuTyFYAkSpMrfqb7k3fCnwZP?=
 =?us-ascii?Q?9sFmFV6FHJOAo7cWqOcuSzPFssFRbDycEWtMCDgeFZC0S742q2j9TOfmUJEZ?=
 =?us-ascii?Q?cw7wVDFecZrlBc5WNRTjneF3iz4vWbXb/KdPi1Mcl5ZeU8thvzAYIYj+TF4j?=
 =?us-ascii?Q?9zncq06K1Evnb/3ajTAQ1AmNttIEHxoWUU7zcrk8VD6U+M9zqu6ZDPzXFEW8?=
 =?us-ascii?Q?ZS1rVaWWEEUtA8g1lx+WzzgHwu/rzR6rQNH+mV8PqhpgJwSmrrd/2cYQRN10?=
 =?us-ascii?Q?cOEU7EZgxNLUmZTr6IqORkpkwR1jEWTj9zlgtEmqOOBJyy1zTrxr9E+QaAB1?=
 =?us-ascii?Q?F27BhAkxnZmZyn4pvGmyvjOKJ6CRq5/dAzxneL78RE/RGjgrUIO6ZpE3ULE8?=
 =?us-ascii?Q?Lq2WsfZKI8v/rgLWSB3JF7KG4Fpx7UJtjwo8/UNP6jHzBfatiMurEvau3AsC?=
 =?us-ascii?Q?jkTePQpLz/aw6Kr+5fNtS1OkIGeK3+9bdxTtzdq561kPmPg5t/kzVPRxUhGr?=
 =?us-ascii?Q?oZ5F3EEIxSTjzOYE3SBZjx9QGYslLDdXf7MPhWwNgOeB9QwfMFwGERj9MjOM?=
 =?us-ascii?Q?qGPJXZHPaW+11L+wtOpHS51MK/U5ULuGdINy8jAKihKSt28FEW9MjVYn4IqD?=
 =?us-ascii?Q?y7AzwCThPoYQrE/I5C9UYReMoSY5PTnSiCFItrY6BhX1iKkM19KV3r6T/Y2A?=
 =?us-ascii?Q?nkztHWrK3wLLBmGSA3YlO0dcf8QbtCJTLEKiVq0QFrdi5lKqS1P4ziRb1xuF?=
 =?us-ascii?Q?6DpIkqeD4WU7XVlOCbkGVvgp1nLvxoTaJheliq+Txcwe8eH/BKJa/mBbrPDC?=
 =?us-ascii?Q?ZlEF2mKGhHAyLCxIjb8pVrRhUHMMu/r7uGL4uFhOiI5ZwbUwGkozzz7CMkL2?=
 =?us-ascii?Q?wGPfWlulNjEBqWBouqBLRiey8ewFS1IfyCqVWvYmDBNhcF9/F9jYhyovahxK?=
 =?us-ascii?Q?l6PeOvs9NTmSLrn/myb/0KR1hN/AYWwuw42IG7AuTPSWcea0KTnfflPmWQ4H?=
 =?us-ascii?Q?3NlrLd1L1v+PptKjA4d0o8tyAds1p+moJ/ujOqcU/roJIo/dmy+8aNMZ0KW6?=
 =?us-ascii?Q?CZa8wvhC2Da1fdRXOPabibUp9bVXDpAMkoCAMv5bQ/BLJwTk+XMnX4n2vKBe?=
 =?us-ascii?Q?Q4dDQH5jLi+ORC+8IlrFZZiN6Xen48M1McU5OA2jKc9Bg8oig2+KWogj2gaq?=
 =?us-ascii?Q?sG8mefoAy4um9TT2AQ2xLwLUO/HSuUnm5HNQHTh434LMxH5ORjBLHCjqajJl?=
 =?us-ascii?Q?2fFDYW+pg1Ov1KLRfNboWHO3ybVe9rZSuhup66cRKUANgXhbbGZfgriKRvHX?=
 =?us-ascii?Q?y5CLXpeoDYNy/5OP0sQ1brY75odSv9QcLfeKB12etmuxxTfGKcRd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4906bf-9eb5-4084-4269-08df46b4b0b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 03:16:38.4205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oj1BeA/AIhrTnU+9CKRvDumExhZ/lT38WkTOkwHJuZuoLOwdHicQLQguboewVFb1IlHyad1lC1MS/GC7c7QGEpTkkKKMHzc/4JctCck1L8RcG+4Z5h/IsKzPOnQOlY8J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_191643_336569_45268BCC 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Add num-channels = <4> to the dmic-codec node to match the DMIC
hardware layout on the i.MX943 EVK board.

Fixes: 715dc11c78d8 ("arm64: dts: imx943-evk: Add PDM microphone sound card support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 39e819c536cc..bfbda9f99a62 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -115,6 +115,7 @@ xtal25m: clock-xtal25m {
 	dmic: dmic {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
+		num-channels = <4>;
 	};
 
 	m2_connector: m2-connector {
-- 
2.34.1


