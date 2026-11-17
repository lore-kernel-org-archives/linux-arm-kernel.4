Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96672606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CGP0bZa2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9QDgGXgHw3XmIR9vRF2eMspFA8gGWE2rjJnPNKyKzZU=; b=CGP0bZa2leni/XLpkTJlCTwfb2
	fMoWSKyTd1aoJZoYSUzbCS0XL/rgcHoUagqXsJbmsJWXyB2E6uVC4y30BCI08xeO+AAc0eWQSO408
	r0l+obAHuttwwAYlB7ZcWo9S/2JOOXckYubSdPDIonmce5131D5i7/TkhanZVQwOdlc8yQqsfvA5i
	9ys/CnetmH1g0NV+ZyRN8R6q01+XTp0Jm+1N2lvCc+Lnn8lSdn/egBRGUu2EFhGSsP3HtmffT4EN4
	MUFszEsPk8qLD6IgSEian3gdZ+9ZX8hvztuKnO4VvxezZMpKWRcn7J+j3E/9UwS74wL6iUPH/r0JM
	nf/byB8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8wY-00000004PE5-2ZFl;
	Tue, 17 Nov 2026 02:29:10 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8wW-00000004PDP-0uRu;
	Tue, 17 Nov 2026 02:29:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FM0nLpvKeH/D8Ov5pmNQNjGcK3WYAscb3b2KqTBN6ljMEzGAfusYLoBtH5P/BJRCPo3DzTXe/USK5LZ9U4YaimHhQrPgE7F81Ky8m/oCKyG9SuLl2U/LcHCtsI9teRh1DW7KGXCnI4HvINvJBrGBuK6wnwoiLcoaCk773E3OgevXx284nF1WaXpeLzLZeV+pwLLiYnXCLII0WKqdYsWcOlxZp4dGTa23FX4D5CbAPCmaG2Q8aCboBas6N+aOA9vVCekpjSLjkhwN/Ea4CjWmSgE824JacNgdqQzBwK/C84pA5eXtnX/UrBxWLJTZord6+hjEn+Nw1LnDnCHbDSfDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QDgGXgHw3XmIR9vRF2eMspFA8gGWE2rjJnPNKyKzZU=;
 b=mfXPtXSWkcd0Rwr4Hq46xb7Kvs3t1BbGnCGIiDmmVbOlzKaCTVj+hEZzJePMM3vPtA8FKghfBoEJuQnl1ySOhyD+9DwLtsl7CfhQfDsHWtUh+mNEAabFNzrMnV7sLunyCaMTtExcjZXOdZOELMeAWsLPU1GVnIl81mfb8BNaWyTbx+I3873xb6lx8Gx6WGrxdsziDMYVHMG8DOCrzeycYdg5lfDUqMxmnji0I8mkk48GyKqoYzQHHZtdMqwJLS91vAJFRgQFORtZLNDr9VbseitmFtysRryOLFsPdbIXcM+knu5f5itY07I9HRa4iCgxVUB8egleewhDIAvZrSiECw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:990:7::14) by KUZPR06MB8074.apcprd06.prod.outlook.com
 (2603:1096:d10:47::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 02:29:00 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:990:7:cafe::22) by JH0PR01CA0156.outlook.office365.com
 (2603:1096:990:7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Tue, 17
 Nov 2026 02:29:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 02:29:00 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 249B3427EFC5;
	Tue, 17 Nov 2026 10:28:59 +0800 (CST)
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
Subject: [PATCH v8 0/2] phy: Add CIX Sky1 USB3 PHY support
Date: Tue, 17 Nov 2026 10:28:56 +0800
Message-ID: <20261117022858.2210212-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|KUZPR06MB8074:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 80370986-2ec7-4b0f-1204-08df445289fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|18002099003|6133799003|261009223027099003|3023799007|5023799004|56012099006|10067099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022075727099003|261022105027099003|261102123227099003|261102130727099003;
X-Microsoft-Antispam-Message-Info: Wa+QNK80KdbbvaNv4gYHYj9y7iSB8fGlPOhzUbzRKLq4cIxIszDLqS8dp3E3oJ3ld04RxN5jJqZqyheC+ywAPKWZbQLBnj9KCwij8i04N+wA58sFTOGnqohSD3EwGBR7SLgqlhdnilbWT8BblbMH3MEY75jMC4k9p7F20A0iY4h8VCzFY0yOIxjB3zXlSKB45bs7+XxWYpfIgzgm42gmL0XWRtcQwM2uC0600v/C3N64XL8IllsxchhsZQkcRliwSIOOs/8EhnHmTI0yTIH5NN7RwGvs6bajtF+Zu5bFEerT7sIaH9ssuvE9nGV9gFJuFIiIdd6FejfyrYjB+Tp/g+x14EPv4hZ1jK7/llm9Hg+Ju6MZNesRd8t4j73uGUQZegionvIOOTgPD9rccRraOugsX3Ygp7qHj3qGlIQArmcjXngFlCVR67zY07WqRvcWn0f4pcn5y2Wpjt+cxfj5UhqRz5+hbnARyIQgUr27JSPfLR5YiFlloHGO6v4JNmet7TkDiiy0VNnwRPTOQmYMl+FCJte2s8c8yn/Wg+GS1YqAFnOfhjm0YdbBD2rUV9QEgODlDutLxF/tzNAShrhPXHQ5vTVlzRyVH/FPobZv56+jP7kOzZr3LfZcrRE9sqxtqF9CxODbNcVHMnvSbgApH4Orbj9TSblxUaqau6Io9VzZgqFmZxm1jeGmqm5I646RslhK0WOjSrqtyVpXNKuHXg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(6133799003)(261009223027099003)(3023799007)(5023799004)(56012099006)(10067099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003)(261102130727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AlCmafM9JmFA65V8JO2vTvbGZHdqzEek162sG66mJIlMTME2sDfiFOkTqiRCViw9STFGq8NftP0BMoFACuQBQApib3moCJ5QPEYBdAtMr1+iRf2BMPfcAyqcazSh1122WeYVvoj15PxJNzSDQMfVtfa+WyAT3pG1yrCvHq0TxvRs4WiJxARemTHLWxIE66qqHrdpqD7XmjT80z5Ezqn73aPGvMAFKa8zYRqpqdg5m0xyXSmNgMyFBGanUlTjkTrl+k/G4wDq7DHrdFef8DmyNliuaHTNEgZ5gFmSV5JAGZR6G3aDl4dVQAl3tGvXIpfogHmmM29IriEyXDUF2FkneacpccWWmG7aYK41/6+uxzXdZvy4IPjf5eebnNbaKRoighi73NxZoMbNIEWdxNroBWAvNHu6e359UbmZO8l26mwwvljqtYhDMAKlYGbCx0p8
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 02:29:00.1116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80370986-2ec7-4b0f-1204-08df445289fd
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_182908_261171_EB08CD36 
X-CRM114-Status: GOOD (  15.33  )
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
controllers reference the same phandle. The PHY core reference counts
the phy_init() and phy_exit() calls accordingly.

v5 described one child node per lane. v6 collapsed them into the parent
node, but nothing in the binding or in the changelog said where the
second lane went. The second lane did not go anywhere: it is the second
lane of the same block and has no registers, clocks or resets of its
own. The binding description and the commit message now say that.

Tested on Radxa Orion O6 (Sky1) together with the USBSSP controller
series: the PHY probes and USB 3.x devices enumerate at SuperSpeed. The
series applies on top of v7.4-rc1.

Changes in v8:
- Rely on the PHY core for serialization and reference counting of
  phy_init() and phy_exit() instead of a driver-local mutex and counter,
  and call the Sky1 init and exit functions directly from the PHY
  operations; the per-SoC callback structure and its duplicate error
  messages are gone.
- Drop the register macros that the initialization sequence does not
  use from the private header.

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

 .../bindings/phy/cix,sky1-usb3-phy.yaml       |  78 +++++
 MAINTAINERS                                   |   2 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/cix/Kconfig                       |  21 ++
 drivers/phy/cix/Makefile                      |   6 +
 drivers/phy/cix/phy-cix-usb3.c                | 313 ++++++++++++++++++
 drivers/phy/cix/phy-cix-usb3.h                | 180 ++++++++++
 8 files changed, 602 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-usb3.c
 create mode 100644 drivers/phy/cix/phy-cix-usb3.h

-- 
2.54.0


