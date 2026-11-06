Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF70C606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OA7nBuBC;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=msbo50db
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=; b=OA7nBuBCJ619in
	5AVDMPvFMoxuIMZctQIW/OjycFyomfbM9H50P50bQvdxDDmU+JKpurcKWke5ZtMYsdwrNmmy4mz7I
	pUKta+NW809FQugI4Q3whunJlUYsHqZA86Wie3RknqzJyBoo06r4Gu5dUcvVRuMrD2HLmEnYyMj6T
	+zNy7sKXuJ2butwG45zvhjmdU/YrveHns9guo+PsmOGE0JXD7NDUKn40WkLrpKScq6tnzhZbkUAYP
	/eE0MDPq2TVWbvwKZY5vIBfvcixVRc+PA8a6KYM12gxYNQxi18Ng6yTV/h+7dJGj/MX2fTYuS2tJW
	HMsNXv8gTIUYJojFwSBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLyy-0000000CqEs-1aEv;
	Fri, 06 Nov 2026 15:36:00 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLyu-0000000CqCS-0qNZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:35:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fz2xWbbhWsQgho9enBmnfttGcPn5Tx7k4fZQH/xFSuTfzJPtCmuZAAuj+BewkdkcE//zzLbZ/RQDKInImG5XHolDKM+2PfQSkkBAg2UL8dl7GCg/qBtgDiEP2iDf4M+PhvddSqYQh8l14nsVyCoc5yaMK6VnZ/5zjaa3mA3tcmJA762FbUF+JBs/TEltqApSfopZzBQFVnrI5KuEhB6W1R2kNNGDmDwtJd/JnXhREhNALHySvo+7EfmMr5MQnKmI0mqJovlHH18kKJ6F4q2Ep8PlcelVqJRYjQh6MZ8Zz5uXbx6cRYyWDkiBEeo6SqhkyISlY9FU0No75WsxyhTdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=;
 b=NAHzzQDZM4jAzzyy2/30U5RY8N87o0Qps+03ksbw7cay8iYhg8oOvGN0xMiFt1ELwCPn7JYWM62qp93JruVPBXW0E80IGkJeRrgKdVUqBDkf0Gkq1rDzsA8fxePQb8P0dXxrQZYkp1saBmdDgCeHbl/5SZxdJhsfH527/wFJvMOfM17qBXtclthcEhTzD/iNmzZ8NayaTOs8ocgvVKtFeiGfG+G2nISX9cjP7k8boB1SY/Px1Ql74+yIBdjNL7ox8MzlqBE74tjYSO556tRuywZCJAw/vW3vqpmLuXE4QNpZiMspfc8pkGOauMn9f8nunPNSIkcIaFghom+gZXMXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=;
 b=msbo50dbgRPp6e9B0HvO++kym7KqDn7gJ9ovswTA0aZoj41yfC8zeIoO+g0e1tm1l8aSZ+PtZZkX7zuiIBQ5nLqRv5goOwuW8lS742cTPmdxSuqa3M7geUC190VOg3CHqaWk/p1rLvvUYxx3/bdrP1I28FU9pSTdzK74KWq0TnQjrlzMEMyXXnU00+mLdDqMws7LzergbDfPVEdih1e92WRek/kMSp15MbFv3f9sOMHS/9zwDJbL2nKkMS8t8kELxJBFE1ARkwHZwguYEGAhaIlz8flzsNAoA/dqFCMkjPjj559cPg4zjmxAw80MFMZu74sF4Y4sWpGqd1bw+l/GXw==
Received: from PA7P264CA0466.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:398::13)
 by DB5PR10MB402168.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:5db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Fri, 6 Nov 2026
 15:35:52 +0000
Received: from MI3PEPF0000848C.eurprd02.prod.outlook.com
 (2603:10a6:102:398:cafe::aa) by PA7P264CA0466.outlook.office365.com
 (2603:10a6:102:398::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:35:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000848C.mail.protection.outlook.com (10.167.240.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 15:35:51 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:36:21 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:35:50 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 16:35:32 +0100
Subject: [PATCH v3 3/8] clk: stm32mp25: update register with reference
 manual
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-ups_mp25_clk_update-v3-3-4a32f68119ed@foss.st.com>
References: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793979349; l=760;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=IR7Qf83XRHd9KKifUWIA16iA5fTVyfnLbI2U7E5fr7U=;
 b=aYL8UWpyXjE+5fbIzRJVzqsBKK2YMgdgDM12RWO4uii4dkFlcc0YrCv290paz0JcfihQJj3A6
 k4iesAuR0N5CQ2Z/ckpACOSuHI3nzYpPF6uMb+RGMeIRatycfSHvrCZ
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848C:EE_|DB5PR10MB402168:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d2e972-e232-4a63-bc32-08df3c1ba3cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|22082099003|10067099003|18002099003|56012099006|11063799006|261102123227099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: hxuL4Lyt34Cfw4e+OH0kZiyhSajC/xJWWyKd2A7kwZQx9+EgfbNGP0oMoLhFGdLKT0+mha31bhoV2eObBHIQ7sthzT7UqH/2+wKtoWBS1+UUFD/TmTUlk5Vf8Qq77FF/nUDOFfSqsvDS4J98FMlDHL71WbODvgasQBxEg/m9hBpfeKqm5FYSfTYsux7qBxRDVqS0ZVpwUJOhQdx287OSDMEVOtcaGhSfA2Fgb46RJuqCtNYpnCGSqNw2+jHIfHSz6Gt/+FX49b54AbHnVOJcKdRyIu2kK5DNDrJ5q/whixe8OE0nEsjsQLONPbkMwwYb6ipR2buJVkulpqNU7PNH4BdkBubd0dSBLI4ah/vAAsR3nuLFlQBVmaeUWb2hgGrOLxFvd89bc4nD9aWTR1mTTmr28XSSz/f/NUvKa3NZu8mSkaJJsNcMoUddwobLRsDfMBPgHHpilNDE1By+tyR5gVAZl73n4BnfKxEC6iMqn5kJNonvv4m2EEbJQbzJ0sn+ujE7UaDuehTdr6g7LHmz4wUh+ucbpjMUi2X1phIIgnWml63XfMx5iUMQIEHy8F2HU9cwHsn9f9ROAS9xBQG5AroPExUqowqYh6YzVvlcDp3Lfc3DeoIYFvYd/VdVobXUSj6cv9BfXJCIpMqDFsoPG9q8a6gE7qw2tS4h7eXQoRGveDWtxcsiWWFInUbBoBd7OwfDmwEiUZnpLd7OPdHR3w==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(22082099003)(10067099003)(18002099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bIqLpkXpLDOq4zKPFYa1HcwZSZ3q6vn4GX97XTwpELY+s6dAeY12coCZA59yY52yn2XPafDIi6Q6tIEqK3D9JVdXPKn0TX3DXgpTL3ssIcY2npJzwOmgXC+0vHxAi/U4myCEXuVVISSnY5f/oZ0x8ZTpuVV3+bfN3ZrgPPtQB1cYwioyGEpHaqve0Coq6/QeF88HZcsqoGvlFpiY35snhUi+eVycop751i8Sr/s29/xz3iXgnjZz/h2enlnspKTGGHzVlD+EMZo/yeLXwfT18Cc3a0dOnLWGck/DPcPeMPDUsXO12UphnD8yw+Vddw4ZHfORo0jC0kybfVg/Q15RiVxxlGZkCHyljWVrmVLkkkC+ni82Zk1Ka0IBt8POUrNoFcZod7ZsARTZFw5hdGZVNr5EhlgdOQiBjJWWe5AeflrrLpaMUVyD42sJzDZfahwc
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:35:51.9052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d2e972-e232-4a63-bc32-08df3c1ba3cc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000848C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB402168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_073556_613736_AABCA3A2 
X-CRM114-Status: GOOD (  10.02  )
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

Rename RCC_STM500CFGR into RCC_STMCFGR to match the reference manual.
No functional change.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/stm32mp25_rcc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/stm32mp25_rcc.h b/drivers/clk/stm32/stm32mp25_rcc.h
index 687bc6a78627..421c74dadf8c 100644
--- a/drivers/clk/stm32/stm32mp25_rcc.h
+++ b/drivers/clk/stm32/stm32mp25_rcc.h
@@ -319,7 +319,7 @@
 #define RCC_OSPI2CFGR				0x518
 #define RCC_FMCCFGR				0x51C
 #define RCC_DBGCFGR				0x520
-#define RCC_STM500CFGR				0x524
+#define RCC_STMCFGR				0x524
 #define RCC_ETRCFGR				0x528
 #define RCC_GPIOACFGR				0x52C
 #define RCC_GPIOBCFGR				0x530

-- 
2.43.0


