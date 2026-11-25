Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F53606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R+j2Ug0p;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WEAEcClN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V2MkK/GE5i9eYlxic8B7WZZB2XfJLV0duP13/sdYGBE=; b=R+j2Ug0pLudekUdVXQnUCdNqEE
	qGCz9f5akIn74ZZs3RkQiYFdMcybaK/jsPg/YqEWt6//njKghqvCk4FsYejALTmU12jhaA6LZp5zd
	laxHio0wQceTD344njcsW6rZkmhvqwPM4chn8FGMVKzbrlc/m21e3Qzn0G9j10ry4s/jt4dMBwo+4
	Ch+GpMEVjg1J+6zSb+gT3PtIdIKTT203QTMBfehJQqvdww/QPYSOeqwFsikhHgfJtgmaTDDnAnYVS
	mz4PELfh+6rIxW62yRynMn1ZleBXTVKud5iUA/kdDi+epxJ7a13FjqDPXrJhbSPv6mmiMJb5N4TbT
	dITv4KOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGX8-0000000AfoH-0mXv;
	Wed, 25 Nov 2026 17:11:50 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGWl-0000000AfdD-2URE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:11:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qqiayfzsij42HCMwQdyiNzTxPLxNsaX7k8wAx2UxkUDH2J+oQ5wsrsBjvwc13KIhBOyiDgO9Uf8opqBpRFfFAusXfAbFJ9y9L3zGYoo5VQ23FiioGmUfeP+qd50fHYO3vaqSzQxzpWWz3FFeBujJz1ftYE5mvo7hk2FymgRKUJM7T5gqq8AYvkzRzfWthammOAtO8Pz7KmShUoWkb7hyA0mwpMO4WVKjcVImAODGRysNG0jalEMVU5yw53zSmeD8FXSvC5u5vvJ/Z4JID2h4dEdjtHor1s0a8jqHG9NE9IczNWKmU8kVphSfQU7+Y6efjqOJdfKIYFYBq7jDZCeWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2MkK/GE5i9eYlxic8B7WZZB2XfJLV0duP13/sdYGBE=;
 b=P+9ANtABzUHH3pQ+2IDdndFqaFsIh2nij3PSkG2Ouh6IUVNgChO7p6GfO8/wT+DVPTIYQQNSWPj86BEmWqe2rVmB+tP/5gfSftmHX3YYY0Vv8dPAw9cKVUVqRIt3w17MFHh+kF90E9GuSvh/XiOVqeK7mN6vTTWJP6tHUPxN3MezplB1SMMZZRloQK5Y6ztrzx/zqfGGppY6X8CtycnP+AAmKIducMw2BmXEUpszCyUKCQaoMrft4wzPHPLb6lM7OPEp2MLrudlgtZ91iazAUwB/aIqMA/u/jy7fmLTVgfnYxGhmi57YupmWzvegRTb03RZeGltjF9QkOtAbryahuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2MkK/GE5i9eYlxic8B7WZZB2XfJLV0duP13/sdYGBE=;
 b=WEAEcClN2YhXTHU+LZkn+ryfsofGUdD8cnoOOCrEzoTFdRMHLlZ08PUyGK6yMciBnQEbdZUPxY/uI3ROy6LUTW1GfT5cJpPF2RYvXY4Jcp2AfMhqBdMfAxVVI88k9WuKNq0fFpaKyhfyE6bsjCEUUPvhDaMPhMZujk3sj6w759g=
Received: from BY5PR13CA0020.namprd13.prod.outlook.com (2603:10b6:a03:180::22)
 by CH1PPF989868826.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 17:11:22 +0000
Received: from BY1PEPF00026965.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::4c) by BY5PR13CA0020.outlook.office365.com
 (2603:10b6:a03:180::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.4 via Frontend Transport; Wed, 25
 Nov 2026 17:11:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026965.mail.protection.outlook.com (10.167.244.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 17:11:22 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 11:11:16 -0600
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 11:11:13 -0600
From: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Dileep Kumar Nagavarapu
	<dileepkumar.nagavarapu@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>, Joshua Crofts <crofts@kernel.org>
Subject: [PATCH v6 05/16] iio: adc: xilinx-xadc: Drop unnecessary masking and dead code
Date: Wed, 25 Nov 2026 22:40:19 +0530
Message-ID: <20261125171045.1246381-6-dileepkumar.nagavarapu@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261125171045.1246381-1-dileepkumar.nagavarapu@amd.com>
References: <20261125171045.1246381-1-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026965:EE_|CH1PPF989868826:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f9a923-bd60-4df1-7bca-08df4b17217a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|261009223027099003|22082099003|18002099003|261022075727099003|11063799006|10067099003|56012099006|261028144727099003|261102123227099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: xVLF6+8fRtS4n4uFF1m3K/luA6Q/IyWMZv/85SkJ2gXWdYLzpNjv1uh2f3tFoX+I7jtk92lFBsChcf4A22E5IdjiGTCCSCD0dkgTORNpBRBjH3G30c4eu4wCmxGdo8uvJqPV6K87UquvKUq2Xt+R/MUVtPOZaZ6TrSbjNhI2GWj96bLZ6N9HFUd4H9xnNDsDf8m/paIT8GHgcsz8iW5zwLA3WWe6c7bek0J4ruEiOoR7Eyoaeg4nkkxQiGrKvZA+j3F78KE+IEFEzjW89lzQmrp363wcnLUmwpr+0ek4GPRvZn88+6jLYmaqoZ5JMH3YY/VXwcGnMAIcFXFjq27trXYta8pclMheF7xyEI6fvXm4kYsx3KXTce9fwszVRMXFuagdvINuQ0j3LfO4OGH8j25jPMQiPYsr6xj6pucZDLGc71t/x/4jidJkGrMSv+MrHoxbvlQvt15TjceiXCTHzzTIcDdOy3pUkxY1b+q70dY0Xl+EjtLS2ndC3RtBr2d3Z9Gj7pXYFwWXjqnZSpOBne87A6R8VxH4UMHtViRlgrXdZ3vQyPWT269s/E4TYRmhd8yzRrSJfEE7lMD0793LauKm1WwV3EgJJgLnQasqpiCD8FWTf4kGBZRv+AXu97C+DA8mGJ6pKQwyS1Ck3gNKp/KIDyJcnF3e8ktaNhQZLsOcEaqZyNWehPFO1KImbaT+IOpDe23ydgwoa+P4xc8bUQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(261009223027099003)(22082099003)(18002099003)(261022075727099003)(11063799006)(10067099003)(56012099006)(261028144727099003)(261102123227099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NLxlMeVHNMmQ9C05nD2vG+P6QHyZM/uW3i6HSUkuKmhAPtZ/YqP+E8rhzAFi7B/lBKl9Tm//ELkVFO+TBVdP2iD60MRR2curoc6l6jReTKnNPEOfwWUo82B7v3DineKG3Ip5DK3+LQCDPGF0ja7SDirz+Z+3qlMr68SFggRhfdEh1CBWBZN3T69Q9PhjIHa76kQgmpU2K4vyt0x73WhYN7+II0WNBv7iuKzS46jGs+hDokxFzq4YLyfMzc/hK92K7kNXp1A+IlbchLtxQHwp/ufs4/qW7pTKcMCoYGAZfnsYuuNa272FhwjRTE6/OcWmOMA/yHQ7R3ga3MA5UdAwgub1/BSlYISkXy0o1YrfCuPoxoLzmQp4uklcT9oCMqucgG4koW4iVQiW7liDD3w2SthSDoVIeSA7MWQQ1MRt2+MCDL0w3YOMRvdvp0OTcgcL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:11:22.6823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f9a923-bd60-4df1-7bca-08df4b17217a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF00026965.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF989868826
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_091127_681646_69A9ADFE 
X-CRM114-Status: GOOD (  11.76  )
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
Reviewed-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/iio/adc/xilinx-xadc-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index f7623b8050bf..3f9bf75d9067 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -182,7 +182,6 @@ static int xadc_zynq_write_adc_reg(struct xadc *xadc, unsigned int reg, u16 val)
 	xadc_zynq_write_fifo(xadc, cmd, ARRAY_SIZE(cmd));
 	xadc_read_reg(xadc, XADC_ZYNQ_REG_CFG, &tmp);
 	tmp &= ~XADC_ZYNQ_CFG_DFIFOTH_MASK;
-	tmp |= 0 << XADC_ZYNQ_CFG_DFIFOTH_OFFSET;
 	xadc_write_reg(xadc, XADC_ZYNQ_REG_CFG, tmp);
 
 	xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, 0);
@@ -233,7 +232,7 @@ static int xadc_zynq_read_adc_reg(struct xadc *xadc, unsigned int reg, u16 *val)
 	xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &resp);
 	xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &resp);
 
-	*val = resp & 0xffff;
+	*val = resp;
 
 	return 0;
 }
@@ -455,7 +454,7 @@ static int xadc_axi_read_adc_reg(struct xadc *xadc, unsigned int reg, u16 *val)
 	u32 val32;
 
 	xadc_read_reg(xadc, xadc_axi_reg_offsets[xadc->ops->type] + reg * 4, &val32);
-	*val = val32 & 0xffff;
+	*val = val32;
 
 	return 0;
 }
-- 
2.34.1


