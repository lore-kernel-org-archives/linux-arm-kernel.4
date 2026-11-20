Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E684560A2608
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pzPxjjc0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nzwWT3ESrbmTnBdheacJ7T2KZemBnvRCxOtLHQCJeuc=; b=pzPxjjc0DeI7qqeosirIINnAp5
	9mmFsBZFVjnI7LEN7yQ9BWFU0jdtKwpIbQjsMwM9cd7Y5ke9iX6UQyzXnxnXcTW1vYGVM18YXenpu
	cOUq9LgoddVSWA/T27lmLnp/Reng8oxFEYVeds8FiISUqSCI9Redaro9b/QxuSD/UZQGJ+ApK80EN
	5DuIMr+ZFCIXLbm5vghidKwygs8i9vYJdY2jXu127WTsbxmxXFxAh1uuDbZn+G6dUV/nAKLGiwY0b
	mvKh6x/4QNpMcz12kJFHQxuRg1gyu94r/WE3z4u3/jRllxM/DDSNnWHqQMC0lLSS0qBaZhYc8tA4d
	u21LZoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHIB-0000000E5Rv-3ZQX;
	Fri, 20 Nov 2026 05:36:11 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHHh-0000000E5J0-2QG4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 05:35:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuBXvLhuzYbCPJcQohDg/9hnFCY6RXdWu9xul6XZg5KxTkneHzM6E2KnhMFpnRcUOSC3i5unxoDadvOgcmcfdusXcxB4u4DdXL6/4kK6wn380Qj6Fc1FzASvzGRAGnc1hNbLYk0CTwgvcaH3yDboEfSEUG5wQEhV0Fh9MBJbIjGH4jgtXTG0jm7aMcuVBZKWsZ37uiLSqO8lPRNOVoxNaSI/C0BQzljbJY/X7nxa7cxdRaHys+AZgDhaHKwPTSxCwp9fhe8+GWUY4eOPq+znylUxXCPcj6GOzY5i+xzE6Izch8NrvSQWMcxrtYZ8CoUKQ39CVZCIeIo1K2+1IFelCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzwWT3ESrbmTnBdheacJ7T2KZemBnvRCxOtLHQCJeuc=;
 b=PUPVIQaOkfAsi66TQr02fmkop4oWS13m6EbrqaPp+yZ/hqFBIwXctPooHEskueJp9s9o7ntAx0H2+7P7l9S9Ne/Y/qgi3afQaU3WdqAjiLNVW/y29Yo+ppsw6/Ch1f5RG88Ml983vLJsl/H2xzg0L+6LIr96XFGg3sgnLxE4NSXKXhWUM1f//YKyYDZqsrbgTOFAWhsiFrJNSEinny14CaddNYgXhGfTCq+XSJlOVzTp2TxJxT0Wp0B5du3ANawva7fU0KgLUN8e49543dstG9hMoZdIbUIdm/OM7V6/kwK3NfWyRPLPjm+BDhuOLpzo8L7CTv0+FGZ884dwIGi/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0050.apcprd02.prod.outlook.com (2603:1096:4:196::11)
 by TYZPR06MB6076.apcprd06.prod.outlook.com (2603:1096:400:33b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Fri, 20 Nov
 2026 05:35:34 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:196:cafe::78) by SI2PR02CA0050.outlook.office365.com
 (2603:1096:4:196::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 05:35:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 05:35:33 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 746B040920E7;
	Fri, 20 Nov 2026 13:35:31 +0800 (CST)
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
Subject: [PATCH v5 4/6] clk: cix: Register the Sky1 AUDSS IRQ auxiliary device
Date: Fri, 20 Nov 2026 13:35:27 +0800
Message-ID: <20261120053529.371923-5-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
References: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|TYZPR06MB6076:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2de1c2da-ce88-4ba0-db90-08df46c81911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|7416014|261026140227099003|261026121527099003|261021121427099003|261022105027099003|261021123027099003|261028144727099003|921020|261102123227099003|56012099006|10067099003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: AAe3tQNMvG2GkioPp1Py4E05aq5lKq/fGkVhhdz+GQMfEfaO7O7PuthBrwx1o2qRPohg9+jxw1Mt+v0EuPoNXWkI70Gp0JW/38GDkYLOe5jM46setgbOfQTPKEkkrS8k4sMo69M1e05da3PNRAGQEGUzY7bbOngbSnl2EHF/eXMtvVVizUmuKJ1JbPX3s3R4+TVm0fFEnx3izrsLIJf7y8wXaiPdw9xneRM65QvBvd3wNloWcrXCE2PrKaMwyNd1wike/rHmCaXmkbRU2O+c60/UkKcYVuzft7DwfD4ZF55GWgKhwfq9QMkxmTTpzIwwC+cJdAjGtL9gpUYkYxzcLmNO5FtonOuQokC8+IJwWwff0MwPztfi6PbAAaCSCmyQ+TjV7aRnWPhr0/m8ltm6eEvg90NZLUcfM9isvm5pic6mE8AQdyQBKIa8n6TUMTndD+1jCR/KCYGHnQ3IPf2G/RjkqZUNNmgJ0t31/T5fjtO0x/WDQt8bBDBQAhlRpmNXAwYyXZY2gaPzXyc9sAsyPHIfiZZhTciggNO7Tm0JfRimDipanvKFz6s/I2gqxMe9+5LJrd7PoAGSUF2k3GMXDhTw1rJkSDz0KFpHSS81Pta+av9RuINrb/iCe/KkJYdiTy+snUssT1MaQWp6dRa25L68KxIoJJ4nI0N5lldYeLmuADlOwbUyldwdEh/zubMuiZSbHrcXbYrayRL6kwEYAngEMPGi+iHg+3M7Cp/vXfvY1Y62NWGDpQ0VVSVfyrCk
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(7416014)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261021123027099003)(261028144727099003)(921020)(261102123227099003)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yE452XGkgxgfrNMkr2qTzEb+5Z6iZm/B1qAyV49V+W1xdYxXAHKvYNVArSMjDep5CmURJHb3K/IIyZ5lzjm6x3FJVhXkU+C5MnfGUGag/veBhkdnz3TBeHu/hEXiPCeKKf/LZGtSlHIbdxNUdyVip7NC3T6fnAGI8Bmff2F2xf5mXWDEc1aF7CB32QvccwZOHqOtbacdctb8cAgW2xui4J1cK/UXrcucYNoiH3JjTbSnXN88qEJhgWc43Mn+jduzyQ6AlGjWt4fxDL25ogbHmUiDKuKxZwFnF96F2Q2O29lNV2QZpRjBNQnh7VhPgOaj9h4x3dUdGyUt/siHphjjMfHA/FPM0Bu0lXLz6hDNSM/iHUKTDuCYGOAbgh5xwIdiH+F7SsbsZ7ne5gzGSamnA3C5gdXHIc16xxJFJRu+J+cLavUoycwXPF+kO1MN2789
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:35:33.6003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de1c2da-ce88-4ba0-db90-08df46c81911
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_213541_624525_9477C988 
X-CRM114-Status: GOOD (  14.77  )
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
regmap with the IRQ driver so its hard IRQ callbacks can access the CRU.

Restore the parent before child IRQ delivery resumes using noirq
system-sleep ordering. Use the same PM callback macros as the IRQ driver.
Auxiliary child teardown must run before parent regmap/runtime-PM cleanup.
The existing reset-sky1-audss.c is unchanged.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/clk/cix/clk-sky1-audss.c | 45 +++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-audss.c
index 1da86f6def4f..34edd19bb95f 100644
--- a/drivers/clk/cix/clk-sky1-audss.c
+++ b/drivers/clk/cix/clk-sky1-audss.c
@@ -523,6 +523,7 @@ static const struct regmap_config sky1_audss_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
+	.use_raw_spinlock = true,
 };
 
 struct sky1_audss_clks_priv {
@@ -932,6 +933,31 @@ static int sky1_audss_clks_enable(struct sky1_audss_clks_priv *priv)
 	return err;
 }
 
+#if IS_ENABLED(CONFIG_IRQ_SKY1_AUDSS)
+
+static int sky1_audss_irq_controller_register(struct device *dev)
+{
+	struct auxiliary_device *adev;
+
+	if (!of_property_present(dev->of_node, "interrupt-controller"))
+		return 0;
+
+	adev = devm_auxiliary_device_create(dev, "irq", NULL);
+	if (!adev)
+		return -ENODEV;
+
+	return 0;
+}
+
+#else
+
+static int sky1_audss_irq_controller_register(struct device *dev)
+{
+	return 0;
+}
+
+#endif /* CONFIG_IRQ_SKY1_AUDSS */
+
 static void sky1_audss_clks_disable(struct sky1_audss_clks_priv *priv)
 {
 	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
@@ -1114,6 +1140,13 @@ static int sky1_audss_clk_probe(struct platform_device *pdev)
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
@@ -1123,7 +1156,7 @@ static int sky1_audss_clk_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *dev)
+static int sky1_audss_clk_runtime_suspend(struct device *dev)
 {
 	struct sky1_audss_clks_priv *priv = dev_get_drvdata(dev);
 	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
@@ -1143,7 +1176,7 @@ static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *dev)
+static int sky1_audss_clk_runtime_resume(struct device *dev)
 {
 	struct sky1_audss_clks_priv *priv = dev_get_drvdata(dev);
 	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
@@ -1172,10 +1205,10 @@ static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops sky1_audss_clk_pm_ops = {
-	SET_RUNTIME_PM_OPS(sky1_audss_clk_runtime_suspend,
-			   sky1_audss_clk_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(sky1_audss_clk_runtime_suspend,
+		       sky1_audss_clk_runtime_resume, NULL)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				  pm_runtime_force_resume)
 };
 
 static const struct sky1_audss_clks_devtype_data sky1_devtype_data = {
-- 
2.54.0


