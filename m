Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794D360A3817
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dhx0S/yS;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=DuX4hILD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VMU9qIvj2jTIoxzbXaerfZLGIliMto3pgTE1jGY+PEw=; b=dhx0S/ySPqAqsVGY8CUYlnCJeS
	MKChIbmfNhnIHGRH6LM3MEx7SKlZCftGMAYWGoWUQ1iul78NimrrqTvceK0oZPIePAnzECfA9QUUq
	pNAS/sX2jWE7h0u+mDG2B5RXlh1uWVo1EwZY+sbKYgw3r31lWmIzDbig9QPgO8CBBoebnIdxHCZ4r
	F5yVgkLhEKaPnrN8ijR2aMDMS10nldsujOrgQU9SlJxearmnDFotNEQsSBnR2UPsXm/2vxPPcoZ1e
	bWeK8i02yBe/QoY9ojiS5EtJU8KfpK+eH+/1qrOArIKa9/+PxtcFjpPATFTbZ0gOVkaQnokOlskgy
	EarQ4t6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe77-00000002Uwu-19cu;
	Tue, 10 Nov 2026 05:09:45 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe6w-00000002Uic-22L9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:09:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxbELPwWKdCuTErVGDNihiCoi19JjkkPTFAAWxJQJJQun6QLzLkFG2Ce/aMYSyA1q7DSZSCpgVM4MzL+cSm2SzbGg2oIFfadUVzR9rIw5UlqVSFk55fwpcIQu6/RzIzH7Pp9Keg5eRUi1Mbbjvm8wtpN5Ee+c/xkTtAYNcTj8JNwCiv+GVA3MpvkV8wmPZ/mtb7KszVTJu4t9VlJDJsf6mzBmwGyuV6P7OMu9yRwOlb8LtMiCVUxUTsJssUiM71wLGMtyY2BVWaqsTowy7H+UmnTtZfgKWco4B/221VBqKz5xpBeidKhfQilR8IbKrNDwvUtKXnqLSN2S0OzPf5ZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMU9qIvj2jTIoxzbXaerfZLGIliMto3pgTE1jGY+PEw=;
 b=hNqlFViSDqrCCbUQblKNN9EK/fSiIT5aNPC4XBTu2SPh9IcSfiWw/19ChQ2GmWnxO9NRPQ/NpU+GiEllUSO4b1FuY3JNphs8eBGPWAWDzLDoOPfvclZJ+jXraNFw5k1qvNaHGORAQB0/5HUTxVXKR5VR2qfSUMyXvej5sJKDReQ9bAX+6pAKb4+/571FniBop/7766UuIxXP5fBpWQrnpZFecQxUp+1FKKvq0qVQgGV2fmbONxWQ4GU7DyC4Kz4ncg5LnA7bVt3cvRSctDS1MUo49TeHhDsf0aeEfVaXRM57fgCQvHDZ/F+xjMvBAUY/xnUHINEjPOnMT0TG2Uk13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMU9qIvj2jTIoxzbXaerfZLGIliMto3pgTE1jGY+PEw=;
 b=DuX4hILDim2i8kkAIUcN1kcjnC3XXjlONPzBLVew90A6Odra4dLVb9n8z+jz5SS/AzIItRWVzJb2fWDUOVB3QfOMJuRZfJa9pdqy9CcD3UOAtdrQZc3vUpYhM7KszfSKpKpgIMigw5NDfz8BiAGlJLKkm0ep5ZLLJApJg2fq5t4=
Received: from PH7PR03CA0004.namprd03.prod.outlook.com (2603:10b6:510:339::30)
 by LV8PR12MB9692.namprd12.prod.outlook.com (2603:10b6:408:295::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:09:29 +0000
Received: from BY1PEPF00026959.namprd05.prod.outlook.com
 (2603:10b6:510:339:cafe::26) by PH7PR03CA0004.outlook.office365.com
 (2603:10b6:510:339::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 05:09:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026959.mail.protection.outlook.com (10.167.244.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 05:09:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 23:09:25 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 23:09:24 -0600
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 23:09:21 -0600
From: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Dileep Kumar Nagavarapu
	<dileepkumar.nagavarapu@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v5 15/16] iio: adc: xilinx-xadc: Add .setup_channels() to struct xadc_ops
Date: Tue, 10 Nov 2026 10:32:00 +0530
Message-ID: <20261110050201.1850399-16-dileepkumar.nagavarapu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026959:EE_|LV8PR12MB9692:EE_
X-MS-Office365-Filtering-Correlation-Id: 277fd3a6-369f-4231-b784-08df3ee8cc13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|18002099003|22082099003|10067099003|11063799006|56012099006|261028144727099003|261102123227099003|261102130727099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261009223027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: qgBaqB/3bnLGCobg/rQoDhCuoGTyrqf0uTGbnfIubaNeJ+mHcStWFykmjl2xr9J2kPRZjPSVkCubVLgaKbEyW66QwblKYhPtn2kjX6S7UBf+Q7v3J9wWuRKiD9J4hVRCgprmN+aMrJAnHfW053pCPmeywxX/PO/5/0yvd12pCyk6pO0rCqe2RQAuIAdCoJPXh1pk6eX2VdL5A23skkwQy5z2opeZ7u1LmDxKwlPKMgd/LQlIjNCSYJiDMO+VguvXLvEmP/BGpoSo0Z1IoKGsxvNMa+xXyBDot5aRBXH4cUg7Mvqy2skQc3NDUxu0qUxQsjj1JGUD+JEix3HNvIYcz6ZJZPx9lh2H6r/kM8YEGSpe9sRMOOqmEgdvVC+1LOcG+WEMg2KQ3bLEdGK4hqk9YkXXms7HKNiLd0tXXASTybrfFepDcbvEdTSdfb41ydU8XhtCYl6IvE0ptLLoiLP3xCY60hDN2ue6oShZExCadUlyUGAzlsvwTI7Okhdq9dObD7xVtvfYUrFIohFYm96upaT9wUEYaifWB+QK94MxGIEA0X22rSggiyvrEamiePcXyJCHwkEF5NqfJ3dza6qTszxQ7gxesSoILq6wT/qtQllWCC72Ll+Hmtz5qPxkQFW6xHRKDAVgOSAdmHi3tm0Qw0LO7Bi3Iv6a2KMl/142AjQ1aL1Z/+c6lvojdxUhaBVuSacPjtvqvWoGKKPGf0N8ig==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261102130727099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261009223027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LbehXoEorfGQcXi7VoaxR6PEyUJKA3fXX8EwAETsPg22C3XXaOMHEfcoG8eD1q2XCJfAEFrJb6qXC+cEQr3WmFWdGuVnCYkUJxjZ9cguuABMZ8wNQ1Diro1NFkwu9UIxochMGmt1qepx4ipKx+fCgvJxhQWQjFurcHfXVKGtEr1XQfJldRAHU3u/T3Qchb5ijVLpaf+KJ0t9ZZ0Zyc0t0TKE2lW7Lv2k6wTR/1AMTogQrFxsodPYwqsXc1c/65Q4d6EALlcaRChspv0CrrQ7v0u0nEqKRG3vk0YITPjncMB1xcNO2U6FgHj3qDUUT3s7Aiqc+iz+S1zn69GTMt2ISZY5Z1Bx9+Co5nKTr1R/FgK7l7WKJeJDw4FCdcXgapIX6+aBrgW1v06RvYegO5euEPhZqrsPJgpH51aEuTcyXDKvoMXhWVQngIHxZpWO3jmT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:09:28.6037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 277fd3a6-369f-4231-b784-08df3ee8cc13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF00026959.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9692
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_210934_585093_DAA805B6 
X-CRM114-Status: GOOD (  16.67  )
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

Add .setup_channels() function pointer to struct xadc_ops to enable
different interfaces to have custom channel setup logic.

Export xadc_parse_dt() as it will be used by the I2C interface
support added later in this series. This avoids duplicating
the devicetree parsing logic across interface files.

Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
---
 drivers/iio/adc/xilinx-xadc-core.c     | 6 ++++--
 drivers/iio/adc/xilinx-xadc-platform.c | 3 +++
 drivers/iio/adc/xilinx-xadc.h          | 2 ++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index e92d21efe3c1..24b2a8118daa 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -656,7 +656,7 @@ static const struct iio_info xadc_info = {
 	.update_scan_mode = &xadc_update_scan_mode,
 };
 
-static int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq)
+int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq)
 {
 	struct device *dev = indio_dev->dev.parent;
 	struct xadc *xadc = iio_priv(indio_dev);
@@ -762,6 +762,7 @@ static int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(xadc_parse_dt, "IIO_XADC");
 
 static const char *const xadc_type_names[] = {
 	[XADC_TYPE_S7] = "xadc",
@@ -787,9 +788,10 @@ EXPORT_SYMBOL_NS_GPL(xadc_device_setup, "IIO_XADC");
 int xadc_device_configure(struct iio_dev *indio_dev, int irq,
 			  unsigned int *conf0, unsigned int *bipolar_mask)
 {
+	struct xadc *xadc = iio_priv(indio_dev);
 	int ret;
 
-	ret = xadc_parse_dt(indio_dev, conf0, irq);
+	ret = xadc->ops->setup_channels(indio_dev, conf0, irq);
 	if (ret)
 		return ret;
 
diff --git a/drivers/iio/adc/xilinx-xadc-platform.c b/drivers/iio/adc/xilinx-xadc-platform.c
index 68610c0ffa43..f3e44f768656 100644
--- a/drivers/iio/adc/xilinx-xadc-platform.c
+++ b/drivers/iio/adc/xilinx-xadc-platform.c
@@ -412,6 +412,7 @@ static const struct xadc_ops xadc_zynq_ops = {
 	.get_dclk_rate = xadc_zynq_get_dclk_rate,
 	.interrupt_handler = xadc_zynq_interrupt_handler,
 	.update_alarm = xadc_zynq_update_alarm,
+	.setup_channels = xadc_parse_dt,
 	.type = XADC_TYPE_S7,
 	/* Temp in C = (val * 503.975) / 2**bits - 273.15 */
 	.temp_scale = 503975,
@@ -516,6 +517,7 @@ static const struct xadc_ops xadc_7s_axi_ops = {
 	.get_dclk_rate = xadc_axi_get_dclk,
 	.update_alarm = xadc_axi_update_alarm,
 	.interrupt_handler = xadc_axi_interrupt_handler,
+	.setup_channels = xadc_parse_dt,
 	.flags = XADC_FLAGS_BUFFERED | XADC_FLAGS_IRQ_OPTIONAL,
 	.type = XADC_TYPE_S7,
 	/* Temp in C = (val * 503.975) / 2**bits - 273.15 */
@@ -530,6 +532,7 @@ static const struct xadc_ops xadc_us_axi_ops = {
 	.get_dclk_rate = xadc_axi_get_dclk,
 	.update_alarm = xadc_axi_update_alarm,
 	.interrupt_handler = xadc_axi_interrupt_handler,
+	.setup_channels = xadc_parse_dt,
 	.flags = XADC_FLAGS_BUFFERED | XADC_FLAGS_IRQ_OPTIONAL,
 	.type = XADC_TYPE_US,
 	/**
diff --git a/drivers/iio/adc/xilinx-xadc.h b/drivers/iio/adc/xilinx-xadc.h
index c70cb6a77d2e..e52e90a22a67 100644
--- a/drivers/iio/adc/xilinx-xadc.h
+++ b/drivers/iio/adc/xilinx-xadc.h
@@ -80,6 +80,7 @@ struct xadc_ops {
 	void (*update_alarm)(struct xadc *xadc, unsigned int alarm);
 	unsigned long (*get_dclk_rate)(struct xadc *xadc);
 	irqreturn_t (*interrupt_handler)(int irq, void *devid);
+	int (*setup_channels)(struct iio_dev *indio_dev, unsigned int *conf, int irq);
 
 	unsigned int flags;
 	enum xadc_type type;
@@ -225,6 +226,7 @@ static inline int xadc_write_adc_reg(struct xadc *xadc, unsigned int reg, u16 va
 void xadc_write_reg(struct xadc *xadc, unsigned int reg, u32 val);
 void xadc_read_reg(struct xadc *xadc, unsigned int reg, u32 *val);
 struct iio_dev *xadc_device_setup(struct device *dev, int size, enum xadc_type type);
+int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq);
 int xadc_device_configure(struct iio_dev *indio_dev,
 			  int irq, unsigned int *conf0, unsigned int *bipolar_mask);
 int xadc_read_samplerate(struct xadc *xadc);
-- 
2.34.1


