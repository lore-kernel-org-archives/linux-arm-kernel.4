Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47D9606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DjjRvKs5;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lI8xrYSJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oY872wyj7/HKGNDNC/yPBneFdOIWuaON5Yf1YCUy1xA=; b=DjjRvKs5271hEM686Iyvjg1sYF
	Wew9QlCLv4OxqCe+c1HxXVoE0cRVlPfNQFtPYLKWEosWm6DOVtf6IhZzETU1tE9gLLx4He7HCw0Dm
	Ti+91zatFFyVy6z16zr9IqlB2np8/OT4uA0p41N8DxgM32KkXwG7WfSQXFnp3rF1J5EGzu+z7CPip
	LIdXv22el6nMiwv2elEwt2820HrTiZjQpresDfVf9xAMp04XPtcW9epaD9QRRGmKWHVpj95OYOgur
	7v+C13uXdzq7sB3gdOnM1HB7rtlKc6AwddoBE5zjAmusJUKti9sO0QTZGpGukgNADMMmc6myH9VNp
	W4MvPlqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGYU-0000000AgaU-11XA;
	Wed, 25 Nov 2026 17:13:14 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGX2-0000000AfmB-3UVr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoU9WdZeBP1rXIhWLmGP6DKe4+L+IDRXx6GtBMmMDarOkXf1vcCay2STslrXwrF62jxFh1iEh7m2VyFb0+jEXnnWHS1wCvPZdi16i4z58ByoFa8lYqjfnlXlEtiLQWXIGGH8UM17LVnRz17+a7usWePMCSQU8Q6VQX6PMe+H2yXcpqUyBDjEdAYtxgcIAYDtofIfhjxyz4MYMXnr/EWLWcDZm+2HVzqx04ng5fynHeG8rvmLVtOybonDj+u0cYmO/1vRvwCUBRGAyjewFeBO/SuyW/EBj/85JjlbXo3tBfCnReaCXwz1ooSJa4X+hZ4o3uHUj4enPqzzz0f7SQW5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oY872wyj7/HKGNDNC/yPBneFdOIWuaON5Yf1YCUy1xA=;
 b=BSWRCqIbuy/eJyHIcMSJ2q3WH7GOMbWMIV+Mul8tF1p08l56TI7I863v+ovtSb/xW/1e+SWS+HmjG0PYnMGAbb2bSkdbygHcGdpshEg/49D7YqZ9AwHH6qAAtKcjhSsT0kvyf6XTFmaQOCs3vWGP3Dn47J1Lo77VhSQRzInJCq4dOqrBNlUv1g02Vq/zkqhd6DAC1ITWlbzYQLgnMygeXM1NgkUNRPXX58rrZSnKq4080gy365Uw2uU8iknaQCnsU61bXxU85g0uL3NMgyd7TZlNUJkZv0ya91kx3qgdiKqGX01kR+TdAb8sMdwkFeiPXCamhMdHgHjoT6d8oerDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oY872wyj7/HKGNDNC/yPBneFdOIWuaON5Yf1YCUy1xA=;
 b=lI8xrYSJ6wZZMVzxXOSulfFdyu3wf87sTvVtoEB+dTOUb6iXdZn2HydbeFiBO4qYJpZFncilj37hmKfn2YV9N/7ML59kyHr6M/YPd1FE7E3IktVDRdQOwx9ZxHChgY6uPQ6020RJKkdUyVWNrGt49hqbGpS/99hhLcczGzyOqlU=
Received: from PH7P220CA0106.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::7)
 by DSVPR12MB803185.namprd12.prod.outlook.com (2603:10b6:8:3ea::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 17:11:39 +0000
Received: from BY1PEPF00026968.namprd05.prod.outlook.com
 (2603:10b6:510:32d::4) by PH7P220CA0106.outlook.office365.com
 (2603:10b6:510:32d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 17:11:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026968.mail.protection.outlook.com (10.167.244.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 17:11:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 11:11:34 -0600
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 11:11:31 -0600
From: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Dileep Kumar Nagavarapu
	<dileepkumar.nagavarapu@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v6 10/16] iio: adc: xilinx-xadc: Add unit suffixes to macro names
Date: Wed, 25 Nov 2026 22:40:24 +0530
Message-ID: <20261125171045.1246381-11-dileepkumar.nagavarapu@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261125171045.1246381-1-dileepkumar.nagavarapu@amd.com>
References: <20261125171045.1246381-1-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026968:EE_|DSVPR12MB803185:EE_
X-MS-Office365-Filtering-Correlation-Id: c26050d2-85ff-4a3f-5cb8-08df4b172b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|261026121527099003|261102123227099003|261022075727099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|10067099003|11063799006|56012099006|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: f+rVPr4R9e8Tz7MvmjJ5rbax938HVBPayLI0UVfSoOCa+30oJ0+C3EjA636mApDL1x25RcUzLqdaGAUtqRKOiJgX3dvuoj5JrWKHIENtiVm2mjyXb62k0+27AkaKCvEqESC1sMjy1V9TN/HEKkHgpY2WBn/LFVZWNNjFGk8FDBYEB2+cPVj/BGzbekMhWU2X2I2ubp017pINEq//Heyry7fgXk0u7VKy6WIrdxNvW3T3J6f0u6Ae0REMY+HpN1jPZo5sLg6S1E638EXOt6uDJpWa3K9ioFAfO+hQ2TPsN/Ac0WSxR20PNvlvqXnL7PHNAbrs/m0xjBmco0mkpVDhIfqU+xou0z/aD7hat1s4lZ6m6w10ERzxr3emtE4fpymSe0kQSHzPBywikLruukDpCmBQ+cR+FOMcza2Dko4DI0AcEHGVZq55U33EhCCLhpj/rOUxqO7o+pgLzQ+QzIJUDF9svxBc5rfgnqKyTwA72VCGLok22UzTWGwsazoUpl7jRUgibzHc+dlpDMSdT6CfKsd3lSqu9OCo42gnWiIiIlm8HUgP4ENFtLLJMhgEaJ1cb6AHCEYzQws6PSV2smMl2vKWryFlQEDjWaAWs8jfpA/EkixdG9vm1TytgeNPGnRgXiD/vyBx0/+sFiHwZKF23ZiPMdzPc2G0Ki8LwKTn2iL19VzkzdTtGicqndSMjYHiESZ5Ndr54bJBV1O19HG9Sg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(261026121527099003)(261102123227099003)(261022075727099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(10067099003)(11063799006)(56012099006)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8RxSSo6pmRvoDbhRcCQH1wyNrlAlZ/Fvuq/9MAxF5cZoK/ZxYDmWwwZuZizzg+0L7co+/8uT9pLDYaasW9V+8xDyRSrfGHffXru5AHZbKs1USM2Fr3VtiXYu4oB0WSvJ/YikWxOXPHHirC289FVxZXZl39N4thsA63THwJDF4Gw3Ra/w9DGDwn4JhHVg7i2PvKHjeI2nKpvIUGF99R9tukuii+8mQxgbrrPwSyf2yJVNSYytZ7zrX7YtBj2lT1KUVSMGqgWu0AhimPHmzGmS2k58nd3NplGUwJbK8jeyvW79qdXQa6RfjUGJVM8+fMAmq0cN/hQ8ibYAtaKI+RunJGC2b0/Px/Ro9uAELeP1Iaf7xznVfsAnjF0QRqbK3zpgmGfpdD1Qvrd3cVCfYJ9SfwNYPT5DmdtmJG2tpiLiOvA+cqL3HglSTw+vZNW79/Qz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:11:39.2863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c26050d2-85ff-4a3f-5cb8-08df4b172b61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF00026968.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB803185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_091146_931598_D97196CE 
X-CRM114-Status: GOOD (  19.67  )
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

Append the unit to the relevant macro names (_Hz, _MS, _CYCLES, _SPS)
so that the expected unit of each value is clear at the point of use
and to avoid ambiguity.

No functional change intended

Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
---
 drivers/iio/adc/xilinx-xadc-core.c | 37 +++++++++++++++---------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index 8801bbc7431c..813caf66b11a 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -27,6 +27,7 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <linux/iio/buffer.h>
 #include <linux/iio/events.h>
@@ -38,7 +39,7 @@
 
 #include "xilinx-xadc.h"
 
-static const unsigned int XADC_ZYNQ_UNMASK_TIMEOUT = 500;
+static const unsigned int XADC_ZYNQ_UNMASK_TIMEOUT_MS = 500;
 
 /* ZYNQ register definitions */
 #define XADC_ZYNQ_REG_CFG	0x00
@@ -120,7 +121,7 @@ static const unsigned int XADC_ZYNQ_UNMASK_TIMEOUT = 500;
  * limits the maximum samplerate 150kSPS. At this rate the CPU is fairly busy,
  * but still responsive.
  */
-#define XADC_MAX_SAMPLERATE 150000
+#define XADC_MAX_SAMPLERATE_SPS (150 * KILO)
 
 static void xadc_write_reg(struct xadc *xadc, unsigned int reg, u32 val)
 {
@@ -276,7 +277,7 @@ static void xadc_zynq_unmask_worker(struct work_struct *work)
 	/* if still pending some alarm re-trigger the timer */
 	if (xadc->zynq_masked_alarm) {
 		schedule_delayed_work(&xadc->zynq_unmask_work,
-				      msecs_to_jiffies(XADC_ZYNQ_UNMASK_TIMEOUT));
+				      msecs_to_jiffies(XADC_ZYNQ_UNMASK_TIMEOUT_MS));
 	}
 }
 
@@ -315,15 +316,15 @@ static irqreturn_t xadc_zynq_interrupt_handler(int irq, void *devid)
 
 		/* unmask the required interrupts in timer. */
 		schedule_delayed_work(&xadc->zynq_unmask_work,
-				      msecs_to_jiffies(XADC_ZYNQ_UNMASK_TIMEOUT));
+				      msecs_to_jiffies(XADC_ZYNQ_UNMASK_TIMEOUT_MS));
 	}
 
 	return IRQ_HANDLED;
 }
 
-#define XADC_ZYNQ_TCK_RATE_MAX 50000000
-#define XADC_ZYNQ_IGAP_DEFAULT 20
-#define XADC_ZYNQ_PCAP_RATE_MAX 200000000
+#define XADC_ZYNQ_TCK_RATE_MAX_Hz	(50 * HZ_PER_MHZ)
+#define XADC_ZYNQ_IGAP_DEFAULT_CYCLES	20
+#define XADC_ZYNQ_PCAP_RATE_MAX_Hz	(200 * HZ_PER_MHZ)
 
 static int xadc_zynq_setup(struct platform_device *pdev, struct iio_dev *indio_dev, int irq)
 {
@@ -336,8 +337,8 @@ static int xadc_zynq_setup(struct platform_device *pdev, struct iio_dev *indio_d
 	int ret;
 
 	/* TODO: Figure out how to make igap and tck_rate configurable */
-	igap = XADC_ZYNQ_IGAP_DEFAULT;
-	tck_rate = XADC_ZYNQ_TCK_RATE_MAX;
+	igap = XADC_ZYNQ_IGAP_DEFAULT_CYCLES;
+	tck_rate = XADC_ZYNQ_TCK_RATE_MAX_Hz;
 
 	xadc->zynq_intmask = ~0;
 
@@ -345,8 +346,8 @@ static int xadc_zynq_setup(struct platform_device *pdev, struct iio_dev *indio_d
 	if (!pcap_rate)
 		return -EINVAL;
 
-	if (pcap_rate > XADC_ZYNQ_PCAP_RATE_MAX) {
-		ret = clk_set_rate(xadc->clk, (unsigned long)XADC_ZYNQ_PCAP_RATE_MAX);
+	if (pcap_rate > XADC_ZYNQ_PCAP_RATE_MAX_Hz) {
+		ret = clk_set_rate(xadc->clk, (unsigned long)XADC_ZYNQ_PCAP_RATE_MAX_Hz);
 		if (ret)
 			return ret;
 	}
@@ -355,7 +356,7 @@ static int xadc_zynq_setup(struct platform_device *pdev, struct iio_dev *indio_d
 		div = 2;
 	} else {
 		div = pcap_rate / tck_rate;
-		if (pcap_rate / div > XADC_ZYNQ_TCK_RATE_MAX)
+		if (pcap_rate / div > XADC_ZYNQ_TCK_RATE_MAX_Hz)
 			div++;
 	}
 
@@ -376,7 +377,7 @@ static int xadc_zynq_setup(struct platform_device *pdev, struct iio_dev *indio_d
 		       XADC_ZYNQ_CFG_REDGE | FIELD_PREP(XADC_ZYNQ_CFG_TCKRATE_MASK, tck_div) |
 		       FIELD_PREP(XADC_ZYNQ_CFG_IGAP_MASK, igap));
 
-	if (pcap_rate > XADC_ZYNQ_PCAP_RATE_MAX) {
+	if (pcap_rate > XADC_ZYNQ_PCAP_RATE_MAX_Hz) {
 		ret = clk_set_rate(xadc->clk, pcap_rate);
 		if (ret)
 			return ret;
@@ -952,8 +953,8 @@ static int xadc_write_samplerate(struct xadc *xadc, int val)
 		return -EINVAL;
 
 	/* Max. 150 kSPS */
-	if (val > XADC_MAX_SAMPLERATE)
-		val = XADC_MAX_SAMPLERATE;
+	if (val > XADC_MAX_SAMPLERATE_SPS)
+		val = XADC_MAX_SAMPLERATE_SPS;
 
 	val *= 26;
 
@@ -966,7 +967,7 @@ static int xadc_write_samplerate(struct xadc *xadc, int val)
 	 * limit.
 	 */
 	div = clk_rate / val;
-	if (clk_rate / div / 26 > XADC_MAX_SAMPLERATE)
+	if (clk_rate / div > 26 * XADC_MAX_SAMPLERATE_SPS)
 		div++;
 	if (div < 2)
 		div = 2;
@@ -1343,8 +1344,8 @@ static int xadc_probe(struct platform_device *pdev)
 		if (ret < 0)
 			return ret;
 
-		if (ret > XADC_MAX_SAMPLERATE) {
-			ret = xadc_write_samplerate(xadc, XADC_MAX_SAMPLERATE);
+		if (ret > XADC_MAX_SAMPLERATE_SPS) {
+			ret = xadc_write_samplerate(xadc, XADC_MAX_SAMPLERATE_SPS);
 			if (ret < 0)
 				return ret;
 		}
-- 
2.34.1


