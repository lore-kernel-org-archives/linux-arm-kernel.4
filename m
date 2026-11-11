Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D91B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qYuxaeJR;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hZvqSFPz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rvtcsaWXbZ0AU7/Z05Ue9HLc8zKQq4Jig+YwezFXe0A=; b=qYuxaeJR+5sLuXg62vb27gHfVy
	pkTdU0rxfC5DjsErNqUYQsvxc5yI5JLwFRhnPbXQ92FXKDAmco1krw/RgWMRxWcxrojmJt9NVhtRc
	wpeAdJyldK3OV2ogZzHewg/XDPFTQ53pV6hJ6+O0rVyV892CMesUtctZZx53GSLybiUZy/jMgIO+x
	t7+kBp6nHJwGoM/GVn39f0HOWoWhIl3c6QgBRA1U4xwl5jHZhzmulc++rz8hhkZYpKq8kw7sd4WBf
	/T8uZIVCQejDTT2m4Xt9VBLv3bKSxRYkV3r5WdlgohuMrpTNiJ/pXO+ZdKiizDih8e/ylW8Ff7YWY
	IiQkjWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9xp-000000073do-12ow;
	Wed, 11 Nov 2026 15:10:17 +0000
Received: from mail-centralusazon11010024.outbound.protection.outlook.com ([52.101.61.24] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9xl-000000073dV-13SB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 15:10:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvuXCmLfTqX4VQARoiJlR2GglbwvUozvErswI8TzsPU/r5Ba/wjTIqb8HPYfwENw2upncskHhypujMyZNhxR3vV9SR2iNYGpVwwx3eYIcASvM2B+NPry0xd8wQOZIK72wpXHiXpRdy9Ukb4wK2Ey9HIVY6aN+0RbS/EbL7BW8bimtIjFCuHKjGDwvDctpDb4PbkQNgUFKuPcLSwY5FuniC7w5uOWirtA6tJD0XVzr2r8Auy1biPkJhMtC56CDFAl3AyMd/beiT9f5PTLcvjpca6RWKzChdcG83d1zU9rKOA9nGlSCjJk8lPcoTFp57ItrWslTLIEAN3ppCnp2gGK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvtcsaWXbZ0AU7/Z05Ue9HLc8zKQq4Jig+YwezFXe0A=;
 b=Ylp7OTJyeeMbel9cZI84uvCBIrB8ii0GH4XJucjnabs7eckdrz4qJrUL1fc50Kk8dvTLc/MSxOJQeCouORjZfEZRz0wM+dhLo/8RspiNhs+aY59kNS/FG3VydkjbiimD79FD13Grpm5rXbdxeD7czz4uIzw1QHjOUgBOIzURxhsIxAJcTSZSqFyS6MpidJF3Q0ioBR6z4aVxCyeYKYvwWVBHMHqpB0Wk0d5xgE1WKexHa5Du8x3FdNq7UQ3r2FW/kzOXPDFHJDtAjAXxm3BdtezwhEG5g+ZUWHJuS1C43NgF25oInNDtnMNBBoPdaR2cmDvqIxyXLz/SIAlqr1wgew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvtcsaWXbZ0AU7/Z05Ue9HLc8zKQq4Jig+YwezFXe0A=;
 b=hZvqSFPzUdIziqCequUBa9cJsH5BMZnUEBujq63iXlcqJFxkpZV8nmiueLQ8fZks/T2ORAa4tjVgo+bYum5eoPujWpDiGJlJOhaci42eMBqhDVlDoyyCKD3vzXaUNfZSdRFolSn1XzzODvVPdeJanD5U2mxkx0hK2YccGMHXDD4=
Received: from MW4PR03CA0056.namprd03.prod.outlook.com (2603:10b6:303:8e::31)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:08:46 +0000
Received: from SJ1PEPF000037AF.namprd03.prod.outlook.com
 (2603:10b6:303:8e:cafe::57) by MW4PR03CA0056.outlook.office365.com
 (2603:10b6:303:8e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 15:08:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037AF.mail.protection.outlook.com (10.167.244.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 15:08:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 09:08:42 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 09:08:41 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 11 Nov 2026 09:08:38 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH 0/2] dt-bindings: convert the Zynq-7000 SLCR child bindings to yaml
Date: Wed, 11 Nov 2026 20:38:10 +0530
Message-ID: <20261111150812.1874449-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AF:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: eb4749f8-a5e6-4f57-7f39-08df4005ae0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|23010399003|1800799024|82310400026|56012099006|11063799006|18002099003|10067099003|261009223027099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|261102123227099003|3023799007|261028144727099003;
X-Microsoft-Antispam-Message-Info: +g/j5alGK+l8ImyyMwX3kHTc5bm5hgqBC5wul/8QDirHyPQzm9h4/yU1BvI2hw8JFt10UFPnff0JhMjXqtYX9MjJCy4IM9i3deVpEMb5fN2Kdcgd+muyP+/D5NZT84HZ7Sqn1zjQYne0Gl7KNSYSGY75NA67wFCmczXSxGPekYgSRWbxiUJabbxBO3qEYvDfhKXSJyJmJZvPbOjRrxJa8iLe4giwdsXJpas+ZJgRbVrDW+VC/OjD1biGzBZenSkJPAQx2ndi9KvUdNY9vcSR6fTF+U9kWGSRcP/SJpX1faCl7V47NA8cHdo0TINeUs/n54FCvhVTx051W9ReuUCBa8HV7gg0ythguerGLhBymPI5AQdu4iXNwEG5XqJlcNOe3AX07yoB93CUIBUOWxXaQEQIAE1Kxh8uL5gEQ+wpugv5DFSfdfIyLRF09Cbrs1ceeRriNRV/+tB6L/30F8zZNICNBT4U9/UFjq/xDFibF8aAfWdPeW1KkHW0wnkFJVRgJ65bSbJu2OzCEf7MtL3C86TOsRusMY2URmZaP+bjc5xnduN8P/kJCdLDEe6zkYqUe1SOtQg9XTG1ZgLF+9gNVqf5ThMIMyXyq7QGfifUxoMFqWTI1PuqlI/gEKQy90xS2kXHT9qbwlkhIHWYBvkJJsbPj1lJVd0OXovuzOtBUIS2yV7kUGwHXNgRvpehOXUufJtY55ZgDf3ZBqZlcT5sJQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(23010399003)(1800799024)(82310400026)(56012099006)(11063799006)(18002099003)(10067099003)(261009223027099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261102123227099003)(3023799007)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1GgvNan8gZN/56mF/y+jQ6nR0sDHyolrwEJd5dZZlHU/D5FDUZU0VNunGUS8OCzcwqDYpx4dDa0Nm70ei0aTqnfTltgShFIi/Opk4AbHgyCBnAYYM61oQ0YFJSIwaJxMDZz20PtHY5mmWZ01lEMQ6Z/AWX9CSN6RKK6DpwVd87Oxo5O0KKivIJXK1Y7tpisxCb6h4wfl5LpwRdbGXDCtwqrYedO4sXsXyBry01GR4WC7nT7VqNqkSQx75N02uDR1jj223PzCnn25LElUH4o6FCsIPXEiZmTOIl1GnijOFSgqalLLjn1Q9qf0vCS5eNMKqt6ZvikDAMy0E9IL+bB1X++Nr+ZTB0dX8z0CLq6cjeeI975N1FEQQHyIvqW5Oyh9iX7XXIgZYoEJ0wP6+qJnsp+muNZkvCHgH2ahPvLBw+Gw8EdkFcfuSPx6YokcSJzp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:08:44.7694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4749f8-a5e6-4f57-7f39-08df4005ae0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037AF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_071013_298414_FE4C7D62 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Convert the two remaining free-form bindings for children of the Zynq-7000
SLCR syscon, the reset controller and the PS clock controller, to schema.
Both keep reg as an offset into the parent SLCR, which is what the drivers
expect. ps-clk-frequency becomes optional with its 33 MHz default, and the
missing trace_emio_clk input is added. 

Radhey Shyam Pandey (2):
  dt-bindings: reset: convert zynq-reset.txt to yaml
  dt-bindings: clock: convert zynq-7000.txt to yaml

 .../bindings/clock/xlnx,ps7-clkc.yaml         | 145 ++++++++++++++++++
 .../devicetree/bindings/clock/zynq-7000.txt   | 110 -------------
 .../bindings/reset/xlnx,zynq-reset.yaml       |  99 ++++++++++++
 .../devicetree/bindings/reset/zynq-reset.txt  |  68 --------
 4 files changed, 244 insertions(+), 178 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,ps7-clkc.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/zynq-7000.txt
 create mode 100644 Documentation/devicetree/bindings/reset/xlnx,zynq-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/zynq-reset.txt


base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.44.4


