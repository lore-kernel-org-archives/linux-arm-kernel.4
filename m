Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D9B606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FmbLy2v/;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=ltZJUZb5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ioZC/+/dE3KvhD56QKMRjB6kDxDJy1bgz3Od/RtauJA=; b=FmbLy2v/IYxYggFX6qi592oL+u
	Qtag6XF2QW0UF/4noIeAneiJ6/bgPfgSFHX6DKaXXbBMZSXzLAkxLUsPRGshQmtFSDtjclYG5alL9
	9je+hA8jgZx85n6y9gVsvWWOWLaRKuFeSPbQ7arUyE4N+svd3EDCPdZOQ20soVfKAVAwtB9rvBrlD
	JIl7om0z6N1DfDxjT6ok6HF0Azk6OWSNAZ67zvOh6EXaLB3r9d8cEjIqa645x4mRkCsKXcT0s3vKf
	bJGSIriTs+v/PxldjfVbWch5cUWtYLnptMu+P0LfxnYdUPDCSTXDvJK/iNbRaIhWvePfRNYLcak6y
	5FXPJ3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Yq-000000069fQ-2Stg;
	Wed, 11 Nov 2026 09:24:08 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Yl-000000069cQ-3mbO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:24:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIvLhA+rkLd3LQlHQhNzDL2sDbyoXTuoPmKhXIixnEc8kKxZu8BlKwm+/EmcaYIMExyN6RYmaRT3wMpUgcGp0MkGDVpTZ3fkBWYU96ZkvO9qI/w2aVOAb/+fV29R2rezbE86TDReziUdSURPQVMBo7AnoioX51Ie0A96SqF9f6rmDCPv9bKsKVxkop+jJKdqI4YaqNnjqbgAwqjNu0/Yl+H/bJS4ym/OylwHJMgxfuJ+hIwb1Naj9kW+NwRmdjAST+NqMHXIKrpnUd5VbuD+HA/xWO5x3odd+buUN3zLy/UaAfxzFaJjeB34NWj/OTEWzsM5so/MxCD2320SzV52zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioZC/+/dE3KvhD56QKMRjB6kDxDJy1bgz3Od/RtauJA=;
 b=jpeFLDufIe2hG1tBHqluBmN1H+uWnYQ3342HQ3PvXeJfIFbAWmenGkDNYioXTeExmdN8Ppb4A0ZEeMGpCtDznf08vuBDRQsAaty0EU9MxGBRDVFcGbR0ccc4S05MFctEmpGE2I7WByScdLhJKVi7VrnvRFppxMAKFt765AgDkkd77oBSzqXJ5NLutmeIaTle1yI10scKPP1vzOV/F/No2QFZrLfJIiNHyDqiUqiNePXnmGW9+w5ZGb57zssY9W2d86LBZ55dcNBCfAO3onJq/bj9t22nm0SNwaw5DGHZqDfgwB6oZDxS/FM0pQyD5p4pXgLVm6zoxlMebwo0gUGLvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=nxp.com smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioZC/+/dE3KvhD56QKMRjB6kDxDJy1bgz3Od/RtauJA=;
 b=ltZJUZb5e27BHyX24tLzXey8h3KsK3yhS7cPnbwh4ZeQ2XYssNUSH+aBmMuPfK4hG6+wnwkMJ+RicwyG0AGwJP1wvTVPSQL8v2a1iEBKCHsnoCE6FUXHvBNWfyIDH731hI3csjsrWeYSv5a4Rx4NsGecPpzTNPNYibM0YIdiCp5MFd8j6B3IW8jiFwK4WiPHzUaM8C8ANkHzvDXqCujm7ek+4JaV0zYCsbKgopz0aAwaSqNnZCVPKTTtaH9nyzg3w7ldRw/R6F3v4Kk25kE9OVYb3PiHXEcCHUdHe7k+oMbPXx35up/C+z0feaXdIYzTocXi6Ohj6FmnAabF1jQFWw==
Received: from PA7P264CA0401.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:39b::11)
 by GV1PR10MB409108.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:137::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Wed, 11 Nov
 2026 09:23:52 +0000
Received: from MAD0EPF000008C6.eurprd05.prod.outlook.com
 (2603:10a6:102:39b:cafe::3b) by PA7P264CA0401.outlook.office365.com
 (2603:10a6:102:39b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 09:23:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MAD0EPF000008C6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:23:52 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 10:23:51 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 11 Nov 2026 10:23:46 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Subject: [PATCH v3 0/8] Update BSH SystemMaster device trees and add
 SMM-M2B support
Date: Wed, 11 Nov 2026 17:23:16 +0800
Message-ID: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAQ09GoC/2XMSw7CIBSF4a00jL0N3D5oHbkP44DyEAYUA4Zom
 u5dWiemDv+TnG8hSUenEzlXC4k6u+TCXKI5VURaMd81OFWaIMWeUeQglIIpWUjeg0fo+MBQjZL
 rgZNyekRt3GsHr7fS1qVniO/dz2xbvxSj7ZHKDCg0/Wio4FxTZBc511NI0tYyeLJpGX+F7k/AI
 pipM0ZyJdqhPwjrun4A1lWi2vEAAAA=
X-Change-ID: 20261027-add-bsh-smm-m2-57812d9c7e87
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Michael Trimarchi
	<michael@amarulasolutions.com>, Leonhard Hesse <leonhard.hesse@bshg.com>,
	=?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, Qiu Guochang
	<guochang.qiu@cn.bosch.com>, Akhil Narayanan <akhil.narayanan@in.bosch.com>,
	Florian Ager <florian.ager@bshg.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2559;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=0bUF6kYh6Bbz8QjYQ71h8rLyP0QsWdLZ7gGCmTcC6SI=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLK+mPB8368gu7NTefsLds+VC8rbNTt8ZqW4dmtLfHvq7
 9vKc7uso5SFQYyLQVZMkUU1wfus5NUA02kzq+HmsDKBDGHg4hSAiTwIYvinrt3Q/GBLS/OOIm1e
 aUNf/bvpdW+OLdgltiNMjTG+5Mwuhv/Fv7uuOS7cLPnjkGr4ognq95YZS2R/yOgpUs748Ux05wx
 mAA==
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C6:EE_|GV1PR10MB409108:EE_
X-MS-Office365-Filtering-Correlation-Id: cc3818b0-6b96-4e23-3204-08df3fd58035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|82310400026|36860700016|261026140227099003|261022105027099003|11063799006|5023799004|56012099006|261021123027099003|261009223027099003|261102123227099003|261026121527099003|261022075727099003|261021121427099003|261028144727099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: fATqurOodibQ8gNYNSL5MjieLua34ROlNFMJ+Y+6h/NEI/VdwpithEkB+DK/7+MspBIT5COieOWGqzHW/LxUyqg0UrTAe3cuvAnr7tomwdhp7aWGzuJR/v9rIPkEDcKLKL8fbxXcm0tx2ssIfcmXv7lVzyH9j6dgw365K/HI45DwOwny2v0L5qjSE812fW5KvLbUtNMDwiKTa70wSJC0o37FGedaHUhENbASqHwVoEyDWzkOk8Ui6hKhypoq9eNjYXkGq87aGZ9Vlxk+iRGN4bAKTEElIs6rCbCM+QF3ReOGKwKAaMs1JxJOriaIqhxFNMahgfRGRKw1pIlFU0UOUT8jCiWOZgU8j7L7cgyNyBEKL0W9cKiteDnVEXGLnKJS9n+JH1eeRzw4noT1wznoCWeCJjiJn0JgDCf5ZxJQ/zUonuzV3uHqAvuzWSjmZzd3XWsrmjgGvwnjyn0EhppLdafVeUtQ3ubTedBCTwkvzI+/DXz5eeYYQw4TbjR5XBKXuLjR7RfVKpg1HGYPD14FhSphOJX0YWJrQPF9NFaoAYbkGlxkFqAOywZGlXfehUFVFPof/n6xjUbn/eFyjV8lB7QHRForZU46j+sH50nc6sC3/zX6kGnWvvKTLfPr9ec58Cr5/SA5S0UOWUma6ntEr/2vcRTXu5A0LpuEspwGn28=
X-Forefront-Antispam-Report: CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(82310400026)(36860700016)(261026140227099003)(261022105027099003)(11063799006)(5023799004)(56012099006)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261028144727099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qztHD7vBF7Vi5p1vvkmf1ca3v+TiYrr6l/j/aQDr5u+NqAETlegkratn0q8mZDIxHsBzfE3/C51xQSvYQ1ttT55VusA/PptbNuEN24qM1LmBvPRdnu8RT3z0S3JecDrjXaBGSp9yNq/k7L6w7enDbKsBbSjc0kFbidljn3nD9CqpmlD/g5eCwqPe3p6vcq5+fK+um4dLMMBWrw9juNJ1LNBOWeKckuUGQRu7G5G1MOe0kh2noiyEEGQlw9OzqzX88ZTmGxq4vmWwzRwO8yZTq78jbskqbJHmiUUixCsFGyCUoiZjSnDVcG0OSll8jQK5x9aRQyDRDIIu0x1ePgbZWWw+6PNmHctpnLx7TAJqrjT5PWIk5olZBXGWM0i+gdPMH7ptaFSs1tTXo1hN7NeADXwRNXVYuSVnE6Ty/xslOoy7r9ddBfz1jAYH2XTKT1BF
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:23:52.0278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3818b0-6b96-4e23-3204-08df3fd58035
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008C6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB409108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_012404_462023_4EEF565D 
X-CRM114-Status: GOOD (  12.69  )
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

Update BSH SystemMaster device trees and add SMM-M2B support

Add device tree support for the BSH SMM-M2B SystemMaster, a variant
of the SMM-M2 equipped with an AIC Wi-Fi and Bluetooth chip.

This series adds the SMM-M2B board binding and device tree,
reusing common hardware definitions shared with the SMM-M2.

Configure the minimum NAND ECC strength on BSH boards, optimize
Wi-Fi and Bluetooth GPIO settings for EMC, and pull down the
active-high WLAN IRQ to prevent unwanted interrupts.

Configure UART2 pin multiplexing and enable USB OTG mode on the
SMM-M2 and SMM-S2 boards.

Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
Changes in v3:
- Update commit messages and subjects based on Frank Li's review comments.
- Add Krzysztof Kozlowski's Acked-by tag.
- Link to v2: https://patch.msgid.link/20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com

Changes in v2:
- Drop the redundant RNGB enablement patch.
- Keep the WLAN power sequence in the SMM-M2-specific DTS.
- Move the SPI display and touchscreen overlay out of this series.
- Link to v1: https://patch.msgid.link/20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com

---
Akhil Narayanan (1):
      ARM: dts: imx6ulz: Configure UART2 pins on BSH SMM-M2 variants

Florian Ager (1):
      ARM: dts: imx: Enable USB OTG mode on BSH SMM-M2 and SMM-S2

Haoning Cheng (1):
      dt-bindings: arm: fsl: Add BSH SMM-M2B board

Leonhard Hesse (1):
      ARM: dts: imx6ulz: Adjust BSH SMM-M2 Wi-Fi and Bluetooth pin settings

Michael Trimarchi (1):
      ARM: dts: imx: Use minimum NAND ECC strength on BSH boards

Qiu Guochang (2):
      ARM: dts: imx6ulz: Factor out BSH SMM-M2 common device tree
      ARM: dts: imx6ulz: Add BSH SMM-M2B board support

Roman Smrž (1):
      ARM: dts: imx6ulz: Pull down BSH SMM-M2 active-high WLAN IRQ

 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 arch/arm/boot/dts/nxp/imx/Makefile                 |  3 +-
 .../dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi     | 86 ++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   | 93 ++++------------------
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts  | 13 +++
 .../dts/freescale/imx8mn-bsh-smm-s2-common.dtsi    |  2 +-
 .../arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts |  1 +
 7 files changed, 119 insertions(+), 80 deletions(-)
---
base-commit: ec7b37c768d34107d06bd629d05cde0e2218ee9a
change-id: 20261027-add-bsh-smm-m2-57812d9c7e87

Best regards,
--  
Haoning Cheng <Haoning.CHENG@cn.bosch.com>


