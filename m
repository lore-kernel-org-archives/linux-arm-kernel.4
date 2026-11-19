Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BCA60A2608
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1dcgL38o;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FrAbelM2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fjiil8ZBPWSYIvaASS9MOgH5zQGHhb0si4uDAcvR9oI=; b=1dcgL38oaR/y1CCeGZTBvElsKm
	9SjmQNjt182S/I6Mt0eLiBub4o5MrA06wypvM/eeSFKdHfhSfP72zIijOK+BrYgoYKVLQHxNC2AUA
	Y2uAq6TNmnNnYbnmsAkX0RJovQEKif7pXDNfwy/QBmP8hesKq8oMWnLKV8rOcoj6f5nIP0B8Shz9Q
	7KO4tGo8mmj3rtu/ooXmQuq7TXDsD00S/1vbzmbeLMT4jxb6gsfZKgfJCNtE4y5L4wOnclAt178TY
	vdBKj4DcRI/QFZb/sHxicWNK52YwKEIIhtpbwo7jwzgq7T/o4pTyY9Luu1KKKn+Cp9gWUVv7n+zT6
	yYnFPB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU21v-0000000C0P1-36R0;
	Thu, 19 Nov 2026 13:18:23 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU21s-0000000C0LQ-1aAz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:18:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atM8U8eiiD7yO/aRxjxGxBjvcOfB3YHCj3vOFXWLYW+axqQ8mF1sAOYy0c9Buac/3MWEjjc5n2UD9x+DmG6IiFkizDb1+U1bGmJwYZlPYSq52B/xkQ4Nvrbw9WcEc+bQcDoNrUYjFs6ck6OM6ChR3E8IU7tvHRRUCdhHOiQeXJFJopwVcN4Mr01eVHXk2GLnTJ9n0B9Rawj5p7BcaY0ruphw6QzCDDsOm4e70q/hbsYBgvqyNEkVvnhP+vW8C2PVlotOlFmhX59Ataxq3iXHzPpy6iJMXKovM68Pe1Z6YLO2urjObXj0mPK0kBmnFDtl6fAaW/0KeZB06tVpauwVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fjiil8ZBPWSYIvaASS9MOgH5zQGHhb0si4uDAcvR9oI=;
 b=U37tAvzZb4U9kvVolm3nQ/Mr/JNgbQ+c0A2OKeefnNZdehH1ovXxKk5V8+jaMxOI+SHHshKaJyN0dqqxTMNNiBXxs1qJd2uSO2K0T4TPmX4z6ugRQ984fw2uH1cGOz9lLWZAZ5OLYP0MEu5puLXLp2wAgSAsjA+hYa/pmgnnRT9xW44uiEa+nCovEEJ7QP8DZOYU/W7rmkkSdwWwm1DEtbd0InQ1GsJOyk/3rjnz3AvCfIdb8JuKJzCC5zHyKX8wRsrztP0pV3SMFvRoCvJNskBh/nApxsMvT0Ov8addqUlERhCV60FOkQB5E65AhArgykMnMdnvPZpzvVz5Tdmj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fjiil8ZBPWSYIvaASS9MOgH5zQGHhb0si4uDAcvR9oI=;
 b=FrAbelM2WNZ9MwKur+dRHB3y+2pHP4M1a+ge2H2ED9DwS+WrZl98yEfRPMwTEVsGyAOy1LVdeBaULUYIkoPNTm38AMIyXVYbXLvNtp7pFUgQOVQC+OL7C8Y3CBJ8jiM9P793MxYrHnGdwXPBiI/wo5EC8TMfHGrYCRn5MVW/dkA=
Received: from CH2PR12CA0021.namprd12.prod.outlook.com (2603:10b6:610:57::31)
 by BN7PPF862C85B20.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 13:18:10 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::95) by CH2PR12CA0021.outlook.office365.com
 (2603:10b6:610:57::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 19
 Nov 2026 13:18:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 13:18:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:18:05 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 07:18:05 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, Jolly Shah
	<jollys@xilinx.com>, Rajan Vaja <rajanv@xilinx.com>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 6/6] firmware: xilinx: Bound debugfs clock name formatting
Date: Thu, 19 Nov 2026 14:17:30 +0100
Message-ID: <c2dcbb74fa6ad3c716daa747c024fb73e5f5109b.1795094242.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795094242.git.michal.simek@amd.com>
References: <cover.1795094242.git.michal.simek@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546; i=michal.simek@amd.com; h=from:subject:message-id; bh=M1a22fgz/bdtA5DcyUDVrD3dJcQxkVae0cdsBDV8pb4=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9+/b55fv/388KW/kF5/Y3nRFn+fAgJZGH6duyn4Ip5 ouTGLY3d5SyMIhxMMiKKbJMZ9JxWPPt2lKx5ZH5MHNYmUCGMHBxCsBEDpYy/C93eDPvp0HzbdZ+ 0WaBrEvZ6Ql/FmW+SjRS6r184K1YUCUjw7Ymg+lZSw5ff2xycI6xnW194Kk9Fy8aPX55P6XQILL oFQ8A
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|BN7PPF862C85B20:EE_
X-MS-Office365-Filtering-Correlation-Id: bae5dfee-75d1-446c-e0eb-08df463f8ee8
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|10067099003|56012099006|11063799006|261026140227099003|261026121527099003|261028144727099003|261026135527099003|261022105027099003|261021130227099003|261021135927099003|261021123027099003|261021121427099003|261022075727099003|261022115727099003|261021133027099003|261022113327099003|261026130827099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LN7ly8uUDsEQn2jbl5QOg2RiLr2HY2fDNhdMoFthXMcFBxj/POkSDXt5QSYZW5hZXS2nRXEr+v1jgnceR3i8POAeu7Hb3OVVkWGf738Kqq3fPLmcM3/kPhC2M3B/YEW2phOCaqWCEG/5fMvZ7O9xu4o0YQh107XNWU9IK1Nyv19N8/XoBhYlcRd9sTJqqQLl7NH5xeQBjO+NntnJ/QUsn293WFsXxt9JD7T9Jwa7WSvx4+Ooq8fQ60zBTyx8DbIrF+UQcKVn5GZtgxN/WozkzpY0YGBG3TPgfrLzKLt/GVXoej+PGF3hXS6tkBBZeqJ5PO8kLsLpaNuHpC3SzQu1qD/b6E4yDSOI7JdAy+bCuaLRbef0T8lg/FD/G3efJ+8B8tzXUuOv29Hutf9RJQVJm8IjjDwZYqJqnjI+/PRWe+TIcJo+6MWlgm9PWyZuV241vZWDOI8J6kwizdLrvbxTTP6vWaCj9RO41716GVb7f+E3lZ4f7YdJrAzLcSUQRgcdBO2/xv4qiZ+Dh6/s6j0WDvlMGucJtcZ3MoZlfP+WHzox3jhqvCTfGqaMPxf6F5LCfWUU7HF5jVL8/aVTYMnrBouystJ/2rU2EMfIaOzNc0Ur9oWaijALvyryfRcvdVsGIkUmOx714U+F0yHZ9ju6PfPl345degGASISci4+cMPKVzHLO/WpAZwe6ex6ldUdI137gyXNlb9pype8uo3YJ6A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(10067099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261026135527099003)(261022105027099003)(261021130227099003)(261021135927099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022115727099003)(261021133027099003)(261022113327099003)(261026130827099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RQq+T64FyrneDj1KFR4oA8hYPhJYWJ5gJBXYwxq5oSzLX21AKHxoEIyGkdTVhK5KJRDExym6m8v2R73SCCrNj/YBymqlSDyg3VQQoSd91g2hG3qbRKkL8g3/IVXH3kguorwV1ldrANILmqtRX7r1sEBO8QPirLLmzeFI9bWmpZ0ZlVhij9XKhZvBh4aWXuw5h7tzdaMpZKZa8QwRAcGguhjE+FKh24Cnl3Pr8+FA2X/HC95xRrbLXS/lEVSDXEyBjnkPBqBBNFVpfuzt3Y8ERwlKmo6HsBz/Co9dvqfBkBLaGgg9BkgwNEBL+iOJ+e55qwxktK/Dud8B2oeobHAOIfRnLulT1HbTi98hiWhvNSd7HXMTEnK3FMlTciTiC/75TGbbe32i6QzzMeRTjei17ODYMD7e+HoBHuVRh8P4qgwAL820KgMPd92iLfE8r+Aw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:18:10.2654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae5dfee-75d1-446c-e0eb-08df463f8ee8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF862C85B20
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_051820_424778_D78A95E3 
X-CRM114-Status: GOOD (  11.78  )
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

PM_QID_CLOCK_GET_NAME returns up to 16 name bytes with no guaranteed NUL
terminator. Copy the response into a bounded local buffer before formatting
to prevent kernel stack data from leaking via debugfs.

Fixes: e60f02ddb4d2 ("firmware: xilinx: Add debugfs for query data API")
Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 drivers/firmware/xilinx/zynqmp-debug.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp-debug.c b/drivers/firmware/xilinx/zynqmp-debug.c
index f7751912d80a..77b35a525b96 100644
--- a/drivers/firmware/xilinx/zynqmp-debug.c
+++ b/drivers/firmware/xilinx/zynqmp-debug.c
@@ -21,6 +21,7 @@
 #include "zynqmp-debug.h"
 
 #define PM_API_NAME_LEN			50
+#define CLK_GET_NAME_RESP_LEN		16
 
 struct pm_api_info {
 	u32 api_id;
@@ -279,10 +280,14 @@ static int process_api_request(u32 pm_id, u64 *pm_api_arg, u32 *pm_api_ret)
 			break;
 
 		switch (qdata.qid) {
-		case PM_QID_CLOCK_GET_NAME:
-			sprintf(debugfs_buf, "Clock name = %s\n",
-				(char *)pm_api_ret);
+		case PM_QID_CLOCK_GET_NAME: {
+			char name[CLK_GET_NAME_RESP_LEN + 1];
+
+			memcpy(name, pm_api_ret, CLK_GET_NAME_RESP_LEN);
+			name[CLK_GET_NAME_RESP_LEN] = '\0';
+			sprintf(debugfs_buf, "Clock name = %s\n", name);
 			break;
+		}
 		case PM_QID_CLOCK_GET_FIXEDFACTOR_PARAMS:
 			sprintf(debugfs_buf, "Multiplier = %d, Divider = %d\n",
 				pm_api_ret[1], pm_api_ret[2]);
-- 
2.43.0


