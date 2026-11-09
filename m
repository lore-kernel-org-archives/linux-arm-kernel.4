Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13636606D80B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LXGr/glV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WiafETO/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3x+tr/25dm/bxZ0VbWzVtawX/2sYRIreZjTKKXFFjsI=; b=LXGr/glVu8xG5fPV9q/aQxDcOT
	xgBp80Q9yG3fU6yYAhyWqXUkBeLMxHxU+lqBokdCpEBesrEKWVt+ZdcLf0ybNENh9xprtSttVxGp5
	jJ4p37z2ccTKJuyDkOaBVkbBLrqnrMHglNe/lMo/Oy8/4BrI+NgCTionysjWGS8yufIZUg7yMwJG4
	DF9E6+uBbERX+OD+KrdqRHLaHnhmTR/jTI62huONqdfdRmKHCwEY9guKV7aSi4T5ZckmIIIsczUD4
	loke6Qe47hLIBxP/31MsIwk4yEV+uTkugbFeyKV37kPhO2bHpPfBBS2o2ytSZXPcij1hSVkza1WxM
	+k4TKp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLbx-00000000FVa-0Zoi;
	Mon, 09 Nov 2026 09:24:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLbu-00000000FV1-43tR
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Nov 2026 09:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3x+tr/25dm/bxZ0VbWzVtawX/2sYRIreZjTKKXFFjsI=; b=WiafETO/pDIu+c2/gCz62Qqil6
	iBTtVNIo1C+da6GGCpuBm7b1JM3teMRh9cGdAlp1kAVNEbp3kyG8Ftp/R1g+4SzDzf1ryPD4gPNPE
	1pho0m8QtsSbD2R0YEZl6sWhPHUCmqpV4K+544kOyZA9zHndNGS/qIL9IXF+yXNC3WDpjLH1SZCi1
	IQ/7HqFEzfkXRYBdfkKZPxKgtY9vdpMoD1cdViFW+Mj3FHmHgA1NjbNFt2RM98h7sfbodMXNybuXk
	QffVaB59U/Gb2PlEmn7GTQai2z7z7HBkoYp57QkrXhrTaoFJTtI7E2nVcqFJs2D2s9yrPWDaLbNaF
	jrjQPCBw==;
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLbp-00000006WbC-3n4w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:24:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hP0aA6kJ4vLQsgmtl1v7KNqY2tq4aoXlvXj3PNPSvjbqgJibdP7ZQG2asSC8fKgMU66oLNTvKkvV6WcFUEbLTzlISxbeMDCicPKREGNaUt4jE8JYk0KKUYXmj/Rab/UcqFzT4JOb3Nzl1Y67GdwbuO2Qszy9xfyO+uW7HRwB+D70EXmy8ehdlOTGt1Q0jetAhCL1M/gD6sGMPfbehDaw4TRDf+uM3kj6M6YUgQxXvZD1XDth49eZTKRIUinGWNf998isbesQQu0vE+QBYqXPktzzvgjM0tai7/M4/bFtSt/QUEMJN89DTF6bkQSmFj3MRfFBoGrMmvO/aQHALrLmWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3x+tr/25dm/bxZ0VbWzVtawX/2sYRIreZjTKKXFFjsI=;
 b=djzuOs0QHW4XC6oqgENLyi9KN6wcdEyczV9vp526nZKNOXNNpHjpkH1YOgUIvFJwDLKMTbucOj37VbFW+XgfMrsF2NBHiNkfTgirYB5FE2wbWfG44suOOArZhE0/1WXOQxzlo96aYhGJRC5rI8Kza5tyXNZMBSF6jNQL0RxL0FVf8PfujILsnjfwn6KpLheikjUVZj18RwNvYA5fs9P3UiPsd49bhvaY2bMgvJwfy5uNkfC9Ka+ZiFSdj/CirHSrYOOh9gAol09QqYbUdRGY6LSLDTk3cgic/kb655VoHVsRXqubV/uJumXlepXOw0wXWOpDKoN94/DP23tcLX6F5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0138.apcprd02.prod.outlook.com (2603:1096:4:188::12)
 by SEZPR06MB5245.apcprd06.prod.outlook.com (2603:1096:101:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Mon, 9 Nov 2026
 09:24:02 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:188:cafe::9a) by SG2PR02CA0138.outlook.office365.com
 (2603:1096:4:188::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 09:24:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 09:24:01 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 648CC40920E9;
	Mon,  9 Nov 2026 17:24:00 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	gary.yang@cixtech.com
Subject: [PATCH v2 0/2] usb: typec: add CIX Type-C PD controller driver
Date: Mon,  9 Nov 2026 17:23:58 +0800
Message-ID: <20261109092400.202219-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|SEZPR06MB5245:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 72f35ea7-777f-4060-f35c-08df3e4330fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: FTjaWoMS6ylswIpFGXpF3byDKnspHFHP0aZq2lVic0c8jYHMiOOaOHljbUkMgxDyCRScxY8BFDxwjHfUpqc+AOiaig+Qpg01AjvEiTKHyWcBgLQE4EbzCk8hsePGSukER50ClTAej0v8szPN4ABhwbiWrFG9KuWCdf+hnzzZ9iEs5V27pyu3hvThy8fbflxCF0E5PFrVDJx2vWQCSLY4LpF2KulDQQwCicyARX7tOndCH+Fa2U5JKUxMUccYfpWKin2+WCJiazme4di2O4oKRSVGk4nBFq/1eGOsyMvgN9t7yJpDYNHesVt0cI0vOYQS3RozLyj83Wv7vRGHLYbU5eQPB3QiAMZpxu3X0JIY1tLGcu4y4aVUHtkFoZBwZ9EH6PPuef3RAV2lNjyYt1yw9oyK3BNL7XxHrQ6pAYEEsblJn4KZbzY6i13agI4IvZkofeXQ8Sx4RRr20+0q0vJ+M5hFrlBL25UvTqK4sLuGACSb6j5nAY542pqE2wFAXiWjzwfQfgbcwImqoPfI34s/2CZHsmxINYuTusyJ0tJyConCROjC9C8bY5mbESOuRfDZHkEhgE2KkUj520jAu8/jt9/7x8ufmyhMmOvb1G/a72nTwuBB/8+sh132fIqnYj6ZmsC3Po33Y0HWvrcjt3Eam7NoFOEHSyX/fVz6Z53UDy4mcLqwfzgZvS/LIpXWbQpBG+Eo7hQDCS4zlzYm8s8aiA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Kq1cjaufIxJ8OoQG34sH7c8D79QH7XkJXOtmk2HPwl/KVQVv6KPOqGON2rR7JoPUs+VCzEdWx3A40X4VlSYgZ3Xl6SWXJaj5eHoDRkAN5RSpoklovvgXBUcon3+jfP1ofKyJXClKHvxoBW2WQ/viWflfRmiwS7ykKxtsF+1zmkZtNNXZwHtfv9Ry2DDCoB3gvoe+JcjMHl6NXIH22aFTC12kB+g3/d0fVNrj3Chii3+EBlyGCdHvFvXp268xxbgGFjMJvAsUwLSrAXBHk15pXabFSX/kWPE1zg1ihRlr00hkBDqY9WjiWWIZo1HE4nqq14c6lOU1AjJYabDTCj6G4YQP+8QBa4BSUT49Sd/HfR35u9Pou9B6pogxeYFMyexGZp2AhlWWy22Ie8WjY/yL4ruZD3ALm98L98UL4p4LpnqmaOBTWKb9tnZTdCfnFFXC
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 09:24:01.3655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f35ea7-777f-4060-f35c-08df3e4330fe
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_092413_977545_60398D40 
X-CRM114-Status: GOOD (  19.35  )
X-Spam-Score: 0.0 (/)
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

This series adds a Type-C PD controller driver for CIX platforms.

The first supported controller is the Realtek RTS5453H, a stand-alone
port controller: the CC and USB Power Delivery state machines run in
its firmware and are configured through vendor registers rather than
the TCPC register interface, so it cannot be driven by the tcpm
framework. The driver translates the controller status registers into
Type-C class notifications and drives the platform PHY's orientation
switch and mode mux.

The driver is named after the CIX platform integration rather than the
RTS5453H so that further register-compatible PD controllers can be
supported without renaming it.

Patch 1 adds the devicetree binding and patch 2 adds the driver and its
MAINTAINERS entry. The two DTS patches from v1 (the Sky1 I2C
#address-cells/#size-cells fix and the Orion O6 board enablement) have
been split out of this series and will be sent separately through the
SoC tree.

Changes since v1:
- Drop the DTS patches from the series.
- binding: describe the single connector as a plain "connector" child
  node instead of an addressed node, and stop requiring
  "try-power-role", which only applies to dual-role ports.
- driver: add the missing USB_ROLE_SWITCH Kconfig dependency.
- driver: register the DisplayPort partner alternate mode only for
  actual DP connections, with a valid VDO, call
  typec_altmode_update_active() on attach/detach and set
  no_mode_control since the firmware drives mode entry.
- driver: never pass a NULL alternate mode to typec_mux_set(), and
  treat debug accessories as disconnected everywhere.
- driver: handle USB 2.0-only connections in orientation, role and mux
  state.
- driver: only cache the USB role after the role switch accepted it,
  and force a role refresh on resume.
- driver: use typec_get_fw_cap() instead of open-coding the connector
  properties.
- driver: acquire the mux and role switch before registering the port,
  use dev_err_probe() on probe failures and reset the mux to the safe
  state on teardown.
- driver: remove the undocumented disable_pd_interrupt sysfs attribute
  and the manual disable_irq()/IRQ_DISABLE_UNLAZY handling that could
  leak the shared IRQ's disable depth. This also fixes the build error
  reported by the kernel test robot on sparc64 and s390.
- driver: use a named i2c_device_id initializer and add the missing
  hibernation PM callbacks.

Tested on a Radxa Orion O6 (Sky1): attach/detach, USB-only and DP-only
alt modes, cable orientation detection and HPD reporting all work.

Gary Yang (2):
  dt-bindings: usb: add Realtek RTS5453H Type-C port controller
  usb: typec: add CIX Type-C PD controller driver

 .../bindings/usb/realtek,rts5453h.yaml        | 112 +++
 MAINTAINERS                                   |   7 +
 drivers/usb/typec/Kconfig                     |  13 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/cix_pd.c                    | 687 ++++++++++++++++++
 5 files changed, 820 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
 create mode 100644 drivers/usb/typec/cix_pd.c

-- 
2.50.1


