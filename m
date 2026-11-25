Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C19A606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IhYLIOOC;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0GVe/hxF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FHk2urJn+OyDYOfW68RBQRlj2cbrJUg5FuXKryBzEAA=; b=IhYLIOOCk/DuHREmYOZ0JGOyHs
	CRh8RS5T6dfTBjzbB97KgyM9X0BP/4L+/bpZ+xDjqV6SHNvN6eID3FpFxJwmtxjnAWsREdNSRqdV8
	OQh5QPsWN0h4VCxdPLxknn5kuJ8Mjnnzwe09jDUsK07u4oK7UOpEPIWhVFgSmku/C+UsqG507fdwS
	bmOWr/E1Cu5XHgGPNy0RX9Vcr54HSSE29VTrCL3hRpE/QfCkZ9kZqfjj7mDERyRC5XZETZLpeEcHf
	5q8vYPz5t27PAZoAeWCbQgXBuSK6C0NA/+bkN809TSYps3XQ6MX/0JFMQ/RKec7juELtfAZ9fvgyQ
	BDQvNERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWH1O-0000000Am7B-1hNa;
	Wed, 25 Nov 2026 17:43:06 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWH1M-0000000Am6o-00R7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:43:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3vsbc+1hTA26HCZ5mwiw7y2zuz9YQB9cwIiHeakWj9kJrzgwOz5Q3DdI9QoCAfwXRncH+3Pu9/8WTcExNnGzjyFoLcOZ/eA+1o0scy6K40NNqwZWoobAbgVwZfwwQ1/nNnRu1xWD8CNOj7L0EvuugEPCEld4SY+AZMKF7D4kN4suelEV/k2le87iFnoAeOyiNBiruWw08tFlMQ91465Bz5WDpNeJ1f9noB2MVVPGJyJrvH0SuUcmVdFCI/OaXdRmKhbG2leONP55evmHwqaRfB9a8PMoxt72UrrMUjI9/lxfkDWwBxGrpyG79uSBs29kvPm3YuzIYLVkFeEbbZWWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHk2urJn+OyDYOfW68RBQRlj2cbrJUg5FuXKryBzEAA=;
 b=d/UuE1lMl7mFD/finDQ3upukhavu4VZvsoTyxSWENVMOCRsK49tNfCYmzMwfP/MzaWpTtQqNVcjGytsPLFSRPGjxxzt2lIwMG+yRGOvwgLqIBXFSWvICqqnhtJomvBr2oF+rP7CLLQzG3cVn97AcAu1A74hHi3yUODCosVzMa+wocKXz6odSgOwaR3MOckTbV/YNBsPP+tY9NY8CjNUg2nKIKkcIRiEi4JTrlA+b5enJNOmdKvmV5qis5cDUBaB2fpur5pQLabqkWmLb7isV2EK0thwM5lwK3e2Lut4CKOnwoX6+2MrecQDCDYIkq993S8sj9775uLd8N2GP1DVLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHk2urJn+OyDYOfW68RBQRlj2cbrJUg5FuXKryBzEAA=;
 b=0GVe/hxFJ0iNgdu6LkrOZXJ+JWX2pwi+5Q0rFu10cS8shaQG0bi+ovMVvDICrgwAgGC0Au580RkPqHsmAFjS2Ti9LqkjD91G3qGu9XFpxabPDi6UrxxtM7T49JHjFP5rXSba2yhfy5DYIXggdXCfw92mo8022gXKT9RGzC17gfk=
Received: from MW4PR04CA0075.namprd04.prod.outlook.com (2603:10b6:303:6b::20)
 by AT6PR12MB065114.namprd12.prod.outlook.com (2603:10b6:170:117::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 17:42:56 +0000
Received: from MWH0EPF000D894D.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::9d) by MW4PR04CA0075.outlook.office365.com
 (2603:10b6:303:6b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 17:42:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000D894D.mail.protection.outlook.com (10.167.249.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 17:42:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 11:42:55 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 11:42:54 -0600
Received: from xhdlc220225.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 11:42:52 -0600
From: Srikanth Boyapally <srikanth.boyapally@amd.com>
Date: Wed, 25 Nov 2026 23:12:50 +0530
Subject: [PATCH] spi: spi-zynqmp-gqspi: Initialize padding in partial TX
 FIFO words
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261125-zynqmp_padding-v1-1-bc0f925fb898@amd.com>
X-B4-Tracking: v=1; b=H4sIABkeB2sC/yXM3QqEIBBA4VeJuV4hBUN6lSUWy7EmyDWt6IfeP
 avL7+KcAyIGwghldkDAhSL9XQL/ZNB02rXIyCSDyEXBuZBs39w4+J/XxpBrmTLcKoW1ltJCinx
 AS+sz/Fav41z32Ez3Bc7zAti0JVZyAAAA
X-Change-ID: 20261125-zynqmp_padding-8d1f88eba55f
To: <broonie@kernel.org>
CC: <srikanthboyapally2026@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<michal.simek@amd.com>, <linux-spi@vger.kernel.org>, <git@amd.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795628572; l=1837;
 i=srikanth.boyapally@amd.com; s=20261106; h=from:subject:message-id;
 bh=sZb4TzGB4VSaty/FF4ighgPg/UeQfvEKi3+bJNsPiEo=;
 b=/feWYjOFFnUFyLkzrZuHh/W7188O3agVo4KCN0wloSj3S1Hb9ahZeGapsVCRuW7BTvZwDqa5y
 VNHA4KXvHOqBj7akYZBmLxZw7wM7nRJAOVuOatnYaYCAEA0k8vQOJ3/
X-Developer-Key: i=srikanth.boyapally@amd.com; a=ed25519;
 pk=VZiIwz5+m6FvZJ+3hzpXDQl0u531OPVeBcB2OVGeZVk=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000D894D:EE_|AT6PR12MB065114:EE_
X-MS-Office365-Filtering-Correlation-Id: 2deed269-711a-4b05-07f2-08df4b1b89d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|261009221227099003|261009221727099003|261009223327099003|261009223027099003|261009220027099003|18002099003|56012099006|10067099003|11063799006|261102123227099003|261026130827099003|261026140227099003|261021135927099003|261021130227099003|261026135527099003|261026121527099003|261022113327099003|261022115727099003|261022075727099003|261022105027099003|261028144727099003|261021133027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: e6l0UZuixhHiE1MvzUdkTmcKQ1anMRY0599sqm5bhWUiZ5o7pNDslyIB0ewmHI5goTiL6iYOqe8akcp9yGrE3NP8+2LebOBz14Ii02gVLNArziZm2rQIq7nGSn7SSjKKR9BGGHOJNGxFnq14nQYxNz1mUmFCoWi8zHXQfSH9dbgQ5B2GovxFfJj7P5BnsDXGjOiS8j1MuSm6I14br9OkmciCStfkpxfArqVVaFZEmGE35lzpdIWMhK/Ch9/WYRCoWs6Yx8ySl2nsOuFoKbCpdmQ9W0SCwSDtg/anpsbkc5Hdj8HNVK2ApN56CeovcgPGQF9ycTOcTouMEZ4MW5OzhK+UljMVsbLlt2ZT6w0IiYuABVq6/oRhxCosjWBMZn4SV+CAKr9+r4ckHTeLOCdxbs49eM+RjU7saRRZJmyRZNQak9XUjBWhaUdcwvRPkw2DzO3zt5BL7m48JB/yZxlSd+T6fhxYaoJZSEQekKWx1Wp8clRR2v1gy3L0r2e/EZcTIUMC1HRVhhL1D2+zuYEK2J8NLVyfM2wKzkwL1vBGPB1ycvVOknjFGVXO3qRYJLvCTyySpj2/o7ea/EjFvpg2W9zFdBg56gF871oOTaX2/gJ6nzjC1bvpBBPmvY2PaDSLq3UXr6sB8U5ZcZE12H8CEyk2GhKcMloqodx/WChpuOeqSeA3K/NqRbLXGOMRAmdOrSDn5I9jqezSQIxr1I7F+w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(261009221227099003)(261009221727099003)(261009223327099003)(261009223027099003)(261009220027099003)(18002099003)(56012099006)(10067099003)(11063799006)(261102123227099003)(261026130827099003)(261026140227099003)(261021135927099003)(261021130227099003)(261026135527099003)(261026121527099003)(261022113327099003)(261022115727099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021133027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qY33hBvng8v7DWFZ97+y1/DSJmEnN8ficoGdNWDJbjZMhToYpyUitDeN2fcrrqhIwLJq0ykmVF9fQZomV0p+0KKbM0agKiyNltjnNwz5ANTxsfO2i0ntGVaXKfqskuY+Pvwh6BNtvr6qvhC9jFKZWUf/BWI1xQoyNAw1gIegzdlSnFka+r9uu4alFWulIvQSDYKBWqlpXNv9Nf4RYncPGCUxOfhaH0dwbt+X6tVgE9s/K43gcL69gx3Iz4zTeasyDwuU1Vqxf9tYFc6EefmaJMXXxgvS3hZmOPXh+Yp0wnBt9j+j2iZcdU1A0VI1GSiDJb8vUi9cAdXYXe6p3PkdoM1eY7OzZAKDIDBft8rEEWU0fwwCA+5Ll9BlbSLAoU7e/NqjWOJnJx5n7OLA23HDy7240bvA6j3u4RPje2ZNTrdTHch+CXbmWSEo0Oszo84M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:42:55.7051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2deed269-711a-4b05-07f2-08df4b1b89d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000D894D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR12MB065114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_094304_054528_7816D8CE 
X-CRM114-Status: GOOD (  12.76  )
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

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

The TX FIFO takes 32-bit writes. When fewer than four bytes remain,
zynqmp_qspi_filltxfifo() copies only those bytes into the last word.
The remaining bytes can contain stale data from a previous iteration
or be uninitialized if this is the first word.

Initialize the partial word to 0xff before copying the payload. Add
the remaining byte count to count before clearing bytes_to_transfer,
so the final bytes are included in the accounting.

Fixes: 2530b3df4326 ("spi: spi-zynqmp-gqspi: Resolved slab-out-of-bounds bug")
Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
Signed-off-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
---
Initialize partial TX FIFO words with 0xff before copying the remaining
payload bytes. Also account for the remaining bytes before clearing
bytes_to_transfer, ensuring correct transfer accounting.
---
 drivers/spi/spi-zynqmp-gqspi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 8e4d940a7785..0411dc6a34ba 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -638,11 +638,12 @@ static void zynqmp_qspi_filltxfifo(struct zynqmp_qspi *xqspi, int size)
 			xqspi->bytes_to_transfer -= 4;
 			count += 4;
 		} else {
+			intermediate = 0xFFFFFFFF;
 			memcpy(&intermediate, xqspi->txbuf,
 			       xqspi->bytes_to_transfer);
 			xqspi->txbuf += xqspi->bytes_to_transfer;
-			xqspi->bytes_to_transfer = 0;
 			count += xqspi->bytes_to_transfer;
+			xqspi->bytes_to_transfer = 0;
 		}
 		zynqmp_gqspi_write(xqspi, GQSPI_TXD_OFST, intermediate);
 	}

---
base-commit: d8c1f1ad171d0e5844b6579054fa19ebf6cf7d17
change-id: 20261125-zynqmp_padding-8d1f88eba55f

Best regards,
--  
Srikanth Boyapally <srikanth.boyapally@amd.com>


