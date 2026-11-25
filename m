Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D10D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DuKYpd+I;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3UC599To
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yJ2j5NdDqJAiNNA8dEfseYaSacA3lkAqSPeDNuVrIho=; b=DuKYpd+IG8jR1iominEFDMShCG
	uco/rf/F5oN4MjhURda7yLkAFKOLciNMGKhvRQqhWNAG72cF05hJGuQ+vei9yIoJPoGAjEZDFwVIo
	C2TZrjBfK63BvRbUoyT35ugJk7RIJxGy4M+mw07Z/GnVSV/UiVNpAId3iO0Thg7sNRbfDTmczuEOH
	PGbVENMqUvhz1MqDWLVF/AJEAEtcAXea8L88QAgmyI2QsuXin8LeNjf6LD61RRDqMjlha3KZE7Cn6
	W0y9dUwXQfPTmsongg7TCAqwqPQ8CIIFVpfVD3SO56nUMr2na5pZW7x0Bag6UlGzsa9w7dGC0rRKX
	UWyox0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGX7-0000000Afnf-3o0q;
	Wed, 25 Nov 2026 17:11:49 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGWg-0000000AfYO-2mbl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:11:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxbqLyYqwDh7AQV0k4LeS7qu4JMUyGPo/reBf/Qlq2qg6TMptfj+1xAlWskeRbbikrfQAL4gUUEzg1QHOIVqDGew4h+GllF4aisFVcUEe3ZOq3PHNh32T9xuOydrt2goJ3iqTrLzbOIW3cYUijzfemesCi2KYFJoRfnKwWy6n27H32zxFNkeZynrkaVY345fdSRUQ6zRMAtWsKw5iu7rUgFt5yaR3NJ3j50WmHnPmhA6WQwpGX/5sHfQ4fIl0PmV3I+OQMdPJ4j8zr9mw1HfzJX5ql3sZWzEiz9x1djzCBZmuDWiLuAdlvHQu9LFPIwURBHQKlPtTFpbrc2c35cuPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJ2j5NdDqJAiNNA8dEfseYaSacA3lkAqSPeDNuVrIho=;
 b=vi/wn0aXAoylsaLyhIJPpBu8z9W9ljWaDL7J0pCxyixy2K2hPyaUAxzj+tHmoqee+hsXllxq/lJGFXjkjClem6mDPaOt0fCOxNd34nzm7JrEF4M2Y9TwKuxC//JvTtqJMQyyp6qM9fhb68bvpLyIZ2wmB9BNaLrW+PmgysPeRuQY7C93MYf7SWwzgSst7UgqnrQ2XrEDf/jo6pqs1KDMKPNjpL4ifFEPWSKKohRJhwi2cHTA6ACLvT0BRGRzlt58lCC+reQqvQFc1xXEgQScb7wRTpVtEng6Dqck7baSP1Lj5Aq9o1Np9Du2zu429ecu5/2Oau/+CShMs91T3W4RBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJ2j5NdDqJAiNNA8dEfseYaSacA3lkAqSPeDNuVrIho=;
 b=3UC599To+hasWMoSGOn+0xvZ8XsEfsYVGme/4GT+xsh+cDa6liDdmLGwKBWhtflCZ3WyUzFhE5te/msw5MjjQRONMFyumWLAddASQevHO0b1SvhS22bc2/w9xzFo/HspMb0JtEzUPrpbOJNy4TIdU/MG8Poz0hhXfiL+suTjRRs=
Received: from MW4P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::27)
 by DM4PR12MB6591.namprd12.prod.outlook.com (2603:10b6:8:8e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 17:11:13 +0000
Received: from BY1PEPF00026964.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::94) by MW4P222CA0022.outlook.office365.com
 (2603:10b6:303:114::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 17:11:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026964.mail.protection.outlook.com (10.167.244.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 17:11:12 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 11:11:06 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 11:11:05 -0600
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 11:11:01 -0600
From: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Dileep Kumar Nagavarapu
	<dileepkumar.nagavarapu@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v6 02/16] iio: adc: xilinx-xadc: Refine Zynq read/write error handling on timeout/interrupt
Date: Wed, 25 Nov 2026 22:40:16 +0530
Message-ID: <20261125171045.1246381-3-dileepkumar.nagavarapu@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261125171045.1246381-1-dileepkumar.nagavarapu@amd.com>
References: <20261125171045.1246381-1-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026964:EE_|DM4PR12MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: 3795d3e7-9809-467d-086a-08df4b171bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|261009223027099003|18002099003|22082099003|11063799006|56012099006|10067099003|261102123227099003|261021121427099003|261026121527099003|261022105027099003|261028144727099003|261026140227099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: igUMFqIGNjNRgHqzTO9q2r1VDVa2DJrJFna10eZd9kIIvLF4EdZUu9kr5mpV9Y1vNV2ohSaVdG7BSTMpcmKMzpw3NO4ZwLVavvj2d35K0OZ/whHjuABV270Qyia6Xt+piCpMaIksSIAq3a+sg6Aad9fDWmEGo6kQNE/7o3G8StJflJsUQZNjmUU5TuZNUrFan54pyVx6ERCKCuIROsyfIyiCggPlqrka+PT9CW3H1gQFcUvV7oexZM/3sb5ffPp5P979LypgX5LdCUPmQDoD2B2Z3yjNZwDg08w0Ek8E3miCGdh6nourpcMBHmoroeFCpPADSfEN49cuzODyF4TtA0jU/QwG/n4M0ajY5JMO0cziUlgc0dHc7hNyXzE4HyEbjcS0KMcX9TI+RCxOOxHmyoUy/c9iBJ/bMP2Ek9afgT6eCWCqdn6BsU3zZUfTtpeQVFWmb1QOSQRQOf2YbCe5Rj2eLrvoS6P57PCjSoWNqCA5emUXxkutPzx6XpuHNBZNzler2wPXqccKWcGJtk8Q2U0Q7tgTK2ENeFMRP3xQ7xW3fLIe1juQeG1CbuRm3BERb2q63nWcZ85kAEGyXXru4LND12YMdk/MPOe6iaUfUzNoNbzfumhpfarFCvkRq6Wjtcz8pqcTToSZrDQXCBD4ALnDEec2YcCsdPiSmTJ1f83YeRC9N4TlkiAMyyL/VIFjmQQIwMJ8B7l6AJT+6f5O/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(261009223027099003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261021121427099003)(261026121527099003)(261022105027099003)(261028144727099003)(261026140227099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iC6LPS1tfKI7mcSHoU2gq+dIbm/LskKT7krrFd/dQWGkVy9qH94vAgwA6RCST1lQ+MpgFFdzHU/Etrlxjeex3IKlFPIDlphOjO/v0zwt4QNyFdcQm6Zc9h/DBQsK/FFTnoR5F/E1NQdqaEXZa5Y84Wy80oPrxX1lRZSjTwNodknOrrP+MZQ2NjSh+03IDZL1SUYEnb/OHtoiY+8f30bZ/HD1BmxE5B/GWSrg1yTm4SElClSRs5YUjpqJcW5mYrBwPTENbrllQU4g9HjmAInjqhL5rU8GHQGI5mN0ifo+MG9hjgW9QsLpCc3yz5iOjb7ZJUWJd3J2oVd0w8dZX4GHtckedj4a1dOYa2TZRQtaPYyMJW7l4PWcInNpj2b/UBU5bt6duIazxkhuJUj/eoFqWUBm28KMqQd7ry2ZQUz7LkzSyYmfzB4lieuk1fDZX+tf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:11:12.9513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3795d3e7-9809-467d-086a-08df4b171bae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF00026964.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6591
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_091122_708433_DC0D522A 
X-CRM114-Status: GOOD (  14.71  )
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

Refine the error codes returned from the wait, the same way in both
xadc_zynq_write_adc_reg() and xadc_zynq_read_adc_reg(): a timeout
(ret == 0) now returns -ETIMEDOUT instead of the previous -EIO,
giving a more precise errno for this condition. An interrupted wait
(ret < 0) now propagates that error to the caller instead of being
silently treated as success.

xadc_zynq_write_adc_reg() waits on xadc->completion after issuing the
Zynq DRP write command, then drains the response word from
XADC_ZYNQ_REG_DFIFO. The DFIFO read already ran unconditionally after
the wait, regardless of outcome.

Fixes: bdc8cda1d010 ("iio:adc: Add Xilinx XADC driver")
Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: stable@vger.kernel.org
---
 drivers/iio/adc/xilinx-xadc-core.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index 222571e75cb3..55cb75d4239b 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -196,14 +196,16 @@ static int xadc_zynq_write_adc_reg(struct xadc *xadc, unsigned int reg,
 	spin_unlock_irq(&xadc->lock);
 
 	ret = wait_for_completion_interruptible_timeout(&xadc->completion, HZ);
-	if (ret == 0)
-		ret = -EIO;
-	else
-		ret = 0;
 
 	xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &tmp);
 
-	return ret;
+	if (ret < 0)
+		return ret;
+
+	if (ret == 0)
+		return -ETIMEDOUT;
+
+	return 0;
 }
 
 static int xadc_zynq_read_adc_reg(struct xadc *xadc, unsigned int reg,
@@ -231,11 +233,12 @@ static int xadc_zynq_read_adc_reg(struct xadc *xadc, unsigned int reg,
 	xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, 0);
 	spin_unlock_irq(&xadc->lock);
 	ret = wait_for_completion_interruptible_timeout(&xadc->completion, HZ);
-	if (ret == 0)
-		ret = -EIO;
 	if (ret < 0)
 		return ret;
 
+	if (ret == 0)
+		return -ETIMEDOUT;
+
 	xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &resp);
 	xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &resp);
 
-- 
2.34.1


