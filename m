Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6680D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 04:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ivAMn1pR;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5QA1aREY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZGdorF/41IyVyBqcUesnUhPl1YWUERWGX7u+UM8ct4c=; b=ivAMn1pR8ziV4Bj5vluEhzKJRf
	ojUUvIP3K0PC+4F/Vf9jXq/+YAwhJDFUIxH6xjn8ukGqEvgUYl8UXAeqCjgySDFqrxEP0vX5qhY4J
	oyBSYRN6bSnF0VuCpPHplqq60ivsaj4O656+Yo/1WQdHfSlNlhBtQzxf0YlTCzfsTh1ioLuzJDAox
	LGGjO0pcPQm/rasB27IcIEenQmJwDGezmMcMZi9ZJmNvGcT9fMRUoav987f4MV/ezy5YhwRuqsA08
	6xq2g/ImZ/CU3oacqyWNU/vAqJ2jC14UL6qULaJZ48LMWxDBg27X6H/oqQrDV2t6Sysd6qodpS1xS
	6b3ZlIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhgH-00000005UG2-2kmd;
	Tue, 24 Nov 2026 03:58:57 +0000
Received: from mail-northcentralusazon11010065.outbound.protection.outlook.com ([52.101.193.65] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhfz-00000005UCi-0I7a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 03:58:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJv4oRrM0eV9HRURBbrdYEqASDgjwhoBMsJuDnA3a1+3gLGs20Hy+UHrrezNzFIBGnQk3YTHUyZk55islR5/QwXSL8PNoh5m1Xea6fcpNrdVqrEfqR0anI2RAio87lrg/JhIRNm28jRY6sgqIS15yj9Jecf2h1CFqOo8LEfwtSDtDpyWAjVmM7AVI1nud1+KpFjBOc25881dLlXSEGCj5SeOVkgvj/nArBggSqkQOkloC/WVprLf3BWoX9QkCu2Z6B6qnoOK0X8lGXABnUhGV0IL6p0KImCBmBsoiX3gVTYn7m6IK6fcd46VedVOP2P/XF6G/O8soTaRr0YQuNhIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGdorF/41IyVyBqcUesnUhPl1YWUERWGX7u+UM8ct4c=;
 b=ewDdS+CTFUdw1ZAtl/BnLTVTejUIqZj1XX8XvuEMlwxbCSCL0hxWPYBZjMe/bjv1H98ty36pAsaZ1+qpxSQNqdXqR8Qs6/u0U90vnAxqlxQ2RXhdK0HyvejVqZtkdQe62Vt+8veQbcJgRxJTavO09r7Lokg4vtV6hs1qKhk5v5PnqeEfAQ3VnCpNhZAmtC4Bjn1Z8/Issm3hY6FGQLjL4Gm1Mv3WpleG5gLjPdt8Vp6al2h1HjSibxGzDtJKinP0CgYeSGxPEzaLDPyAPZyJZBCPXPsNVeQhkkFizHOvYTdqHBqKyzxXdUg+2eea7fYEA83h+hJ1xlUOHMEVHbrwww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGdorF/41IyVyBqcUesnUhPl1YWUERWGX7u+UM8ct4c=;
 b=5QA1aREYjHTaFNc02xigfQIXNdmCe5rceLkLYXAq3hCjqKzCC4XSLaLGMg/h0SUU+hdbv5Xuwp52IRxLWiCDWa1s7GISoLDKOBDUHDxpgxb2G9N780iJQlaIOXN7QJ8BgPGuCFxYo2R0xx7V1ZQqJGCw5jtksx1ACDavKqFHnnM=
Received: from CH0PR08CA0018.namprd08.prod.outlook.com (2603:10b6:610:33::23)
 by PH5PR12MB953872.namprd12.prod.outlook.com (2603:10b6:510:501::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 03:56:42 +0000
Received: from DS8PEPF000000DD.namprd05.prod.outlook.com
 (2603:10b6:610:33:cafe::7d) by CH0PR08CA0018.outlook.office365.com
 (2603:10b6:610:33::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 03:56:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS8PEPF000000DD.mail.protection.outlook.com (10.167.23.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 24 Nov 2026 03:56:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:41 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:40 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 21:56:37 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 6/8] clk: clocking-wizard: Use dev_err_probe() when mapping registers
Date: Tue, 24 Nov 2026 09:25:51 +0530
Message-ID: <20261124035613.1968260-7-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000DD:EE_|PH5PR12MB953872:EE_
X-MS-Office365-Filtering-Correlation-Id: e50709d9-73f3-4694-5a00-08df49def34f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|23010399003|82310400026|261028144727099003|10067099003|56012099006|11063799006|261021123027099003|261026140227099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JanlwLo9bndEMAl8ZveO2AqAdalfgdrql2178lzwClMWhGqudXjZZ/GAC7JbjKKMJoA6UgkvZikJWV61ZCEcqnqf0j5QBUDSzmO/lthZcktPTdF6GWrMaqnIO/dlWc/xPk5Nix6Flrww70Jx/YbnbvuNY5c+FrDNTgIiKMI2XUvx76M9jmWt1DIUNVhXlgqnC0AR10debfSJLWS0PlhGMV4vAQObJJfy5lDOAPYmgXbvGtCTyaxBgssqtz0HugihmrzLuJ13pCDDb7QANChAgnQvHeU6cYZGP5bOtkz5N0wZnAYqMhwXwtu+2Y1Uv/bqutN0mgDmYWRWMhHDx866l1VuX+QT3QFk141wV85S9CUuTeWAdBuEh6mX5Xyxk48SP6xC9yYA6I+aMjzNaegDHBymDNA6y1iqkBxi2V5nMyZ4RfwfRTvmrN3RA6y9EJKjNB/90KyNPL/jHAq5c761/FTm5+icjpaaeyHD0mb4affVXyrCwVlTOgemSkUOSJhVdUFTca8qWjlv3aoYZDrKS9NMpN/rnqZmbyQtjwveo/0eD4VnAt2bw1kEtk5+TPnqsLa5zmT3Jlj/8QRLoWQToxnndHFvCPGsqF6KVTCOUUyGd6zQCtLJS9Les8HuefJ6t/+QnfCH2q8W1tJ6nb2dsJ7nlns2P0Rl0k6LG+R1gV++Y6+s5pmc+y5v3c07ynL1B/LqWIv+J2HZIKWDTkGkKQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(23010399003)(82310400026)(261028144727099003)(10067099003)(56012099006)(11063799006)(261021123027099003)(261026140227099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SxvEQbEA5B6LfGjCaldakDMuiy8P/SDgYgDYLAtIYwOUPJMkWbrbUoJJryWiTZVTt8GLjDJonX6IVnetJVv3/JSuJuMF2re3eXXL8iL91TjSPDc2LwPZzcV1GcC5jO6xp6zwizA9U+C0gg7cH6tUYACgcHmoupIbr41X71jQkaJ6LMJADpYBicJ24jKnUNvOHXXMqdRer8W3ZWPY85ch8GMOrivic2Mw0eEeh7+4jzd/5km9Rtrc7kWvwKLidDaJNilJKJK9ycngLCW/ll5gPUtoMWBviV7VgscRwN2rc3bTGrUOkF0d40VpjtCtFf2BJPrdVTLMIztOtlD0HR4OTDbcD9RmtCoK1wMzWwMwocAbwshy2cG8viDUQptfK6mXmsFzf60jusKRKfcLynxSEpLiltVk+eJKrl1PD67VRdaBkz88iA2eR6A2282wTDct
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:56:42.2763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e50709d9-73f3-4694-5a00-08df49def34f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS8PEPF000000DD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB953872
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_195845_339712_95033ED0 
X-CRM114-Status: GOOD (  12.18  )
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

Align the devm_platform_ioremap_resource() error path with clk_in1 and
s_axi_aclk handling for consistent logging and deferred-probe behavior.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index a3f4c5d6495e..7fe8d0d4cfba 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1414,7 +1414,8 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 
 		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(clk_wzrd->base))
-			return PTR_ERR(clk_wzrd->base);
+			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->base),
+					     "failed to map registers\n");
 
 		ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);
 		if (!ret) {
-- 
2.34.1


