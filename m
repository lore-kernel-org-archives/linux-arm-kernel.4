Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F32C60A2630
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kvXyIzyn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yc36iNKm1if18CCBHrylQHXle2IcVzSn6++cxQzZJPY=; b=kvXyIzyn1aUOMk1V+fp2C6eVHt
	01FHRUCbUkZT86ykEI5fQ0q/JYgx2+UifcSeRRdo709eGflGHRH4Pd/HqNWAUK7wJeH1pGyD2ZJSQ
	I4nRqI5P2q7ZFsoeoeTJmF3BasOZ5Fc3RX5ksEWZtIFjgl+IG1k8lSrSmJ4Bj3aL4PaD3jnkbtfag
	m0hLeugWMGpd5s0WMBKoe3q56rgDRKycl0an8QSNXuroVznynNylp2K2XN8s6cfpAxssKK8QUIwja
	WdJJP62d/DzLCcsOG7i7VEK6qr5Sa0vR/JShvicpTXrUCfvYFundTbBr0s9B4f/PXHUcT/Fp3EWyC
	pOzj73WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFjL-000000058wa-10Qe;
	Tue, 17 Nov 2026 09:43:59 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFj9-000000058no-0T1u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:43:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTYf5gUapo0+Q4TYb6fpttaQaNkDqdHkKTAEvWkIIFJHihWk/ihJDnHNCcXpgnBezls2OZ7J424/jcKxB/jIR0kzxrWi1Niui0KsNHwKKX3vj3zfE4xErzR+WUCKoPdZ+47IzlYy6vcEG7gTlT8b6pTBfZ8jiTRItVMgU5PGHc6LvoCZjRY1jiGs/7y2W2Rzpej8ZZpCpfWSDTs7SJ88j6ef3y6CryFVMG7Gb6Xds/oPoH1aU+zkLz/+rzdesmNo9u2LWYQHiiMUtzWRSAnARXkStoaIMdK4BlMFYtCxs1xhpLRD1u/q1LgkbZp3wCHYFYypOIklEk69C1QM7x6KuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yc36iNKm1if18CCBHrylQHXle2IcVzSn6++cxQzZJPY=;
 b=LiFhBgGFWpaaaJDLVrXAYVm9DnvSWzLztvJ8Cytvq/hJby4L2nOctA4E+o49dNBEakmhUqPmHmTpa1DpHyAq6aYMdzAuYPoGlUXcViwmOBk/b/nxoJSSe3KG49Xdq3M9/od1EKWeMUmyv65HYKxh87YGw8JtgaQVVNgZNf5DhIlsuIwkg0yDj6Ui7bV3eI+5loG+M/jZYAg/gG3RsV1gsqJ6WFAX5OL9mn3Vs+OFVimLul0WPW9WPl5kBbQOQxh4YyuWrxfL8M+VEfkfODSyW9UIJ36zR36r+mMxmoyWdf2pazGKm5xP22PRHxyPnwVPpRJJHv7niCHRvUlfuGk5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) by SEYPR06MB5492.apcprd06.prod.outlook.com
 (2603:1096:101:b4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:43:38 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::31) by SI2PR01CA0047.outlook.office365.com
 (2603:1096:4:193::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 09:43:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:43:37 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 64CC1427EFC6;
	Tue, 17 Nov 2026 17:43:36 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v7 01/10] dmaengine: arm-dma350: Fix source trigger bit
Date: Tue, 17 Nov 2026 17:43:26 +0800
Message-ID: <20261117094335.1393735-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|SEYPR06MB5492:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 815cb8ad-cc22-467a-cb2f-08df448f4199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|23010399003|82310400026|10067099003|56012099006|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: pYoeJ4UBqBnKSZfKnd6W6DP3qyQd4N+C6X5S4pKy6FYwI1ggeND3O/fq7XeOlZNEUuxZbVVAd6iWpYkUnKF/KWMV0FcO24PGrBsbdB1rL/iYBrPJe617LbO6oxJ6Uv/v/Hz2TpqbLgJ6A2Qm8oxoarG8KWcXgJQP9MNMEtl3bHd0gvB0DijN0Hx+xtylex1zgW/do2avyv+pJ8UTVi6rxVMBpQ2c9IRBgqbmNK+r9q4NF6wO+NMFImj4WIRHb2FzW9lFGBpqb0nonPtqnoDNLz22i0VLAAWWkjaKoh2bjHz+j220j33x9D57H4tAz5lczEDlFM5jWuuUdeGcURdkZMYRRpKusaGHt+YITWXb6IyklZ4QmboEFuXGUkOHnEQSuKhD+pB90zswpYVK7Rk8Y+Wy99WVbiYP+MbqqdLVwFRgOqa96UGLcXQa0TjZYAhZFOavyqv6UVd0CN7G8idDKt9rSUDOJxFRek1xpeKlXm21bEbRj7IRuIxJ3iqfLbP8YLKvT7fm/rtnjfOrx8wbQxo/uAcyd6w/ywSQKSo3NcKUd3nMJdOL8dZj5YeTzAKsyOLE9XcmSOzpnIxH2IR8zWkBNrmqipBL6arwmuLe7z6v5bEirF20rTOHsUNCsJsoLstOxL322XQ/lBwLJeKEmLWRIg58uUlnIK/z10KsA5iiJIHskmdJGZ4Mo9hdMQjGXBxbWc25ot8pv7pj/9H1tQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DTCoijTN8V35hCl5Hmrv3VpjNzXy9MsrfZpVpFWaheGUzlsz6NzkeSoF2Vb1TAiKdVEFXyj76zGTMPWX+PeSi4yP7dHI7kzCW4CDbHjP5TnGT6ypoFw4zi+2uT7TKp4jKJE0q4DcdqlhNopCHXxY/gxhdEOPMftXEDXMFLJXo/072oUoKQYyt9+X3tmeBtjRNS+IiDE8nC8Ff/WqnRCaKijbP+SWgAyUEx7kvR+oBnc/R5eUD8DYVq/6JCuRwvWaTiTWGXJBTwHMJmjT4IidqFfFTujneEtdjNpYXkxYV4+zNpk+/k+PZx+3pBMcjnEQ4pEI2y+9W0YgM+n8QE1hkU95bT2E+6JEE187KHVcJ7F7Cot/wFHylNSyjnTJmkc0ipc5UXDbqonk3wXCP3nZKsIIGdRXSLfgTDfh88+4c+A8Kf1r4LeUDntGzETdT89u
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:37.9546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 815cb8ad-cc22-467a-cb2f-08df448f4199
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014347_161569_E5585721 
X-CRM114-Status: GOOD (  10.48  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CH_CTRL_USESRCTRIGIN is the source trigger enable bit in CH_CTRL and must
use bit 25, not bit 26 which is the destination trigger enable bit
(CH_CTRL_USEDESTRIGIN).

The constant has no users yet, but enabling the source trigger input
would silently enable the destination trigger input instead, breaking
any transfer that waits for a peripheral request. Fix it before the
first user arrives.

Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 52f5242ea332..fdc4cd224579 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -63,7 +63,7 @@
 
 #define CH_CTRL			0x0c
 #define CH_CTRL_USEDESTRIGIN	BIT(26)
-#define CH_CTRL_USESRCTRIGIN	BIT(26)
+#define CH_CTRL_USESRCTRIGIN	BIT(25)
 #define CH_CTRL_DONETYPE	GENMASK(23, 21)
 #define CH_CTRL_REGRELOADTYPE	GENMASK(20, 18)
 #define CH_CTRL_XTYPE		GENMASK(11, 9)
-- 
2.54.0


