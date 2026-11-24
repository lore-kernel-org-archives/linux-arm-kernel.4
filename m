Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46380606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 05:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wHY1OuTG;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=g7rCrJsf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bqGdlwFo6JgGfmUDwpClvTOFeoViySegZVBIzKgXDBo=; b=wHY1OuTGvuc+1J3UUcUZ/ipDPH
	6NEv5d3smPcocf4DOgzBg5TG23ytZrHI5Sr+7SHzqaeWwv6iZgZM/YzBPTq2NZ2nXM0V6WaA8P51s
	oF3D32tlZS4/I1V5MZKucrqouWZo0zEfGPRKimSTiNR/FxUdvg9VGRv3fByH59HEthbpLlOx75ipJ
	PfmUePcUl5UDsLvlWPCoyNO9ZI7kWU5QvY6CAuuqDN3qycX4qt9WF/rVG3jOAWXsDbxyoxM4nt9fp
	ieEXdzEv+QeP9Bz75HzcJc6a2cEbp6YTo9r8n+bac4gApnMEbmC3lih1SDd3bBsAQ6ut/+iQirmCD
	zocp+A7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhex-00000005TtV-2rPW;
	Tue, 24 Nov 2026 03:57:35 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVheO-00000005TZj-3Dli
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 03:57:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBIgl4SDoHnaNdJ65l/vjpCRyBrFB+HVMrvfh8H54yOnoJAVVK4grY4lGn95hJoDJOSjc0L2y8QGICqzwgR5HRTd07aAuYleLtVCXzztbnvdNAbXhTdn2qosEJm5uU8oW5PQbOpSOXt0+o3xJGPEDIoAvxeP0qfKKa+TZXvijBJVuqnV5seYm6H82Yp59suEDL4ZbEebjBBhE2z0efymys4l5wnkTtqx5ppwbjt0D33lC76yl/B+dyXHgSGMp97z72iEtwih+wRYWQxxTNwfvBDBAMzFPp1Vsfp6RQzD8AEBXnPu2L2xksrQ5GewDmiFKYN3VfYqR4I87K18CoUtjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqGdlwFo6JgGfmUDwpClvTOFeoViySegZVBIzKgXDBo=;
 b=SCZd2SCIj7K8r83qOOlEZRNonMIXY+72mSoqIoZ65MuJCmZnme/rvoAHV/HfGWj7MgdbHMfZuNzRMDEHiEHBHEFUwjOUoeUIlqgZfzWq8xjrP2i0D7Yz6sd7ucUGvYjKRo9Auw/XOL7RG+ggB1kl7z93ByfmTinncvfY8hTJgK9X3mrvzAnkXK0iOmHM5cZ53f+8mucf5doF7ax0Q7nhEIeoScye05AR5zkxKjbJxRKasIDuonBRfqXnEBVNH9D2o1GTkFKOXdp9DbsoX0pFAt6FVIOBotN2UTMBgeUiw1dJgF7ucg+6lRRhcI3y92kp4VaZCULnShHqxmBkgiPiZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqGdlwFo6JgGfmUDwpClvTOFeoViySegZVBIzKgXDBo=;
 b=g7rCrJsfd7WP68OFxJs1XqnxsuoVeSho1S7vqhso4ENJr5xDLMk6vaCnaOt73XmzOg6SxXsEALzQxdoNo/Lw3k8m9OPOuK8bhn0Zvt3x/LROielEpmeg2UBBTwdOYjTzR/gUAPczK1uySSXp6e2cReNwx9BfJe3COAl8kO4/US0=
Received: from DS7PR03CA0329.namprd03.prod.outlook.com (2603:10b6:8:2b::33) by
 LV3PR12MB9267.namprd12.prod.outlook.com (2603:10b6:408:211::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 03:56:49 +0000
Received: from DS8PEPF000000DE.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::75) by DS7PR03CA0329.outlook.office365.com
 (2603:10b6:8:2b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 03:56:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS8PEPF000000DE.mail.protection.outlook.com (10.167.23.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 03:56:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:48 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 21:56:45 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 8/8] clk: clocking-wizard: Use separate notifier_block for each clock
Date: Tue, 24 Nov 2026 09:25:53 +0530
Message-ID: <20261124035613.1968260-9-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000DE:EE_|LV3PR12MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afe0e26-0a96-45cd-2dd4-08df49def7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|10067099003|11063799006|261026121527099003|56012099006|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: nhB8smp0ygyTK0revkFKNzzH3OAql8PW7qmmx5ZZZn+qZuHn4YYKFVGOQlmH1r2ODbI64uO+qReSfk2kbNUJ1zSZyxwYwF52jt00dzmctxRp1nwARzE0tHJW+DJHAVoSxpJ7zDiBAAe9XUohClB4G4ajhLpt9vYsx6hh2oc4faht33EnyM+6In7mO+W8KwfO2E0+eRPmaEI873fYBsDTGfEhTEfnid7wyPG8QLOzckvSWGG4zp3m7HE7GUU4fbwexjvbEr4PVPiSYyWA7KlMoVOjjd7zHuW5SFJNnshVzFArR9ISUa3hykK9WBtHqfn5undD1bQwHw8oJnOR+1jbw/TE+TegAVdR9ZKzvf9NK5oE8X/DYTdrt2Ih1CyaADfdwfsL5MHoCbGpQNs+ayQT+qU6Kq+6PP/4pqfBYu2fDSkm148PuCaOX6KHSe21zJ/PTVFATXC1G3Ax7rDo886IHDBSett2bNY+anUNr9766jVci/kdWaLjDECt3rpLQhE37hFOqDNyDUqsdLdQHsAD6G6aRJYhaeWnALZ7xqRAO8hU7ioUZR3Cu+gORW8OzpmT8d09/3JEt71LJesv1TXcnOmoDHYAM2Yd3eK8uc+dtyt5tv5eFuh4ywG9ruxI1MtIkznd5mB/WDhLGrTFwaJs+cDMI6/TH6MRnhySOcfgVVodfe+MYRP+JfhOUXJ1jjrMKYlMBCnqw4FIVrnGJGIa/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(261026121527099003)(56012099006)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: F5cIimjG5+8/t/XtGMGHsPFStUEyq3fQTcOrH1A6KszvbUK50zt9LhXhyJRZWTH4jsGqWvdMeOt47D8AYAyfgq6Gmmc/d+NzNgQfkRYfSO0GGO1cf0qqkwA2zirHru6JY/5spHfxZX6BR9O1wo0O6vdAgSdJ51pTQoFkppJpvl3SfVgmZ3kgPX/1qN3m5fnZ1Eo8xNHb1bMZK9R4ducFZkc3rxfxbhfYBKYIa45hl3yS7LG9XzPfJ6gzSGvQdwV4c/UMac64ckR2awdIqOyWxjz12n1OYtmx4ilkhjRN8qyCUwQioSY9+zXaQMooL0pFjd1V9lCDZpmSgYrRkv133JTyigB+EYmxa0WPD4rg/+SfCKWeOieYhwUDP23uYaSQ2ZKFv5X2GYpHp23nyfzyB2lC4WF6TNxrz5Zb12GJz/sRMlrdjZ1cbRU0r92z4AkT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:56:49.6487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afe0e26-0a96-45cd-2dd4-08df49def7b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS8PEPF000000DE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_195700_830485_3C257399 
X-CRM114-Status: GOOD (  19.53  )
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

A struct notifier_block has a single 'next' pointer, so registering the
same instance to two different notification chains corrupts the linked
lists. Use a dedicated nb_axi for the s_axi_aclk notifier chain.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v3)

Changes in v3:
- New patch: split the shared notifier_block into per-clock callbacks
  to avoid corrupting the notifier chains

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 42 +++++++++++++++++-----
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 046efa5c77c9..f71e464e0fca 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -133,7 +133,8 @@ enum clk_wzrd_int_clks {
 /**
  * struct clk_wzrd - Clock wizard private data structure
  *
- * @nb:			Notifier block
+ * @nb:			Notifier block for clk_in1
+ * @nb_axi:		Notifier block for s_axi_aclk
  * @base:		Memory base
  * @clk_in1:		Handle to input clock 'clk_in1'
  * @axi_clk:		Handle to input clock 's_axi_aclk'
@@ -144,6 +145,7 @@ enum clk_wzrd_int_clks {
  */
 struct clk_wzrd {
 	struct notifier_block nb;
+	struct notifier_block nb_axi;
 	void __iomem *base;
 	struct clk *clk_in1;
 	struct clk *axi_clk;
@@ -191,6 +193,7 @@ struct versal_clk_data {
 };
 
 #define to_clk_wzrd(_nb) container_of(_nb, struct clk_wzrd, nb)
+#define to_clk_wzrd_axi(_nb) container_of(_nb, struct clk_wzrd, nb_axi)
 
 /* maximum frequencies for input/output clocks per speed grade */
 static const unsigned long clk_wzrd_max_freq[] = {
@@ -1160,6 +1163,30 @@ static struct clk_hw *clk_wzrd_register_divider(struct device *dev,
 
 static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
 				 void *data)
+{
+	unsigned long max;
+	struct clk_notifier_data *ndata = data;
+	struct clk_wzrd *clk_wzrd = to_clk_wzrd_axi(nb);
+
+	if (clk_wzrd->suspended)
+		return NOTIFY_OK;
+
+	max = WZRD_ACLK_MAX_FREQ;
+
+	switch (event) {
+	case PRE_RATE_CHANGE:
+		if (ndata->new_rate > max)
+			return NOTIFY_BAD;
+		return NOTIFY_OK;
+	case POST_RATE_CHANGE:
+	case ABORT_RATE_CHANGE:
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static int clk_wzrd_clk_notifier_in1(struct notifier_block *nb, unsigned long event,
+				     void *data)
 {
 	unsigned long max;
 	struct clk_notifier_data *ndata = data;
@@ -1168,12 +1195,7 @@ static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
 	if (clk_wzrd->suspended)
 		return NOTIFY_OK;
 
-	if (ndata->clk == clk_wzrd->clk_in1)
-		max = clk_wzrd_max_freq[clk_wzrd->speed_grade - 1];
-	else if (ndata->clk == clk_wzrd->axi_clk)
-		max = WZRD_ACLK_MAX_FREQ;
-	else
-		return NOTIFY_DONE;	/* should never happen */
+	max = clk_wzrd_max_freq[clk_wzrd->speed_grade - 1];
 
 	switch (event) {
 	case PRE_RATE_CHANGE:
@@ -1446,7 +1468,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		}
 
 		if (clk_wzrd->speed_grade) {
-			clk_wzrd->nb.notifier_call = clk_wzrd_clk_notifier;
+			clk_wzrd->nb.notifier_call = clk_wzrd_clk_notifier_in1;
 
 			ret = devm_clk_notifier_register(&pdev->dev, clk_wzrd->clk_in1,
 							 &clk_wzrd->nb);
@@ -1454,8 +1476,10 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				dev_warn(&pdev->dev,
 					 "unable to register clock notifier\n");
 
+			clk_wzrd->nb_axi.notifier_call = clk_wzrd_clk_notifier;
+
 			ret = devm_clk_notifier_register(&pdev->dev, clk_wzrd->axi_clk,
-							 &clk_wzrd->nb);
+							 &clk_wzrd->nb_axi);
 			if (ret)
 				dev_warn(&pdev->dev,
 					 "unable to register clock notifier\n");
-- 
2.34.1


