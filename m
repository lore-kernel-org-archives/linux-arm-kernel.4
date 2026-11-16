Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D69606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 19:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=owlqAVc8;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=hHf+ZY18
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wEEmZjD0vKv79FlaKUDu+FMv5V2rsZ7LB2NoBC7xmrI=; b=owlqAVc8uP9gwwHMFMCGuLMXvM
	H/oI0wxofXJ4N3OS99StHhhor4XD/00AvOqN0GO0nfme1raG9XIlegwpffpRe9Q34QJFSbGJic2A/
	n9H061pDMDwBX7+/1z63+sKNmuJfRctbw1NcbitqacAVhIENyzIFLnu6KXPwAsl7A8K6L0EeLXChq
	Yg1sPZsU68WO3fqCyErEU0DLYB31iSInNWyXlWzjX8DiECyGDAwaFvxpPT2NLMuFrlt9OhvOTmNZw
	R+DhSceTG5OmOAcdJvmPnjDctnyn+LjHl3sXu21FzPZySxudxE5S8hSOx77hIeDLc6Qja+TtYf0mp
	sPJ863+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1xc-00000003h7v-1d6G;
	Mon, 16 Nov 2026 19:01:48 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1xZ-00000003h74-3MeN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 19:01:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoD+ROPwD0u8Vol1616PCBapiDfOnU5WDFYeTPuVeo89hAdtxq5BeFN1LHk8uoLKk8LhRDxsMU+fQYHO5TKi55QkAR6838j6Yoz4/tvSdmOHJc2hNM+8OFV2J0vtcY48qH5c9l3ZPvEP2SkkH3GYsS6vTMtWqBTyEq4MJWTrnK5HSKK2wQXHe48ONy/06Zq2Qc+Kr9ipPrrwZNsXgH85QSBScLOUXzGBmMAqlHxH/4nf/tfyoHcVp8E2a9m7C3hZzOLVs9eryPSsRwk2a8qsnKb4Fd3uZbJN9Iezx9PAU/ztTvqwRmeVh/eb0uItopbLOcO0JWpm8iA3+K0vzQFK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEEmZjD0vKv79FlaKUDu+FMv5V2rsZ7LB2NoBC7xmrI=;
 b=nNqfbcGWleVWnK/QmhCCf+GRnmQ75dSoDSuwqe3Z6VrBO422iM0y3Ngin094QcC1bjohI6vd8EVaYhCdKnRv5BhR0JbIHQIayditRCELg4qlvjxDPyna9EZOrhEyqoaw3SmCZE5a8wF/JLS+7LD8XxO4jfcDtQVD9pUHSQsno5G1vQ18HKxDkI02B1g/kv5aFWEJhzmft0wHWNYIaQgVdMf9NqfpBNVF7fVKaLc3Brs4zyRmWMTb/afBA2c8FZC5v3CGowZvsxvtEF94MhCjBsRgIgHB6ePvSDvO2+i60gfwuvpmDD9zxwlAVAWVoZjI057a4zp/BijHyBHrudITmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linux-watchdog.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEEmZjD0vKv79FlaKUDu+FMv5V2rsZ7LB2NoBC7xmrI=;
 b=hHf+ZY18mQ58hpF/gtxNu3Hs2xboUCtzA5coFskh4JI0FnDgmn1thZsxmeOPaFeR/hzfq4c+WQ+Ydjtm/bUwtDObn3b3zaFugBlTv3A6GxcvSBmeFv9h1R2kQw929tFCbE8RAqd4VXyU5zquFuCrONLjfxpN2GmQkgMH0r/vJy+RQmiCURGE19guSEuDUYmaWrvFNef8VAzWvZfWyjp6UHGwVqvCIhQMdFsj/vDiysnVFZho9fNEkDrwTAz7qF4iNgEX+jlkSQ2wMKBP507TaJgcs1XJlWWn5gx6bMaruLLAMEK/AfniKUhobsjR7tqikGNTvQMf7SWInvfwUB1/kg==
Received: from PR3PR09CA0026.eurprd09.prod.outlook.com (2603:10a6:102:b7::31)
 by VE1PR10MB3886.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:16a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 19:01:35 +0000
Received: from MI3PEPF0000847D.eurprd02.prod.outlook.com
 (2603:10a6:102:b7:cafe::ad) by PR3PR09CA0026.outlook.office365.com
 (2603:10a6:102:b7::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 19:01:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000847D.mail.protection.outlook.com (10.167.240.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 19:01:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 20:02:18 +0100
Received: from localhost (10.252.15.73) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 20:01:33 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>, Marek
 Vasut <marex@denx.de>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-watchdog@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] watchdog: stm32_iwdg: use managed variant of dev_pm_set_wake_irq()
Date: Mon, 16 Nov 2026 20:01:30 +0100
Message-ID: <20261116190130.1191501-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000847D:EE_|VE1PR10MB3886:EE_
X-MS-Office365-Filtering-Correlation-Id: 202283bd-ab5d-40af-ea0d-08df4414090b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|6133799003|13003099007|11063799006|10067099003|56012099006|261026121527099003|261022105027099003|261028144727099003|261026140227099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: trZ+WQKHD9KK7P8KlygY0SopexucDKtCN0QCQS3/nAHyzomWiyASwb9Ei3Pqd00Nh1jl7ZYbnLDwhp4Zw4GBFli60hZrYnpmft9vhYNWserpOOGN5PMMzIzegBrG9cj1nYiVVfw/rzzxS5GQWciWHlCUHgdptXsrsFhiYnz3LwMjq11O4PPxwrCQdmYsUX4/xJcL2izjiKehWwBe2wCnkqJ7daAIrhUYWIbYWvq7piFvutm9SHiVU6ayJZ5g2cquw8ByfWRXOMFtfkR2ag7YCr8HGyvgazqkISZIR4TJKnbZZ4TCGlY3I+cAOSuax7Og6LCx9W4ZclV4eskOkJYwZ/imZhKFLDEKYmhwwFzbJWwlGdZ7D+DwJ92YoNsuCWdRH6cKlVhH5R9jwXoxRlRvSnXFXLqGpaqv1NzK8ZaOM4Ac17onMPsj7fs347UYz2ch6pXIooumrnAVxm61CFzLX4hZh5h9AMmBGowos6NlNzbrm2ITT2hBLqm6gWeGBWSRex7ep17vN8lppcly9QMNFLawwMurdmhh+ZtLmvfOmpULH9XHdRlmXRWlLdUKB8i5KGWLFjGXuidYcq0MUuBJVfhDxxnfFen3UHt2ilGBnrD2h5ORA7WZQL8s0wTrCKOXj9jrd7CtzoyaSowhsT8sHg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(6133799003)(13003099007)(11063799006)(10067099003)(56012099006)(261026121527099003)(261022105027099003)(261028144727099003)(261026140227099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kHMOZSrYRdZyV9nKMrY0Qnx3vfM3FJmSd7/N/9mZhQR4grVGUFW2ssdNbjz74TCWlJJBonzTyOKGQY+tLZel6c8thZzd1WspjhmLaYTat4eqwVIF3JpA0ssexKQeJCoq2ndZpHhv6zb8JdaRD5QsjM1DTXGkPa4xEhQPGANa8T5IetF8c7wbgHoGAVrwze1569rZcspFWj6LXIIZdkRysv1v9ehCw8QhGhRpKfzjVlJ2q7+OiJzsh/DIypuPc1N0NVx8wDs9hVFkjPl5fkIfRV9PQqzzGfPhzJGQoou+f1tLWamPQ2XI0e+UmYXmgctIBXYh2/v/X44UNQCajZ1ykOsiT09e+5KvE2QAJsdDRmX5V5oOlEDIRQDLLCpyucLKcTN1O5/cmCZBbJ2g3aGHcaLH/lcyCtGg1yKMf8ssm5/ScGzvIBZNGwYZ37mbkBvG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:01:35.0905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 202283bd-ab5d-40af-ea0d-08df4414090b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000847D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3886
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_110145_950222_339D4E9C 
X-CRM114-Status: GOOD (  12.26  )
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

On probe failure after stm32_iwdg_irq_init() or on driver unbind,
the struct wake_irq allocated by dev_pm_set_wake_irq() is leaked
and dev->power.wakeirq remains attached to the device.
Any subsequent attempt to re-probe the device hits the
dev->power.wakeirq check in dev_pm_attach_wake_irq(), triggers a
dev_WARN_ONCE() splat, and fails probe with -EEXIST.

Use the managed version devm_pm_set_wake_irq().

This is reported by Sashiko inside the raw log of another commit
that touches the same driver.

Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/message/20261116132416.1184447-3-antonio.borneo%40foss.st.com
Link: https://sashiko.dev/#/log/249869
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/watchdog/stm32_iwdg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index a8d2db2d3cf8b..f1056f8100cf0 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -298,7 +298,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
 		if (ret)
 			return ret;
 
-		ret = dev_pm_set_wake_irq(dev, irq);
+		ret = devm_pm_set_wake_irq(dev, irq);
 		if (ret)
 			return ret;
 	}

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1


