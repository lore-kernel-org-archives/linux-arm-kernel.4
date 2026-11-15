Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4751606A887
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 16:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GepULTKM;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=A8gz/SZx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rI/QGfrjM3i7FEH9pkXzGGNmIFzxXp3sVm5FtW/Duu0=; b=GepULTKMGSJzhGxbc/8QdXnVVT
	fCVyyPkqjiwUF/RSQLoI1pAwn5XIIJIKrt/mme5Fd1nP39btpoYtvlfRSvPlv3toI0gb39YyYRVz3
	5aYD0ZpXWn8cDmbjPPI+AKesrDgT6IoOoBVwtxA81pjKMsb+nGQqmdQAIuUa+8k6RiFuDx23ihgt6
	7ZinpLkPWt9GkgERWwpK6yJue/2fUqHKhPvS1PIbUDProyXbPw1y4AN/+dI+KAKeXuWSwTER2riKx
	JVY7/M9i8IPLbTeZlO7AhHjh0thdZI8nNg4moXQTXbBI8NBuRDVW52utIG4KNWtjFn74T8n+st7rX
	5VtEqXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdXF-00000000Djd-2dlV;
	Sun, 15 Nov 2026 16:56:57 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdXC-00000000Dj5-2rol
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 16:56:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHHELrfOSprx3mlhLBIplFERLLehhXyV1XnYTQnUnkyB0SqBzZ85uxkDL6M/fLidqWuMA2vAHY1L40Qz5kqxrDH6fy87pPas7sWtaUl50itqOOaFvh6fEEtMmOIqhgOSTm+wQ7WMPCCklCSBT5Vd7D2V8udXd3icyVaQwXZRvuYH56CEwmyXS2OLUBcdwfQOtkha+/4NNyrpu+BiomHxHP0iIscaEu63fa7cX1cTcGjqRI/o8onW4A70qCB3aqYs/3qO7lJS4MT6qHxYGnaO5hAZz0UmSn2NkOc+wO+bKl+0SUgQiBw033i9ea2MMjribVc1lg6CB/HTdeE1/DHakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rI/QGfrjM3i7FEH9pkXzGGNmIFzxXp3sVm5FtW/Duu0=;
 b=bttLYeBDVp42r9GmJmRC+RhZHqxto36j4C7k9CEmc9fWmS3z76It2D/teRWl5zCMqBr2162H97vKgzXtQ7SjYS19jUYVLMRbWHhvH4pbqxM5mQyva7xFo7iCuTWBVyUWkn2nLBw+huCnGv8Q9kMcZFGq6V2/F49weF2FpCyvnOXmkzLblbdQ5vjwGGV9d10IAOXT9fwiVIHP5jbEQw3ZegyfXkSkRgFmreLyNh3zZkwYRYhtWu/u5SN7fLCiJdHg/J2BUbki0+5rL244SnnAupCxzrtQhhOhKipCO86GOylYNuYGyf70sfWXRhcIoFNjG1cCkVE1PbFOSQNuJ1H/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rI/QGfrjM3i7FEH9pkXzGGNmIFzxXp3sVm5FtW/Duu0=;
 b=A8gz/SZx0IeEmk7yDT014n+zvI61HsiyIxE2RRyvtOOgFnNxo1CBv2txCaQVBboxszvaITL92kMWdsT3ra3BZW0E8cON+zE/zt4Q/msHpnlMphZFuo4JnQdcQwZvOHzz6myKEIUYfUUdQ+5X/jdZgYk4qUEIz76jeMPjTDL+u+k=
Received: from CY5PR22CA0095.namprd22.prod.outlook.com (2603:10b6:930:65::13)
 by BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sun, 15 Nov
 2026 16:56:46 +0000
Received: from CY6PEPF0000004A.namprd03.prod.outlook.com
 (2603:10b6:930:65:cafe::aa) by CY5PR22CA0095.outlook.office365.com
 (2603:10b6:930:65::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Sun,
 15 Nov 2026 16:56:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY6PEPF0000004A.mail.protection.outlook.com (10.167.247.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 15 Nov 2026 16:56:46 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 10:56:45 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 10:56:45 -0600
Received: from xhdsboyapal40x.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 10:56:43 -0600
From: Srikanth Boyapally <srikanth.boyapally@amd.com>
Subject: [PATCH 0/5] spi: spi-zynqmp-gqspi: Fix remove and IO-mode reads
Date: Sun, 15 Nov 2026 22:26:39 +0530
Message-ID: <20261115-qspi_14_11-v1-0-23425ed177bf@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEfk+WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MT3cLigsx4Q5N4Q0PdRNOkZAvLRDMDMxNTJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAJBSW7puAAAA
X-Change-ID: 20261114-qspi_14_11-a5bc89a60645
To: <michal.simek@amd.com>, <ranjit.waghmode@xilinx.com>, <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-spi@vger.kernel.org>, <git@amd.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794761802; l=997;
 i=srikanth.boyapally@amd.com; s=20261106; h=from:subject:message-id;
 bh=cxWTGmA+AsSETKdMw7Ryor0HxRhlm0ddw7Oo4AuBqpE=;
 b=AUFMaozOZwzfSG9isQHPUySteub2DcOxUIxtKyrnPAinEDDkJnrrUTLnSMOu7daUHEmOLmf9/
 tiNvK7IwDFDBzYqge663QTeJI6Ply/SUQas/F1wmLNmeKAUfL+YeJUF
X-Developer-Key: i=srikanth.boyapally@amd.com; a=ed25519;
 pk=VZiIwz5+m6FvZJ+3hzpXDQl0u531OPVeBcB2OVGeZVk=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004A:EE_|BL3PR12MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c760942-7f48-4f10-e7c9-08df43396ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261009223327099003|18002099003;
X-Microsoft-Antispam-Message-Info: UgHhJsj6p3bcB7eUsGHsUrRmlg/0OlueSX4LztQJFfDXr6cc6sqzUx8SCD8dST1KGBOg9YYGiU4FhdWfI8mLv2TJxkRWfp/ZD17Gq2bocIFRvnIipYLRGD+7t3S7GwvgDuJ4DlFIouAMqTG0tIBUf4u1tUmklY8/iMOJOXKN7XlzMlbDaubYmgP6c+XcyaSneuZjusMMarA0tokBT1vLnRsdt8CqZ9EE0xZ0BCvdvdC5ZbzhRfBdmZgU8LZvv048iw8kh3To7iW8MpnTNkzcuoVhrC62RUsIdhen0xUQf81g+13blL0VteEUewQnIOHX9JR5X3OiuwgYChXTQYpiKnb0j8GcC3sgAmRTTmvF6SjqAvHt9SrbNlkm/ntyTFNjbbEuK9OYroAwSAJovvwtIyNVUkhDdkCjyISGoYcWRVNRIutLKJRGdIuyzHYHYitUYViwspPORZd4wisj+X8UQQeewkHuRblsLOPSEyZdSPUqwuvp92ylUWD6V2PWB3+eBn2jTs3j6h/VWibnujywwKAX32OQsqS1rd5UbHZx2XxGOkOz4AvsBf/43aNr3z5gcl4MxmtI6DWOa5DCaUcsL9KdmU1clLo8JMt/oh8ahzFBHmE9lEx8up6V7AfD1m25a0CPXO8xv1e+Jl+drMZF/qOQAPXXR4BIJlxNh4uUMjbLqONy3WSX2yPsyT9rt70vIpC0acusKhFaC74N6QncdA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223327099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wH5J7U/vINHckyGRi6s8jjIUkZAj5QoD55T+G4m5x+fqT5gURDh2ETOAETkpLUuKgKNR/azE795L87Yda5v9C/kdasU7yhODuoqO9XkBP9Mr4h6BHozHOK8MK+W8oRdCCB2WVBFRCqLUniK2jg/nw5PwLX0gsgBcUBkYKcqOf3UXVm+fiZaLbN0QeqYOKKVVG9iC3BGfuD9t0E07nF84TsdZS7chKmbHIll/4u4CrlQvZ5PglWLFsWTCihOhgptw0MkU4T1HC6J9w1N65JYXEzSVWL/fpk7l2VnoJtmcbDCKYkQ8+lerqh7dA1p4gjShpR+6fNGg5xB7Zo7HWi3ayzXdpPOOABcx+jOWWAoVVqPN/EE7FndO9X+V5LwZj+kjZBNWDtOXFLSLojV9PT79dWC3t0MYSRFev+WPOn08bjGIZmdvd9jli1L+K/XQJLyg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 16:56:46.2821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c760942-7f48-4f10-e7c9-08df43396ef5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY6PEPF0000004A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_085654_772960_E4D0B8AF 
X-CRM114-Status: UNSURE (   7.73  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series includes improvements to the ZynqMP GQSPI driver, covering
unaligned RX buffer handling, controller shutdown during remove,
interrupt and clock handling, and RX FIFO draining in IO mode.

Signed-off-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
---
Amit Kumar Mahapatra (1):
      spi: spi-zynqmp-gqspi: Use IO mode if RX buffer is not cache-line aligned

Mohammad Zeeshan (4):
      spi: spi-zynqmp-gqspi: Factor out zynqmp_qspi_disable_hw()
      spi: spi-zynqmp-gqspi: Mask the interrupt before gating clocks on remove
      spi: spi-zynqmp-gqspi: Stop the controller fully on remove
      spi: spi-zynqmp-gqspi: Drain RX FIFO on RXNEMPTY in IO mode

 drivers/spi/spi-zynqmp-gqspi.c | 86 +++++++++++++++++++++++++++++-------------
 1 file changed, 59 insertions(+), 27 deletions(-)
---
base-commit: 7a043c9d31af627f0689757b29b8aad6155a9376
change-id: 20261114-qspi_14_11-a5bc89a60645

Best regards,
--  
Srikanth Boyapally <srikanth.boyapally@amd.com>


