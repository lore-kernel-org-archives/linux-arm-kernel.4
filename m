Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F5A606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 07:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eYzGaqOU;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ukl6dKj0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5m/LqfEs2Q6pvjEFjy4I+pXcRPMYw2RSQ8eG1V+I17s=; b=eYzGaqOUwRSetypItQkdMzepHj
	j3V3hm6berhXTJ7y8llssNsNTHiupZ+rzCM/ujKH+xo8QYXNVIaJc351YH2sMvjdUUovShky2y7fg
	sEP4VXNf/QmySTk/MUGj8KZn9ir5KxtewsNjLGmrDRDJtdr76rh02moB5oTOcNxQ3WWL66UnAxy4m
	e3DhxSVLMW9BdlWhMBDUtJ6fWExFZkKNHQ9HuMVDP9qKSHk04Yv1c532xB14wa/nRX5wpS9WMHZ1L
	2mdcXyu6J7hjyPJW1pRJ/4vKWADV8R9TKvGL/hSC/YZ9GPwdyNon5pjYgPjYdHRW6LZGUiu5TD4Uf
	MhedPtXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJfI-0000000HYbB-1Fmb;
	Mon, 09 Nov 2026 07:19:40 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJfF-0000000HYaq-302n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 07:19:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTNMe90xK+takhjc7EbkwTPyUwkSOq+FQXufQro4Yy7I7YPhN17rC3r8kGnhvbdcqAFPcN6AcgTQuDbCv7uskL+slVSWMUxOGtGZdEwAvJoJdDC7I2ORQqYttt48JCfMuLIuwxncxWTwzhcwIVgbdKgpa+WZvwgx+RMYMjFDI7k2oW1Xpq7Zvx80AJgqGZC3QSKYZ+M9gWdp66ntlqF51VVwX5W/xgBmONVH7331AZOcogvf5I9LfH9uVGgVlzeKnnh+p76d6N5F9+lzV4BTSrMSWLL6OZO8TnK5DQNC1U3mouyMqn4JlLJhmD3U06PL8bpKVss9tSAaC9h1O7XOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5m/LqfEs2Q6pvjEFjy4I+pXcRPMYw2RSQ8eG1V+I17s=;
 b=ZOo1m1n1GDkjNjAWhh31XeCZbz21f+2zZPK/DRTUCBwnFLZ8aaFhiqSbphbzyJENaqUEaiIeSYPdGjiLg6jQbDBqVh1wkPvd3E6S/jdo2aEPNwy0a3JxmnG99TzslA+1mKzSVXOd95SlhZY//HMdDj+HIWueH/EkVdCDf/0asDYs7xRBx7oCjmilhrLxYB0u0z1Ebbe7LupoidxXtpXPbTCBzwei2qYdzkRbnxM9ja+G6E3VDHMugvJBlNYy7GalLAXwoGLdWqDvfFvcPfrPMfXT6FcB/le9tek5YJvk9a/FygYQ3bQ6ZWEAyxGBSUue9EAqEIUN/YIPzBOXBBhofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5m/LqfEs2Q6pvjEFjy4I+pXcRPMYw2RSQ8eG1V+I17s=;
 b=Ukl6dKj0ULmO5nwA4y/NU9RoSz/E7LQ/iKrYXPg5J2um9+ye9Z1m0rFXVI+LB17YrUt4Q5kIbRiaet96PqnTWcLXWE2Ii2OYLBe/BfMhKFGafUBSi8xZ2pVLoiEuUDBPGSglUh6YsiRU1F0iPe6mctRYCAi9hZxcix1uhG8lbZc=
Received: from BY3PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:39a::24)
 by LY0PR12MB727857.namprd12.prod.outlook.com (2603:10b6:408:3ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 07:19:30 +0000
Received: from MW1PEPF00018891.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::1) by BY3PR03CA0019.outlook.office365.com
 (2603:10b6:a03:39a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 07:19:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF00018891.mail.protection.outlook.com (10.167.249.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 07:19:29 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 01:19:29 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 01:19:28 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 01:19:25 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v2] serial: xilinx_uartps: fix runtime PM race during probe
Date: Mon, 9 Nov 2026 12:49:16 +0530
Message-ID: <20261109071916.731116-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00018891:EE_|LY0PR12MB727857:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f7f09df-d0ea-4929-1e82-08df3e31cb6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261021123027099003|261022105027099003|261009221227099003|261009221727099003|261009223027099003|261009223327099003|261009220027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: svwkWAL5Id9IwXFa0XOEgdJndz4Xkw90MabQjdItJqNqBn/awfadT9TaDGsh+z7iaAiPlSh62GDigNa+k77ADOUSy1rAQeo5+l9f9gjxYwdlOBRW8e/hgxcr3f/ZOxVLaEVKoO6FWBxeJ73Ol5m/3dDCMd0RC/ZoMLzModGBdycWhtD3Ds2QAE5NIykdCcjgz4EBmWl5E86SW0VZPeaoe9TgtNqeE9izur2aChA61xpBFS/IiwTF5OSgceGpuYAA4KnnS8Jb2FYYZOZ7VdKp/JhWq2SBcjsAZ4EEQpxAE6Po63sIsQRJujXb+fCeZ+wdbhWQzkQylXk02IXRF7JiGFf5+lR6ou+Y7W+g/zrFh2iubutw8XctAMkXVJD3Gho+kVLnqFa64tO38s0CvP26Z6O8R+vqMgScT5NpuzgsjyCCMb3b/dskUsG+lMHdpD2zH1UXjHWJi5ZdiL/qgRhA3kQUAZa/DMP/CwLNKwVUdWXthyH62hBafFk26yODJY+0wEf9pYWg+Y503Trwsfvp/SEEIpE2DcHzJmyvovLZd5wmC/rYm3SkomGa53PpI5e1Rp9Y26rPL80356wjpwrUyBeoKAyRkhgF/iM9gZum8U6n0DmIEL/+hLM6FNUwArm3ggXW0yWlSQO0D7pbTx95tA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261009221227099003)(261009221727099003)(261009223027099003)(261009223327099003)(261009220027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TMFaXJO+fD2zlECN/3cvHZvoslIDTcXxc0d8oHaa1rc82E48JNOHp02IAAPzkkZVUUywJeLtKPi2hMPrtFyU2Q5eC0ROOIZ6TaRF3vwEt8H8HUqVj546y2Iy2Ua9q7z3G8N95qmexe+Tyw+FtuIPLk3gtqEomPHxegWblcZWIDeeORlnjbjAG60v9TbQIfV0voNXXCf0CT+b0lP46VbKNqdxq5Nr0NFJIRTyyChPOGBnJECcdeld6tDCGDpkszatQsHY7tZCCJDxodMj+3uamSeLCv5lBii5jvYA6TbWeVdOwF1+4Neyx0Lq6Z+bpo8tWxwXw7DP+jWQilVzvfmIfJ0s3MLkHvqhjHDrlWZUt8OySUNvwXydo5NPFjrzMsl3CFAbGdGzf979RGoeim2EEpxEcCbHqExPXOWdc9YPCh39tKRzLUXYXk/hjr0WrXZm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 07:19:29.6436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7f09df-d0ea-4929-1e82-08df3e31cb6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF00018891.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB727857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_231937_764038_5730F5D5 
X-CRM114-Status: GOOD (  11.84  )
X-Spam-Score: -2.0 (--)
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

From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

pm_runtime_enable() was called with usage_count=0, allowing the PM
core to immediately queue a deferred suspend via pm_runtime_work.
This raced with console write, causing cdns_runtime_suspend to
fire before the port was fully registered.

Hold a reference with pm_runtime_get_noresume() before enabling
runtime PM.

Fixes: d62100f1aac2 ("serial: xilinx_uartps: Add pm runtime support")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
- Add my signed-off tag.
Link to v1: https://lore.kernel.org/all/20261109070915.727524-1-radhey.shyam.pandey@amd.com
- Use latest base.
---
 drivers/tty/serial/xilinx_uartps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index e8c4b1fa7658..aa3e820760b1 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -1799,6 +1799,7 @@ static int cdns_uart_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, UART_AUTOSUSPEND_TIMEOUT);
 	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	device_init_wakeup(port->dev, true);
 
@@ -1823,6 +1824,8 @@ static int cdns_uart_probe(struct platform_device *pdev)
 			"uart_add_one_port() failed; err=%i\n", rc);
 		goto err_out_pm_disable;
 	}
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
 
 #ifdef CONFIG_SERIAL_XILINX_PS_UART_CONSOLE
 	/* This is not port which is used for console that's why clean it up */
@@ -1841,6 +1844,7 @@ static int cdns_uart_probe(struct platform_device *pdev)
 	return 0;
 
 err_out_pm_disable:
+	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.44.4


