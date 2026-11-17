Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9108B606A896
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pWs9w1it
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r6W8U1wNbNF6fiHP2Xyc75zgrRggcel3GExfzhcAL2Q=; b=pWs9w1itougJnRd6+R3Wh6uojJ
	Y4yT9NVRq0Y5z1RETepQGY6NdoQdX7UblzeYd/9CbGr4YJkPXhbbq3cEs5TdmONGgV5pM7nv64icq
	zVgsZ7rwEeW9u7o4bvEZrrAuElh0Jeiwg0T0Zabg/z3HyTkd35CkA36wY6cQavrJohsBXbRq1tCHk
	AF4WLM0itt8o7eAQb9huZ8D0U6fhbBlp0mW3sG4KKFSIffyngtDG9QlC0pBy3poPXWUzM9lLeRHHj
	f3XdAm6V0VRUK70kiEqX6KlMLBP87io9QCJPxnpdpA2M1x0AvMm+OyHcSgFwhlhtHqpsXep+XTdmY
	i5JEj2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFk8-000000059rS-0m90;
	Tue, 17 Nov 2026 09:44:48 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFjf-000000059Od-49hw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:44:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1wL3IuojbWycgGPn/BGLn0SFsZ+rkM/AFA/SjpZIdIELh8+MVFS2y7iS7mZU62X9vVfrFx3bx4SOMwQsbfFXoyf8TSujZWeh4eSabYfnBQ2e9LMcmWOAu/XKgDtzhG1A3NLkfwV7lgof5ct8K61Vn7yExsv2LfICMMpWX+A97F6jB/urkuk7zwPGrxDOY8oqEB8V1mxij8Nbj6o49aofvVtFWspRUT88iJjX8xafBcfr7oGXMYhek76z+eQq897Q6P8fIxgHF6ni5RYTvyKvWe3YL9bq1btI3Y6TqYIupzNrHbioe+BMRTka3ffWgE298DPx9Mw1adRPoJCFwqHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6W8U1wNbNF6fiHP2Xyc75zgrRggcel3GExfzhcAL2Q=;
 b=gOKcsTcAQ1bsRzZglNzXJNHt2BuKSVV/nCi7vj5Xjj9sPxLTLLebi4LHVmGQT210P/wCEO4jv0NP9uLwXklDfkd73IqejA2CwGZKeSCB7HYu8HaX91an7k5hoz2KrzRkxYCYyQNX5HXjXvRu9ibcJQcjT1ZL5DQqsYMykISsNkCqJqHlzfxQBEt29EmLYyzPazmrkRCreIvg+2+/7mClg++XO2wOOppPZ8pSmPh+0dsfPmhLTD6NakQU6BQJBVSXtqI0G5AWgAihU2ruMV3Cmhy5bWwNhh0iasWgKbHYlljJD0N8gCrCVSD/H7/8y5dGrcYLJsU4FQY2Pfz+jwuQVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17) by
 TY0PR06MB6882.apcprd06.prod.outlook.com (2603:1096:405:16::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.7; Tue, 17 Nov 2026 09:44:13 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::52) by SG2P153CA0030.outlook.office365.com
 (2603:1096:4:c7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Tue, 17
 Nov 2026 09:44:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:44:12 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4090140920E5;
	Tue, 17 Nov 2026 17:44:10 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	tglx@kernel.org
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com,
	radu@rendec.net
Subject: [PATCH v4 3/5] clk: cix: Register the Sky1 AUDSS IRQ auxiliary device
Date: Tue, 17 Nov 2026 17:44:06 +0800
Message-ID: <20261117094408.1393837-4-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
References: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|TY0PR06MB6882:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1e22c4f3-53dd-409a-3e9c-08df448f5601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|23010399003|36860700016|921020|261102123227099003|10067099003|56012099006|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: CWpf/Xrn03fI6nEXT0EOw76k7587WP3pehM7tk+yZvo8e6aSYPVonI1zEj3TbvPCn99NFn1JSTVb7/zlb2sJ1c7/lIlIFhEizqW//rfr1DtC3PhAy51E3isSoiNnhozExPSVc4x5ImZfdq6M95mXJ8pfKhNma/VPhxVmJU0j52f565Xes452VSesC3kCICDmS+89yBztkEgB9WfHDOM0zd/9CNIt12T1+sttp38FXhwpr6f3q8leeFnR4L68Tk5H8HUU9RjKozv8pPgKxRRgG6+JQ9a6aHOgEUhcLHA8Z+koo2oI74enN9LxqPUPLupfNsbbMSasz2GcSRGmwRAVGMwWUbytb6jZ7HijxSgVjZFvmc5K6nd9Ewp6jdbABhbtcHOtKl7X7M8P+Qtc7FawFXix1pW9hhhQTrHVHr+cR8Ca7/FWwSWW8h+KCcB9Y2Ntq+8rPRyEgjsf6zKRjC2rWkpDF5IoXE9IV3+h+suTnUNqfKAKka5WlG+M9d+lzgyBSZCt7iqstTiYmr3Woc6Rk6YmlrDmren0dIWKq3nKiabo1WwDWFx+X7oYyaQXi3EX//FJjSAQ/1bNZ053I6jFYM7XcdIpAWRJzvVTZcQiOc7WESvscKD0Rx6Ck33x/XJWek10nBIoiSSjDsZMRXc0mgjof9OPMkfA6tage1ux/tiEl9qUgmmZJz2qMZAAYuZ3pLhhGIcJzGJuiP3MTwJWV66GMMioWWn13Ph2vQ1rY/8=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(921020)(261102123227099003)(10067099003)(56012099006)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tSiRNJkvfN3bie37/etK7dkakcPbz2ZEOhoi22MK0WI+b1272fPRRvxVJiJeAv1yfCnHuu4YPoySt57RK+F5K7mblcTPV012vnKWwokmeXqUNy1XgTnXZZ9AWaE1sS+oscBa7XOIl0fvLNMrkilF56YnhWvLIcEcglbrcv1n9oQYwBiPpdnGXK2QZxF/e3XwWomfdmWp1C+pwEk9ilAA0sWh26j1Q7koxpARgTLJmTdYH1m40rn0kvVUQ343IUno0TxRdXXR6PrWTNDwIDDc4ZpBfRvDdsHZU2ezZSiEDgVhVGvbCXJzBwn/tJRiKVAnTZnlC+bDjw+9DysCRQqjmB6uzSxA2ohLvAl6f0Qep8UEDpUa4JW+hL+e3m0R3BbnAQZlQC/7JwPUTHUJ9K3EAv44lwHDPt7uxPGClF6FNaOUSQOK4XJxv941bFDNl2ab
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:44:12.1406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e22c4f3-53dd-409a-3e9c-08df448f5601
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6882
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014420_096780_8EAC89A3 
X-CRM114-Status: GOOD (  16.83  )
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

Register an auxiliary IRQ device for CRU nodes declaring an interrupt
controller, following the existing reset device pattern. Share a raw-lock
regmap with the IRQ driver and preserve gate/reset context while powering
down the CRU. Restore the parent before child IRQ delivery resumes using
noirq system-sleep ordering.

The existing reset-sky1-audss.c is unchanged. Auxiliary child teardown must
run before parent regmap/runtime-PM cleanup.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/clk/cix/clk-sky1-audss.c | 37 +++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-audss.c
index e096b8121df3..fa51cdf4f4bd 100644
--- a/drivers/clk/cix/clk-sky1-audss.c
+++ b/drivers/clk/cix/clk-sky1-audss.c
@@ -2,6 +2,7 @@
 // Copyright 2026 Cix Technology Group Co., Ltd.
 
 #include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
@@ -18,7 +19,9 @@
 #define INFO_CLK_GATE				0x10
 #define INFO_CLK_DIV				0x14
 #define INFO_CLK_MUX				0x18
+#define INFO_AP_IRQC				0x54
 #define INFO_MCLK				0x70
+#define INFO_SW_RESETN				0x78
 
 #define SKY1_AUDSS_CLK_PARENTS_CNT		4
 #define SKY1_AUDSS_NUM_CLKS			(CLK_MCLK4 + 1)
@@ -28,7 +31,9 @@ static u32 sky1_reg_save[][2] = {
 	{ INFO_CLK_GATE,  0 },
 	{ INFO_CLK_DIV, 0 },
 	{ INFO_CLK_MUX, 0 },
+	{ INFO_AP_IRQC, 0 },
 	{ INFO_MCLK, 0 },
+	{ INFO_SW_RESETN, 0 },
 };
 
 static const char * const sky1_audss_clk_names[SKY1_AUDSS_CLK_PARENTS_CNT] = {
@@ -519,6 +524,7 @@ static const struct regmap_config sky1_audss_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
+	.use_raw_spinlock = true,
 };
 
 struct sky1_audss_clks_priv {
@@ -928,6 +934,21 @@ static int sky1_audss_clks_enable(struct sky1_audss_clks_priv *priv)
 	return err;
 }
 
+static int sky1_audss_irq_controller_register(struct device *dev)
+{
+	struct auxiliary_device *adev;
+
+	if (!IS_ENABLED(CONFIG_IRQ_SKY1_AUDSS) ||
+	    !of_property_present(dev->of_node, "interrupt-controller"))
+		return 0;
+
+	adev = devm_auxiliary_device_create(dev, "irq", NULL);
+	if (!adev)
+		return -ENODEV;
+
+	return 0;
+}
+
 static void sky1_audss_clks_disable(struct sky1_audss_clks_priv *priv)
 {
 	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
@@ -1110,6 +1131,13 @@ static int sky1_audss_clk_probe(struct platform_device *pdev)
 		goto fail_pm;
 	}
 
+	/* Remove auxiliary children before the parent runtime-PM cleanup. */
+	ret = sky1_audss_irq_controller_register(dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to set up AUDSS DMA IRQs\n");
+		goto fail_pm;
+	}
+
 	pm_runtime_put_sync(dev);
 
 	return 0;
@@ -1125,6 +1153,7 @@ static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *dev)
 	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
 	unsigned long flags;
 	int i;
+	int ret;
 
 	spin_lock_irqsave(&priv->lock, flags);
 	for (i = 0; i < devtype_data->reg_save_size; i++)
@@ -1132,7 +1161,9 @@ static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *dev)
 			    devtype_data->reg_save[i][0], &devtype_data->reg_save[i][1]);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-	reset_control_assert(priv->rst_noc);
+	ret = reset_control_assert(priv->rst_noc);
+	if (ret)
+		return ret;
 
 	sky1_audss_clks_disable(priv);
 
@@ -1170,8 +1201,8 @@ static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *dev)
 static const struct dev_pm_ops sky1_audss_clk_pm_ops = {
 	SET_RUNTIME_PM_OPS(sky1_audss_clk_runtime_suspend,
 			   sky1_audss_clk_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
 };
 
 static const struct sky1_audss_clks_devtype_data sky1_devtype_data = {
-- 
2.54.0


