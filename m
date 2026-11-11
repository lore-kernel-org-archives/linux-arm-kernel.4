Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2899A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 03:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ckgw7MwN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=H0oMVZx9MZWX6ntUtJC0bPYKAaeS+PeC0KGyJrD45TM=; b=Ckgw7MwN4mvvDnIMzk9GK17TCa
	kkX4f0oqoVgfguYqcYfNMFU2hiDjTTflENpqW13D9F5FuJx9Z7pHHOoqsfL6rBE83qzP3T5CV4G6Z
	U1TKzWdBX5iUpNF4A5sl6VV3iLFYjqZqujrKftgnvC78nCUoxM1NDiqEYwVgQXFa6H4mz2zywIj55
	3G6y/46ykfgpJAPvJ+xBZOJ8RD8Yori0GF/ZesJw7cEhF05jJ6EPxrFD3GikvDBhf/t+4KZ4aZgKu
	kVpW0A4obxlo8udnzWqrE/QWmxd0dAtfA+7n/BMWNHxuTzxFxL9zgX4q15ZSWlhJbEC01uvBjcVx0
	rHkgW0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyim-00000005V8H-0x8P;
	Wed, 11 Nov 2026 03:10:00 +0000
Received: from mail-japanwestazon11022131.outbound.protection.outlook.com ([40.107.75.131] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyiZ-00000005V1w-1Zmx;
	Wed, 11 Nov 2026 03:09:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdlJEAD2Y2/gfgnszqfRX4dY3HXx3jI0T9RQOAcXfH0vgzILmmbKvEBdVjs3hvynAn9ZAalI8yM9veGboVyyou0161w+g1zt8Pu63m/IgnF9Ku/39BTNqcbA17cgrdSz4LP1ZkA0Gq3ORIzNTJCWuykIJf6Lvv1RmUh+6HjpqHZvvTXEZ2JVaQPv9hHNMl7Fo88wkHjScLwqQnqEA0b/vP90R1F5ut4tG02wtvVoVHAtWDNTiC8/slJdiODJnaYdbCE410SKIqvkYL7JVUs/XLqGQIezZkuSkpr/QRWFxIiOtCF7xgC0tyn1MecoA0UjW18+8bDdDuzokZlfxEjBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0oMVZx9MZWX6ntUtJC0bPYKAaeS+PeC0KGyJrD45TM=;
 b=HBGohD8iYLP7fRlQO6OJFsbIoDgTtBJZ0Tdi2sRk5ycZ9k9IfJO2MAhDxbwyjKh+b5oBB4d+Iv8E/8G2HjY1raWIuW3ThEJES82mwY5FIjZlJbOfwJjJ0Iu96EL1uvgDxIDzkkzuzTTN+EiOj9tsJoGfF7piGV51HPKP5sth/YmWZQUTX/RA/2Oyej6sBGgTLttFZNSgqhwztauqUlz33nLZHiJBMbN65eQ4EoVtcGJExdTrJBAUYDFAZ0yvwSQsAz6q+1IFuLJ4+1ZHsg87JRoZNU0YZx2yVEF4AGi17sJKkfo7PLndp6RpoXbWiPTxgXk5GRm72x/5SEc8jKMupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0019.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16e::17)
 by SETPR06MB9048.apcprd06.prod.outlook.com (2603:1096:101:317::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 03:09:40 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:301:16e:cafe::88) by PUVP216CA0019.outlook.office365.com
 (2603:1096:301:16e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 03:09:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 03:09:39 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4CB354102E64;
	Wed, 11 Nov 2026 11:09:38 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Gary Yang <Gary.Yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: [PATCH v7 0/2] phy: Add CIX Sky1 USB3 PHY support
Date: Wed, 11 Nov 2026 11:09:35 +0800
Message-ID: <20261111030937.2954646-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|SETPR06MB9048:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6f58bc8e-d2ee-4d79-d596-08df3fa1398b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|1800799024|376014|18002099003|6133799003|10067099003|3023799007|5023799004|261102130727099003|261102123227099003|261026121527099003|261028144727099003|261022105027099003|261021121427099003|56012099006|261022075727099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: EdMTohlEnpLOeMa8gNjMjIZ1esWCCQHgLuQI0wdp0vsKJ/8A8DmqGJ2R+b1RbURqiBabEXswFWMryvXPoS1FoRuOsLAm6Z518K/kkCpEuO9g/V1jdgx9SXGoc1JfCaQiQwNddiZa8dx+5TV9tIG/MVEvFVKZxxp8ExgQhBK+TirFAhhosuWO2qV9SwXjPZx22CmRbaXBxNjV07drkhNqb1Kt4Sp7obLxdUrJbFpHc+vFrfTcUihoZ7HoS9Q7uw9jbmQppD4Rk11CPkXyyq+dIQ6vifXd9hpJ2mN9kul7orDDjCGSViqCLe+eU64LzZUmjDY9Wn1aUwUmWRMHstG86xV/y3IMW2Su3F8GPqjk2ZRt8i/aqV40qdAsSUSZ/vGHff4mqXM+6FNSAlsBBmV5lMi0wsyY1RZGWfXfd0uuHeA39xYl3ZGKs76dBfCs7o/x6m+cmPUoV3HhLAJ2pvVpWh8yfxJfN6B+Np2LFykRql3w+mS3nvnIwgUZrV+Uj+kT6wM42dQY6UX9qjxOOLMppgWsa9Qf+X/y5/gLRh/uoMsHlF9/6I6tSJzo0m3Oh0ynMvk38Vs50lPeTARoZYtq7LdYACnh9TG6ZPI5wA7GJ0rRMt8aUUG4p+wFntRQpDsc7G6JNGuVaRcQfLeb0yy7nWjWQ2OL5HlgTlrqp/INUn1yES5SJsCdm3KWilIvK7L81H1BHQ2LKSPjB167h6uAfg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(1800799024)(376014)(18002099003)(6133799003)(10067099003)(3023799007)(5023799004)(261102130727099003)(261102123227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003)(56012099006)(261022075727099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: i8vWABVI1eOwyXuvMK4paE7hJdSdqxEjighTvZnnGsMA+cNRhEIRbwkKIOEC+Vlm8SN/xpCglgc2t0hWOCoPzGoadVtdAdJR77x03MD5GLpIcW2g3TbZU0twCmgGYcvueUtpVQ/Dtnt6cG6IsDdHaKO3M+bGz8MtJSi4sEATVtlg9P8nUHHtr7eHTzqXXV8tywIP19mNWLeyIyAm4D3/UO0i5w8yjfvLcRu8I+okWXKyHTcMc6CZKw8JlrJq297NgKxfTbQFwL8HTcHHJR1ludeg7se5RN3rW3XRMksaY7Ym3tDj8sB3Ktp5bS9AcK4DNKqYu4lxfuX0R/OpYwAQI9mRE5VlSPhDJD8ZZ3zhqxLwdzDajjih/KTIWEge+MLnyOLprkcWY0oHFKf8eKM8UCu5G5hC5XQdmI0LXYsY3k2A1LHtdxgD+DGDlZOlok0C
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 03:09:39.5449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f58bc8e-d2ee-4d79-d596-08df3fa1398b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SETPR06MB9048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_190947_435091_453E9B7A 
X-CRM114-Status: GOOD (  14.98  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the USB3 PHY integrated in the CIX Sky1
SoC: the device tree binding and the PHY driver. It is a PHY series
only; the arm64 device tree nodes belong to the SoC subsystem and will
be sent separately once the binding is accepted. The PHY and the
USBSSP controller series were split in v4 and are posted independently.

The PHY provides the SuperSpeed lanes for the two USB3 Type-A (USB4
and USB5) Cadence USBSSP controllers of the SoC. There is one PHY
block with two lanes: they share one register block, the same clocks
and resets, and one initialization sequence, so the binding describes
the block as a single provider with #phy-cells = <0> and both
controllers reference the same phandle. The driver reference counts
phy_init() and phy_exit() accordingly.

v5 described one child node per lane. v6 collapsed them into the parent
node, but nothing in the binding or in the changelog said where the
second lane went. The second lane did not go anywhere: it is the second
lane of the same block and has no registers, clocks or resets of its
own. The binding description and the commit message now say that.

Tested on Radxa Orion O6 (Sky1) together with the USBSSP controller
series: the PHY probes and USB 3.x devices enumerate at SuperSpeed. The
series applies on top of v7.4-rc1.

Changes in v7:
- Removed the arm64 dts from the series; it is a separate SoC patchset.
- Describe the two lanes as one PHY provider and say why, instead of
  dropping the per-lane child nodes without an explanation.
- Renamed the register header to phy-cix-usb3.h: it holds the register
  map of the USB3 PHY, and the usbdp name suggested a USB/DP combo PHY.
- Fixed the module description and the Kconfig help text.

Changes in v6:
- Dropped the per-port child nodes; the PHY node itself is the provider
  with #phy-cells = <0> and the driver exports a single PHY instance
  shared by both controllers.
- Selected REGMAP in the PHY Kconfig.
- Used dev_err_probe() for the reset, clock and regmap acquisition
  failures in the probe path.

Hongliang Yang (2):
  dt-bindings: phy: Add CIX Sky1 USB3 PHY
  phy: cix: Add CIX Sky1 USB3 PHY driver

 .../bindings/phy/cix,sky1-usb3-phy.yaml       |  78 ++++
 MAINTAINERS                                   |   2 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/cix/Kconfig                       |  21 +
 drivers/phy/cix/Makefile                      |   6 +
 drivers/phy/cix/phy-cix-usb3.c                | 404 ++++++++++++++++++
 drivers/phy/cix/phy-cix-usb3.h                | 289 +++++++++++++
 8 files changed, 802 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-usb3.c
 create mode 100644 drivers/phy/cix/phy-cix-usb3.h

--
2.54.0


