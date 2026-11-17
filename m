Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31299606A8A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RhYcgkMm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DIyH95MIfkq090Bd4q8r4oTLA+GyVUktGIBdtD1Q+Bc=; b=RhYcgkMmqGa2E/2eHEdsdRvle5
	+V6HTUJp4SnUN55sE7Mv/2kWVzQhgKdmEl6RCfDZUK7x6WeFvVpiAgWHnH+E5t6tnboQ67Oz3smWg
	ZzJTWYq2RJW1uUl+DTwve/gYuo/lh+2dQS0O2Owj/3NDHfZ/TAIpa2jwsE/RQK4gRh5i+89uiK8/G
	l6SXjVLYagX+km77v+CzkQhPNsHLNsP6CmrF8YqwoTkxGxgMCFTCX1r6O5ewj44WdWcvQcY0P5rMK
	D20Y2Axh/xXZZUYawFH6JzpYmn6KP4dtpJcZODejNRUsokF9CNmVNeWHJe5MIXRgp5P87svCMMsmC
	i8CWqQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFjL-000000058xa-2F6M;
	Tue, 17 Nov 2026 09:43:59 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFjA-000000058oU-1NQ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:43:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMSwyU4/tWU0nh/FbVj/hghxXFFZcHWRBgnvQ6Gy0mkkafBSlDVojpE1/vxnmU/QMwyieFnZr5snxy4vakfxlractB9mGItBXDwes2r1aXHRBOEvVbtkCFqislTS4kYTP2Nr2CVa5ndINB8LXYcnrTg3QVaNtvWH6Yehd9uChatbrrFV/WDiUAF2nzAXKJLgKwGovdyLT8GPNvVa8fKtphis2qQ4y8l1jwrisCp3591k5ceyiU3mmpJbyZMjhRL763GALc1d+M7Yzw9/XGXnDOjVm58g6YuzV0FNv0xFgBGN8WtfZmEhJIqb+8wrm6qZHxubZ+xrRGWKbnSeC6dl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIyH95MIfkq090Bd4q8r4oTLA+GyVUktGIBdtD1Q+Bc=;
 b=bKBQVqLrqFs1l5UBY3QCjafByAdBUewScVsXvkTDMXu/4uI0D59L8A8NFV9sn6YltocoKKR1SSIqe71Cr34UI1WZsxNgDk4tMOZhai//cmPmaTE+qdqo2YXIRnoHpkhICrUykR6lp70naJs17PsachGZ4hgW2C3R+W8n8LdAwoPFUzFfe9Dj+lv8WnNI5EDIS+psgFwlfelwiy/9ILJnkbSVkRz4opC488mvXU1jXWy1QxJTPk+xJbe7V7qAk9WkKLFT8oSlDNG62/EPfqm1vAVRSA57esJQlYEdUDGT78xuX5idUs20K7+QOyr5d9r7xVMor+wyAnsM1dUesrxCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0033.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2b2::14)
 by KL1PR06MB6886.apcprd06.prod.outlook.com (2603:1096:820:108::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:43:41 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:405:2b2:cafe::51) by TY4P286CA0033.outlook.office365.com
 (2603:1096:405:2b2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 09:43:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:43:39 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 21B0D40920EA;
	Tue, 17 Nov 2026 17:43:38 +0800 (CST)
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
	Jelly.Jia@cixtech.com
Subject: [PATCH v7 06/10] dmaengine: arm-dma350: Use managed device registration
Date: Tue, 17 Nov 2026 17:43:31 +0800
Message-ID: <20261117094335.1393735-7-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|KL1PR06MB6886:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 80455db8-dbee-40c1-1eeb-08df448f42c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|23010399003|36860700016|261102123227099003|10067099003|56012099006|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pt4XzD7RzFUoUX0y4W7AEhvAwv1QDAOQaQrEgMMyvL5B01+e1k4iEi/ZfLHLLsqS5PUQy2xc0iH7fD4lwD0TQVx6lU/KMtGlngofEphRyuWSBj1x8AbMKsbTwqFHG+fd4tldQMUOUMSycElUeIN4KT3ZbM44yw3kGzb2Kku72e0nLA+tYO5r/Se8JjyeCJ4sjeh6kLgxv+Hq1i+/4IDVw9G0TpFr4VLEOIokv0NFKhyU0pONtIJvK5Gh0WeoL15hCzX3oe4m/CtD6Tg8dm5/d1gR4uHzzTdEK/MgdZkG4YEnppvfk3ZT2ZX2STmdw2vYReDSf5ZBmLH3kGruPyG3j5nTipq+i47IOYnIEgxp1d5WN7IGyUv9A24F3gCg8r1rfl5C6tOvKVfC3T+sK6g7IsGPsnQEXPDED8A5KVASHOsDZl/97yjSIjTuOSBH3Ie7OE9yBdFu22RXi40tf+r6VYbow3US8s3iirAK3Vu++nQbHPSCSXY1ypUjkYO0k2kPgtq+dqVVsWPWQwz/EAekhC4s3D4aeILsRL4SjW0Alqy2oL8wAFTDMm99BtKrvEhg+TDoP5EdKC4qN0VwP5KHxVMG5dKZDCDfr3EY85rLPdX/Z99a8LckVRb3M0Z+Ql0LovVzGen3PMBY57qWFNaI67DHEkZyss7Pt/JrP2lhKDy4jVTmR55lWbZiRoGeolX3J5nxCjJj0QLTjzn/8xJwJA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(261102123227099003)(10067099003)(56012099006)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: He0isCDV5nZP+8GzTzXOvNDVxGmxWyWgu+WqV2Bh/ZXrPJIOXRTm8cjy8nZcPrUtWl1Z3Ejk27O79uG5kDtPFD9wFPcDZQMGDt2yqqMl8o4xgmPKgaY+gaEtlAYruFm8eqVppFptR16wzNP2GzajlL8rDQhWHu8b32Nch2Mda0rn5dJ8KUWYFeZbDVQyTRWDTWBE3xaZTHEi/T4HG/EeGKqA82jnIcZ+6fftMyYMYwlIxVTD0YSj/Z3CDnOi421TeD4TcvfMvyIP39+DKv+Hg0Ck/74p4gAuINQ29xahWf9DB0puLfpYrR70XDHc1/EP+CTY6qkP+hLs9T4a2qnVZjvCA9ww/ohtFP/wpqGlRHxW9M8ucKtTiOwx1D8FbyPylJRT7r2yfYup1M2C0+Tje2fZAkVpWw+olAB3BK37WDHmUL/xlk1cWf9YVpYF+T6k
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:39.8752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80455db8-dbee-40c1-1eeb-08df448f42c6
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6886
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014348_416550_466998E8 
X-CRM114-Status: GOOD (  11.94  )
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

Use managed DMA device registration so probe unwind and device removal
unregister the DMA device before its managed resources are released. Drop
the explicit remove callback.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index f785251935f4..bf87460c1c20 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -690,20 +690,13 @@ static int d350_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dmac);
 
-	ret = dma_async_device_register(&dmac->dma);
+	ret = dmaenginem_async_device_register(&dmac->dma);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register DMA device\n");
 
 	return 0;
 }
 
-static void d350_remove(struct platform_device *pdev)
-{
-	struct d350 *dmac = platform_get_drvdata(pdev);
-
-	dma_async_device_unregister(&dmac->dma);
-}
-
 static const struct of_device_id d350_of_match[] __maybe_unused = {
 	{ .compatible = "arm,dma-350" },
 	{}
@@ -716,7 +709,6 @@ static struct platform_driver d350_driver = {
 		.of_match_table = of_match_ptr(d350_of_match),
 	},
 	.probe = d350_probe,
-	.remove = d350_remove,
 };
 module_platform_driver(d350_driver);
 
-- 
2.54.0


