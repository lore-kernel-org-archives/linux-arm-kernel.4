Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7F60A262E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n1ZWiRga
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VZrSVwYpZW/2P1ljs/nVCcJV57bpcGcXU/xs6looOUw=; b=n1ZWiRga/sjOnGYKfOV4hqnPyC
	SpwkyrXni9wY0S3/h9wnOSK4VcREJp9BcDO5XBAnttoUrCThQlna7KTr5kCGtp5ChKbuD1eavg/WW
	j0wKT4w8GkjU7u8TX92I+qLFXnB2OXkwImc1nDRjBPS9oh9+kfOpy/lxqOIhGr24x0s+HKJ7k3zf5
	p45KmtzOt0uU/M1EBmna4+zaLkGLpZ+Db/Tl8fQbjSnUc1ZpWL8aR8GMTsEXDy7IDRUkuTyHFjeQV
	XccxaZ9dYvYYaiQStqBt4I2apGWwCWt7QEyL7TIh/OlehhN3GJR9tRbjXLDCrqMQc5DC5mtI/TCoi
	b7C25+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHIC-0000000E5Sq-1wM9;
	Fri, 20 Nov 2026 05:36:12 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHHj-0000000E5KF-2lqJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 05:35:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXGmuAUIBiqByWc1tpf8rU1QGqaza0lSG2ISwS2q+FtJNaBk4I3No5ygZFfGLg433CHvv+q21ngOaYMG4UGdY5K23G6h47Xli23xL8f6mz5cSpK5+Gwhd+yi/SzWIwKs374/6KbnviA7RiL0/nsBGtALJLU7MLWUSI/Y6W3TwvDuyGDKgZ3DNwPKDmlQ51FIv3lIe1xgDRg/QhdI146Q4SJjlAtGMZF6jgEKQBO3uCHzdLfadj8pojZiKd4gTPpsEiUz2jy1yZVYxDqcB7YwJtyATZrk5raPF6GeiGSqtaXlUEcCZTKsEboEOAFGfo/JmHC29mwnDQ0Mi77E14Kg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZrSVwYpZW/2P1ljs/nVCcJV57bpcGcXU/xs6looOUw=;
 b=Xxt8sDoocJAk0jKyRQZ8/n82j+tMSlMkvAEarN1b2wM2PRSg/EPx0RNpYCUDfZBOY8T5WZQhYr0QZmgl+GQEPpJquJ9E9sbxrwC8et6Aidw1JlwEM9cUGX/fajWI0ChMBROebeDmvWP78fThoG1BSrQl6c7GHqjVs7DQOLUlp2yp3WYEIVSe1mdAXvnR5SC1vbgB8aHhCxY1XinbFYSks+YAsT+x9jcSE2Zpt9IScGnGmE81KbK6tO74Zkw2m4r2yyQfIMIWfjbCt1fV4HAZvCU+p0rR+xYlk27e4XnKkcqntC8X3bg0ka97gYetlklongDaqx0tchdm8YHpFRnfzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from KU0P306CA0090.MYSP306.PROD.OUTLOOK.COM (2603:1096:d10:22::9) by
 OSNPR06MB8835.apcprd06.prod.outlook.com (2603:1096:604:4a0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.1; Fri, 20 Nov 2026 05:35:34 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:d10:22:cafe::66) by KU0P306CA0090.outlook.office365.com
 (2603:1096:d10:22::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 05:35:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 05:35:33 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id EA845427EFCE;
	Fri, 20 Nov 2026 13:35:31 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	tglx@kernel.org
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com,
	radu@rendec.net,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 5/6] dt-bindings: dma: arm,dma-350: Document dma-channel-mask
Date: Fri, 20 Nov 2026 13:35:28 +0800
Message-ID: <20261120053529.371923-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
References: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|OSNPR06MB8835:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 129eed01-3ba1-46ea-61eb-08df46c818f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|23010399003|376014|1800799024|82310400026|10067099003|921020|261021121427099003|56012099006|261009223027099003|261102123227099003|261026121527099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: oXdQShBYaTIZmkrC+6q/Yto+ulbMxvlyLv5WIKX3uGEE1WK+KGxRZte8wo2NSvhFqJEQVY71tbY2/JfA8zl+xyzFQfc/CPg8nxUGz8ERb9aZmkueM6vgHc8bsiMiHkoCzLk431Ul0UYCBebE5nfCjTq3FN3NpZ4SsLnzpE8qPeghPqPX/6m8ohbhN2hJ3ujdatN4oQK8SUv6azL1stNseh+PhGzArneCtG5fkPiJTnAnCM1FUg/EQ/ZvLhdT//j4l6kCGnSW2OvYB26OddxOfAcLHfKZ5rLiSjqicC9b6359AxN1gAheOoaSQHeXc24p+xHeE8/3+yb1pMpsLsBrZmuD3grqWMKRQqYF5Lp5nnXTidajXvHuoT/tvecVoT4D0aEK2GIYCNB31lO9Ka87/w6175gc/fRVEE5gXfzZ0tJzj8kiJSR8GGT0TfGGrG8ET7O3x+bJbml237bAoBKfitMb8/kfqXJsVGlZy6JTXVim84N2SCFy5/C5ypCMWyzk4yiLkHwZtdIxbryTgkNDPnfKCiUJ73QBkzw6s/30ZusG1NiIXSu4C0oa3Qsfxzas/dmUjxLh661RaEGGyQOBhiITWG0cflf1YCCMvBVFe9ONYeQsza+y1Aok4VI2CEwuPaVnGzqtoEDF9kXC1wOKJOTNKdKIQqiTOhlhSomWWNINdAXftZ2x5hoC1UEdBwDteeSJ6w4VHKpzmiuUusETTWiMFcMehuNbyj4mQicr6p3maTQu1Mjwx7fLDs6llLA7
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(23010399003)(376014)(1800799024)(82310400026)(10067099003)(921020)(261021121427099003)(56012099006)(261009223027099003)(261102123227099003)(261026121527099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: adFRXvRdaWBH28g5ZpSYBsfgTOpoDmdEXIB0NzwedVKJk6SbSTxhPe5jHjw0KY/7ToFuSqjWSmbTAVJzYEa5Xf89Y/hNxeHrYsYT0/pMUveLpu3Z4D/SUmC3coaVDxuerdYz5uhT569PbFwo9Si2LXtSAztmSdo4kdOElc5Buv8NMDP033g2L1HnipfDKVrHJNHnhRKxyzCM3F/n9CoHt41Nkn5WqB7RnHj7kgf6U0hFc8YVcghAqJXWNGo0kvfOat26oFnhW2mPlKqNSkDMcJLElERdyuv0izB9qhuz9/wuvBfQW3myYfngqjoACcwHSFD3gPtt8zymYbY6w32I47YCCuH2R5P0u4qySncFWKatSjhhjfO0Wr2rEBxPG/evEJQr1aNLD8XMwtGhLJs6mT8VnP1Zl55wASE1uV6bDwarxJrCO5Wznggd4KI62VkA
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:35:33.4014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 129eed01-3ba1-46ea-61eb-08df46c818f5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8835
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_213546_016074_6B5196A8 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
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

Some DMA-350 integrations reserve channels for firmware or another
processor. Allow the standard dma-channel-mask property so firmware can
describe which channels Linux may use.

DMA-350 implements at most eight channels, so one 32-bit cell is enough;
limit the property to a single cell.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index eab3b31aeba7..59f3b59b47f5 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -47,6 +47,9 @@ properties:
     description:
       Optional reset line, where the integration exposes one.
 
+  dma-channel-mask:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.54.0


