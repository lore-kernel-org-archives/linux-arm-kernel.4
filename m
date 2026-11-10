Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF47960A3818
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bJAnxx0T;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YWw9gzPM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q8Keuytkp9ZqoTq8cGhjxG9brfsAa1YKMQRKtK5ASK8=; b=bJAnxx0TK/MCoIHkyoiEq5slu2
	k4uPtbFgcLdEzQc3CypUR3kq1oV95Ez7fLwcuVGYej3c91ztVyfQ4FdZMNMVT85XH6N69GGJOrsx0
	9FYepqGaMiA8EYrY8MUAuOzQUnpFEdrNZ1SKsCN+NDZT89BB3iUHtb2Ks4yYdjVBQbqkWPdJThDcR
	fXC970uvuBjqsJRKVt2KYnnuH2G4lJ4Cic110No1CoSvmVy0XtSxqkgJi0aj5P6eY8TrGzoK8sleG
	oPd56fo+X9evJrPKTYNIK8xQ6qQnySyjbagV131bGpJursFyRRaAjq3StyThvZVi9rhg422bAthWh
	/IE0tdsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe6X-00000002UG7-4BOQ;
	Tue, 10 Nov 2026 05:09:10 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe6Q-00000002U7W-3EWz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:09:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRwVc1wUgUfn3PmZ9Jjm1FSughnLwwkM0vh33MlC91/gS1kZBGVK+8ccR/q+LDWI/oV4SD+psRKzNGMxQLehKFXOiKvX6yQHNVIlrPXD2F0OoQ9k4dvt3TFzavmp7hHC/X6zcADbYiqc+IfcfZfhjDYp9FYLVlVwRaqYfXy2LFZQm10M06iNHb3+RJHZWRiWHMfoe18a8/uMVHjhC6loXC6PauHH/dA6ypsEvIa7CPmECrNgZuQAME0kpIgz7EOy8oS4e1lWXVf1dkIZYVdZ2FkhijIpbyNRwh8dqYeMjiUZBmcU6RCM5RWux54+9/tYeGsMkWdVu9NT/GGsXx5HIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8Keuytkp9ZqoTq8cGhjxG9brfsAa1YKMQRKtK5ASK8=;
 b=L/aqmM4FolmvZdyv4Xadvd4CdIWPce0tamoMgi1v6YQmy3e8fBQYQhdAbBNOadXJ7VI/6ZFdtyo/qO3RKMvJsSFhEDVDwl1gb9Mbr6AmN0Yt2owSCDbtLY+SyQlKoDGofOvBJZiKzff77x7Zqi+a6ZrzBnhyDM7Q4mKs2PQTyMziT6Gl+7r7xieoen7vJ4wnriLB4RKbRUtb5AHWwaJ453k9zuQhoUMAjRDuA8ZMeOKjGgutIoPq3HKLcUNGFELPHOq5qDpj0kEiaH0ZcqpWzCmgZoIkdX4xpCZI8pM6yAkbFAflx3aozHtVe52KMyhfOWjvQHiA8vsbMV6y2kz4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8Keuytkp9ZqoTq8cGhjxG9brfsAa1YKMQRKtK5ASK8=;
 b=YWw9gzPMGs0cvg/DR2oKZw2jy4v9G5h4Cs0tUUQCQaHnviyk2BR1dyZvHvUwtRzhb84R7G6zxhpc7RTpa8zwH96teo0nl8l5NMbcZ1gEeSiuzLb2kTS/QZ6MW2FGuA9v8/lEttkTX+3+sqaBnZ01TABYx4YtzUVD9N1Fsju2tIU=
Received: from MN2PR18CA0013.namprd18.prod.outlook.com (2603:10b6:208:23c::18)
 by MW6PR12MB8708.namprd12.prod.outlook.com (2603:10b6:303:242::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 10 Nov
 2026 05:08:55 +0000
Received: from IA0PEPF0000003D.namprd03.prod.outlook.com
 (2603:10b6:208:23c:cafe::61) by MN2PR18CA0013.outlook.office365.com
 (2603:10b6:208:23c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 05:08:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF0000003D.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 05:08:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 23:08:53 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 23:08:52 -0600
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 23:08:49 -0600
From: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Dileep Kumar Nagavarapu
	<dileepkumar.nagavarapu@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v5 06/16] iio: adc: xilinx-xadc: Use guard()/scoped_guard() for spinlock locking
Date: Tue, 10 Nov 2026 10:31:51 +0530
Message-ID: <20261110050201.1850399-7-dileepkumar.nagavarapu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003D:EE_|MW6PR12MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c9650d-cc4e-4791-0f16-08df3ee8b845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|261102123227099003|56012099006|261009223027099003|261021121427099003|261022105027099003|261028144727099003|261022075727099003|261021123027099003|261026140227099003|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: eQ2a9Vz76m5hjCcRXDFJdFVBWhqBppmHAC+rRR5L3xWMwitEUbFpcGQ990VfDe/yH2nlf/2ccHuArhEEWwqot7bjJjEhyn/LXGGCyu41iLpJEAZ9Zx3+gcLJCkWsOhA4mkwObvwIDexPViZI/2aLK8pNvGQjgZhA36VZINxAa5yYGsc+nVNNhmG4g2jt6HT7rVgBY8yNXPvOYpgF9/rLoq2fj9tf1/9sW200Fm5HSo6ZKk3FOCudbfNEjt+OuwC/Rz+buJ9J502RfwH2g+nBBBobAhK6YT3cjVE2uN2fTs5TOYSTUI247BX4toM8KA+C+yxVINwEhTtbPVIRAKUhosBZpHiAXUGfau9pAevbKEkXcYTOXbwAlO+lujVTzswEBujM3ntjNQkG3zu+PA7npMec0XoiUU/ZG51bkvvQH+VNpAXsmIVrqr5XrhY8vC3yJnFeuitoRTy7Lubd5LKFepR6teHa5mckfqQJefRfxRWS8rtLHFzb1XGNFr1ZM90aMqFa+gPh3gcwm+0SriZJhvnl0K6SDgrvBgaGcNpBqJa6xDj/xoOnytjfAwELRq+mwmvteSPO9eYwI3iDpR5HqmmzRh6AFK2VOMYEmYitk+51z9oNUhgv4J5VvCyRrvEx8qRV4E0Hl+z5IsWXDmal4EyGznucaLSpGcME7axQVI7lErU/7mWpRv83rnkdRdDd/a1xUQdDl3WOI5RHfyhTcg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(261102123227099003)(56012099006)(261009223027099003)(261021121427099003)(261022105027099003)(261028144727099003)(261022075727099003)(261021123027099003)(261026140227099003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IyXpHbyjSHRn3uPB1f+glCcFErQ0n7gCQjlpQaUUZiEWZshiyGU+VLzu+UsjgGS8wPzlb2WzNrDjsU/UkqHD4au37kSEre3uuyQcbJ8TQ4Xc8GoRmpe+/dkT/+fc7IZc867cpuAebvIfyxKfVFRnupeT4t0J2pY0NVl0SLxQbhBDxGoswt5vZjoxrAMaWxsf+63WaYTA8wEPRRpQw7gkRTbZ4qwcvJkKRdlI5xNmvqgfxsmTHlDFQYZFdirc/kHAXGcwC3HZ0cdNaM4Eb7Pe5MmTI0/HlDHxjCzxMbiiQlT+eSaLYHFav/tYxhM3OOYYLkGCvgPGZlc2gDpEfkAPPWe0KLplmvR0aQfzj0sCP+zwuQybzEazpE/R+1RcWsmT2gQ42/ryVza6VWHdzb2pUbQtXPumb//dQHx6Z/+JLOzW3ZgOZVYbon93Qb2Zeq/G
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:08:55.4411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c9650d-cc4e-4791-0f16-08df3ee8b845
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF0000003D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8708
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_210902_886256_1E9890CB 
X-CRM114-Status: GOOD (  16.93  )
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

Use guard() and scoped_guard() helpers for spinlock handling
instead of spin_lock/spin_unlock sequences.

This removes the need for explicit spin_unlock()

No functional change intended.

Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
---
 drivers/iio/adc/xilinx-xadc-core.c | 97 ++++++++++++++----------------
 1 file changed, 45 insertions(+), 52 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index eb63675464bb..ea874420b940 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -13,6 +13,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -180,19 +181,19 @@ static int xadc_zynq_write_adc_reg(struct xadc *xadc, unsigned int reg, u16 val)
 	u32 tmp;
 	int ret;
 
-	spin_lock_irq(&xadc->lock);
-	xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, XADC_ZYNQ_INT_DFIFO_GTH);
+	scoped_guard(spinlock_irq, &xadc->lock) {
+		xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, XADC_ZYNQ_INT_DFIFO_GTH);
 
-	reinit_completion(&xadc->completion);
+		reinit_completion(&xadc->completion);
 
-	cmd[0] = XADC_ZYNQ_CMD(XADC_ZYNQ_CMD_WRITE, reg, val);
-	xadc_zynq_write_fifo(xadc, cmd, ARRAY_SIZE(cmd));
-	xadc_read_reg(xadc, XADC_ZYNQ_REG_CFG, &tmp);
-	tmp &= ~XADC_ZYNQ_CFG_DFIFOTH_MASK;
-	xadc_write_reg(xadc, XADC_ZYNQ_REG_CFG, tmp);
+		cmd[0] = XADC_ZYNQ_CMD(XADC_ZYNQ_CMD_WRITE, reg, val);
+		xadc_zynq_write_fifo(xadc, cmd, ARRAY_SIZE(cmd));
+		xadc_read_reg(xadc, XADC_ZYNQ_REG_CFG, &tmp);
+		tmp &= ~XADC_ZYNQ_CFG_DFIFOTH_MASK;
+		xadc_write_reg(xadc, XADC_ZYNQ_REG_CFG, tmp);
 
-	xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, 0);
-	spin_unlock_irq(&xadc->lock);
+		xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, 0);
+	}
 
 	ret = wait_for_completion_interruptible_timeout(&xadc->completion, HZ);
 	if (ret == 0)
@@ -214,19 +215,20 @@ static int xadc_zynq_read_adc_reg(struct xadc *xadc, unsigned int reg, u16 *val)
 	cmd[0] = XADC_ZYNQ_CMD(XADC_ZYNQ_CMD_READ, reg, 0);
 	cmd[1] = XADC_ZYNQ_CMD(XADC_ZYNQ_CMD_NOP, 0, 0);
 
-	spin_lock_irq(&xadc->lock);
-	xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, XADC_ZYNQ_INT_DFIFO_GTH);
-	xadc_zynq_drain_fifo(xadc);
-	reinit_completion(&xadc->completion);
+	scoped_guard(spinlock_irq, &xadc->lock) {
+		xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, XADC_ZYNQ_INT_DFIFO_GTH);
+		xadc_zynq_drain_fifo(xadc);
+		reinit_completion(&xadc->completion);
 
-	xadc_zynq_write_fifo(xadc, cmd, ARRAY_SIZE(cmd));
-	xadc_read_reg(xadc, XADC_ZYNQ_REG_CFG, &tmp);
-	tmp &= ~XADC_ZYNQ_CFG_DFIFOTH_MASK;
-	tmp |= FIELD_PREP(XADC_ZYNQ_CFG_DFIFOTH_MASK, 1);
-	xadc_write_reg(xadc, XADC_ZYNQ_REG_CFG, tmp);
+		xadc_zynq_write_fifo(xadc, cmd, ARRAY_SIZE(cmd));
+		xadc_read_reg(xadc, XADC_ZYNQ_REG_CFG, &tmp);
+		tmp &= ~XADC_ZYNQ_CFG_DFIFOTH_MASK;
+		tmp |= FIELD_PREP(XADC_ZYNQ_CFG_DFIFOTH_MASK, 1);
+		xadc_write_reg(xadc, XADC_ZYNQ_REG_CFG, tmp);
+
+		xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, 0);
+	}
 
-	xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, 0);
-	spin_unlock_irq(&xadc->lock);
 	ret = wait_for_completion_interruptible_timeout(&xadc->completion, HZ);
 	if (ret == 0)
 		ret = -EIO;
@@ -263,21 +265,19 @@ static void xadc_zynq_unmask_worker(struct work_struct *work)
 
 	misc_sts &= XADC_ZYNQ_INT_ALARM_MASK;
 
-	spin_lock_irq(&xadc->lock);
+	scoped_guard(spinlock_irq, &xadc->lock) {
+		/* Clear those bits which are not active anymore */
+		unmask = (xadc->zynq_masked_alarm ^ misc_sts) & xadc->zynq_masked_alarm;
+		xadc->zynq_masked_alarm &= misc_sts;
 
-	/* Clear those bits which are not active anymore */
-	unmask = (xadc->zynq_masked_alarm ^ misc_sts) & xadc->zynq_masked_alarm;
-	xadc->zynq_masked_alarm &= misc_sts;
+		/* Also clear those which are masked out anyway */
+		xadc->zynq_masked_alarm &= ~xadc->zynq_intmask;
 
-	/* Also clear those which are masked out anyway */
-	xadc->zynq_masked_alarm &= ~xadc->zynq_intmask;
+		/* Clear the interrupts before we unmask them */
+		xadc_write_reg(xadc, XADC_ZYNQ_REG_INTSTS, unmask);
 
-	/* Clear the interrupts before we unmask them */
-	xadc_write_reg(xadc, XADC_ZYNQ_REG_INTSTS, unmask);
-
-	xadc_zynq_update_intmsk(xadc, 0, 0);
-
-	spin_unlock_irq(&xadc->lock);
+		xadc_zynq_update_intmsk(xadc, 0, 0);
+	}
 
 	/* if still pending some alarm re-trigger the timer */
 	if (xadc->zynq_masked_alarm) {
@@ -299,7 +299,7 @@ static irqreturn_t xadc_zynq_interrupt_handler(int irq, void *devid)
 	if (!status)
 		return IRQ_NONE;
 
-	spin_lock(&xadc->lock);
+	guard(spinlock)(&xadc->lock);
 
 	xadc_write_reg(xadc, XADC_ZYNQ_REG_INTSTS, status);
 
@@ -323,7 +323,6 @@ static irqreturn_t xadc_zynq_interrupt_handler(int irq, void *devid)
 		schedule_delayed_work(&xadc->zynq_unmask_work,
 				      msecs_to_jiffies(XADC_ZYNQ_UNMASK_TIMEOUT));
 	}
-	spin_unlock(&xadc->lock);
 
 	return IRQ_HANDLED;
 }
@@ -419,21 +418,18 @@ static unsigned long xadc_zynq_get_dclk_rate(struct xadc *xadc)
 
 static void xadc_zynq_update_alarm(struct xadc *xadc, unsigned int alarm)
 {
-	unsigned long flags;
 	u32 status;
 
 	/* Move OT to bit 7 */
 	alarm = ((alarm & 0x08) << 4) | ((alarm & 0xf0) >> 1) | (alarm & 0x07);
 
-	spin_lock_irqsave(&xadc->lock, flags);
+	guard(spinlock_irqsave)(&xadc->lock);
 
 	/* Clear previous interrupts if any. */
 	xadc_read_reg(xadc, XADC_ZYNQ_REG_INTSTS, &status);
 	xadc_write_reg(xadc, XADC_ZYNQ_REG_INTSTS, status & alarm);
 
 	xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_ALARM_MASK, ~alarm & XADC_ZYNQ_INT_ALARM_MASK);
-
-	spin_unlock_irqrestore(&xadc->lock, flags);
 }
 
 static const struct xadc_ops xadc_zynq_ops = {
@@ -518,7 +514,6 @@ static irqreturn_t xadc_axi_interrupt_handler(int irq, void *devid)
 
 static void xadc_axi_update_alarm(struct xadc *xadc, unsigned int alarm)
 {
-	unsigned long flags;
 	u32 val;
 
 	/*
@@ -529,12 +524,11 @@ static void xadc_axi_update_alarm(struct xadc *xadc, unsigned int alarm)
 	 */
 	alarm = ((alarm & 0x07) << 1) | ((alarm & 0x08) >> 3) | ((alarm & 0xf0) << 6);
 
-	spin_lock_irqsave(&xadc->lock, flags);
+	guard(spinlock_irqsave)(&xadc->lock);
 	xadc_read_reg(xadc, XADC_AXI_REG_IPIER, &val);
 	val &= ~XADC_AXI_INT_ALARM_MASK;
 	val |= alarm;
 	xadc_write_reg(xadc, XADC_AXI_REG_IPIER, val);
-	spin_unlock_irqrestore(&xadc->lock, flags);
 }
 
 static unsigned long xadc_axi_get_dclk(struct xadc *xadc)
@@ -677,7 +671,6 @@ static irqreturn_t xadc_trigger_handler(int irq, void *p)
 static int xadc_trigger_set_state(struct iio_trigger *trigger, bool state)
 {
 	struct xadc *xadc = iio_trigger_get_drvdata(trigger);
-	unsigned long flags;
 	unsigned int convst;
 	unsigned int val;
 	int ret = 0;
@@ -703,15 +696,15 @@ static int xadc_trigger_set_state(struct iio_trigger *trigger, bool state)
 		xadc->trigger = NULL;
 	}
 
-	spin_lock_irqsave(&xadc->lock, flags);
-	xadc_read_reg(xadc, XADC_AXI_REG_IPIER, &val);
-	xadc_write_reg(xadc, XADC_AXI_REG_IPISR, XADC_AXI_INT_EOS);
-	if (state)
-		val |= XADC_AXI_INT_EOS;
-	else
-		val &= ~XADC_AXI_INT_EOS;
-	xadc_write_reg(xadc, XADC_AXI_REG_IPIER, val);
-	spin_unlock_irqrestore(&xadc->lock, flags);
+	scoped_guard(spinlock_irqsave, &xadc->lock) {
+		xadc_read_reg(xadc, XADC_AXI_REG_IPIER, &val);
+		xadc_write_reg(xadc, XADC_AXI_REG_IPISR, XADC_AXI_INT_EOS);
+		if (state)
+			val |= XADC_AXI_INT_EOS;
+		else
+			val &= ~XADC_AXI_INT_EOS;
+		xadc_write_reg(xadc, XADC_AXI_REG_IPIER, val);
+	}
 
 err_out:
 	mutex_unlock(&xadc->mutex);
-- 
2.34.1


