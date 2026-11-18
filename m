Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED4606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BNTDUt7G;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hc2BoG7J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NXxatydLu7Yddm+3B4X0BvZPott/i5e02wDogboP5dY=; b=BNTDUt7GcCP63M4SaJCebsrZHS
	AQCJGUECqIg/CVIF/+/Rf79TxaYOCoAnTxykOVh9AyosUZ2JLBrzXkaAc8MO02j0PeRENdxMkZmjH
	7wa8NNa+jTpCd35Mu2SVWT9rTFNrNeK8Qsso86d3PVCUqEfL6Tn2WFEXctcWNCF5Fa3Faz2mEuNzG
	V6ctoYcNVdFU5oPphit1ej5uc6BQR07sxZAUlxgZ+UPAfP+md7KahUe7jcRd5NoR8JLXXLAL9A2Aq
	DohR0pKSMg995l1CxjsO/060fkcNaFvKKlxRUYwLCi8OaJml+FAvcdMg8zawuGnoMxqynrdLsikhD
	HYPXZ5cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpCR-0000000AW9i-3990;
	Wed, 18 Nov 2026 23:36:23 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpCO-0000000AW9B-3wMj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 23:36:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjJ8TViQV8Qt+VCil6hMGiPsBvj7qWYCRbKOyF79iTjslwIXmlgjxQT46Qyc6mT4DnCdR4i1amsIw0C6+9hZ3HS//YvbdA6ui6yY+BgFCA7/hjw9vYP1uU4VxlGb33d+DsECHhnuf6yhVG9JkbcFwIuK1T3uoq0g+odo5KOUa7NYIUHSKUb7RXpbp9PiBs4ShUGA4nIRwz0AZESLzUVDvhujjhhRGG9pQueIe1T4MOdwUgEyE6TUujQu0uGm+RA6UCyQEBTVUsiuXutWW/t3eSRwg5wAp6Wn5cT1QN3rX7VMyBrINmo0rwKTnhs4eNIBNOkjs9QZM6lPfpzOol1cmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXxatydLu7Yddm+3B4X0BvZPott/i5e02wDogboP5dY=;
 b=xORpi6kFqu+Sh2iQsaj7LV21oYsjAARycpHk6aAlfamP9opZCf8IhkKgBirp3fme8xDuR+k4UbK4MURn+77BbgrvXRDNuCvdRAFluEl79NDK6ypp/PDmJvpkQhT3lXkrTUIvcmcixItzKp9Irdlkxw6fM0ilEGh+g/SSI0qOofPdTy1vy/Y/UfJf+x+BNBMeabY6cwrsfirH0zasrWFgjnbwsR3q7Zuk4hO3xDFy1pnyBnqHCMX1TJifAqz8mygO56DjI5GhkOm2y0IhvBA8bxec8X9XfzGZ7e8myNKCYFeY0nvGysmF07nb/Qvx2JvLbptWFs37JluZnbFrDXYM4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXxatydLu7Yddm+3B4X0BvZPott/i5e02wDogboP5dY=;
 b=hc2BoG7J1X4nHfdjtI9ttmh4050njYn8n+zV6umhw42WgjmxCFhCtAAHHznt6QWV1eR3y59Ds5FK5FX+WGvFmmFM+GXdBk8h9evhsqzGu8/dD4dYA6VtsElg99vbnXLb1Js+1w/FIw573bpoCPHOXKgHQeIsG2Ru9FNGeUee3Rw=
Received: from CH0PR04CA0064.namprd04.prod.outlook.com (2603:10b6:610:74::9)
 by DS4PR12MB999078.namprd12.prod.outlook.com (2603:10b6:8:2fd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:32:26 +0000
Received: from CH3PEPF00024581.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::53) by CH0PR04CA0064.outlook.office365.com
 (2603:10b6:610:74::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 23:32:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00024581.mail.protection.outlook.com (10.167.252.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 23:32:26 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:26 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:26 -0600
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 17:32:25 -0600
From: Gregory Williams <gregory.williams@amd.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Michal Simek <michal.simek@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 09/15] clk: zynqmp: Add Versal Gen 2 compatible string
Date: Wed, 18 Nov 2026 15:32:05 -0800
Message-ID: <20261118233211.4121361-10-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00024581:EE_|DS4PR12MB999078:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b8fd4f-09a2-4a77-6f68-08df45cc34a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|261022075727099003|11063799006|56012099006|261026140227099003|10067099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: xdWJb7dQI23Mh9Ydg4mQ+U0mvItEzs/TtgE8P0ZXc607GLYVCI5qAb8AZa7Qd5Z0f15BJ8w9WZ98fv3tPzHSNiHWCk8AcNoUcxtQ+mf6p1SXkVD9b/uJq/rlq3jULX4NAFKi5CVZ1tUQs7FSFsBzgqKgZclW7I3V+I6uKBKaNys6ax5S51oPB2s699+NV19o7czgBTjw9BLtR6ztQb11MLFL5kSTyfZYX335iAIhysCL3+n9Nqb5Szn1x17/v83wlAh1sDrtpOppeJAreijB0kKcyVN2S9SKdm6YiiWTsVZvxaLfcSXCFTIDQNmipdmh/iuznMLkdw0WCBzWL4qKlDNlJTx/cvRmrJbC92SHvNLW+6suoKQW8+gL9PlLPr0Y44BEDphODO6H2P8s/70GP+F7K+EwPXrt9x0fEtkj5xosfSFhAJC402ouxqU9AR9KkXyKhozcUYKEnDg1ZOPbDL/5SeTAxWYFf5INduAmP1MNiRhrV+7BdLgB+YmZs/fs6vG/76ymXR2Ml/IOm44bElu/VNAH2CE8/l/k+nPAo9IgR59dYJVSgPDs6YFSBDO4Ay76b+l7dXJKX7WjKpsrnObna/9lrA8xx237wAIEwJLImgYBHuIe9Qlw+IG0TEvCiSQ5ryQEWe2BudjbgwxyLevLsfUBYsaJUMykXxYCOVmPixhViGkL8lZ1eLjihlJm4WfdjlBQH15hPcjWZGB3aQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(261022075727099003)(11063799006)(56012099006)(261026140227099003)(10067099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OOHA+G332c0qw5Sa0sIOUegHA1c3XXzBbMa3IA8Lm7FW+Lr+sFeuidE0u1AxD9PVnwH0QIU4smDiTUcXLMe/wdC6INztsp7fmJRJwBLhTmcuJxkDwbpCKTWQDmUQ/TJiWABhLxvL8gVIWUjSbdPVkukXoZLS8n4WhG8/WMuScvl9KvLwRW9gaDbx4U6mwzJ3d/NYThBj4Dp8WnLNqQI02t7isR4eXnDrhjDMJ88TMji6Yz/J3eeNOXHdASgvTlCV5oJodCH1kjSyNS8ShpnydQWF/3qNEILm7ujZXagCO7gOHnwlqhbfyuHAn0+2rRxEJE5M2QukA2E6Hce53zgmt8UysnhqBbhUXxOq4808CA3WnAHLa5Bd+8b93lQ0o72IGpgJuqNQHLb1QG0UZO6GN6vWycHTHwGgcq17pE9lXIlzckFctHQh1keVUfUyhLoM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:32:26.8178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b8fd4f-09a2-4a77-6f68-08df45cc34a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00024581.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_153621_209754_D189FB8B 
X-CRM114-Status: GOOD (  12.62  )
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

From: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>

The Versal Gen 2 PLM exposes its clocks through the same EEMI clock
API that ZynqMP and Versal use, so the existing zynqmp clock driver
already implements everything needed once it accepts the platform's
device-tree node.

Add the "xlnx,versal2-clk" compatible to the zynqmp_clock_of_match
table so the driver binds against Versal Gen 2 device trees in
addition to ZynqMP and Versal. No code changes are required beyond
the match-table entry; clock enumeration, gating and rate control
all reuse the existing implementation.

Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
---
 drivers/clk/zynqmp/clkc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index d62f1901d0ab..ba8823e385e3 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -789,6 +789,7 @@ static int zynqmp_clock_probe(struct platform_device *pdev)
 static const struct of_device_id zynqmp_clock_of_match[] = {
 	{.compatible = "xlnx,zynqmp-clk"},
 	{.compatible = "xlnx,versal-clk"},
+	{.compatible = "xlnx,versal2-clk"},
 	{},
 };
 MODULE_DEVICE_TABLE(of, zynqmp_clock_of_match);
-- 
2.34.1


