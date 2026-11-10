Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D744860A2639
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s76zvQxh;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UYosBiAr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s6+81S1BaYsAxRgs8WUywsXSi47VNCVV18WCTJLe9Ro=; b=s76zvQxhJFSJ3SwaZf+UFrJ+vZ
	8NrDsvzHLqpfCE3ia+X79uvzKrCaDjbScUk0Q+tydMicooNmjqTC95OOUc1dcHCVQYHa18zYgtxwl
	w+uJ2BOoNHpOJYBEPMU/s7LSlWqTtcrTos3+BqSMNNjlJW78T0cxWfG/954m/WIO7MMbUIHLTsSVk
	Rzpn1rCQlwuoH3PUe0WVOKI88V9ikxpPi71Yiti+gHuxB/nSd0IedV2OH+Hpr3wFgFsCbPhXJO1yM
	n4we1xFjygi1aNncBq2kV8UePlIRBM6i5snIQY1TOAzAQdH490ZP8ko3sYM5h7lNSVlTwI6pbSduC
	XeUcO25w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe6R-00000002U95-2cPU;
	Tue, 10 Nov 2026 05:09:03 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe6O-00000002U5p-1Uo0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:09:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cx9pscLtXAKpmodPTcdAfJTca4X5P9pi7ezlx2Q3D44us5kYLBXWagnV8ZSM2g4vlP3MYEn8ADvSwMQ+whv2B+ipQqL5/pT1UDRFOJPnNYLvYgxjdx40S6VVxYOq4XbO14BVCydWOz/fEJwNz6GuUdIlh4cvKql4c7VhDxT6aFaVLAiGde65LTFhIlE7Hqh/xSlcMEL5nn0ufJXGyCyLV3zvh0U4sx1v5AKoFr8JDGe2PtJ0Bb81uTg2zbRpjPYeFSnoGPb3NoxMEsizIMhdIwVuoc0DYr236G6NiGc5arAMMxjpKvGEZFPSWUsqRkMDDXzWVHmzQo6ORxxn8hfHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6+81S1BaYsAxRgs8WUywsXSi47VNCVV18WCTJLe9Ro=;
 b=efkP1Ph5WgNL+ddD7AGJt3Sp9c/hlN2ta8jX9BRuSL56Abn6RhLGEkuDUnnELXgh56G2yKFb58nROQ/N0/d4YZQ3JdNgudvPaY9e/oq9QlzehWgXZtizYUk5uSJSZE5smK/PtCSebAyRKdLnh7m0u9AtEkNWW8TfLlAlkTsz7x+jGjAeatClGMkyGGgu8noZykVtMaUnRLCvZDLsy7bgrY0FxPNmE2cskaFk8LECj6SMRM5obvmpH5r2Detu+JH4F13FbjrEknYfvkX/jzS7XI9VfeQZovTBnChLsxwvklWwi9cnPqPOOq5WzTbOKqxUIqUdfg0gCcriOaXgQwpK5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6+81S1BaYsAxRgs8WUywsXSi47VNCVV18WCTJLe9Ro=;
 b=UYosBiArLlyQq/X4SQKhwk6hZcRx1ktdcX8pSrpjdMDrqzkba8SFCJu7CwCUNJ5hgCTrTldE3uPhUaeMcugxtzwvRodjWD2f5U8t01BQf0S/HGL8Vvs/rsNljc3GrIn1qCalYQk93rUELhL4uhh34hheI1s0WS8NBG+QD0Rt3kE=
Received: from MN0P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::20)
 by SA3PR12MB7976.namprd12.prod.outlook.com (2603:10b6:806:312::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 05:08:53 +0000
Received: from IA0PEPF00000038.namprd03.prod.outlook.com
 (2603:10b6:208:52a:cafe::55) by MN0P221CA0029.outlook.office365.com
 (2603:10b6:208:52a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 05:08:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF00000038.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 05:08:48 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 23:08:46 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 23:08:45 -0600
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 23:08:42 -0600
From: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Dileep Kumar Nagavarapu
	<dileepkumar.nagavarapu@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v5 04/16] iio: adc: xilinx-xadc: Drop unnecessary masking and dead code
Date: Tue, 10 Nov 2026 10:31:49 +0530
Message-ID: <20261110050201.1850399-5-dileepkumar.nagavarapu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000038:EE_|SA3PR12MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f7df88-7d07-4ef3-12c4-08df3ee8b409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|261028144727099003|11063799006|261021123027099003|56012099006|261021121427099003|261022075727099003|261009223027099003|261022105027099003|261026140227099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JQxwIKaARU+/II4aixHfbWaTMEvGb1KIcck8y81jwXV013q67K0ELi+A4uLIsjwhEuQyno5tACT/xYMTjwAQaQT5MK6H1i16I3Kei28EtHaYeEB9D2Sp5JFMxAWagI9+52lO1tt/bxGw34aV7a/EUXkV/D0z+qepuSyadcOd5oab7ZTNXGQr0d8qyLm++blvJAvfacWRIjyDe/3+Pz7HPWidc2STxkJHuPFWJPsE1exV6IVM4AcX+EyVribPbSZ6Z3ZbVk0+xQakrm6OTsNhXQfteY/wE3Arl1BvgRNepCi31DPTXUHb4w3o5NQjhRq/3rFLU747VtHnkuu0c6SjP4y8sbld4WwStGajs3+2QgBzV3XmNiVq/nZohXx2XSsiQeSRLIg4elQtdX1q3o/glNh7hrSRL25ZKi1CzbniecF7nCiG/nb4AJA9LPLm5+T3vS+xsUT8tWnqfwAjSap80IxY6CV7j2DJVzIjwJutEBXOsYkKKfmFWWHUQ404RMYiR/S+qHcXQyrT2zONWJMTd0italeznXR3TyH4MixOZFvWmtaYVZFXCqEF7yC2EgxGIvPRvcn574f1RPw6aCn/HxymxvtbFWAkYqg/WHjgOBOwVLjsbfG9MxIFind8ekrJBNBH41UzIe4LIe/zBcxl1ACavk6gpeucKyjLrFZgogf/ByjxEeMnOr4tIUcDITvnbZRVeansdwdLMMrJLamWBQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(261028144727099003)(11063799006)(261021123027099003)(56012099006)(261021121427099003)(261022075727099003)(261009223027099003)(261022105027099003)(261026140227099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gV7qRQgDW2JXXSABO9Hyko/5KG1xoZfo5eTpWQwVmonmD3Bnikb/GNzuPK8/dSNIEkoIEeJtCiR0LABY+GhyC+lMlHxMLWTCJDjrD9kKhKZrp8PbeLCKvLvwAvt8xzu8Y7CWmBY6w+BnbkamgvxbNcpWfgEGRAGsUjPVWJSF7PSpU3HfvGbagTCRX2sW0FezJP718PGkylUe6po1+lJFXlIpPBdj4vwbosAFK2wF/lczEt8Bsp5cBXb46hF+YT72w/lX9OE19LEAR2InDXmHRncBi9Y1XBt3525WwOOJcDWBvq7qsb30qd2oqCki56VDGat7nMyH7ugj20ZC4vXMUrtkzLG6i5eva5nggKr8eJyUAwTApQTm12aHKYMBVdtKU5ERr/Q2Rq1pK5yDGPd0CMlBX6yl71pExsksMguKgwd5UnRnutxqVwT0L5e3lTZI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:08:48.3392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f7df88-7d07-4ef3-12c4-08df3ee8b409
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000038.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_210900_400759_9960319B 
X-CRM114-Status: GOOD (  10.91  )
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

Remove a no-operation bitwise-OR with zero (dead code) and the redundant
16-bit masking when storing values into u16 destinations, where the
mask has no effect.

No functional change intended.

Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
---
 drivers/iio/adc/xilinx-xadc-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index e9d5b7ebdccf..66c6f3319ca0 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -182,7 +182,6 @@ static int xadc_zynq_write_adc_reg(struct xadc *xadc, unsigned int reg, u16 val)
 	xadc_zynq_write_fifo(xadc, cmd, ARRAY_SIZE(cmd));
 	xadc_read_reg(xadc, XADC_ZYNQ_REG_CFG, &tmp);
 	tmp &= ~XADC_ZYNQ_CFG_DFIFOTH_MASK;
-	tmp |= 0 << XADC_ZYNQ_CFG_DFIFOTH_OFFSET;
 	xadc_write_reg(xadc, XADC_ZYNQ_REG_CFG, tmp);
 
 	xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, 0);
@@ -230,7 +229,7 @@ static int xadc_zynq_read_adc_reg(struct xadc *xadc, unsigned int reg, u16 *val)
 	xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &resp);
 	xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &resp);
 
-	*val = resp & 0xffff;
+	*val = resp;
 
 	return 0;
 }
@@ -452,7 +451,7 @@ static int xadc_axi_read_adc_reg(struct xadc *xadc, unsigned int reg, u16 *val)
 	u32 val32;
 
 	xadc_read_reg(xadc, xadc_axi_reg_offsets[xadc->ops->type] + reg * 4, &val32);
-	*val = val32 & 0xffff;
+	*val = val32;
 
 	return 0;
 }
-- 
2.34.1


