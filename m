Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F9C606EE91
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zcWgQboJ;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=A9JBYGVL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2eYWXyas6b/UtjQdSicmTzx4JRJ0SdYYP76SBqcDZJI=; b=zcWgQboJL3MCjvEAdgunedcjMX
	vHpuCjsiQN1liaOqIcnDYNI9sSOmdoNkLi0cphEO2YZF0xUlYOqAd+/8aJNx8vLtYLy7LWvN8zJwp
	8Bl+X5x/aVaPsEqCfC1vYM+9piKIcybDWuFkMVBxcqvRuakyTjPO/31yt+wXnQBgF8YC8KO0DaFdS
	ICdOYBzmwiBJhPvyw21bdI1/I/yhkADkQQVbpuv39iny2g/f0JUFccRumm4gJU2VHw8ELnDJN7+CN
	0RwPNlIgjtyE3MQM/kvQiCL6w2SwKmXgqDQ5MUZwFjA8NVNOb9j70eI5Z4Zz5R5CPaGqONVsIf8fD
	y14kN9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLyy-0000000CqEd-12Mp;
	Fri, 06 Nov 2026 15:36:00 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLyu-0000000CqCT-0pd6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:35:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0ZQ3L78YJObTW2Mq1IXkgstRePVTN82rOgJEOo6zIN1p0fiE9mWugV2nVS0Nn6cWZ9xM3Ob/g+JUmqjCNAoGQ3DTbfE4WopMnCV1Jl+DD9Gt8m+s1cdAXWXsaicI4xERNmxToLTCCbzgSTClhHS6IxNqtH7ZjdCJwrDwKDoQDX3Kt3BpyHL85cNKsnANBv9YjtTqvibiaFc3zqeUXc2oQHCD/RM1Mr7P1ut8BJqu0CcZa1YitZ4duOHR37CXFr5/Rv36TtddJVXV5ygoF8kAiN08c8RaNo/FpXQQYeeaFRgIw9PhDdfbpULpEmcxFsp4QXH34RP04kQnc13mpT28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eYWXyas6b/UtjQdSicmTzx4JRJ0SdYYP76SBqcDZJI=;
 b=sKGTqQfzHV+KRQ0w5U80PkOjSmwwWhi/IA39QLMpMCgDjQ5qNGzPbKus9UkuQRv+IeOrztbH+8/ooabNYBnZZ7XlaEBWV11bl888A1XeyLl28G6uAXk2aVAHHJAT/y9cTYrzQNnmjWNMufX0TcqiK6rfoVY7r6xsxwhYj1tUaKWKU5PyiBq/l/3T4aGfJwfkrZheVcdHQwdmpkPeRV0nkcagkUh4FkEM1e1qjMqAr/83HlgpKpaA9OAjLFlV0v/FWz4Yx2rT9kXITO8fYkjegFwtoZMaPlWJc/zlqIyF5djFSGYQNxQ00Wn4o1coDxPos6jTeJm3xz7qNESwHmH4Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2eYWXyas6b/UtjQdSicmTzx4JRJ0SdYYP76SBqcDZJI=;
 b=A9JBYGVLIkg0aAa2C8M3LjIt4jtqwjR/yG1HWmDDbscxspPhvi6KMliNNqfbX8NxGw11gn08AAuabGpvH9ysljNzyTUMhp93ED6o1CXFUXQYC+FjwC/sloewaa8Vkiv4h01Sv9PHzjUMTpFDTEIAVUpdfq2Nkl4GPOQ/G/lBu7RI/C7jgRDgXLZdBwYbeu4xeM785ODfoHmFznHYy7pCiO4i6yhLmvnag5BanOQwSs7X3Xt/rkEuCtuHb4vSj0TjbzVJf5Z23yjHYF8T5bg+969cXxu2Ciy4CAsfOwk6GIreEUM8kUrJsYpq4FMrhbRVgR/a/WjF4asdyybuZwdN2Q==
Received: from PR1P264CA0114.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cd::6)
 by DB8PR10MB3783.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:16e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Fri, 6 Nov 2026
 15:35:49 +0000
Received: from MI3PEPF00008497.eurprd03.prod.outlook.com
 (2603:10a6:102:2cd:cafe::58) by PR1P264CA0114.outlook.office365.com
 (2603:10a6:102:2cd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:35:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008497.mail.protection.outlook.com (10.167.240.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 15:35:49 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:36:35 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:35:48 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH v3 0/8] clk: stm32mp25: add Cortex-M0 D3 clocks, ETR/STM
 and USB2PHY1 STP
Date: Fri, 6 Nov 2026 16:35:29 +0100
Message-ID: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMHz7WoC/43NTQrCMBCG4atI1qbkR9vUlfcQKWkysUHbhKQNS
 undTQsuBBcu3w/mmRlFCBYiOu1mFCDZaN2Qg+93SHVyuAG2OjdihJWUMIYnH5ves2OjHvdm8lq
 OgCtDJeEtVaVhKF/6AMY+N/Vyzd3ZOLrw2p4kuq4fj//0EsUEQ01KqCQXquVn42Is4lgo16NVT
 OwPhWWF10LzgwApjP5WlmV5A0cUU5z+AAAA
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Gwenael Treuveur
	<gwenael.treuveur@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793979349; l=4195;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=m7RGkuiflrH8LmD9+/XQcH65fzGPVnD7+nTDj4EMPsY=;
 b=XG29GmzkWNoBidG1egEOl4DlorZVOcD9M0SRYeLysnYlANaf6bOXcON1gv0c3ncF1+ASAg7A4
 4fjJOCifv/iDjXWbPEvH9C6W8u2cPd8XN7Xy/8ZvLA3uHHk+M+P2ONx
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008497:EE_|DB8PR10MB3783:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf21e67-b0e4-41e2-696d-08df3c1ba255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|7416014|1800799024|10067099003|18002099003|13003099007|56012099006|11063799006|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 1QC+Y8I+UML5tOMAIS4X/7xgtzMPmEB3eMxZ1aMPtV6zT2RrPK5VNefak50j/j52tKy9K27s969uvxgV3wirsSu08H7KZwRTQRjqnOybuD7BLgLVP20iDDV+iZu17P1+DbFgno9ki9VyrUfrCM/mJGOM/0rPoQbzKMMoedcZ2/FdaCWHwXEKOnvGjEIVfRLu4nyes4feeUJrS84DaZlOsXxBNxZ4aikHiMs2I+1B+hbsFcnQGXK4SEvtoOI4kby67vRr4XTt1bMAASNLTcB9VVa0H6zfNIDLdSOzxDjeyqjKABuQp/2wQu+uPIPmSiMa4oSrsB/y85CnqMAGLYzuijvCxoTdFpLHF7pvnhTr82i6RldzwRpmvBQGcobDdDNR+klgjUop1tQBS6dm6khsT4ErNDfTFbY6PRgnCnNAGSQ0YG1csFTxOUSD5KX0BvTWgDIGkokTTMIPV8k7SBsZ3uwcOhpq7CqJeMnn6wuZkMHKK2Kug4LWjSnz7Yrj2ODjeGlkZWcwqINBmAmxe9NeUu62oPyJxNhbeVZSr+aMN/ffnmGrYxFOZEozSGlhmv7AGCXWwMT6y2Ztj2SDRghK58Ye92EN2vxyqZvmQvF4wCd6yl0sy/6H123/2yztcQ86BY4wAwngW4CS5uvQZRaeew5WsKpYUOU9BtpqwVA+6eU=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(7416014)(1800799024)(10067099003)(18002099003)(13003099007)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UG9jHSLJxjI2xXCfzo7DqDg4yTafdXE+WtxCMJMmGHfu8ORcXZyoE7vmm/fD1kZeRiFB7e7mwgVHeb0NMy6bMGfZRkd84dqctyN9+aGkBDGrwyEA0UX769Hoh0P41Wr7mrJlCaWpZK234J8oRD4KAl3Yc0dY3gEuuecutn29yLY1FRSmbDYngmPRx5SRmLg5e/FhfPH8kxhSNBdRWx0kYgvXA0G1g/sqCGryNDU0Sx1+wXqGDpVqCjnRhPI/0Icx/H4RuJOfHmeKYFY8yl5D/rB38rdUQu7uq7bRGw2k7KTVU+nawupm9XHnfCmSQZmZOUJT5rNH6sIFRRkaZix7Fr0TjcgQexz53fCKStxC7bm8Dips0YscgIPS1Zr/1bofffgRFdX+0C1lURU8Y28MYekLrGSX+OABZppMywDQDNexokQLmsmgHMOpuzYGL+l+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:35:49.4829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf21e67-b0e4-41e2-696d-08df3c1ba255
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008497.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3783
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_073556_611833_6B0403FD 
X-CRM114-Status: GOOD (  18.77  )
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

This series updates the STM32MP25 RCC bindings and clock driver:

 - Patch 1 makes the driver define the number of clocks of its provider
   (STM32MP25_LAST_CLK) instead of taking it from the binding header,
   and drops it from that header. That value is not part of the binding
   ABI and would have to change each time an ID is added. This is
   already how the STM32MP21 clock driver does it. No functional
   change. The driver and the header are changed by the same patch,
   as the macro has the same name in both. The driver patches 5 and 7
   then update the number of clocks.

 - Patches 2-3 add the kernel clocks of the ETR and STM, and rename the
   RCC_STMCFGR register (driver internal) to match the reference manual.

 - Patches 4-5 add the clocks to allocate the D3 peripherals to the
   Cortex-M0 (CPU3) and to enable their autonomous mode. The binding
   patch also adds the HSI, HSE and MSI kernel clocks as three new RCC
   input clocks. They are optional (minItems), so that the existing
   device trees remain valid.

 - Patches 6-7 add the ck_ker_usb2phy1_stp clock needed by USB host
   low power support, with the HSE kernel clock introduced by patch 5
   as parent to keep it running in low power modes.

 - Patch 8 uses the reference manual names for the bus clocks of the ETR
   and STM (CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM), consistent
   with their new kernel clocks and with the STM32MP21 binding. The
   values are unchanged and the old names are kept as deprecated
   aliases, so existing users are not affected. It is the last patch
   so that it can be dropped independently.

The patches are kept in one series because the binding identifiers are
allocated sequentially in the same header, and patch 7 uses the HSE
kernel clock parent added by patch 5.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Changes in v3:
- Patch 2: only add the kernel clocks, do not rename the existing bus
  clock identifiers anymore (Krzysztof).
- New patch 8: use the reference manual names for the ETR and STM bus
  clocks and keep the old names as deprecated aliases, so that
  existing users are not affected (Krzysztof).
- Patches 4 and 6: drop the redundant "binding" from the subject
  (Krzysztof).
- Patch 5: keep GATE_RTCC3 after GATE_RNG in stm32mp25_gates[], as in
  enum_gate_cfg (Brian).
- Patches 1 and 6: add Acked-by from Krzysztof.
- Link to v2: https://lore.kernel.org/r/20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com

Changes in v2:
- Patch 7: drop the custom clock ops and the recalc_rate reading
  ck_ker_usb2phy1, and use clk_stm32_gate_ops directly. This fixes the
  missing .disable_unused (gate counter underflow in
  clk_disable_unused()) and the stale cached rate, as the rate is now
  derived by the CCF from the real parent. Both reported by the Sashiko
  AI review.
- Patch 7: update the commit message accordingly.
- Other patches are unchanged.
- Link to v1: https://lore.kernel.org/r/20261023-ups_mp25_clk_update-v1-0-e906e7a38cb3@foss.st.com

---
Gabriel Fernandez (7):
      clk: stm32mp25: define the number of clocks in the driver
      dt-bindings: stm32: add kernel clocks for ETR and STM
      clk: stm32mp25: update register with reference manual
      clk: stm32mp25: add clock for D3 peripherals allocation for Cortex-CM0
      dt-bindings: stm32: add usb2phy1stp clock on stm32mp25
      clk: stm32mp25: add ck_ker_usb2phy1_stp clock
      dt-bindings: stm32: use reference manual names for ETR and STM bus clocks

Gwenael Treuveur (1):
      dt-bindings: stm32: add clocks for Cortex-CM0 on stm32mp25

 .../bindings/clock/st,stm32mp25-rcc.yaml           |   9 +-
 drivers/clk/stm32/clk-stm32mp25.c                  | 187 +++++++++++++++++++++
 drivers/clk/stm32/stm32mp25_rcc.h                  |   2 +-
 include/dt-bindings/clock/st,stm32mp25-rcc.h       |  53 +++++-
 4 files changed, 244 insertions(+), 7 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261022-ups_mp25_clk_update-7f1a03b1c6f2

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>


