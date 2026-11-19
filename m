Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0FE606D6CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ziCcV3G0;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=owXW9S47
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FbALR339RuYD8lhd4cuoPdeHYUc/gniPSnw14Ih6UY8=; b=ziCcV3G0ktXT6VTJooFdS6Dn4T
	8P8SVrX4im0gRDebh1hUYgjxVdwzllwPUrnNIOsWlMzECaYAT0FNALTTmKCjwItm8knk2MS0Lo1VT
	PgHxrXaW6Na2gKGXH+n5k85uVfthQkAxoJahKblFXdL4ok6ahkyMwGcMtoKl68aBiprlAutKy3IFN
	chsgtKdWZNRp9sFdSZEy2qGe+8nJFID/kP+hLxsbnLVkPXOty2yncxNFswKbru3LMPduAd6Yrxfsc
	w1ychOjVn1E0kgLErd7VeF9YR/2H7ohf1BbM4qewRihDRjJE/418JJNtHMHEZvPOlF7nlSx69+9QI
	1PZGPMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4GV-0000000CVqG-2QKl;
	Thu, 19 Nov 2026 15:41:35 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4GS-0000000CVpb-2KmC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/8O4AvgzLNZqMi+bknFZDsIPjC9i2s9AZ+fn2Q6rBXrmwZfJHoGUdThSDHf4SMLGSfP1DsBEQI6sPwNw6QJF1xWRp1SwnAaFItWaHotQHNr2DwzctIx97o7qYiqLqqKL9/s5FGf61CSCrndBjd2qrQ1+9AKldwEv37f1GQDw/W+D4o/+fv/otOml6KhaakYBbbKBrE+/uOjdZ51zViqMJVhmZbhs0IMSzbPwX/Wa9lL9T01jD7XJokV4v/eAkcpOLN5+aON4kATOfFTvZmO82JWRFxnzx8fnsB9asJFvga4i+1iAuq4fURhdz3/HrzwnAj2vfYW2ypD+RxyBBI0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbALR339RuYD8lhd4cuoPdeHYUc/gniPSnw14Ih6UY8=;
 b=GeDhdp8y9O+N/JaQUPQprFaVRLdt+9xpJ+tEwbx97Uq+Cvjz/TAt0bDvAw5ZjRr8YN9yDm+2pRwfQP2XpMcxlwHLnBTBulKAUrvDBNnMfehydv7S7Ulz+6INLU3iq3HNiNYwY3iuk65vvdWrld/1SR5UG7ONO+GztbSurSlpfZXYlHxwT6rKndVtUHBZse/L+jNYXOv+94uDrDbM4PP+6OdM3emGGAOZyAYUC8mS8wWBLSv1QkZzn8Jy5jDSjoSttpL4nBS9M5M8gcVpEP9AHZgseydfirFxNdKGgz55+EMGBN9zZ+dZdCHjuUD7ByNmeHnjz8m1oNVIOPvPMqsKnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbALR339RuYD8lhd4cuoPdeHYUc/gniPSnw14Ih6UY8=;
 b=owXW9S47hv604OJyhq/dHenvE+3PpGbr4HCLjj9DmbXIooxr3BEVluuCd2sAbwzveYYP1EtvPWKE9WHq+zW1OIKbnRKMwUxTfUX5zuIv5IEEUpCa3isCf4xHDyO/mo0CqazWXQRH0xjqxXtkXSxO6wTuCH3HMQL668oG0TCflPY=
Received: from BLAPR03CA0177.namprd03.prod.outlook.com (2603:10b6:208:32f::30)
 by LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 15:41:23 +0000
Received: from BN2PEPF0000A894.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::7f) by BLAPR03CA0177.outlook.office365.com
 (2603:10b6:208:32f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 15:41:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A894.mail.protection.outlook.com (10.167.248.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 15:41:23 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 09:40:57 -0600
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 09:40:57 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Shyam Pandey <radhey.shyam.pandey@amd.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:USB SUBSYSTEM"
	<linux-usb@vger.kernel.org>
Subject: [PATCH 0/3] arm64: zynqmp: dts: Update USB hub description
Date: Thu, 19 Nov 2026 16:40:41 +0100
Message-ID: <cover.1795102838.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=michal.simek@amd.com; h=from:subject:message-id; bh=o/NSRq1ct3M7O00Pa5DJVYX2tFguRDyP0qAJ6nR48O0=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9l2j28V6a8lM373PyOYE3e9+pOXjs0zB27wp1dz1Y5 XlHLPVQRykLgxgHg6yYIst0Jh2HNd+uLRVbHpkPM4eVCWQIAxenAExkygtGhgepR68aCzoKr7cR 8yxdp3iSe/q7c2dqj+RckJ76K+HThaOMDAtLFuk/DIy9f9cum1mSq3/Pv7K3c7iMlc3c77u22W2 YxgcA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A894:EE_|LV2PR12MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: c60565ab-aacf-4878-eed3-08df46539097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|261102123227099003|261026140227099003|261028144727099003|11063799006|261021123027099003|261022105027099003|261021121427099003|56012099006|10067099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: IqvKoEMBZmvDzOMyEdBaxDkKGpo4eG8FtbDRVaAzv39p7ldWPhDY1gWVyzbP7jbUV89oBYr3JvxJJJrXMN4GJxEvT6Ky1+neq1A5hpejrleIxBpUaY8sR5TLFo3JFzON4iPdrhXEnXf/qMkwuFWM9aXpSGUlCeFPpF0k+YRm2M+fjStGjXqC3oJTrz4P9CZ9lwRCC9uV35QYXEGf4PzDcaCV0NwXvXqtGfF90xqwAIkQZ/wOmhoDiGm7xkzniVmbalq9TUfcK/Dvq6hqC3y384RuYcDXEJSsuoUhsy9AU+w7PH7SzU3fG+bUh2dWbJQ6d/VP0QgzvzH1IMxjveaI2prwDB4rZJdzZ/sXuq0mt1qcEnp5luKrtV9h+3rYQ0v6a4VFjaiELkkIZJCs4piG6dMiwKgfcL51gkvAVcETbFysqlvf6DD5p5WNBrbehOdjJOKg0AwZLQo6z1MyjSTSiD9DO7V2PvpXibFCQ4u6R5Urlu3dDzP6Hdgou9vRu4i0yuKgAdd28MhU4ugWUH+XDdiRlcYHbfTqJPefJxFxrT1zHKix5HFCui8npuWJfkGsD3Zc7LdMC4fd8HGMv9G8kvLWXkWCVPbFPGzKPPgGU3L+0xtDakzEVfuVUathfWag/l3UBtBumqEDBVxNGmN5XD/BTjoRQeDntYg/Mk3YNCmjBX+RhekBz3fNgELjP4dSRacpcjTwHY/+oVjAXyUd/g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261102123227099003)(261026140227099003)(261028144727099003)(11063799006)(261021123027099003)(261022105027099003)(261021121427099003)(56012099006)(10067099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xdX3nk4zCv1lL2MOJXJIcYt1UQ53PqImGmBa52RXCOHcAF9Rpk4FXOEFbmwwxj1eKwocemkV2o3Qm8Ocnz8Br6Un2yjimGz66wsGxatzjfR0IkzmfCklRCQdPfQvmlkSOzXehayucYd6G159GYKrEvW+qOGM1RV/wpQgeLvPuw4026zpWTmFg2eqMVv1RAVeZq2KjFpN+bTgIMV+TQdA5k8vjwlL1+cHWqq3yred4Bro4vusmMGUctdk9lqY6zpMyQ091gCHTnXXNjj2XQ29M6ngh1RYjTrS8w+BSw3LYO2MfpgYqjMtgOiF7Q5Zt16NX91hc/PRnR/JZQCq/NzbRdlU4PSUstrnfMXoHsP8CZSSkHCk3z42OU53fPAg/vSvjw/sRjrHD7Sm6wA9TT8YiWx5D1bdJJlqWJp4EoTSSFai2bxowBsY+CStFcwFRZJd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:41:23.1602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c60565ab-aacf-4878-eed3-08df46539097
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A894.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_074132_642323_2025CA88 
X-CRM114-Status: UNSURE (   8.34  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

this series update USB hub description available on Kria SOMs but using
gpio-delay driver as reset provider with also defining power regulators.

Thanks,
Michal


Michal Simek (2):
  dt-bindings: usb: microchip,usb5744: Allow post-init-providers
  arm64: zynqmp: dts: Wire gpio-delay driver for USB hub reset

Shaikh Mohammed Suhan (1):
  arm64: zynqmp: dts: Add USB hub supply regulators to SOMs

 .../bindings/usb/microchip,usb5744.yaml       |  3 +-
 .../boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso | 34 +++++++++++++--
 .../boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 43 ++++++++++++++++---
 .../boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 41 ++++++++++++++++--
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 34 +++++++++++++--
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 34 +++++++++++++--
 6 files changed, 170 insertions(+), 19 deletions(-)

---
-- 
2.43.0


