Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF746606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 07:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J30r3Qrd;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1dSGbqJ4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yAYks/SA0vJHt3hnV8Kh0aMzQk2/tXRPyQYdxACnaT0=; b=J30r3QrdxH1CTou38a1mC83vn0
	Q4opjybXPBc59djmIcq3Xsq51LPn7Qk8ar7PCMg9tt5gNmkuaOoJ5dTFpYcqsG1mrQizT9eC6j2hT
	jRuxv6iXTeu9hBa6fvQfyr8VvqfFk0XTdr2RU/tezrWugXLSttODV19uc8+SEM9z4MbfGL0RRi5qX
	euktMAhZmOYAogOJfP8sa5sJHgcip1Djjx41A0eo6PCETCSbgZu6qo+zv17M7JYYhk07NqD4hqIHd
	rcKy6qksRIWjBW9IAWYWNq0nQB3NK6a0Gzx/FDH8FUrh3DiI1xxnNP95qNIxJbhVcS/R+deMdAVR5
	PXbFZCgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJVn-0000000HXv2-3bZK;
	Mon, 09 Nov 2026 07:09:51 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJVk-0000000HXuM-2f4T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 07:09:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmLqLTGWGAH55N5AFI1RwR5cJU0HfZaJDH/ezxACZm8UgcXr2Vb+ZUYOi9m8jyf9y1wnPfgz9W9K3FjPl4mRe3Kgr09KAtt83So0R/2uTW6fF8LtzKXI9DfS4g/F0qhitu/H7Q/+SQa0ihYE+cdWzX9a19YsJ/3iT4rRHQVXT1E7gwGqTjxz92wyoPEFomVVRlfRGRs042UV70yc5wbg1W92C4rKF8t1dKBJdfljaLNhgg+nXcShy1edVxbfBjC4L06C6hXzeh5hYtgd7vhy3qn14YBJQUjikhnWCAt/0OVD9b0ilF4hqbOMRaVtSjXMOjcpY8x289d1DDw6BKTtwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAYks/SA0vJHt3hnV8Kh0aMzQk2/tXRPyQYdxACnaT0=;
 b=RNXsdWWKFZNAl8S39gkQEA2GE9GRywOnJizDW4Ir0aJrWgOMERC6pPz3cYwtQj0dggECo+DbptJCcB32tXseYQEmWFo1xbHKMbGPJj/mstsF5sxz8t54S2SxsGVox8ZjNe/FbNRWFjOBHe2+yq6v8H+Y4N0veJZzFpuhG4CDYOsSGIbmV/kTD36SFa14l0gTYrLOVRnQJWXd8RIAK/OIC3/fw15fPevEd54KEYvw+Q14UhZiLd4UhmILqxdEQWhTRE3a6DtKSvI0MA/cp658pIK4V+LV9q+ph0RJNpbstCH5MSJTY9sACwb8Cc04wHSkaTZKjRIzd7a6OXyqU+K3Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAYks/SA0vJHt3hnV8Kh0aMzQk2/tXRPyQYdxACnaT0=;
 b=1dSGbqJ4T96XfaR+HJwhpw+LfvZA2Ffn3m7KAjW0of+P7rZL876JyOa14diJ+7RdoM6kj6n6VSKVbiILMxTn+oxIBTuo7z+aSK7ld7hQVzqLXGkNDMiQXZS+83LITRVBzdBFc6kDwRbcX6QM4AZ3M/YO8XT7Thpj//iARE1vx0k=
Received: from SJ0PR03CA0355.namprd03.prod.outlook.com (2603:10b6:a03:39c::30)
 by DM4PR12MB6208.namprd12.prod.outlook.com (2603:10b6:8:a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Mon, 9 Nov
 2026 07:09:40 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::6e) by SJ0PR03CA0355.outlook.office365.com
 (2603:10b6:a03:39c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 07:09:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 07:09:39 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 01:09:24 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 01:09:23 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 01:09:21 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>
Subject: [PATCH] serial: xilinx_uartps: fix runtime PM race during probe
Date: Mon, 9 Nov 2026 12:39:15 +0530
Message-ID: <20261109070915.727524-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|DM4PR12MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: 905f5fdf-9584-4f2d-c556-08df3e306bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|18002099003|10067099003|56012099006|261026140227099003|11063799006|261028144727099003|261009221727099003|261022105027099003|261009223327099003|261102123227099003|261021121427099003|261009223027099003|261021123027099003|261009220027099003|261026121527099003|261009221227099003;
X-Microsoft-Antispam-Message-Info: 1fFy/CwWpEd2zSerqTOVKuNaH1TRBxQC/0kraFAj0+0TYnIxiiIRtVyBafe0or/y/KJgJXRz4RJGCVO7X1wQN/usI3jR93TffKIaQI2WS9Q0Zu6KtIRAY1+vdTIJN6lzMwPLwjOjCl+sl0xpk6VJtHO2oHAe9PTSRAenoZLUknlTEe1mX0tEGEew9P4K+Ylor7mxmvQ3W8nthQWBVyo2OZMLMkELStrrDSPkgmGwTJiGA1KbUoKC7blbFvAGwYf1aRye+9DPU6uCC1Mg08f6oFkBm2AF2Gp+sxvhTvzQm9+PfVoP2/dCWPySDYjvzLRjTIvDdsglw7qfWPw1DE/UA9zTtEJnlgPa2dX3cExqcLzTAy1b41JlfsTBnxgjopvhEZGUYai96BZuJjK7JkPvPhpoAlPfK9zaNNwxV15f4VvMjWt/JD181krUqeef2XY/jL7xdg3ztdcyf78DeefoY2kiDr2bXMgdEeFkrYfRiDt4x4PrFJ+MD7wF5PJOQ1X8DwGTqxl7clSeSfsme3MVi9kGKPc8BNhSHXW5g2/03WmZg2/RS6i8MqKOQJm5C2Yjg6ySbBCh2dZR78y3VWgsJ/BU4cBWwr/yYiZsuPqlGtS/u71uc9XWYC4+W62E0GmxTuAejB5XxguCbTIeaEDWjUSVDBWutD8+6/a99gmZAqQNBfeOrf26DDLIDWXS9tpxLDtuFyjsErssCY800Ys/5A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(18002099003)(10067099003)(56012099006)(261026140227099003)(11063799006)(261028144727099003)(261009221727099003)(261022105027099003)(261009223327099003)(261102123227099003)(261021121427099003)(261009223027099003)(261021123027099003)(261009220027099003)(261026121527099003)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: K+BAOT1h3NP04sUGCSxIJPHdGgPb9JooAu3xn/ino6dbk0LqotemHLv2azGh0VRxZgPEWo/ARrwxKnyFzAzv4/t8IvJ6Z2G6TXtq/BrvjNxH+QIlkP6DhFCHoWYTlyTJMYIt4ldWvNDWqoqUjwPWYehn9h95xh1wgwWFdhDPojAzeDgyjz18EspN0rjLlXjM3Q2Bx3YQGQeSQfLEqwx3G8MTuf4qN79P/C+Q4imUq9e9AsJHqbCDSCF7M5Zd/CmmSt4JnL4FWQAkijqnZ38tG778WkosvtbfVLnQkhzUe0gvDNvRPoRmf8VAKMcZKlSB3/IKbXzxnVpu1bloIVFZ5KZCDGJ8AP+8xMSDyJoYlxS0sH9qKD2rN3SKyzCJ42Q0UF1CaTQqwDuZbFmvtFl+TBU2sv+e0gz91rrWdQC6O5zQBdqS7AH3b6wjvAYbQX0A
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 07:09:39.5886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 905f5fdf-9584-4f2d-c556-08df3e306bc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_230948_682674_4A33FA33 
X-CRM114-Status: GOOD (  11.57  )
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
---
 drivers/tty/serial/xilinx_uartps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index a072b75dbaf2..e316cac4f35b 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -1800,6 +1800,7 @@ static int cdns_uart_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, UART_AUTOSUSPEND_TIMEOUT);
 	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	device_init_wakeup(port->dev, true);
 
@@ -1824,6 +1825,8 @@ static int cdns_uart_probe(struct platform_device *pdev)
 			"uart_add_one_port() failed; err=%i\n", rc);
 		goto err_out_pm_disable;
 	}
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
 
 #ifdef CONFIG_SERIAL_XILINX_PS_UART_CONSOLE
 	/* This is not port which is used for console that's why clean it up */
@@ -1842,6 +1845,7 @@ static int cdns_uart_probe(struct platform_device *pdev)
 	return 0;
 
 err_out_pm_disable:
+	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);

base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.44.4


