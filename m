Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50F2606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FhhUo9/G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d4H+OH7K54UFf4VBdUBinKL5nXIA3ULBobd5mHhrMKM=; b=FhhUo9/GvocM8kkZXggZPLNrJ8
	78rN6Iyf/bBySVuAUc/CPiktgYU3TvSCKFP69sUS2RY280Wc1B/cjIl9kW8Ze8BrhmGDH+Z5iVR0L
	U8kcZFMSLBMuNL9TcVmtTYl98gCeT3IEGHxo2bKNl1DaT4G0yFVRaT5JupCalBP2Gujdm2BuSclz3
	ehm22DBTCqEiMVwGlhoyCegylt4XyEeE0UCIFHjozgfHznTICiMz4LdlXXrPWDRZZeK9qMAwlFEtK
	eKLZB2ljCu+dmcJmnUN3jU4dl1V75vEdV4Y6hViqtkiuS+0oq6saKmJkP+PiGqey9r8sJzngTNiOr
	7TolI9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFjM-000000058zO-16sv;
	Tue, 17 Nov 2026 09:44:00 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFjC-000000058qS-01UX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:43:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/H2x3Jthy4kMZ/0oVmRuSDV17XBSxJDFx+dax1o1k/URJLyhKiN+vjQCxLJnlCHzr4vloTJWW1Ifij/qRrawh0zYAMz3wwb+Gnlln3ymRLqty+D7j4Tg20FEZJC1Zx8XfNRP1I+fEGfIYgKMKW+2Ua2cm6/PogN8hXq21eUgwkgirHPQ9qmdZ2Ps4CPsSsFuBC9ctI3qWMLf4yymc8Rgzwf9PgmFOIm1aoD7mv6XUeimoHE3pCtHtDl+qO6rgb+B8Rsf/55lGT//6W6o+ZylrmWFgoOiTEzvZ7YCll9ysr2oUnI95BUnkeYEqypyC+avOsA+Hf/Ms7FJZwaKfcYJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4H+OH7K54UFf4VBdUBinKL5nXIA3ULBobd5mHhrMKM=;
 b=PQwuVY80qH3Sx1p8zRIQ2a+xrD3CX5st5V2qbQloksPi1fjY9FeodJURXXHVMO3waNfvChHIq+y25uheXDMQjYpMFxQtIdutvxoZZKDeOqDeGGAlrmTiKVqiO8ngQui87B8cPgI4/EBwzGNfKzht+MqZBRb2cGcCpVqxQd0Lxvx/r94v1MUm3UTf/RPHWh3O4PTj0M07wwYfDrQoNQ91A0zlShRcx3usoDlk7dalR8fAhOgZ1t11DMKCpBYQiBmhbZT3/HY7RFJnqRYBQLLCBH3V2XTSKLrqb7JHGQsJe6A+7VC56CC5i49uHpFREslBuKLzKgIlTci4ra64RyK20g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6) by
 TYPPR06MB8280.apcprd06.prod.outlook.com (2603:1096:405:396::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:43:44 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:4:190:cafe::a8) by SI2P153CA0023.outlook.office365.com
 (2603:1096:4:190::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.1 via Frontend Transport; Tue, 17
 Nov 2026 09:43:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 09:43:42 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 959E740920E1;
	Tue, 17 Nov 2026 17:43:39 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v7 10/10] dmaengine: arm-dma350: Support integration clocks and resets
Date: Tue, 17 Nov 2026 17:43:35 +0800
Message-ID: <20261117094335.1393735-11-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TYPPR06MB8280:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e9b48bf4-0b63-4446-99e1-08df448f4491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|36860700016|1800799024|56012099006|261026140227099003|10067099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: LakMUA2C8yhd1XmFS0SFZS1KmpuE3hu3dYXWs6qJ/yI8wTuX4+nriC0wEal1ClJky2IXtf0Cwfi6qsYjxe4+fc/iN6wdyZGf0d/lU+9BYvKvNafVJLRmlCJ6c9PcKdR48kxVQLO/etVw3IybkEjcTNbJ7I5ynk6rifF3ZcPjhh/8eIiKsnzODcqQLv/BqJwna8hnfdCbxpJDQwtmksMRyjCRi7PkOVEzrUPgIRbfRD/I84MA+HnY9SJZJJcuruBSPbamTAVR4EnHCQQIJYKefRRDfbU6m8SksvrjVDdpDfR6uY/FGy3+3h2uml23VHLtPZrpXQMnzbc35JmA7dy0/FqIUmvu2xHm4Zwn411RZB0Y0lvzGJFGzcI8i9oBZnwA57ohvRqgbRtx5m2GOPpAQ/MFbTK7M0lh3hFTPB7g8fAHyD2KIzHbZy5qQI6NhhUcZtyL1/fhiVjcNgKDRvPMzhkwB5WA4/CoVegHox/YayiqomDSghXC/IGmmgNpLHOSKeYUJZtA/351o6UHgHA3im3DhFDiQmdKkAYZPsFJE0U57EE0pjDXx4m1gYzytbyfsWYqwXLQCJOKFBe09HSYj2XIAnncitz7QDrCfr35rCUE7Bydh8a0+3PRDXVWgWqZCyaiMpgW7jvpl/9Q6lb5wJDqoxCjTKkCsFjqOpXryk71U7yBJS190yTQ+72V/yk953ugS0z+e/ZUFqrdmjjOMA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(36860700016)(1800799024)(56012099006)(261026140227099003)(10067099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AyCkG6YiKSUSf83+pCYinhMYtAcYnA7sjf8Q8mK+M0apMVuYJP+zxfIlniHD7/cxDveeoGIM2DULFbZI4U0U5fGEgDR2Av2VCQ4byLxPd0t3LW0YNMiarSAFqcw1m2NEEayArAdQG9FEUcmY9+MED76D6znFw74pyHzn5i3blJCg2onwQgre3GrPskhDRZ0otAWUPaK8v4zVXHviA9F5AsDy0vYyQor6Ltiy+KGb8pR6isMyS89zT1VJm+2cfyindGCfxozgqjreKNxexFwCPJbHGFkuKdPs8qsrTcpYMTGHD7ftaZqaQJ13mu7VIhjNK2xmWcmd9RkzCNWSeZv/ub/zmbDbEu93Dgyp65Ddh/zNYX8A3rS3kSx0NK6uaxCFQonDHw+oqvV9mXbKnyr9zsZ/KKm7YZzerBM7lMAmFQPD2Vovgl/Pg2ZI1Mh9u5r/
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:42.8820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b48bf4-0b63-4446-99e1-08df448f4491
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8280
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014350_055907_C96261A0 
X-CRM114-Status: GOOD (  12.75  )
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

DMA-350 integrations may gate the controller with a clock or hold it in
reset. Enable an optional clock and deassert an optional reset before
accessing the controller registers.

Use the deasserted reset helper rather than requesting a reset pulse.
This also supports reset controllers that only implement assert and
deassert operations.

Both resources remain optional, so existing integrations without them
are unchanged.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 7b46b4fdcf9c..ab68213d0bbb 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -6,6 +6,7 @@
 #include <linux/bitops.h>
 #include <linux/byteorder/generic.h>
 #include <linux/cleanup.h>
+#include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/dmapool.h>
@@ -17,6 +18,7 @@
 #include <linux/of_dma.h>
 #include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -1270,12 +1272,24 @@ static void d350_free_chan_resources(struct dma_chan *chan)
 static int d350_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct reset_control *reset;
+	struct clk *clk;
 	struct d350 *dmac;
 	void __iomem *base;
 	u32 reg;
 	int ret, nchan, dw, aw, r, p;
 	bool coherent, memset;
 
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to enable clock\n");
+
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to deassert reset\n");
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
-- 
2.54.0


