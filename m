Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F929606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rbqowv7p;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oGmZOY2z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DJNwBYs3szYUQ1+gldQe8p7+E5TWwtXQYBJ2PoNzVEM=; b=rbqowv7pnH9js4
	vtI38F9crB/K78yKjm+gh9rhtRRr/3T2NMj+6pVbQ1cOFwmoMiu9e5ve/koOe/YGlOgp0Q3T5HShN
	GM5DzAM4VzQ0bdLHhath3NdO6MsMmkP7JlL/2TWf/QcHG8+1TXUU4n+ZXw6wHBkyhHsb6NuQ/XZE7
	3KBIX0Qcj3qUb0j33QVUxlYuidsvL2esaWdhQJuh/O/qgPiGzPHEv5HJb2iYuQ8ssrh1YDe6Gy18z
	/toTKPyKgQSh3/Etx8dk+nUpALHC5fZNOp8UpKWqqcqQMYQWntDf2VWMfIBL0bg+7zWZZTwAhbe+R
	5RUGWDC6ruDBGz8cOrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdXV-00000000Drd-0Hdz;
	Sun, 15 Nov 2026 16:57:13 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdXK-00000000DlE-1Dbf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 16:57:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHiCO+NvQWliuaFHsgy9v8rByKLwnVsTE5wbMKkILvxXE+ZWD7IVf7bPiGtA63gIwRDzxYIKC4tiTwEjx/zAK51sDr35RWZFZWrHrfiadec4chsCp8bc4yRqrKK38fCDNsF1sHuWHEerBsmJ8iBb3qEnZE0jfSQmfOFGAidcOSrwOlOOtBT4/VnYYgR9Kl1gsIWXUFV3dCBIA0pwoJXme5D5PASWgFMJPseRMipggCgzO7dyAGoKa9oFBrddHSNpZZy7tLjSQIptxAyqGxhWs0T71FU1fGbjsNt+t1Mk8kpj4oRX+BMx7CkJa3cyQrYyAOqAEG0xIsL2LR57x3x4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJNwBYs3szYUQ1+gldQe8p7+E5TWwtXQYBJ2PoNzVEM=;
 b=ZejYadk5/5BCK4KvkyqAQKiyK9sTAZmcKDu8agblrxIuRF51uJy+vovZtJUg50DVoY8az4z/+k3YNweTtvLzGKE0Haw0cdesILAIDrfsttNfaIBVemCO5kx3RiVIz//XtqbH4Ox7oGDZytRTXHgLXvgLvTTEVJTYdEpAFhNpsmv6CdTIGynVzw+Kv22FChDFH0RercX1jNk5zLqE0Jqutv0fYcqyJi04zCKpoVlDdXbbpByVgwQN3PB+Sdo2UwctOrq+7C8Q5rJ6l8DSKCauthM0+5pggoEGFcrSfj8M7+iPXgXFSyBP4snKqdwhftC+zfOAYeGYyiOb4hhYeZLFgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJNwBYs3szYUQ1+gldQe8p7+E5TWwtXQYBJ2PoNzVEM=;
 b=oGmZOY2zN/uuQI5bJh0aUAPJnGQ+csXTbqj4+ntREyhnHQVWCSDp/+qH6UfKaQlKfv1bAgQpFsx26BkMpkpiS3irx9QXBUqoTUBpWYcY7ADOeF269MuPuJCxm+91s9z5uAJk/dmwhQjUri72hmsdhzSsgDRG6GPI20t0TggHGfw=
Received: from PH0P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::25)
 by DM4PR12MB6541.namprd12.prod.outlook.com (2603:10b6:8:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 16:56:53 +0000
Received: from CY6PEPF0000004C.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::5c) by PH0P220CA0005.outlook.office365.com
 (2603:10b6:510:d3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Sun,
 15 Nov 2026 16:56:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY6PEPF0000004C.mail.protection.outlook.com (10.167.247.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 15 Nov 2026 16:56:53 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 10:56:52 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 10:56:52 -0600
Received: from xhdsboyapal40x.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 10:56:50 -0600
From: Srikanth Boyapally <srikanth.boyapally@amd.com>
Date: Sun, 15 Nov 2026 22:26:42 +0530
Subject: [PATCH 3/5] spi: spi-zynqmp-gqspi: Stop the controller fully on
 remove
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261115-qspi_14_11-v1-3-23425ed177bf@amd.com>
References: <20261115-qspi_14_11-v1-0-23425ed177bf@amd.com>
In-Reply-To: <20261115-qspi_14_11-v1-0-23425ed177bf@amd.com>
To: <michal.simek@amd.com>, <ranjit.waghmode@xilinx.com>, <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-spi@vger.kernel.org>, <git@amd.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794761802; l=2043;
 i=srikanth.boyapally@amd.com; s=20261106; h=from:subject:message-id;
 bh=XAdabUmZSJcMtOWLN1HNMdEIqmv7dht8nffFF/RNM6c=;
 b=c+hPfxuYDxrpO/2+KAAPBaDjGqR3ef3/vdiaCu9B0pW2xP8EWP4QO+JMZZLFSBRUNiM5r6iPz
 LLS2kAhQUVYAf016T6vjR/gzkJL27A1+oFzCxEnQmIH3HTPbbViS5mR
X-Developer-Key: i=srikanth.boyapally@amd.com; a=ed25519;
 pk=VZiIwz5+m6FvZJ+3hzpXDQl0u531OPVeBcB2OVGeZVk=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004C:EE_|DM4PR12MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: bd8d2fe2-ba04-4685-c187-08df4339730b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|261102123227099003|261009221727099003|261009221227099003|261009220027099003|261009223027099003|261009223327099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8Mx2JmPI8ng+XbnZthKJ/RTsU2Y3haeqa9tstBMMxAg4dnIKyMK4mysXA4UNiLIT2uQcpOBdIGSQWjOqZ9T03I60l0NHDez4wZwCbj/4cGVnZs5shW4YNGzRHea4Utc8FJhZyyfBiZJO5oaVmrJDKpMMR3HJOJJ+A3vyglgZXa84ls2NRO/O3coAOMsXRzOHIbN+cndurzaLn4MlP5fdi76DxcX14N4/qF9HLGK74/Y16aV2JhPKJae42VgwndR1eKIDSmuTgz0miioKq8MhPlKXF4u6CrwB9COowBtx13smRv+9H+eGfnNk/i9A4ARereep+HVNoP7ao94lZV4sdnpNEcYwEKeg8JKGUggJvIkfhnornHOPSttavWBTXE95sihHnnB2xjYxjAwsIk5TXh90BjceWc+DAAQBk9wyMl9aITb5Zem0rD5R52zSSPNAgFmFvzl6YaZiWpzDksPpUUSZuoFXv0Cw37pqSvPniAeb6qFcOOAf4tEuegQUO6tPOUSVkkX1pI3HoCbcchoNBB+N6wL/IK6Rn5pestgh7qqv9XMY88bCLkav7iltJ9D1iNiQEOSKG73YxpM+1n8n3INPNcSMZfqpSReeEdrL7GqtFW8TS5pRh8pezzzbeqOUT7EaGKYx9ewyTuMLD29nGizAndGJM/tNmdHhsbliLbS4XO5kbj90q1/7nAzJM0Q4x2dg0P+KOz/QHB+hKx6JEw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223027099003)(261009223327099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TRDgvmg/DQ7civ04FwF1TtL2uzkQ8I+L/GTQB6pQo0nzA/FSoJNgHlt6mXlWFVpdunp6K0hUeIR2tDuYedEaC2UrugqGfNLVdcD9KY9sqQ+OEgxUEdjzwY1Pfw5yC6lyCnoHaaP1WG2GlG4+2t8N0bNPCePSOkFsM/uGfwy5Ps7LiKSPFBcTAkOgFJfs6tgTlgeABCHIiai9L0y3e7+msUzp/bj4F2YA7ghChjB9Ih9Ewc/lPxOk2HeToPDBlElu1QyPSvFuek0QxD3rY4TgJutYrDsBXT+2va/MjOyfForcKVCiVFQVDm7aJ0GH/NfL7vi7L4ubwxYYaF/CAaWDVudoc6Ojs8hPCzPkWsyTon1VFN3SnwIa4+9Ci/anlGZ7K/V5Bq1UjOIx/0Wewk33kM71C9en8mbwe6D4f/l2MjvUEN1lg5vzQw5cl5fHNfWZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 16:56:53.1376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8d2fe2-ba04-4685-c187-08df4339730b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY6PEPF0000004C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6541
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_085702_362882_DB96EA0E 
X-CRM114-Status: GOOD (  15.70  )
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

From: Mohammad Zeeshan <zeeshan.mohammad2@amd.com>

zynqmp_qspi_remove() used to stop the hardware with one write,
GQSPI_EN = 0. That disables the controller and leaves pending GQSPI
and DMA status set, and leaves the interrupt sources enabled.

zynqmp_qspi_disable_hw() is that write plus the rest of the stop
sequence: acknowledge pending status, mask every interrupt source,
then clear GQSPI_EN. Call it here so remove() performs the whole
sequence.

pm_runtime_get_sync() can fail and leave the clocks off. Skip the
helper in that case and warn. get_sync() still increments the usage
counter on error, so pm_runtime_put_noidle() below still balances it.

Signed-off-by: Mohammad Zeeshan <zeeshan.mohammad2@amd.com>
Signed-off-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
---
 drivers/spi/spi-zynqmp-gqspi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index cf22ae8d2163..39f90fc3f453 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -1372,19 +1372,25 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 static void zynqmp_qspi_remove(struct platform_device *pdev)
 {
 	struct zynqmp_qspi *xqspi = platform_get_drvdata(pdev);
+	int ret;
 
-	pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_get_sync(&pdev->dev);
 
 	spi_unregister_controller(xqspi->ctlr);
 
 	/*
 	 * Mask at the interrupt controller, same reasoning as
-	 * zynqmp_qspi_shutdown(): the write below cannot recall a handler
-	 * the GIC already dispatched.
+	 * zynqmp_qspi_shutdown(). Placed before the ret >= 0 check so it
+	 * also covers the branch where disable_hw() is skipped.
 	 */
 	disable_irq(xqspi->irq);
 
-	zynqmp_gqspi_write(xqspi, GQSPI_EN_OFST, 0x0);
+	if (ret >= 0)
+		zynqmp_qspi_disable_hw(xqspi);
+	else
+		dev_warn(&pdev->dev,
+			 "failed to resume device, skip hw disable (%d)\n",
+			 ret);
 
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);

-- 
2.43.0


