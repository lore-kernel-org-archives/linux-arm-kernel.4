Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEDF60A2612
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FSElZGyL;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ynO+5BzY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8jUxgPl4HvjIJEKGyO4/SBiaKmdzG1JADbTf7SYef5Y=; b=FSElZGyLFKFogluEC6D7+Ay5GM
	ZbzOnCA25G6qQfLwB2j1LyF9j/g6llTbK/9c8PVIvaoSLwNCS7qisN3f+yiR3pHjgHrxj+4VtssIy
	NAJ5mBA8pdVtPx2mtwUU3xVHjn1KgabnRA35pYiRjv3X7t+W4dJ1r3lpUMxWyRBBGioYCS/s5d8Zl
	6qi4U2MaISqWIGxRuY+O4CENYBrH6ruqKbsv9wfw1cVWgwK4qktS+vXHFkJAlEnm4iukPfUA/YRIC
	CJXYw+94xY7fIs5odk3h94xUZ00fq+HA3IlqhMneHFeQW3wgndhqtW2cLBId0flO/7BSEkCt+yapU
	ptsVl1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU21v-0000000C0OU-2GMO;
	Thu, 19 Nov 2026 13:18:23 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU21o-0000000C0KJ-2yRz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:18:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8c78ijd/ZzUJDBXtqOgChtEutYShZygSAqWz2BCHBq7xIQiB0dOhogfUKdVJZHBjsUQsH0o2zAdDhdeNGHb+6FMVy3Hejf0SrXmxUF7iK+XEKz9xGeHAJ9TJljZepVbf7mkSK3oTl0e59m4A1VnqI9eNL4FxscvQ5n8dMXiKkPLShOqTDKFq6ihwyAn620iZEw+PJPGIiVgfxy/Yk5pTq577d3I0FGRTa5tqO9JmGD0OtjBXFOCthPVb+6WS3LLxoweFxmQT2TF3jb0BOL5sh31b90+3pLcG40KfAdYGRQ4TVn9j2L14i7qYO+6zOq2VGfbuWX6o6TyxWgyyLfu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jUxgPl4HvjIJEKGyO4/SBiaKmdzG1JADbTf7SYef5Y=;
 b=GNayjj54UutkzOhjrG5aCJsuNMWJcEzTO5fyg4B4XHwPX1NsN0koWfL0cBaIrp9/6o33KYZ/FvVHG7nGcXiseRnuv7V3ZkxcF2cdfT9wiobxTGcKnnzYPf2q3N2+Jj1LA8QRQuGY3Z2GZOhpHe4eE4nM/82VuqfPkiVWULjOOWLGwc9L0ef/eV787x+1Z6otmSOVgxceYlS+xJyQl10G9r7yNsuckyar/flf5l8g4fQ1yp4elUuRqyHTwzJvSbUWpcEhC0CKFdx8VxjHSr3YxFXprQL01Of3oXPjap4Z7fe5EeBP2796NoC+rgFQw8vXY04WAiKnLmWlyKd33R7jTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jUxgPl4HvjIJEKGyO4/SBiaKmdzG1JADbTf7SYef5Y=;
 b=ynO+5BzYAsg80cx241lz4qkGy0+6rt27ro97OJs6481be4xIc9jpTb9l+4xxgs0amI6DlK9tW3OaAZv4gJYgp+8j9oIuZl6Oej5SxfxxnmQMw8pbc73Jy80YA2o+TN1X8zejtDJcyTDbeiy/7C4S2aguqEagUk2bC8/NgWgkEOc=
Received: from CH2PR18CA0011.namprd18.prod.outlook.com (2603:10b6:610:4f::21)
 by CY5PR12MB6180.namprd12.prod.outlook.com (2603:10b6:930:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 13:18:07 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::5b) by CH2PR18CA0011.outlook.office365.com
 (2603:10b6:610:4f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 13:18:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 13:18:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:18:03 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:18:02 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 07:18:02 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 5/6] firmware: xilinx: Change debugfs pm_api_ret size to PAYLOAD_ARG_CNT
Date: Thu, 19 Nov 2026 14:17:29 +0100
Message-ID: <9096ca10ea87d3d56e9be40894a8545eb8b497f1.1795094242.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795094242.git.michal.simek@amd.com>
References: <cover.1795094242.git.michal.simek@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039; i=michal.simek@amd.com; h=from:subject:message-id; bh=qTGZRaMMdZU/Au0bXHxiE8MiRBaoz0tels6SkznW5ks=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9+/bpsTXfxjy1z03bZgUuad9qaL9U6qnm481PdI7cF /iVy6nd0lHKwiDGwSArpsgynUnHYc23a0vFlkfmw8xhZQIZwsDFKQAT6eFg+B+80Z97j8IUl2MT F7x9nLSDpyZ/w58ffq967zzacDK3JfQUI8M5j2KLe56iH+JOHVl54+JEd5Hkte/3laxU2FOT/iC y9DcrAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|CY5PR12MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: 6492b587-1e16-4ab5-2549-08df463f8cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|261102123227099003|261026130827099003|261026140227099003|261026121527099003|261028144727099003|11063799006|261022075727099003|261022115727099003|261021123027099003|261021121427099003|261022105027099003|261021135927099003|261022113327099003|56012099006|5023799004|10067099003|261021130227099003|18002099003|22082099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info: QzX+PJa1h+ZLx8j/86cX8GY+rng4oix72NoW+NHsbG6U3PLDJOV5aCCrqGAYrA2RZOMD3PgO7xC87j4ugwnBLW4XBQYcUAWGvtDC0ji/G8n4Ntkz+JXygklDsHdJ08b+YfaA4mKALjoNMS+fdHifjaEJNuWLHgme41AcynH5NTrzYvlG/tcp0QOPdU7D1EH1Vmi5VSYt/POcn/80EEI/ykQO6e3Fo2hV9goC5XDDqbewHVGLdWXnieyoW6FVbh/VAFlIGACotE+NnLftRRGcmnG2HqNqSpcJ87l61sVyd/IzE0wm9F2Ipmr1Hh0P6rrcstM1aFi6oczBpb1qgYDRREPtwJwZeVMpH9JElo+6jJPNJLbQQ2VO85CJsKA5HGpLAin/2j0PjCnWhSPp1zQQ4pMbP99tdMsRCYYYleBKIaUu59xlpqiADIRdkRkHoAH45TushO8VBk+qZlorWkW0PSTfx6kdwiiSOcEBOqe3r9aa9ZSUY10BvHfetB2tqRPLzCuh9UlQWbkxAYe4P0zG5JGjkvqo9wK4mEAoO1hr+lHpzFVGf7EaCGAZVAeMuMLPvT83kAzwIi881/vwNVQumxnXv27fr27DTqQrHqAh04yk5h2/E3Zqu352MjzIX5yes0GtIxh2waSlEqFD0qzivy0Vsh+Vy5ln7baMuEOV2hZ5pdIG2ByNpD2wE/P/joZI60JPy1LVnb0VHA6zowXUxg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261102123227099003)(261026130827099003)(261026140227099003)(261026121527099003)(261028144727099003)(11063799006)(261022075727099003)(261022115727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261021135927099003)(261022113327099003)(56012099006)(5023799004)(10067099003)(261021130227099003)(18002099003)(22082099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: L1UWgcQBCqImUKn3JeGlCyy7q1pHYV187YoFxisNC/COoRU0DsLOEvaHI/v28VcaF1D+AumULClmkV/9t4Ye+YY3TcOdzxByN+ZMMQywayl9+v1J8fGsPh8eBGC2AHAqQhHmI0ifr6MlexzTgF4JQcWlZWDVRGUdg3R6ZhbHLJihhY5wrVIJ9BAIioHVFZFJ2rOF/nj1FskyuJOMToGSSsFhOrLyS1hcY/UPB4ZlX5OLVD3S9KBfVqQSbkLFviTXeIo/GI7xEpoMivvFqePvDMec+ZPm0GqD7HMktj0yCBdSf41Yz7fOth8CND14Lhbftkjq3nvkw3RdDcYMnvSKWgzAsAT+3czskNJ84dHjV43OhlXHK51Us+Rwj++zOgGJJc6z+GBUuFlyKoCc+macyNvpIkVgbtNyp9ZQECuCJkfhC+0S1aBuE1RZnmldf/7L
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:18:06.8721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6492b587-1e16-4ab5-2549-08df463f8cd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_051816_761205_BC7F458B 
X-CRM114-Status: GOOD (  13.34  )
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

From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

The debugfs PM API handler declared u32 pm_api_ret[4] but passes it as
the ret_payload buffer to zynqmp_pm_invoke_fn() and zynqmp_pm_query_data(),
which unconditionally write PAYLOAD_ARG_CNT (7) u32 values via the SMC/HVC
transport. Size the array to match the firmware call contract.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 drivers/firmware/xilinx/zynqmp-debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/xilinx/zynqmp-debug.c b/drivers/firmware/xilinx/zynqmp-debug.c
index 36efb827f3da..f7751912d80a 100644
--- a/drivers/firmware/xilinx/zynqmp-debug.c
+++ b/drivers/firmware/xilinx/zynqmp-debug.c
@@ -325,7 +325,7 @@ static ssize_t zynqmp_pm_debugfs_api_write(struct file *file,
 	u32 pm_id = 0;
 	u64 pm_api_arg[5] = {0, 0, 0, 0, 0};
 	/* Return values from PM APIs calls */
-	u32 pm_api_ret[4] = {0, 0, 0, 0};
+	u32 pm_api_ret[PAYLOAD_ARG_CNT] = {0};
 
 	int ret;
 	int i = 0;
-- 
2.43.0


