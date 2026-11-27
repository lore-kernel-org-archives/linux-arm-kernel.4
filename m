Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C2B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jZVdEv05;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=WxG2ZMHO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2WdBqYYUOIHDleMNDj1nK7sVmmyxrdbmKVZq9PjsdGY=; b=jZVdEv05YL4nv9
	OvFNPLpuA4UQF7iZQ8GQS8vlrVch0foWwLba/CJFKTtBvcicA9lue57RN/FVVvV00Egj1l4s7eOrV
	/0PigMbsSTc72dXIXNZChHojdrkgCBbHP5YtsIJELMAm5i/EzDRBL5Cq+MOq/bvfae0UNfnXgW3Z8
	mTrYaeUf+y57bz9y/NncWDZ/79cuIXYXVwRAKba7ODYAzbJ8wnM+uRS9ob5JEgKvnbHMwo30AGZru
	pkoXhjZLEfJWOx7FK5QvXNmT41xtcAgxDb3Zha5IUPLmKyMpG3+3nIOoHJ5wv1g2STi4O7+K6PnZM
	r4twHwjNV2ZXcpR7DT/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtJx-0000000FciW-3vgU;
	Fri, 27 Nov 2026 10:36:49 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtJk-0000000Fccu-3Juo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:36:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSYVQ4u7p033Q6F4QEjdqiEOZHySNTVf/nNIxiBdsX5ufw1aSnMVOTK9HRxQSwyNLGawHcNQDTWXA0kYIhp14ksAcokpTjDfoNhmM7vepvFKmZq8IZX+/317kIU2sL5E/SyFw0kHxInBnJoJNIsXY5ZBOKLvM/z5AT8qp4Dbz+ut82ElPeFelZGzAhU/uMcxPvzhozpeugrz51mMO9e3JiimTkJ3/2OAO6boUshIC1H7SEskbn3bskCF+pPOxJ3ZTxHaFayOud+1hDoTrS0AP3AsRmCrr6EMFqE0bWrKERAFAYKR718vsuEYkmmVD08HOOBSBcegVQ5rS8OV191roQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WdBqYYUOIHDleMNDj1nK7sVmmyxrdbmKVZq9PjsdGY=;
 b=FqTGEohxytCvGufIecknqopTe21j1QJX3Pberjdjy3/KTXhbvgUqLLxH5TVpT/FzFTyBKQUB/L5Vmjl00nsiRnv+qsUcv3NRIXRZRsWZ0Yh6Uy/hvYGfwAKfLDyWeyA7VBPH1oczlYdQY42OtCYFrsTJvtGtqYBjIdknt+mgiIUu0pHS4jV8oX5txTXGbi1VJ7bBgwRedqoPvUOOCX/omq2uKOF+zRcQZyHZ8VRYASHpkoU6Re60RLFEk9FrKl7uVuvFAGWiKbAGIGHW5k3S2LI1s1t5VmJCrCkt6mUd6exhYXKmlLq4+/TzJgKl3C5iTCQ8eEdLBN9JVLxoKL6Pnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WdBqYYUOIHDleMNDj1nK7sVmmyxrdbmKVZq9PjsdGY=;
 b=WxG2ZMHOTFWhj0ZkbzGJRm7v7LFWAdg+MPeR751uCnMLR3Fns8FCrehe/Rs/r+VNW6z9Ol5BhSn6aTvJ9af7zeotPR9K7pMcFvkiliAZcAkA0bR0yCxA620VLHEDuKWld4LJmMzQZqryqVzCwVOzOG9NH7yDKTSgJWeyi71/SfATiQImEzLyYeFpztRbpfZ5BuRQ1dryoa/ILy4v0uZKyuPEQQ2WtBQybgjjj55GVWZGgs1ldnMN/OYumt/Ob3sSWJePcdb5I7P9fj9DkOVaVUOYMluuJadnc0GDbHFh8vAgtX9SVrAa4SqNI2WUC9M+pQEAIO8CnJk+O9uytNORbA==
Received: from DB8P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::26)
 by AS1PR10MB5771.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.4; Fri, 27 Nov
 2026 10:36:22 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::40) by DB8P191CA0016.outlook.office365.com
 (2603:10a6:10:130::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 10:36:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 10:36:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 27 Nov
 2026 11:37:27 +0100
Received: from localhost (10.252.15.170) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 27 Nov
 2026 11:36:20 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 27 Nov 2026 11:36:18 +0100
Subject: [PATCH 2/2] clk: stm32mp13: remove LSE from the RNG1 clock sources
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261127-ups_mp13_clk_rng-v1-2-86bef8c05ce9@foss.st.com>
References: <20261127-ups_mp13_clk_rng-v1-0-86bef8c05ce9@foss.st.com>
In-Reply-To: <20261127-ups_mp13_clk_rng-v1-0-86bef8c05ce9@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795775777; l=3136;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=dBPONFlFMVdXFOxZScIr9F1RDnArKAgE0cyZSOuAKcY=;
 b=Bv+9wXtzqZSXAxB8coWx9A7IiwszmvQKttltlVxtsqTYhDvaU3ozfRL1Wac0rwYtY5dM7OvC0
 Z1pvW675DDpCv8oVCQkJvu3PIrTG9r1xUsp5uhXHq7fxqxiBo5nG7EI
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008859:EE_|AS1PR10MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: 6974f850-8efb-49f0-1f9b-08df4c724759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|6133799003|18002099003|22082099003|3023799007|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261022075727099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: JUNlNYAbpn+OtaiBrkbh9MNAAJTKj13sAcSnKnIt0IGqsd/M9AA52ZN5cadeAI2Y4CceAVuoyVmuwa/ekpw8jJatvvC53bWsncAYZpEWoIflX0LAI+sjkofCHYlGFn6jI4NHR7zOQUJxBHkyGs4AWEpew3Fa4PftBOXpQsr2BPtZGNLJ/smvmcdLTrMVtmB5JwYVLfLdpjIzWW23UN7SFK6xHCYyZumhbl1BghBrkXX+VfFw8guHCifHup/C6M1PVUzvvoKMSlD9jt/zzE+jIMdRsocI5v8pi5PkI/RqsJnElL9bTFM8hXJlb6s5n+OH2vv/GDgVWgnfbyD3JqRRP6VDYOlRj1sB3+A6QG9OL7ct2mqMTUuHPdgMttmrfWP7x/tRTW1dsrpO7O10Nv7rhVLSvxUfqH0ZT104b11vZsZyVseU1DAASsnCy1shgY39v1c7rd4YBuQMsNkINKBCPQKt1inC+0uNBO8jLwNCfLKGQ+KtO/EeAqpIhzdOVSLdcpJglO947g/4Kfq/8dzQsvB3tXnLzPcU7Z6kjG9xgOPPWGxr1sJd29iAYUhLfkvKkf8UlcHjuO+76+rgELA7Vp7aw5uJDWptm+D5eF6Vbm44sFoeidgsj/th3Vxa28nYZvYpp1IwafbFPjg2XblvNIlbcI6Ri2qmMljbKVQaqCjnr2/g+NeSB9Acti2NG33XuB495Sv0mXSNmiHMVLp/ug==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZMeDjpsjxlj3JTCZEcPsbaqFIlENA/lGHQzvYQMLY4yHT1mVXZrCTYuD2v53VOp4KfNvJxvbiFJQHKJVIKhq8OXYCxfC/4zh5tGfG52GoMCWSg0or4ZKdhkFfpiK5XAXcAZJrhxuR8iCvL+KFMkOFkRY6EbH+Md10NBAPws77OTrxcK+WD5PDPiNWVj704A7nJxPuF1k0TH2BQaYE84PCXTUj2nbDwR/6tKBfDX6MNPql0EtFgwzh2aEnLsjFMjCeLK2dNTlASMdZ60wYWtA9pRla5dVIx5CezSJ+PAnczmoz005L0C4ZiDNZ1/QJ0sKecjfY90Bt0JngGIeWcOtXovoZYrf+v+W8tClfJrAORHKeYCtSvAmczmBsF/m4cynI2r9OolSePAURSYncnKmtmlAawhMitICWRofedhEczeQEVZiXzA0USlruSyHBZd0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:36:21.5710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6974f850-8efb-49f0-1f9b-08df4c724759
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5771
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_023636_845166_E107440F 
X-CRM114-Status: GOOD (  12.14  )
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

On STM32MP13 silicon cut 1.1, the value 0b10 of the RNG1SRC field of
RCC_RNG1CKSELR is reserved: LSE can no longer be selected as the RNG1
kernel clock source.

Simply dropping ck_lse from the parents of rng1_k is not enough: the
parent index would no longer match the register value, and ck_lsi,
encoded as 0b11, would be at index 2, so selecting it would write the
reserved value 0b10. Remove ck_lse and describe the remaining parents
(ck_csi, pll4_r and ck_lsi) with a mux table { 0, 1, 3 }, so that the
reserved value is never written to the register.

If the register holds a value that is not in the table, for instance if
LSE was left selected by an earlier boot stage, rng1_k is reported as an
orphan instead of being given a wrong parent.

rng1_k is not registered when RNG1 is secured (RNG1SECF set), so this
only concerns configurations where Linux owns RNG1.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp13.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
index 90c4bfe1b2c4..fb0d5e0cc4a3 100644
--- a/drivers/clk/stm32/clk-stm32mp13.c
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -352,20 +352,28 @@ enum enum_mux_cfg {
 	MUX_NB
 };
 
-#define _CFG_MUX(_id, _offset, _shift, _witdh, _ready, _flags)\
+#define _CFG_MUX(_id, _offset, _shift, _witdh, _ready, _table, _num_table, _flags)\
 	[_id] = {\
 		.offset		= (_offset),\
 		.shift		= (_shift),\
 		.width		= (_witdh),\
 		.ready		= (_ready),\
+		.table		= (_table),\
+		.num_table	= (_num_table),\
 		.flags		= (_flags),\
 	}
 
 #define CFG_MUX(_id, _offset, _shift, _witdh)\
-	_CFG_MUX(_id, _offset, _shift, _witdh, MUX_NO_RDY, 0)
+	_CFG_MUX(_id, _offset, _shift, _witdh, MUX_NO_RDY, NULL, 0, 0)
+
+#define CFG_MUX_TABLE(_id, _offset, _shift, _witdh, _table)\
+	_CFG_MUX(_id, _offset, _shift, _witdh, MUX_NO_RDY, _table, ARRAY_SIZE(_table), 0)
 
 #define CFG_MUX_SAFE(_id, _offset, _shift, _witdh)\
-	_CFG_MUX(_id, _offset, _shift, _witdh, MUX_NO_RDY, MUX_SAFE)
+	_CFG_MUX(_id, _offset, _shift, _witdh, MUX_NO_RDY, NULL, 0, MUX_SAFE)
+
+/* RCC_RNG1CKSELR value 0b10 is reserved */
+static const u32 rng1_mux_table[] = { 0, 1, 3 };
 
 static const struct stm32_mux_cfg stm32mp13_muxes[] = {
 	CFG_MUX(MUX_I2C12,	RCC_I2C12CKSELR,	0, 3),
@@ -387,7 +395,7 @@ static const struct stm32_mux_cfg stm32mp13_muxes[] = {
 	CFG_MUX(MUX_LPTIM3,	RCC_LPTIM23CKSELR,	3, 3),
 	CFG_MUX(MUX_MCO1,	RCC_MCO1CFGR,		0, 3),
 	CFG_MUX(MUX_MCO2,	RCC_MCO2CFGR,		0, 3),
-	CFG_MUX(MUX_RNG1,	RCC_RNG1CKSELR,		0, 2),
+	CFG_MUX_TABLE(MUX_RNG1,	RCC_RNG1CKSELR,		0, 2, rng1_mux_table),
 	CFG_MUX(MUX_SAES,	RCC_SAESCKSELR,		0, 2),
 	CFG_MUX(MUX_SAI1,	RCC_SAI1CKSELR,		0, 3),
 	CFG_MUX(MUX_SAI2,	RCC_SAI2CKSELR,		0, 3),
@@ -586,7 +594,7 @@ static const char * const qspi_src[] = {
 };
 
 static const char * const rng1_src[] = {
-	"ck_csi", "pll4_r", "ck_lse", "ck_lsi"
+	"ck_csi", "pll4_r", "ck_lsi"
 };
 
 static const char * const saes_src[] = {

-- 
2.43.0


