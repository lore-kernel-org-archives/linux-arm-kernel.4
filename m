Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D9B60A6F55
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wc9RnrIM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WngfGjRncINeVNYDlRokTVicUnjpqrAZJQiuhDN9Ysc=; b=Wc9RnrIMYC45wdIHWJiPWINABf
	B1JEpj+1EE9jBzkXri6WxB9Pu0J7VVYsN2ziZg2Y2i5u4plQCt1OdInTtnqqnHI+k9oyZyzRF3/CG
	5eX0lY1NarV+P9vloaEoa7Er9xw0Ad3XoRAGg7mkja6NlZdFtua+2M5ZU6EiKkPOiIr4mM4VnGhv/
	6263l7AnNQF3EdKk5bUZiMCmZjCCgaqvOrCQAMqy8yDqrD6C32TRm9ueKLwrjyt3eXMWmpVjLcb9c
	2qoNzOtYzEfJBbAt0g6IOhcYu37moItG1YX9/B3dcCKpuUf6MIPsxvTwgvFkeI4RsYrBd1EoybK0R
	qD0Oa6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtl7-0000000DV9Q-2TuE;
	Fri, 13 Nov 2026 16:04:13 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtl5-0000000DV7k-0hhN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 16:04:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzOZX+GLCVJXYEiKBFwmwq9Lys3ygMCFwzb7yF4JFGuSgVBDpl28FktjDJnjdDXw6Vd6+5Ezd3GRuelgDkva2ZibfTDDo1iFRJKGOqldznOARSaVwCoRC2mjrc89aXCIhW1HpKxihqkxE4HryjpxqQ31oCkJtOYPkAyuZjotPLxmo9QQY2i4hUGzCIBgVN3q1UVKkI38Akp3jtuf+XUQrNjzerGitgmXT3DBihQ3z2TVusHfwkUj1IcWNZMMtXfFfRLtgitNx1pYs15Wq+Wz/jXnH1DSCIy3KU2eBysOH41ovqHoEbfhm6wmVnr+prgfH9Q1uQ5EaGPXqh4LlaruTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WngfGjRncINeVNYDlRokTVicUnjpqrAZJQiuhDN9Ysc=;
 b=BhElquhTAO20KLNIfMdqtEYlO26InQrtZ4JPDJ+ypMNLSqW/CZ9GJcpYvC2Y59N5Ddtfw498QG53pL1o3U5bpVIwsE5VNLOPHqH/Pqkv53M/h7S/nKpwwNdTgqALFXdhW5kYzK525r91qbTHy1Qu0MDdrNJtYUhvqUScxANQywBhURQPFFFieXpC3fkTDBLsgz1A67Q2LrE2v2gq/0HQL2sOnK9q30jkERqPCJDn4NPPYDWAIYsz2gEeaqVfCbe3ECAEeIe9ErGIpWyUQd0JZFymryDEWp1gtNzcNuEH76AxQKFpku0H2Fpn5JvmVScInaXH8loHlQs1og/W5AFvHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::10) by
 SE1PPF7C5444CB3.apcprd06.prod.outlook.com (2603:1096:108:1::41e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 16:04:01 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:140:cafe::9) by SI2P153CA0017.outlook.office365.com
 (2603:1096:4:140::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Fri, 13
 Nov 2026 16:04:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 16:04:01 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7C69B41A9A83;
	Fri, 13 Nov 2026 11:31:24 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: linux-usb@vger.kernel.org
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Gary Yang <Gary.Yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v8 2/2] usb: cdns3: Add CIX Sky1 glue driver
Date: Fri, 13 Nov 2026 11:31:22 +0800
Message-ID: <20261113033122.1438152-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <sashiko-outbox-210229@kernel.org>
References: <20261112022141.4136099-1-hongliang.yang@cixtech.com> <20261112022141.4136099-3-hongliang.yang@cixtech.com> <sashiko-outbox-210229@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|SE1PPF7C5444CB3:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5595ac13-ac34-41c8-9b5c-08df419fbbaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|261009223027099003|10067099003|261026140227099003|4143699003|261021121427099003|56012099006|261022113327099003|261022105027099003|261022075727099003|261102123227099003|261028144727099003|261026121527099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: M8mENAsBv2Jm7ic3d9VFOqNb+2oiQyMLlE3ys0KAh4gHF8NTXb0NDhGt1YjUovmGtZ+Dl7LO3cF/YzJVkecdQcjJQbvbVjt18jyxhlKz6sHa3TpdaifUL2HIwmHvl+TLwtWJ6Gr27W3n9nnPGqqOonkJn9Pi8V11lOUStoWTApEvf5FkfGXUE5JhPCWAU0p9XpO7R7k5IW2FzMfc7ndEWIotQ8dh4yomGNw9XcMgLdEoI3aKnpYmYHND74NCpLmPQMaPfxdX4DZscUmHU40yM7fpEm2uFNGRzmePGACqPMg9Rqo37mjhIdQW0K8UuquWLNPguu712e3LbYgT7flvzcxKyMOTamO9HvlRT9dZw1g/vyMYXm91hA7W4v3azTkoRIkbxt8quKfyMkb2zsZHuNhusRZGX8qxU9Wqr0QaCYm50yi4pH6rCtC4vjy81aggT5x5daMryuO1NQEDNCnkje6lDfp1a0Xz3pxJl2U2HW6+9YXTiZWBViNYhWMzJf9bMDzHOBl6SNIOGzV5vZZsJ5T2OQzplfjirI2mZeNp3ZT70saTRODSwbRZGFZxoToOGCCQGIlYOvwWn3/iZL3zRshCMfopTkkCz4gB0OsIyLR/MMBrcBsGbNrtPpqzUjMxuUfCzB5owIeaPecAtUMO0KJyfg4n3LHjN6y+cmIYJmmNfVLNAsKSBXpmbuCVoJH/Wx8jgBRvIRUrsAc2xVuK2Q==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(261009223027099003)(10067099003)(261026140227099003)(4143699003)(261021121427099003)(56012099006)(261022113327099003)(261022105027099003)(261022075727099003)(261102123227099003)(261028144727099003)(261026121527099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iXGPzLXhkbKRobYftR+WusIyIeok5j+ABBKoovn75qf2rWFjcZZdTYuw+I0dbCoL+mC1xsFxnDbU/LHY5ba5ciaeTuBXXpRxisrje8ul/i17tqNxBC3Uog88mYg/VAp7xW9RgT/olWwcTHReaA6qWrmapkwuHqPrfNR/8UFcwGeNFvnNm4coE7YMxlSiW94yBKnh0B3pY5mxVMygMQ2wuJCGYjGxrzk0zHdUdxAUNkVgR0NRjbGDpzrjkrxkotECJsYtawvj7S7w2pvrFU6kkYpdXWqrFzvCBgbGW6bX6VIOmwiAUAaULEmw5SN+tdxEtBOIAmYyFUGiwVfwJ537u02/px1or80qGq6Bx7GQKIMvPHJnhrp/QfW3qTLDaIplnDDMNOXOBdrNzojJjeVFQiclN4rwWDLwJY42MF5O/TUgLud/jJJ78Hr9M4hanOhG
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:04:01.2368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5595ac13-ac34-41c8-9b5c-08df419fbbaa
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF7C5444CB3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_080411_212364_140A7D7D 
X-CRM114-Status: GOOD (  13.55  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All five are real. Fixes go into v9; the binding patch is unaffected.

> [Low] missing MFD_SYSCON dependency for USB_CDNSP_SKY1

Confirmed. ARCH_CIX does not select MFD_SYSCON, and without it
syscon_regmap_lookup_by_phandle_args() returns -ENOTSUPP, so probe fails
with a minimal configuration. v9 adds "select MFD_SYSCON".

> [Medium] clock refcount underflow after resume failure

Confirmed, and it is not limited to a failed resume: shutting the system
down or removing the driver after system suspend, without an intervening
resume, reaches cdnsp_sky1_clk_disable_all() and disables the sof and axi
clocks a second time.

v9 records which clocks are on in a bitmap and routes every user through
one idempotent pair, cdnsp_sky1_clk_enable(data, mask) and
cdnsp_sky1_clk_disable(data, mask). A clock that is already on is skipped,
and the enable error path disables only the clocks that call enabled.
CIX_USB_CLK_OFF_NUM goes away; the suspend window is a mask instead.

> [Low] PS_PME_En not cleared in cdns_sky1_platform_suspend()

Confirmed, the read-modify-write keeps whatever PS_PME_En was left in the
register. v9 clears PS_PME_En together with PS_MASK before setting the new
power state.

You are also right that the core drops the return value. That means
-ETIMEDOUT does not prevent the half-suspended state, so v9 restores PS_D0
when the D3 entry times out, as the vendor driver does, and keeps the error
return for when the core propagates it.

> [Medium] cdns_sky1_pdata leak in cdnsp_sky1_probe()

Confirmed. of_platform_bus_create() returns 0 when the child device is not
created, so the if (ret) branch after of_platform_populate() never runs.

v9 checks the children twice. Before the populate it requires exactly one
enabled cdns,usb3 child node, so the auxdata platform data can never be
handed to more than one device, which would be a double free in
platform_device_release(). After the populate it looks for the created child
and, when there is none, frees the platform data and fails probe.

> [Medium] unconditional clock gating in cdnsp_sky1_system_suspend()

Confirmed, the function contradicts the comment above it. v9 gates the
clocks only when both conditions hold:

  - the child device, which owns the shared wakeup interrupt, does not have
    wakeup enabled;
  - AXI_CLOCK_VALID reads 0, that is the controller has stopped using AXI.

The second test answers the device/idle role and the D3 entry timeout cases
without depending on the role, and it is the same status bit that
cdns_sky1_platform_suspend() polls on a successful D3 entry.

Best regards,
Hongliang Yang

