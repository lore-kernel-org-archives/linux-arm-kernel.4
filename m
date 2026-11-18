Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A213F606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2bEuwMGI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Y2Z/AErz;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5nZGPYqY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=I/6mm1o7qjQIUn6gsPTWrGOhPJjBiJCqIIybSRFefDc=; b=2bEuwMGIT/3phfpJlM17M/JlMP
	/TaLNBoz+kOhOQt/M1NPVJNxzg1urkYIeIs2xVvHyWzZiDkMi30qtb2y5Jzp4CXFG29b+RaxBKZKL
	yu+oOgD4oRFJanfp3nDWbpHxbD/AWeNEdICVjBvDiVobbrf5JHHeEyvZjtzwKd1dP7SNo2QWNcumL
	xeyz9RDo6eOzCGp9tsrq9/5ya97qOhd89gBqJXUQf0Ht2Zna60AqYvgGPVXPmyQPcOTG+0xEKdbm1
	1lH34bqFPIg7NG17h5UNBzfeQYW0lKGafFFhLGeawhfYa501+yECsabVbWAxRVjbIacMwKcqFiF6y
	IyWzlPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc1y-00000008OIt-2Amh;
	Wed, 18 Nov 2026 09:32:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc1x-00000008OIh-15Rs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 09:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=I/6mm1o7qjQIUn6gsPTWrGOhPJjBiJCqIIybSRFefDc=; b=Y2Z/AErzuITKJjdHD2UQ7HsZxy
	F1Vl+3SOKx72rsyU35IYFAY2At/M5bKH8JfaCXlWgPTiRRpoaUoKGSF2Z3R1FerhYjV2wtsnJzKNX
	RXbRp8nW6ViNR24diy0RWr0q9MiWZgXyGr4JDUU7JH9Z9uOme3BGD3FM/zW4KPQcexzRq3VCvmRVC
	nQhYeRrMG7t3vKlP2gHqg3CbMYbwD2hsJODKCH7owTIRsgEfYEgSC/X05LM5pUYeACy2RzjwbgaFX
	ha6gZNrg1V6EbkvWxfAwNQ/1014Jb6YeC0G0WHhJMqun6iMKngTNjnd5jVd9vozoSJtsiFz4HFEOp
	9zF4BygA==;
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc1t-0000000Frt1-1VR5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:32:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UStRO4LvnBDTaB+DPgytsM47cSw5Cn0jZ9VedIEcDlqME6ZB7hBvHLalmWEu6QD3QFJWNVP/OnyE3lucx6hxzNj9njvH+u9HugdUMBi3r2tVnmScGHjUTZLLiDEJJ4V1+XeUlp+YxCJ4GJ3VJYUw5mTvTktYSV8N5DTuu2HjoxluHnnsirvOYMGiPBU51LpvOrB36aL+MKf6/7gyh+m/i+9KIwRYNdlj8EyOpuur8vmvJwxNu2ZtOu5CCbjY1aCFgaSbdywCDI0lepQvymlnp/sHOtW7YrroDWUjsWqgHTkUpeUMBcs54S+C31/2pLsGE4d55UkEIAt8Du8RpGNAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/6mm1o7qjQIUn6gsPTWrGOhPJjBiJCqIIybSRFefDc=;
 b=FDsLnj1bQOAJzD+DkLgG/WUcaAa/qcf4h0zMoelaBKtOf9jsQ6Wc2JAl12Xth7hB7qIMuCFNbF+T8/iPROL/Sx0JBX+l35GdGTRTRUTjBg/HVigBevtoyOJfA4zROEE0F/rl59CcA5ux5rr0T5+RJgFGPyJb/xmiY1L0Y0cOYQcZXC2l9WrdQfkz7V9ZloIPedZNdBCqkyLuDx1yRgF0IGpBziRBcTos4quQna1+C6ySxuX5uhLC6m2zktieCKvGe+q9C6ysmUXtCzOvBMWMNi8SGgjzhs+c5TEIM4YmTw519a3hFQhuCJj1rorvKLv8k9FV02RQQItWljk7VS1wkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/6mm1o7qjQIUn6gsPTWrGOhPJjBiJCqIIybSRFefDc=;
 b=5nZGPYqYoarjoH8zu8sHg0174D3Hu3MO9H1Nk1Ffo65CAtTEIRRuPmfPxpD09/MNkFB99jBjReuFdIXYXjYYTI8nFLVkjMopV2yiB/5njTm1R/kMUx7CXAds/2s3rjCZY9rxTDet9ez93PxqwuSll4baXpo6JGDkepZUw6BYgNk=
Received: from BN9PR03CA0471.namprd03.prod.outlook.com (2603:10b6:408:139::26)
 by PH7PR12MB6468.namprd12.prod.outlook.com (2603:10b6:510:1f4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 09:32:21 +0000
Received: from BN7PEPF000000A8.namprd05.prod.outlook.com
 (2603:10b6:408:139:cafe::4b) by BN9PR03CA0471.outlook.office365.com
 (2603:10b6:408:139::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 09:32:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A8.mail.protection.outlook.com (10.167.245.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 09:32:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 03:32:00 -0600
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 03:31:58 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:XILINX VIDEO IP CORES"
	<linux-media@vger.kernel.org>
Subject: [PATCH] media: xilinx: vip: Make use of the devm_clk_get_enabled()
Date: Wed, 18 Nov 2026 10:31:32 +0100
Message-ID: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079; i=michal.simek@amd.com; h=from:subject:message-id; bh=qnkFrtFK2uCKIF4TN99wCvhwAHaOrhfl+HFx0m3diYY=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9LagP/Kswf+tUjsf/JNU7rmycLWdy9o3X+vnSb22TK tTq7u6o6yhlYRDjYJAVU2SZzqTjsObbtaViyyPzYeawMoEMYeDiFICJ5K9jZDiZscU92J/p9izj A9PddrPqfSx4YZi81GnvjIUHjDY7XrzC8L8mTWFFE9sfLb/9vw657xFTFS5+2u70MXxOx6TSBzP FL/ADAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A8:EE_|PH7PR12MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f1fa80a-7bb2-4c0b-c97c-08df4556d7f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|18002099003|11063799006|56012099006|261021121427099003|10067099003|261021123027099003|261102130727099003|261009223027099003|261102123227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: oBzjrXQI+Bvx8rxYxGm+kSYs01B8NE1/aiJ5tHGCNMA3j2zk0JdDSyX2HDK1F8yWC17HLuJA6EYY1+92NYFWHsvmMHy15fnSc7pSJ+SnBiEzyBqARVeEtVkVP6RTCcGOdf20FcK3G0ozygZ17U5SSSTK87LKn13ChmSN60PPgFhF4lkoacat1xj9h7j2Kn219IFkm1bEr0reLMuE5PCL6FoYoUaKl4RDcTr3eTStWBoDIylouSe1rZA1hjP5X7MatBS6UP2kpltUWGGIQ8sgnCthU8sE1EmbFgpawTCyIUgx8OCQNfM43E/ZsgYj0mKxv38R0NR+BJQAm45WBiFC02bL2lHMHoXbqYXn0SLzQarHOuSXpVTGb9Ey1afmpmgcbvJMzA/3sR/uG5Py41Nm2tAkYClyqlhaTB8mwSEY8wnpKUy8nhGJuONk1dlZyJ18JnvgG/3A9DaiJg95cy8/hC1bttLF2DQOitCAhQKumi65ZKciSi09WIsxQIOnSQ3cuahTo2Q3W4ke3VOL/pQkLsW43L0FSvze902pKLOTej4Kg//Su27wZJN6wxqWa1/48dvM6QBVVt9c0yrHIf5jSm+kveq2U9y2l7WfnCXluQh0oocnEUbku4kQ9JHTTX/SEEXIw21YVJef9rnQHsuGwbZjRf9WlqvmzgwhFa/ItYF87X0yadWv240MJziG4at7zi2Lvt4hDOXth8KeO+7gcw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(11063799006)(56012099006)(261021121427099003)(10067099003)(261021123027099003)(261102130727099003)(261009223027099003)(261102123227099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BhFIKlz8limnEBRRPwv2r5MwYevuyhk5+dlSx09wdSVY7sEVIH6ThNFm0vpM08UvfifPN3su+5IkBF3jU1ela+hsd4EUxEBFKrW7RsjZutWkS1kL5dMCQztqzyGEA4zsbjhsxwzkCI3MZ1XOtwZD0/yKFVXqvJKD8QP6HIaXqcZXyZuhAZgDcBWruFVctpz5yoPJ5dD6LegMT2DKBZE5CjNQS0mcYDzSfcwd30QvQ7bp8ISVsDrM2YRbG1ghR38hTCyH6VuEFVZZuZN9vMd2JbcG3c5x9UpDK5KhG4X0O5Zv/zYRhDMOVKhjycu1f9mWdd2r04wU3L4QPif6aDT3uqSVBR6ie9hJscpcrwnwateQBVXyJnqwcvcpj923RdmYhIp7dvstuWMz0GciwLc3dOf6+OiUGAbT6Mlq9gsnvqzbwKW0FRhAYaU789KXQt9a
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 09:32:20.2452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1fa80a-7bb2-4c0b-c97c-08df4556d7f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF000000A8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_093237_494565_B9CB7E56 
X-CRM114-Status: GOOD (  11.46  )
X-Spam-Score: -0.2 (/)
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

There is missing return value check from clk_prepare_enable(). Fix it by
using devm_clk_get_enabled() macro.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 drivers/media/platform/xilinx/xilinx-vip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
index f1574edd2b43..b8a06328b8bb 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.c
+++ b/drivers/media/platform/xilinx/xilinx-vip.c
@@ -212,18 +212,16 @@ int xvip_init_resources(struct xvip_device *xvip)
 	if (IS_ERR(xvip->iomem))
 		return PTR_ERR(xvip->iomem);
 
-	xvip->clk = devm_clk_get(xvip->dev, NULL);
+	xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
 	if (IS_ERR(xvip->clk))
 		return PTR_ERR(xvip->clk);
 
-	clk_prepare_enable(xvip->clk);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xvip_init_resources);
 
 void xvip_cleanup_resources(struct xvip_device *xvip)
 {
-	clk_disable_unprepare(xvip->clk);
 }
 EXPORT_SYMBOL_GPL(xvip_cleanup_resources);
 
---
-- 
2.43.0


