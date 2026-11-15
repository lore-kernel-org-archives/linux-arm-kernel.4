Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3F1606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jIY8CsgN;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0a5Ve/5g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jwfAv9KT/gvVyFrTHdgfsAqWsfvLvjtF8C8JwclUSFY=; b=jIY8CsgNc5Y9wM
	i6pJ8InyPbO4+gnQgjtBO+v4H93mRdZ1UGDXaFl7mLvq9BmJ0RF2lG4w/CKytQ2KkpIOJtRK/4G6V
	zhIdFAayU0X/Lez/hZ2cZcDv0ZuSGAW9KJAueD875YZTTgKlWE7BmA4b7mgDM+t4ilR3NLEJSSmAe
	q5V4zCtuTw9o8rNS20T2Pz9f9/cGX4fxdcX+l7ok4NIMQ4tJbyTNROn7Q3/9aIulrpyjzBkqmEe77
	8+YjLUF1rLyCiLti2Rr4cYSMbmdXQ1OE3Ke4lZ4nowR9xLfy3nupR1jVb+FP6/ji3BdMeAKxFpQYo
	VHRvIbLV3XtZp8uYoMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdXL-00000000Dm9-37NP;
	Sun, 15 Nov 2026 16:57:03 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdXG-00000000Djc-1oWu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 16:56:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gsh3GbuHci94F706eFHMfZUSXCUrzESsMg+VBKeGrdabUOXluufJrmMD+rsm/AUMoVzyGSHI5rHf5XlTicBqztzBnu9DVBvXBcQ01hFsehfP+EzyFWBJNBwScKTd+g/1yE+0Zyc4w/WB9R1mMk6gb0qkVAe2aQBZJQmPk/wRRxGBrB8kDb4uGh9nJ3LfEAaUwJUn2Vqp1eMenmalw5La272uvknjzJvS47i5PQ+ZF3xvgxqsY+0G9sivJQCl//vskUc2yJU0oSJKntmMRaK68A6FUpuU26TKYTsEei8PXYYwieb9etLrhTBtRYSB8U3T+c7zEFdZgffdTGbVNeT27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwfAv9KT/gvVyFrTHdgfsAqWsfvLvjtF8C8JwclUSFY=;
 b=Xms/duwmcigQG39YJ0EB7c3zeEZfAfFN37F6xfmA8bCE9ANOYbC8sKbQilensN/bOkfyjYU0NpirCvx3EgB02gYxGpB4wyGPmgahOjTfx1MD12Ttr2KeI/Ygq37ZO1UphNajq5dFMGPbEdILU32AFYylvwsvVaoPZUW+VgvqzC5uKRqL4mclOwKcTAshwwA6YUFUxB1w6nZGR0FKYI1BEkDVAOvdtMoino3SGR+S7vvNUP9Q4ToqwBXE3jxlzVOUQOR1faQTyufbiuTXhlXZgIGBUT7LM4MeZQN3RADtsfiQX9DGcVrZGwVenf1X5XK8Atoa9zu6WMoIhp4O0eQp6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwfAv9KT/gvVyFrTHdgfsAqWsfvLvjtF8C8JwclUSFY=;
 b=0a5Ve/5gH3oFvfbudJMneb9pMYnMYxVnXkbqiN/PNqUxyK+a5enAlrPhv9ky1GwRQSqRakhc5o95KfmdyAgiSINqTpqr8vyscE3qHi8OVmMob5NTr8FEJebjBdpHk9RI0nOVv9lnDuBvOlGDEIbZ51YblWWRB6e5MkcKnh2WDxc=
Received: from PH8P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::6)
 by EAYPR12MB999132.namprd12.prod.outlook.com (2603:10b6:303:2c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 16:56:49 +0000
Received: from BY1PEPF00026959.namprd05.prod.outlook.com
 (2603:10b6:510:348:cafe::53) by PH8P220CA0028.outlook.office365.com
 (2603:10b6:510:348::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Sun,
 15 Nov 2026 16:56:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026959.mail.protection.outlook.com (10.167.244.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 15 Nov 2026 16:56:48 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 10:56:48 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 10:56:47 -0600
Received: from xhdsboyapal40x.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 10:56:45 -0600
From: Srikanth Boyapally <srikanth.boyapally@amd.com>
Date: Sun, 15 Nov 2026 22:26:40 +0530
Subject: [PATCH 1/5] spi: spi-zynqmp-gqspi: Factor out
 zynqmp_qspi_disable_hw()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261115-qspi_14_11-v1-1-23425ed177bf@amd.com>
References: <20261115-qspi_14_11-v1-0-23425ed177bf@amd.com>
In-Reply-To: <20261115-qspi_14_11-v1-0-23425ed177bf@amd.com>
To: <michal.simek@amd.com>, <ranjit.waghmode@xilinx.com>, <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-spi@vger.kernel.org>, <git@amd.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794761802; l=3494;
 i=srikanth.boyapally@amd.com; s=20261106; h=from:subject:message-id;
 bh=eUdFmEA2uwXKj7sDr2IechKU84/eSHhk0pPowcwOHjQ=;
 b=/TNspH9cHieoYg3SoFZFTwpzdQNCMbNyLeAd6V+XVmI7UJNcSgERq9+uqsjjMhJSxMV6xC30p
 CMW0tHjjerUCNapW2fDuczJzXCfVKrU3ixSg8C6jLP+INA8F55Crg23
X-Developer-Key: i=srikanth.boyapally@amd.com; a=ed25519;
 pk=VZiIwz5+m6FvZJ+3hzpXDQl0u531OPVeBcB2OVGeZVk=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026959:EE_|EAYPR12MB999132:EE_
X-MS-Office365-Filtering-Correlation-Id: f72d8dd0-75dc-49af-4df6-08df4339707d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261009223327099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: y+43pP2bWsA5I+yBe+0WIRkHncb1FZYI29TbWgQspq916F/vHk//y33OU7fykk8WvwL85c9EAWK5CdHi/mZ91eNQYoMUSwIb+UO2ZzbDJR0Z/yXCB4K7tF/1w5/rybHI9B6uPPVrUAm7ttBFvNusxGKgbK7Th9Q5jYxF51qFzb7Z49WMLYcKRaG9TlDF8CsbaVoNAcIdf4u8sNclakx9O2ECth5souueBxZeWbFASU7qrfU5ZOhzYddWuYg6V09YiOBdvqW7HLzVg91Xx85kcnTM4d5JdKO0cPFIogrYFyhsXdwlotAF6v1spJtlyDZhRUBABWPiUH2VmfY6TLtpCIq3xzzHoXFQ5jeHEKtHaPy6+NPvtE2OTaxWlhrbnCpXeyxybG4NymnWCweXc50x8QPuNLT4m16Yn/MkdMGIzY36CvfQEoXYiICaP9ngGpLMPw0Nm+Ni7xuuw0tfvUwJ39EleZWImBliUJQcr6RwvUuyS8a96AuKUm+7toK6JtmpcdZHxZQ3bQU+jvR/JtVHzybrk6QASny9zhpmKJ5UkKwSUD++xbheEQ63LHHHwplAkzaTPZasBahF84tAM4e9u/DcX1raGPATGKvGAJ6mjjyPENBRdEI5XUwU9yW6mTfhEk6tldqhdBTzZj7+rQ2/1/5K2nvTXeUQ+8gGpv/lK1C88Mh3vJZPayYqDrRIF/DcJ3rvxwnbB44ukF/OTJIkfQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223327099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: K042Vc+rrHGrLMQciqvItAopGFGXcpSMsOfuk/UX7Xxga6r9VcTWrwFdctdmIW8nTcthkzCoQK6decPSPWRsxXvxxymRrz48N6O8ne45oX6Cta3IxpzR+rgnRfXy+ifU1kKidWlKdV8lgi4s92xjDLnspBGgNoWLQT189jYjPL2QBh03NHRmFpCimx0iJNbXrLVZdBhy1EIh5tY4KhPO6dtZDSfA5wmk0/jUgIwAePPgQyMQ1sAKoZ/AH9em8u81vuY2o+8mVrM94S5aws/M+mUSud9tjqOZfi+miwk26jVVKDd5IG3W+ikkI8kviik+HLNsavPlKJbLfAn1VOSqvF1Cee9knGhBRodPVL1Zl1601CoLC2HZ+lIlO4eWwMMxxBffyVeMiSHjRWZkZkMadcGBchQff9ZPfStc6n6hY+bA1l2g3+PwCc5AhC88Q9Ls
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 16:56:48.8101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f72d8dd0-75dc-49af-4df6-08df4339707d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF00026959.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_085658_486019_7D6CB7AC 
X-CRM114-Status: GOOD (  15.39  )
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

Move the clear-mask-disable sequence out of zynqmp_qspi_init_hw() into
its own zynqmp_qspi_disable_hw(), so it can be reused by other paths
that need to stop the controller.

No functional change: this is pure code motion, zynqmp_qspi_init_hw()
calls the new helper in exactly the same place it used to run the
sequence inline.

Signed-off-by: Mohammad Zeeshan <zeeshan.mohammad2@amd.com>
Signed-off-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
---
 drivers/spi/spi-zynqmp-gqspi.c | 54 ++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 15e9d3ef8839..0da44ebaf39c 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -280,6 +280,38 @@ static void zynqmp_gqspi_selecttarget(struct zynqmp_qspi *instanceptr,
 	}
 }
 
+/**
+ * zynqmp_qspi_disable_hw - Clear and mask all interrupts, stop the controller
+ * @xqspi:	Pointer to the zynqmp_qspi structure
+ *
+ * Acknowledges any pending GQSPI and DMA status, masks every interrupt source
+ * and disables the controller. Used when (re)initialising the hardware and
+ * when handing the system over on reboot, poweroff or kexec.
+ */
+static void zynqmp_qspi_disable_hw(struct zynqmp_qspi *xqspi)
+{
+	/* Select the GQSPI mode */
+	zynqmp_gqspi_write(xqspi, GQSPI_SEL_OFST, GQSPI_SEL_MASK);
+	/* Clear and disable interrupts */
+	zynqmp_gqspi_write(xqspi, GQSPI_ISR_OFST,
+			   zynqmp_gqspi_read(xqspi, GQSPI_ISR_OFST) |
+			   GQSPI_ISR_WR_TO_CLR_MASK);
+	/* Clear the DMA STS */
+	zynqmp_gqspi_write(xqspi, GQSPI_QSPIDMA_DST_I_STS_OFST,
+			   zynqmp_gqspi_read(xqspi,
+					     GQSPI_QSPIDMA_DST_I_STS_OFST));
+	zynqmp_gqspi_write(xqspi, GQSPI_QSPIDMA_DST_STS_OFST,
+			   zynqmp_gqspi_read(xqspi,
+					     GQSPI_QSPIDMA_DST_STS_OFST) |
+					     GQSPI_QSPIDMA_DST_STS_WTC);
+	zynqmp_gqspi_write(xqspi, GQSPI_IDR_OFST, GQSPI_IDR_ALL_MASK);
+	zynqmp_gqspi_write(xqspi,
+			   GQSPI_QSPIDMA_DST_I_DIS_OFST,
+			   GQSPI_QSPIDMA_DST_INTR_ALL_MASK);
+	/* Disable the GQSPI */
+	zynqmp_gqspi_write(xqspi, GQSPI_EN_OFST, 0x0);
+}
+
 /**
  * zynqmp_qspi_set_tapdelay:   To configure qspi tap delays
  * @xqspi:             Pointer to the zynqmp_qspi structure
@@ -355,26 +387,8 @@ static void zynqmp_qspi_init_hw(struct zynqmp_qspi *xqspi)
 	u32 config_reg, baud_rate_val = 0;
 	ulong clk_rate;
 
-	/* Select the GQSPI mode */
-	zynqmp_gqspi_write(xqspi, GQSPI_SEL_OFST, GQSPI_SEL_MASK);
-	/* Clear and disable interrupts */
-	zynqmp_gqspi_write(xqspi, GQSPI_ISR_OFST,
-			   zynqmp_gqspi_read(xqspi, GQSPI_ISR_OFST) |
-			   GQSPI_ISR_WR_TO_CLR_MASK);
-	/* Clear the DMA STS */
-	zynqmp_gqspi_write(xqspi, GQSPI_QSPIDMA_DST_I_STS_OFST,
-			   zynqmp_gqspi_read(xqspi,
-					     GQSPI_QSPIDMA_DST_I_STS_OFST));
-	zynqmp_gqspi_write(xqspi, GQSPI_QSPIDMA_DST_STS_OFST,
-			   zynqmp_gqspi_read(xqspi,
-					     GQSPI_QSPIDMA_DST_STS_OFST) |
-					     GQSPI_QSPIDMA_DST_STS_WTC);
-	zynqmp_gqspi_write(xqspi, GQSPI_IDR_OFST, GQSPI_IDR_ALL_MASK);
-	zynqmp_gqspi_write(xqspi,
-			   GQSPI_QSPIDMA_DST_I_DIS_OFST,
-			   GQSPI_QSPIDMA_DST_INTR_ALL_MASK);
-	/* Disable the GQSPI */
-	zynqmp_gqspi_write(xqspi, GQSPI_EN_OFST, 0x0);
+	zynqmp_qspi_disable_hw(xqspi);
+
 	config_reg = zynqmp_gqspi_read(xqspi, GQSPI_CONFIG_OFST);
 	config_reg &= ~GQSPI_CFG_MODE_EN_MASK;
 	/* Manual start */

-- 
2.43.0


