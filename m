Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CB7606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0i5wtV/s;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5HtqvH8s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=prAa4bglv56a9zS9Zl8nQ0qhdAxkPpnxdvD2AFjL/tM=; b=0i5wtV/snYvZtYMrywvGlHmIhQ
	k5vcazQ9X5wdX6L4E0mMT0gTQabHjFDvju5G3DgaVfqbkydqNWTEH5lTuZjjk9iA0V02JqwxmAqlE
	xInI0Eqiwv1MTIYiOUW1+vkEiaJEW9PLOdYkO7RBi9VGo0lo0oYbV2yB5w2GePgymqG5rTYwHuWMx
	eKdZc0szBGIHIOJQ4KGiSreu76xaYQHTk6gqtF0wcn3xgdjTDSOAqDlv9vnoLHvtPvH5krrwu75R9
	HN/URh2TxxvjFLzame5FCfG6JS/k/na5hgRii0HM01SdpjtZodZpOrAnkpOgOpQiBRRiC/9wgx3/z
	CAi8R9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU21a-0000000C0GL-0Rp2;
	Thu, 19 Nov 2026 13:18:02 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU21X-0000000C0FX-0uTB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:18:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxOG5gQ2+Hhu/A1ARNulN4z+UThVQJ+Vy4Eq/YeCSNzNX1W3NhhAnw2FXsN1KWMz/xhFfrGF+GJ+RTWezJ17P7xEpE+dsQgKF3XHFQs+C7s6Jgz19F0xU1yI+5lRWyWjCBStjkhsMCr6lwYyNih7uM0hCcXzg3EGLWMRHX43X6yl29pRRPTuYN8Uh922207B/RHNpGtdZNfOuggkYN5u6EyuILrNtr0v3Wm/+/F+WlynXj2odLxGWWHlXJDXrT2g7NBz7I2lbTqHMjuKoHYucCmJbP/OhAxy8krJX1kEMptzRSlTx5WJ3Dbr/XTHkMthRqq4RdQuhiZcb6dlabhT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prAa4bglv56a9zS9Zl8nQ0qhdAxkPpnxdvD2AFjL/tM=;
 b=kw1aoSqY07OgcM9w03+oWm1CcN/+VAaALspYB3ts2kIhKYQJ7pU/yVcczgccCbZDyjeXTsPXM5jP7GC0Y98yU1YBoc+7qEYyMcFSDVN1Iai6CSgaBkB/Ro+clVP88nJT7dwixpekGRB6hGNo2ok5/m5TKV/ZpVmnCCnCmrHxd3bJgkhWWGamGMDXvRGnOYAsq2qUC+qAb0/iKCLknjGu/Owb9Ot+6TsIlUcvwrfIDd8rD6k+WnuMa4i7Sg/zosvRNInr67ASiKtJb9OTIae+KhQGqQYs+HdjHQkQx6Hqu4haUUyjxpwG5LyjPxN8qWsd7alRq9jlsJYCFE3/fOC8EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prAa4bglv56a9zS9Zl8nQ0qhdAxkPpnxdvD2AFjL/tM=;
 b=5HtqvH8s/MSIzhr96JXhON1NFBObkcgtFDi5s6S0d8RhYxuywAtmpV1AzLTnS5zYSMHuNG0resLxC6zqsiMkVguwzNk9kDvbyRzYJtcOwpDSNb2Z2heSse3E2abt3awsGscNRKci0AFLky5bU6mttWXgWTfly00tkCfyE1jGNiU=
Received: from CH0PR03CA0420.namprd03.prod.outlook.com (2603:10b6:610:11b::25)
 by LV2PR12MB5989.namprd12.prod.outlook.com (2603:10b6:408:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 13:17:43 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::46) by CH0PR03CA0420.outlook.office365.com
 (2603:10b6:610:11b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Thu,
 19 Nov 2026 13:17:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 13:17:42 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:17:41 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 07:17:41 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Jolly Shah <jollys@xilinx.com>, Rajan Vaja <rajanv@xilinx.com>, "Ulf
 Hansson" <ulfh@kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/6] firmware: xilinx: cleanups and debugfs fixes
Date: Thu, 19 Nov 2026 14:17:24 +0100
Message-ID: <cover.1795094242.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=michal.simek@amd.com; h=from:subject:message-id; bh=7JRKm5lSuT858wpIMTNKywXoaJHBJdou7IN0rulGqMM=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9+/Z899Zv5ypmLf2tyPyOX0klLc22UHZj0TLmEPmXk /a911KI6ShlYRDjYJAVU2SZzqTjsObbtaViyyPzYeawMoEMYeDiFICJiMYzMnSsW8+Yql+6LSVV yn67S+uJ+Y2e+QcC9IRWnZ/aI5ahE8jwh7Npgpb8obj+Gev/8SpPuWMuxiocPlHyVI4y+8a+7xp dXAA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|LV2PR12MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: da63f908-3a50-4a4f-2b08-08df463f7ea3
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|11063799006|56012099006|261022105027099003|261021123027099003|261021121427099003|261022075727099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: O56ZqnU3TBXTJDBP51LZioPIqTD/Y7JquBf3NXwVH/47ZbhU9TNixGETbY68oJSz2VGNUdqkmpJm7tldN4ToYV7D9ISIET1jRlGqzcmV1RAFAuw+m0lWjeXLCJnwwxHxjNPLJbiIM60UjG4YPWdhNB8TW9qgDvxtIS8nwOKCL9eRx9eNynFoNUYMQoGj++3d9zWOnHr4MMXVdzFL880NDZSkbMVr1Xp3MK4fEQ8XIIyCzcDU1IbVKVNCA4kOMz8IBXQ6ajJyPXrQI0jf9IAZYshwxrw8yg5fXVt/0V2YVRhNq7YYAJ/PZ6aHi6JANNh3QUkooaAn8gsoBmetABkdxpoOe52Jq+qqDNwjqpLHTsXpt4SbMpNKPE+1oDYe1sE3ZxmzSYRhZa8tAmqS4zhQMZXz1kYbjbGjs8qOf+nwzRHf2n6NnwkMEv9p9+wwTspYslwql0eUE5RipuAiI3XF4NCjoMp8YBd/BEyGsQljFyRB4UYHMTipqdPzJ/xNUqyukOQ5jk1PrPXvyA4XMa7q8QXI+Wc69w18IO1kQ9GEX63xDWuZG0loJi1G0DnHbcXoOkKeKFhCjSahfc3ItXV/Fsomkkkx/UGfnLaV2qfZdGBFbFAZLmbykoMu6Qu0dlH9uQk8ZgpsasRkkfEQQ4Wd5w14klWDAhL2GxiE9yfNObflRzXkrxnIsmhz555Q9lqkjzG846xweo42LXpXt+1iyA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nvEFKrXEYbB9M6gBn9RcOglL5wBOp7HlDqrnNokLAg+IK39UehkAFrhPA+WZ54re0sFNgD5IBMfapjZzQobrvKZ8fujA/yvvZZW/bDSXubW2OP44+EmoMN3AInJXf+KdMonr8ntXC0rwFUZ4YMEFbeBWaVy6D/Nw+fcmTi99gJef56DzPUCuABIgonjnKrUU4MxjxB7PuLWPrtfYxz2hsYs1K53JZVhQrhbiGdDPzWHE2gU05jPrph9MsgQnPZKuIIaV58IcK6Qj/8g0kRYV8bEsGSjrly887GNkMAHhppyTHY+62WO93Qsmmw50O1trBL3HfAR1zwJArloch91hx7QndzibNQ4T0UnVkNxvQNIRvLABc2c5lDAXPMp/VWBahxqsw5eNHNKFnIXRhlCc0NG4zsnMla3Htstg34HO947i8z0VkifeS5eJ8Vtg5ebc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:17:42.9533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da63f908-3a50-4a4f-2b08-08df463f7ea3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5989
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_051759_279080_041AB453 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Patches 1-3 are preparatory cleanups of the EEMI call path and of the
sysfs registration.  Patch 4 fixes pm_init_finalize() never running
when a firmware consumer never probes.  Patches 5 and 6 fix two
debugfs issues: an undersized ret_payload array and an unbounded clock
name copy.

Each patch builds individually for arm64 with ZYNQMP_FIRMWARE_DEBUG=y
and checkpatch --strict is clean.

Thanks,
Michal


Jay Buddhabhatti (2):
  firmware: xilinx: Change debugfs pm_api_ret size to PAYLOAD_ARG_CNT
  firmware: xilinx: Bound debugfs clock name formatting

Michal Simek (4):
  firmware: xilinx: Use late_initcall for pm_init_finalize
  firmware: xilinx: Call va_start after pm feature check
  firmware: xilinx: Add comments about number of arguments
  firmware: xilinx: Call pm sysfs out of dev_groups

 drivers/firmware/xilinx/zynqmp-debug.c | 13 ++--
 drivers/firmware/xilinx/zynqmp.c       | 90 +++++++++++++++++++-------
 include/linux/firmware/xlnx-zynqmp.h   |  3 +
 3 files changed, 78 insertions(+), 28 deletions(-)

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
branch: xnext/firmware

-- 
2.43.0


