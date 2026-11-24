Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E789606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FhdGJx2G;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=g4EnuwH6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tp6aNA+99gIovrTYIbvbggc0NMQ1k2zHjaAq2GcyNHQ=; b=FhdGJx2GwX87EK
	s0J3v315dIf7LqRYrDTC7VRWq7RhFVLbDw+z79v1pEDFMqH19tkC4oqrUYXpzUfTGUq69EbzRqosz
	8VnBaOH2gcpiLSxDxfG8pgPpDvlgJTcAFAJW2CYHZfz/hijRk1ivOyc80VePvyiLFo6GXZ+FZt3bh
	ITH7U9M3MrBYCvQUWpQhRdtcduCYN8ktZrQ14fK0riXQdTKmW4v3wMfYW0rwVao7LnT33NFtXTfq6
	ymnd4huPxOWocTJjDf1V1BKMzYxIbnrPEX4+TvNtki+XfpP3ab6frE06juweaBWAdUfH9yf90hkvV
	02CgwshOoIFXTLQnbP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtgy-00000007Bx9-3Cvu;
	Tue, 24 Nov 2026 16:48:28 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtgw-00000007BpI-1BWf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:48:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lL+FIashX4uFEjB7rYX2flLlNPrPec0riJw7b/Z/QtsbRlOjAt27Jm6mZ+Ll3wptoJL1a+dEhF7VDjyrkr/+UiP2rceT4W5VTof2f4JrQIwupxvvOnYBlB61qrwRsSzO/sl11FYvpGCURFrKeDYEq9BiXbJZ2hThzCbMpe4byPWWQu/jzy9iRA0GtBYVEXd/CdJLTKAgrtFkf3E7UjYHNP6bh9URIY2TpDdDkfm3NTwIrrSqCOWyQBTSIzY0ur2O5Ulxq3Rm+feFDM7FN52Q983xuwHp6qmzWY6L/boB0Gsfp01JItFrBLBPOAR2z6Fi1FK554E9ZTp+YAM0B/QPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tp6aNA+99gIovrTYIbvbggc0NMQ1k2zHjaAq2GcyNHQ=;
 b=KTIJNeiaxfAap/bolvYK/UoI00mRHuvf+DQYzh9UGxF+kN42wdRHaffOgh4iuNfBTAlAY26jIcb64Rl/eg20VyFaYuTLP6tL7zZBlZFujf+A6ZagkraqjcNnCLmkL8aRbueyMV6vH4H2deo2KxaVEDXmJ/4CjMk6fiy/ukhqK1fFQ1VWaOr+W64+OEVcWidz8dXHO1XQ4qe/t/uJ60pKZXcRnHx1Rg7yaFmwUVkQDlZvNFfUTk93WMrMQrdlmMpv5NJhM02mtRFOYteyzafa3bp3K1dMTgI5J6gWlyNnSDhgC5lSLJX4DhEww7KMNdBIYAfeWn+m2P2V56OO1ht/nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp6aNA+99gIovrTYIbvbggc0NMQ1k2zHjaAq2GcyNHQ=;
 b=g4EnuwH6I7lYtGILeSCo+1bhJVRxMyGS15EL3iALNTbHCOdHhKqRHJo8AjpBrJj8UriNovLs6K1pqVHudAwvQkXD6jTN/EhukD3C+3WDM9UE7KKAI3rZiEPHZSnW8r5kNqyFn/hSyW/GrmPPcIreN9md0cyes7oUckvedx/MlLNha7JrMxhQEWaAKhQJ/nmszooXTVSrQVScmzOLr86wdXMGzRtIUG0HDcC1dLhjoPAJLPuPYGztzfrs2B6LJCTLw5GRDKwRHcyc+quFlWiR+l6tg5m5vHf0M4ztHka3lwQz5UgInmyVxzyXh/PVjUCtZtH0IShD8Sk/bWeUpKmCIA==
Received: from DUZPR01CA0285.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::23) by DU0PR10MB6851.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:47e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 16:48:15 +0000
Received: from MAD0EPF000008B6.eurprd04.prod.outlook.com
 (2603:10a6:10:4b7:cafe::56) by DUZPR01CA0285.outlook.office365.com
 (2603:10a6:10:4b7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 16:48:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008B6.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:48:15 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:48:44 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:47:43 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 24 Nov 2026 17:47:39 +0100
Subject: [PATCH v6 06/10] arm64: dts: st: add TAMP backup register in
 stm32mp211.dtsi
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20261124-upstream_nvram_reworked-v6-6-ea0cfccc20b0@foss.st.com>
References: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
In-Reply-To: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Russell King <linux@armlinux.org.uk>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	=?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B6:EE_|DU0PR10MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d07ab7a-02d4-4a9e-3dfd-08df4a4abbfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|23010399003|82310400026|1800799024|10067099003|11063799006|56012099006|261022075727099003|261102123227099003|261021121427099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cQ9OHTlE4ebg4+YK93WtxoOS3M1R8QB7ofnzG1JZbrtVNSnRYCmm4KReoBWp9RvmPUNtD6kYbT8dW9p4D7h9o5ZAZcZfP71Rk8geLLRQqlmENGv/RamAL2pLcj+tr3qrkA6MjKHFIPUb073K82G3Czig8/ic9QlEBunO65+GxVoi9/Xs22seXycbRF7BTbOTnO5bZ0CCyMWE/ZJY3qP6tQIBu8Gxhg9ZJpn+cNvZ9pTFI7T2/BRccf/ayBXzKmlpJn3u2oQ9RL4f0b3fOIbN5sA4FxSAKVziX57jsRReQCRLOXPjFfpKYa6qql1M1xe2kdstK3qjBynwbIH3nUfO6H7si383EgWiwY19AGwk+qyXginCwot/tO+tqaw8YaOrfpi7MjqjAl1uPRSjbOElbB8oTuY1ScE/iHQu20G5uRpgvXddHmBNuPLvVbkUdh8rG/1mwdIrUt+FZ9HmH38wgJtpj90CdooTUNul2YpKruPvp2eym1tDAiWo5jb/gq6vmGDrKoVRmHUxviZrIq39S3N64LOERQFJpmF6RfiLtTeZYS8fnTo+cKafBimQ0imOyrggqNkfCAyPWJQNLsQQdBeeDnOrOUlMmtO2wkhjqPBdYoorWb+3pYjUQNxkgJKaFlmQt4CgNo0zu+fLdD58tzFIVIFSEgPha1soZ30bZCn2N0DpTTlsxhCunLZncUT5dO8og6Grri8MzHrcpXOHdA==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(23010399003)(82310400026)(1800799024)(10067099003)(11063799006)(56012099006)(261022075727099003)(261102123227099003)(261021121427099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: x+E6uH16xjTNiZKuh4wju0/gpDNkty5GJMGL/Qs6TagPSf5qqe2CQpuoht3UNpZ9migyFpZrqj0h1f7W5e2gd1oML1BnwvgzdCzCv52hpWNA5ZP0FjpSJcBjIAl6JEu9CbtRI1Jjl2p/A9WdA4zrfGikXsn2V8pgHCb5odYDPAvg8MgogH4/DpYwmue5Y4lqSVff/X51WWPBdi1WZ3//oKTSi2vgMJ2iU7h/0Y6SnXlb2uRuo4FjiHJOvf2gbyrSfMaJ007BwTE+hPtzVqMdwAHTo/986Sb6qBVHSIlcyQUJW05QymfZkt+coKTJMnle7HNUZNXu+UNzxpYi9zcFJvj8JWVoYJNfKaLCb8vN+I/eM1+DzLQK+xDvuSMCQ7ByAe7ouQB3gbDukif0Bg32ib5wdUNXpmvu6UNbxvD9CpBue6jO6F8i4eD9MXQQymSv
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:48:15.0635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d07ab7a-02d4-4a9e-3dfd-08df4a4abbfb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008B6.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084826_336433_5F86880F 
X-CRM114-Status: UNSURE (   7.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 4bfd58b26b51..f9fe99dc90a3 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -133,6 +133,37 @@ syscfg: syscon@44230000 {
 			reg = <0x44230000 0x0 0x10000>;
 		};
 
+		tamp: tamp@46010000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <2>;
+			reg = <0x46010000 0x0 0x400>;
+			ranges;
+
+			nvram: nvram@46010100 {
+				compatible = "st,stm32mp25-tamp-nvram";
+				reg = <0x46010100 0x0 0x200>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					boot_mode: tamp-bkp@180 {
+						reg = <0x180 0x4>;
+					};
+
+					rsc_tbl_addr: tamp-bkp@184 {
+						reg = <0x184 0x4>;
+					};
+
+					rsc_tbl_size: tamp-bkp@188 {
+						reg = <0x188 0x4>;
+					};
+				};
+			};
+		};
+
 		intc: interrupt-controller@4ac10000 {
 			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x0 0x1000>,

-- 
2.43.0


