Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B248A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 01:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bEM4cUYu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sdXFT9W9Wyc62fL8WwLK3bZAHiberLn+3ZtXwWxtjc4=; b=bEM4cUYuUtkcgZ7/uQWYDO5S68
	7now7Zc4omFQkE3dZhdYpgkAFbiXXbOwzsJubyu7B92RpXS1BUrpHYr8Nbs7xw9a0jUJxdIT33khk
	g/UhdhdBSMs9OHx6IhSBVMt3aY7PxB1q+qlWESuyr0nfYcCtZmE8aVH2rlcoc1K6IYDj6pqM/EK94
	14JHURcenkAEkvg+yQntOuQ+YAYURcga9OuPAdLJtM7p8z6cT19vk+4DtH4QrIhHNsnhVUGkIrH+u
	DOosSArQ+ygY/FIMKOqYxa4V6o879pDTgWZ2Gqgwx8sfi1P0OjhEK63D4sB7yxpp9DBaZ6iheTWC0
	PWIBHl/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUxU-0000000Dyw7-0ITF;
	Sat, 07 Nov 2026 01:11:04 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUws-0000000Dypt-2X6f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 01:10:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3DZ6AicCSXgjEjULNMel3dl3RiwQR+TeVNttBPyMWpWfiGOGCO1UqhBl/8auKg4My7qT/fQAHAnxJieo/dMKtuCc/egjs0HCZ8QTKPjXSfPB8Qex+o7IW3LTjZxMzDGoYdbON9GY20vhfbXWRWLVg8JdFVMArq4QepSJGj42f4hTM7439gPBQsHUD4teMSJflYF0AA5V5CZuKLh6uzjHi5+LljTh0PBfnBYL7I3SB1OJ5uRInpQTmxhD2leFdIv+fk7Sb9VRTe+UHvw7eEptjIeJ/f0GpnIDhsK8emuHIHkOLC9GERAnfhhaN0Pauo3PKKfSz0wKUM2+amB88kAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdXFT9W9Wyc62fL8WwLK3bZAHiberLn+3ZtXwWxtjc4=;
 b=mpZBZVzp2So6mN/f71puE6sL517/OVU0z0Oxe7hCk+XvoEiFkhAr8zVnnyn10neZoN5PYmC504EdtiDEJg8Mtayumja524VoYiTMjhNxgY5z7Iaq6WHCVV1nKSbM8scLa2YsX3dWDACfnMDLC2RQThhEImrCXEZ2iv+PEUqnuZNe7PzIbzdlCRicUiiXicvDPkQaSAVPies+TOILe8fttul9UpD5Ta/QKKXMC9mG6bfkSfcayf4lrNzlH4jDF3UBkbc2JEh7PqWcHScJthstXKyqK2/tGL7PnKQgq5mQs8Z36Q2aAxjI1JlOid2wjmdI2Y6A47+ndJ9SZHu796Bv+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) by SE3PR06MB8642.apcprd06.prod.outlook.com
 (2603:1096:101:334::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Sat, 7 Nov 2026
 01:10:14 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::72) by SI2PR01CA0047.outlook.office365.com
 (2603:1096:4:193::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 01:10:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 01:10:13 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E40814102E61;
	Sat,  7 Nov 2026 09:10:12 +0800 (CST)
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
Subject: [PATCH 0/4] usb: typec: add CIX Type-C PD controller driver
Date: Sat,  7 Nov 2026 09:10:08 +0800
Message-ID: <20261107011012.3655873-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|SE3PR06MB8642:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 56f66ecf-3ca6-4d50-07fd-08df3c6be0cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|10067099003|18002099003|56012099006|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026140227099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: G6EeKiXGxW8ggpaMZeCPdeLBP548wH+/j8aNIPx6eExsuSqgp0H10luVqhQfRDzEYTAGPilFmqnCtCjPLKtXKirj+hNfFr94Nklhoafzode8c/oqqLcT2ojYHwsKDnIym4eHOPz+sCxO55rUW54XPJsZUmFwuPHda7iLcu73QIKwGa1Mv5V2AK1R2oVYAMrBVl1SP20tJY1kKiU44pNJzzZjHvUhrVet6khjnvxJMzVvUXMjsXhfVOXLB8xz8DdPq6VfmrcTlPDETRCgD/vqbEvQJtga1G5JQIURVGCuipSu9CASIeI/QVrVRkjxbAjGvpf97Im20ppp5iftP0uwetHVxQPgZxkBH5OCh1JjwToeV3gp0iwLLiq9ZV6s32siXalfFLn6y5y6Tq8x7bGfsAFHsH5LqevkjBJdKdCCPn7J2wQnKei/4BVtFG7DjHIxbc6CBuCJaiQ2eKlZC0zIlgZ9Yl8RFZeiMdoBb3WypVnzfpcSIGojcXRDtqWM5r92YcDvaqUaf6rpf+41M1FvqgYEsrHkoyOWDZs1PU8CKyuE7diGyylawxlmOhe1cKEQuWtGqgtX7u2KoLdh4ZrCvgqDEqQjDZc8hRmukRev1BB9kyGFSHgrHHC4/NKQ1c2DG44rxnNkGmbRB0PivGQCseAYlOjKAHgcM+xbnurcUJwYqm+Veb95GogeO5Z1dBafjQ9UWqe/Y29HI92ozghJdg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(10067099003)(18002099003)(56012099006)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gXjgvXYVqh9frnAy350uhioGpHfHMyqI7afi/HqU47Tnu41sCyZCUbgI5ygKBlEqCcJE1d9/sbRq3UKTvu8aGz4BJZ4G7uJGNbsVe8QTPk2Y2++L2OOGue7L9qb6Hw8SSsWv4JOQdvRiyc9drgtUFZpW5/3DMK8kIgTELexjqVobClOLCf/IkYaMlMa2JgbPvUQqOO3Mz/TsaT9S8zJ7wGluTepyzVbrL9V4YPUhEmtxwGjPUYmIgEp+tBhAz1j7GPvhIpG9mRZ/oaz35YOyIkMp/HuuPRamnyFvIYEhx4HVsLvMQ+5w2vPaDr5rW9R6IILtnS2aQUFSOkgxADIbEuV3MOo8ZF5Se0cQB67ZFrvAztZGfktkzJ3mHr6KYSwGfsbUyRGhaxdrVx02kx94FtofZGmBoTswKfG7RvpKiqclDB5IVRXZl2M9FoiBMuBZ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 01:10:13.8171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f66ecf-3ca6-4d50-07fd-08df3c6be0cc
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8642
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_171026_644613_10F56E1A 
X-CRM114-Status: GOOD (  14.36  )
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

This series adds a Type-C PD controller driver for CIX platforms and
enables it on the Radxa Orion O6.

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

Patch 1 adds the devicetree binding, patch 2 adds the driver and its
MAINTAINERS entry, patch 3 fixes the I2C bus #address-cells/#size-cells
on Sky1 so that child devices can be described on the buses, and patch 4
adds the two controllers and the I2C1 pinmux to the Orion O6 board.

Orientation switching and USB/DisplayPort lane muxing are performed
by the platform combo PHY. That PHY driver is not upstream yet, so
the DTS does not link the connector to it in this series; the ports
are still registered and their state is reported through the Type-C
class.

Tested on a Radxa Orion O6 (Sky1): attach/detach, USB-only and DP-only
alt modes, cable orientation detection and HPD reporting all work.

Gary Yang (4):
  dt-bindings: usb: add Realtek RTS5453H Type-C port controller
  usb: typec: add CIX Type-C PD controller driver
  arm64: dts: cix: fix I2C bus address and size cells on Sky1
  arm64: dts: cix: add RTS5453 PD controllers to Orion O6

 .../bindings/usb/realtek,rts5453h.yaml        | 126 +++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  51 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  16 +
 drivers/usb/typec/Kconfig                     |  11 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/cix_pd.c                    | 777 ++++++++++++++++++
 7 files changed, 989 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
 create mode 100644 drivers/usb/typec/cix_pd.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.50.1


