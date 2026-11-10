Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6691E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vlg+cRxu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Esdlc4NhWp+vhZfkjJWLLxZIVnbspe/Ab+wjBlyTwyQ=; b=Vlg+cRxu1wwnn0ZcHl2+3C/mx9
	/fPw7ppCc/VO+7xQg6Kq9YME1i3JqyGXDFlPo+d8D1B/Lf9G+ya9ftNQgLspDBFE2qdoX4M9B6353
	bFVZ45DLJwnW6zQbQ+UV10Boi/fAwL8M3IqevONeOQsZyaein+QTLyCQkVEld7Gn5onE0Er1aYZcl
	0zw+mujYESpU88f1qPrLArYb4zZ2JME4Adx2DC3QNxdRtHf7M1ZDQNjiZvH+xC3uCWMs2W6005fNx
	LT5JmDVEtwK9XJH81s9pDeGdqrkux1+3HU0Fv3GYpHx+lj5FzXTg5MIddWe/J7llmupeGRg5gRqbR
	/ieb3I8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeEk-00000002VtA-07pH;
	Tue, 10 Nov 2026 05:17:38 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeEg-00000002VsF-39z1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:17:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9Ih28Tw0Rh0naDX9M7K9zblv1YDCaUgGab5Zrza2dJJiD1l9MqzTYk4+fPxZ9YuWg3HUYje6q/Ck420aQpRqJgyHxF0IFMxltUrkAbB9Gr5/PoduI8jNu9cfGxRyWR6/6wx8h+gGiOYi85NgT8RFzUrJnRUwQprOJLKXhUkRSOenTobCv9NN27Tinm8ObMkwYNWM53Z4XUMhfCrpxy/f/uDk2ZJhrBoDmG8Nmbt5FhJt7kAknjq8XHF7a3bFoeFW0+adXTzYJ9zyl2A0tnDTCTEcKUpisubCF2YCvlcL3RYfEIIVnmwbqDu6t9ty8lhuFc9pXuMruUxhKx6xc7utQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Esdlc4NhWp+vhZfkjJWLLxZIVnbspe/Ab+wjBlyTwyQ=;
 b=N1DMjprLrbCRmciJRkJbwd4B6P3hqpCbuT2jpOSp5m4YoelaPJ8wdYmJupAJbz61TNY3Bc/z65NrBlepu3Jxy8y9EwzTGgRPd+5PmY8AnJJGyzOvhv81lv7UKVWcPLck8BMtmFN6Nt85EmFJsgBUVCbNA8r6l5ydGIq9s1q5i76KYvC7QJIVYXazXtcT5oZWHwYpODSgZI2QU8vGU4UlurJbpfX/p9VDb0A0QEdjCnnFREi28R/kXSWptcrPwZzPE7O6e+P+nQN/D5VUBUAtU20S/QtAmHg5gBm+/2XWDdophTEjb+1EmTpE9qaegSt5IIyvz6IxHO169lGa9XgfPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0032.apcprd02.prod.outlook.com (2603:1096:4:1f6::12)
 by TYZPR06MB6500.apcprd06.prod.outlook.com (2603:1096:400:44d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 05:17:26 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:4:1f6:cafe::29) by SI1PR02CA0032.outlook.office365.com
 (2603:1096:4:1f6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 05:17:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 05:17:25 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id ECE594102E73;
	Tue, 10 Nov 2026 13:17:23 +0800 (CST)
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
Subject: [PATCH v3 0/2] usb: typec: add CIX Type-C PD controller driver
Date: Tue, 10 Nov 2026 13:17:21 +0800
Message-ID: <20261110051723.434009-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|TYZPR06MB6500:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9c981454-95eb-4183-b23d-08df3ee9e884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|261021123027099003|261022105027099003|261022075727099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261028144727099003|261026121527099003|56012099006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: mVR6YMoZTO+ZS7O/4ZoVuOL+JlTgQplbW6jyglUH0Q6KjbvRbQIer19LNKh7ENvgaipW1wU9W4IW2pOHWxODppksfP6MuZb2TVKEfkKgju4C6g2SYnYrjPYTdnlnJUyVtOKXCr07m989CvR384W9Ce4+6oEE1hZyzsS+4B1v1Y7PTj21pYMyqpAhf/N43bfnpvoBYaTVqecipVF6f4rSMgMdbqb/D7hnIt+MjeK496kPIephojUrlKZJwk4axbugggnMujgyIlnftZe5MR5NLll35YOQoc6eOBVf2XMsx2WRCO/xrPGKrhZZdeAknxCA4eTkyscefWR1E4BTh08jJdWZIVnQHTEwboUNJ5IiauBvOv35D7p13ku6a+od+Dr7WFw3DWkusGyKacnimH+ai2Xm1kynuZt1I7B0QEpfVd0cwKPL1iL0Ac953MktRTBVQTDLhLSe9Xtfgu1HtgP34fV1Y323O359chzxupU+6ze5QDFVZcOuN0WHNRye+aDBFP37PERBGyqCEKs7u2e2LNzjhpj69/7b6gf5sYRtIA0YeRK/UruGd1FcfDTy+UH1s+bYYvtwySO9B9C/xRMQPjydX3hyp59FaUzC3/diY/QnG+IpGwBOxuDUzo0mBsOd+JYvZNCNy0wTphKcjCXnUfe0pOisF8v6TtSYbCpEGoipHiiWd2KNqAM2hmjeZ5HF4VNrZXxU17YCEE0lTBEZ1w==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(56012099006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZMArDvTAde+v3/IlJ7VCz3i0j/6IAgMJ6IfXALp9H+x+A7CYfkVYUj707hm/L3zKl3qzwiKUAwpEF0Y4s8N99iu03xr1fezJuY3gbJnSWWDJ+WM2BIltGRCtUgufusn3uFkkjn9S8pkOaxpT6pYMDWrdYS52gJZqLnfrzu9uvP7ieDE54JdRnrIP6gASn1qqzQbFEb+ZYvrCgGbG9w+kGFyWKlNIMkghJnj3m0uvIBLFvChbzGq4ONJTZhv6NcIOGyTARY+HL+r9ipc8trtU/zkyku/MwHFjWaiAIk/xwYs98J9CJJT2Cn3nWOtanRo7IqUFJnKDxT2a1VYUj72Nsf0L994yeR/2L/6xDNhNXyNyp+PFioPH7OZU+iALb5YjGe4NaTBAne0EGwdLd8hMH4sEYQIFnPkxUYiIHI+KDMxd1Vv2Uv384gXwPIbSo6Yu
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:17:25.7141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c981454-95eb-4183-b23d-08df3ee9e884
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_211734_816214_58BA9BAC 
X-CRM114-Status: GOOD (  15.64  )
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
MAINTAINERS entry. The DTS patches from v1 are sent separately through
the SoC tree.

Changes since v2:
- Report the Type-C data role from the controller status for every
  connection, including DisplayPort-only configurations where no USB
  data role is available, instead of deriving it from the USB role
  switch.
- Pass the port alternate mode in the mux state, matching other
  firmware-driven port drivers.
- Force the USB role switch to be reprogrammed on system resume and
  check the enable_irq_wake() return value.
- Acknowledge a pending controller interrupt during probe so that a
  shared interrupt line is not left asserted.
- Do not drop the borrowed fwnode reference when parsing the connector
  properties fails.
- Treat all fwnode_usb_role_switch_get() errors as fatal; a connector
  without a role switch link returns NULL, not -ENODEV.
- Drop a redundant include.

Tested on a Radxa Orion O6 (Sky1): attach/detach, USB-only and DP-only
alt modes, cable orientation detection and HPD reporting all work.

Gary Yang (2):
  dt-bindings: usb: add Realtek RTS5453H Type-C port controller
  usb: typec: add CIX Type-C PD controller driver

 .../bindings/usb/realtek,rts5453h.yaml        | 112 +++
 MAINTAINERS                                   |   7 +
 drivers/usb/typec/Kconfig                     |  13 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/cix_pd.c                    | 701 ++++++++++++++++++
 5 files changed, 834 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
 create mode 100644 drivers/usb/typec/cix_pd.c

--
2.50.1


