Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3062606D833
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aJ8pJ1t9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pGHjZZb01s//+FHZsg85wITdJCCurRihxWUJSHBj4ag=; b=aJ8pJ1t9Jzej6/t7m4B15tTo5R
	RkbOlA0xEJS42/WtZfrQ10gQCLTIgGYnGng0og3Uk16ORhiTZk9PBDh4WtZ1slQ0ATVQbqosESpkV
	i/zaulDWsItR4qgyZUU87idJpWxg2EzVVC2n9CjuZ8EW8BZ3iru4a68ce4/HnKflYOJeQK8NMX4Fi
	SOrMl6V/OnonzzIOcQ+6c9VlOINFCSEHk2a9UhvtFOkjmrP30ZBwTR0aSzmMbJPS5kSbEweFHmBck
	QwC4S1KTDEQXVtEC3+z6n7nhq+BxJx8CPJ+Ak0vS4t1QVL0yFqo2E0j6wBB6PEsVcLuSJSqOfAiRt
	5gv/uOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOBa-00000000dAs-1ruk;
	Mon, 09 Nov 2026 12:09:18 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOBW-00000000d97-0HrK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:09:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dtb5mIsV6yREYI8hBPCkOt1SbWu3jqGH/GxFyBAMZG3DLD6JJl6FJUQgoeniXmohaPXU7lSOKiIE98BJOhAPdD5udBVM+bym8wItfYE+SdXt2uH5IEUDm5vwm4JeoaBz2x7RFeHmVGdGpfLnMZHzxtoWhk4GPCJG6ANRltIQAqJtKX0Rd7yMs/KMdLOgUhE0mhjO354zqKOZzCrwvu55+CD6zdo+qBtJycrfw2JDx6abLP68aLlX/nmwwzOn2XcDsXmrQ1LcythOShhOQ0XeZzGmiICihxpOJcRRNm0k5JMklM78OoiWLnZzxfuQmz/VtouxqKUUDwN3JobDbwtNZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGHjZZb01s//+FHZsg85wITdJCCurRihxWUJSHBj4ag=;
 b=DOQBd1GXzhMD/xAZFOTiG03p7u9vnCVjYt1j14CrsALCsc/jiyWyPfMywUiRB2NoXM3n62hSz88w646+svQrMWTmnQ/FQtXs7CIafHvPhZrIkziOyuKsHU/qL1OhcTkg2nx3qtoFSqVdjKgF0pErOa4SHNCXG/MHrndpK5h6eFjeP43rBYjYV2RNxtfpq6uRzyqtzI57oykbyG/6QCIOqrXWhdyUzX5MUhbVgwCRsE+TXaRGHnSbvUCct75dhU4OwWwRnde23GWRuOWMs5YXjvIkTBUIC7XrCPQ8IURMXrM2bJrztLKoJvjf8xOKgmTeNQli2kLx+diMeOhKs2V9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0061.apcprd02.prod.outlook.com (2603:1096:300:5a::25)
 by TYZPR06MB5507.apcprd06.prod.outlook.com (2603:1096:400:289::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Mon, 9 Nov 2026
 12:09:04 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:300:5a:cafe::4a) by PS2PR02CA0061.outlook.office365.com
 (2603:1096:300:5a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 12:09:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 12:09:03 +0000
Received: from cix (unknown [172.16.64.42])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6168E40920F6;
	Mon,  9 Nov 2026 20:09:02 +0800 (CST)
From: Cunyuan Liu <cunyuan.liu@cixtech.com>
To: boris.brezillon@collabora.com,
	steven.price@arm.com,
	liviu.dudau@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	p.zabel@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	robin.wang@cixtech.com,
	cunyuan.liu@cixtech.com
Subject: [PATCH v2 3/3] arm64: dts: cix: Add GPU support for Sky1 Orion O6
Date: Mon,  9 Nov 2026 20:09:01 +0800
Message-ID: <20261109120902.125242-4-cunyuan.liu@cixtech.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109120902.125242-1-cunyuan.liu@cixtech.com>
References: <20261109120902.125242-1-cunyuan.liu@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|TYZPR06MB5507:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b8688254-ca93-4424-b817-08df3e5a3f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|22082099003|18002099003|10067099003|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|56012099006|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: 1t6DXYaAcv488eRTxLOc4EK5BmgD6DaE9go+b6qfMNnxKz04y1Jk7Z8i+D9JY/ChAytWw+L+EKXwug8L2ObhYmywd/0Doso/XVQb8iL2ktuwJ+j84E+Q+JjccPSXjC/ru6sw9v7UmU0ZnNCNd29yLTZpVQ/H4OcK3q93CSZMnkjlBB/iaKSw/2FZAdFRiFgrmTvhP0ikEqlihCSi0DO9uTRFbjLdUISHveoeim7oizulb0e86HAn1JbbmvwTEQb9hU1XuwfTh4JFkkZwk5sXAyXFFXs/IXiikNOuqZex+fL+6AA6hQ7nRn8kuzy8DpUENxQO5BCJz9WzBqwm4H0gcizEwuEbK0s3sJGJyDc/MeYdXAoyWUrk5xZnjP57zOIA18TKk3l7J97OpeORXqDS56Y9aPCOf2w+kmBwPA9Xt25Ab1da9C8RPg5EeWDWA41L3FdKSCG4Ag7+pLLZD+RzkowNYpBenyxo26ZtObsbxyTmjkyW92Ad4hrn3f1ZJl4F/Uk6+65dnXic2+92Iclg3lY3mhF7hqeW4OBv/hbxvp/TFo8cA/hAS5a/FJfGG84+qJFrNtjyMTxrFU0InDve+ghZkxD3Tv5SDcOKWU0XG4IJrBqjoXFizcC2OaazOJdsZB9E0BZDndsiCXbbNddMcWnzMgKcpViL4Bpr2Y80SRIhlivpzFs/6qnpZMuyiZxC5hnZtmCEr1UUqNMSrowssQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(10067099003)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(56012099006)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ga7ZGmdH/NS423SHtiAGhNlS6ep7yxwlZFjopVkoUxF5DuIf69tZOH51ttBTbDLMc3aowQHM8Nx0IUZR1F44TO5l2GO0z/3CfKgIpNdzNf3+EmoggAxUacYKAP0KWkfKz0cmrNcsC6B70dkHzO18jAaUt4HQoeoAOX4B8ew9+kVKsCaKjph/QOBgMZWxpt9Yvn9AtoxVp/ZMDG1n10JmxZtBD7zs/Vsi8lQFW2iNzd1GwWOoyHyEdAm3YqxOl5tb7ofmpRpao/w6VtHHUfgJuKwE9mnZUCpFlCezxfBveXad90K/2El5XQAn5AMV0xykEb4LttAtJnVHhTVktCVhALdD61l4SW1PwNmviEpS45pvFZX4MxPIeGBh83bpxB0kA7wW7BAwuQydBitapzitoQ19p4HAi+YzIQo4+HEYolDnfWSDgeFN1i8CQMvI0hkf
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 12:09:03.8121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8688254-ca93-4424-b817-08df3e5a3f71
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5507
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_040914_107692_4F674643 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the Sky1 Mali GPU node with its registers, interrupts, clocks,
external reset and GPU power domain.

Keep the node disabled in the SoC file and enable it on Orion O6.

Signed-off-by: Cunyuan Liu <cunyuan.liu@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  4 ++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..853c9c6f202c 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -52,6 +52,10 @@ &fch_gpio3 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..d5d347964ad7 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -762,6 +762,22 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		gpu: gpu@15010000 {
+			compatible = "cix,sky1-mali", "arm,mali-valhall-csf";
+			reg = <0x0 0x15010000 0x0 0x480000>;
+			interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&scmi_clk CLK_TREE_GPU_CLK_CORE>,
+				 <&scmi_clk CLK_TREE_GPU_CLK_STACKS>;
+			clock-names = "core", "stacks";
+			resets = <&s5_syscon SKY1_GPU_RESET_N>;
+			power-domains = <&smc_devpd SKY1_PD_GPU>;
+
+			status = "disabled";
+		};
+
 		s5_syscon: syscon@16000000 {
 			compatible = "cix,sky1-s5-system-control", "syscon";
 			reg = <0x0 0x16000000 0x0 0x1000>;
-- 
2.53.0


