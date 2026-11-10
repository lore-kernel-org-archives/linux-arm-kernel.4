Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D70606A7E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tNbySLTR;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=cSE6MU0m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2jcxUTwywB79L+Q15N8jqbPYrjDv1EJbYnmNXHDw99A=; b=tNbySLTRSfU5yW
	Jp7Nj0rgbBifAakuD+9VR1bj0fdBiTyx5L6sEwpuIoDdxQPwkSYqWiHXccd98537a4gHyAr3PVK4k
	F2L0B68cfKx/Igz5/vEF/DZO/xGATWGJJX2iLicO0Bqq3hZJhCo7kMhA39a3co380Q3HafpxbOwmh
	oL/PzufveGF+FZSpYKWRhDLJC9+qOjTo3YugKTSKg8dl8kn8Z/yc15C60Zyqh43k/xl01KU8rseJl
	9eqg0fIQBZKL14jP2k/32DGb2/dfz6MneVLONGpgb7pXdvzpHQ09XJA5sqA7fFbzoxjq0IccA7yQy
	im5oANZdSkADADgRUKww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlcZ-00000003z7Y-1gcX;
	Tue, 10 Nov 2026 13:10:43 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlcN-00000003yyc-2IP2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:10:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRUo9V4gCc9q3Sqn5bgxKaTdZm60aJuHFtS0fgeacRso395O1UPr04XosmiD522xSvO9wi9W/nSbAEtc8r155jhPoGHNqqkC9Js/GQ86kJX9ZZYkuBgy3UHFVZM2nfn0mkOYY51jd/o0AsLfR57uYW5TB/Lw0ecpXV+XphQIzOzGkha77Zqav6JsVgE4JT0M+GOsbVhuSAh2JrgOJctRBvf/NbBUHtmg4rGz0Hg8BGwsXqA2UDr38jZHcFFCIDFt395hekqG0zqR125r/qtbCQeHZjNpx/mUgthRibdp7p80BbSFGxkW7lLF0LLC+3FUzPJPl/TbKwHEeBIlz2jkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jcxUTwywB79L+Q15N8jqbPYrjDv1EJbYnmNXHDw99A=;
 b=vss7GmfbSkTcJGbskkNDd3WCif8jO+3+NlYEmvba1A+ywGcv1weBL3LZ+zFFPMpgvrBxtYAOm2X1+o8V7tMOPEJWSiY/NuCkA11Fd0q7XxMv7oVLWVQBO7TtQSc2HaGvLiD4qIvDG9WZ9Fch17QJtA7bZ9kKG0rXg2zjSuBrvdZ8wyV1n78lHon3WQbF4WrgjJ/BrrMAikVPcxo25i2JUOqGXnneEQMod99c/7opkbLnBYJOCt8BIXc5azFRBgxj5w9S94CYRUzlgU5dc1xjDSPReWsEZu1eUWGmmAvII1iaqBtYPmoFtw/kZfG69pRoLmrizlcRZFyLzJEnZCFGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jcxUTwywB79L+Q15N8jqbPYrjDv1EJbYnmNXHDw99A=;
 b=cSE6MU0m1sAHVH6EBg2P9kwoNOrRf75IaVUN7niIEWPg9q3QwBGRt4zQ+nJAntO0mcNuAZtKHxq5dYVhiT+zzNY3bvy5RMwuiJKTiGAJDqmM6fJoApsD3+NdTIok2iMAt0FZHysKKWKf/wXqsOdWogcOhpZ1cXwndMwgRTpgnVfMnhgVDGq6elG8hrrSARF5fRQbX++9oGZCdWr2GFS27/qtwTMPzxvgc63IB9YEyOxlxsqlHBrzwcIB/bqZ6cirxELk4uuIlK6ENfkbZg2D+FVs8NVlLsB7EmMEyyD5AsO7sOrIrS8C/OO+cB5tP2kFUywlmjuoLso6ZVoksBFaLg==
Received: from DUZPR01CA0060.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::18) by PRAPR10MB5225.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:29f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Tue, 10 Nov
 2026 13:10:24 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::5a) by DUZPR01CA0060.outlook.office365.com
 (2603:10a6:10:469::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 13:10:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 13:10:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 14:11:20 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 14:10:22 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 10 Nov 2026 14:10:22 +0100
Subject: [PATCH v2 2/5] dt-bindings: arm: stm32: Add clock-controller
 sub-node to STM32MP2 SYSCFG
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261110-ups_mp25_clk_syscfg-v2-2-624559bb8ec7@foss.st.com>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794316221; l=2223;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=SNssRaSoed/3YeehmDUApyvOrsHqUP3MJOUfQCG78Pc=;
 b=lu2h1AK3N0HiXcO9ML89YTN3OCVCJljF8HdriR8wM2dNLMmt0RqKSfq/hHDpdMaHgapkNNhiY
 y1KyDpmLP75AwHYnjmX425fPalyzC79D18tNNMLkGUF3kkZPob5ae6N
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D04:EE_|PRAPR10MB5225:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b561251-8737-400f-c2a4-08df3f2bfb2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|22082099003|18002099003|10067099003|3023799007|11063799006|261102123227099003|261021121427099003|261021123027099003|261026121527099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 4Ffda7d6FWsLoDPi0QXTvd5beCUa6fHHkzYvYT+gA78PAcJzTI13nNEBy6v1ogodalB71UNr07U/8Z8uvNx7VK7cfp7QLb6PRu3F6EJWegK7bQmirZhVcuaVwCm5f6J8Gp/QgGlKQJrgDAR42YeJCoyDk3hX/Lp6PlNFJacd1DVLN/19LISKWzjR3t+EwxjI1XU4jUfmBbZ/qOqFFFJx5OdWxW460BQhPrjHgU7kYyl/6ohcXrLVMu5t1dGzuoF/75TlN9Ow6sQreNZWeK4GiTzifiRduTlN2RJRpBpzsTxsYkHgUfrUXOitfNqFcOWtF8g2DyxYZHbDZPAkuf7e9bNbRt18DFXMvZJwWJyllFCv1ZP95xR4OkNNEdiUDXM3ly53zueFAml8j2FQUs2RsVZe6CL6pDSOA+G3M/Ua4L1Guf3bxKJeNAUwfvDBNfZeY8j5ASCQy26AmHutjrh3vCP0Qygid9ZGDao0KNTf2zmgS61MYY68PE+eDkPBQh2NmNSzrNKhCBkQ8dVYpRFGOEBN6AyKwRZ6amwgA1XNXV8yKpGInExq0ta92h5jh0zf4Nb8BS4915Z7qTeRI+7RPMNC0OTUFKtFxu5oC6pXo3/2XMfquDPCOpcz02SrPQOUUJmXBmbycSkIfBzpRl9jEh7nSVGn0+dNNyR1NijNdIJOEFU152PLHq+2mSWUfs6JxNSw3/t+XRgvL+rS1ZEmlA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(22082099003)(18002099003)(10067099003)(3023799007)(11063799006)(261102123227099003)(261021121427099003)(261021123027099003)(261026121527099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oKiDOGVtnPPFabH7BWHR4ek9/xYm2MGp8dgFoCBo1lb7/gOxv/oFHupoDb/VkG97Ih2jb3OsiUHTdNDbB/h76zjgBBvioKOrf3OwwV2YdmfQeHWesCK9a/LKx4aLKRVPG1uniI0iWEL9UNkmxP/ce8O+t9h/R+N04MSHfTHrLw7JNG+w/YGdraGQ2f7VdVBTc3HWpeaFT3bYaFChFJoDWTubV0J32735qyoXihekYC7+YT+QdNVpkvIcx6Tqwf79ZnAXdFD0+JhDOcibPO3tFIXIDpBpncqwON6FszU2m3VVp9KTkAfCEYr8iqKD3p+khgOMwyXi+EFD03l+INnx7QGW38bv0nlEDmNr7p5uolIGGBx63XoaWOx0LQH+Me5UqoUwCN+v64XM9vkS5BxK9A3btJR4klEW9GzVVwV5+XVKorBRRUUQkoTH376N8aUN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:10:23.8772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b561251-8737-400f-c2a4-08df3f2bfb2a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5225
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051032_809928_EEFFE035 
X-CRM114-Status: GOOD (  11.42  )
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

The SYSCFG of the STM32MP23x and STM32MP25x SoCs is described as the
provider of the LTDC pixel clock, but the inputs of this mux (LTDC
kernel clock, LVDS PHY pixel clock and DSI PHY byte lane clock) can't
be described by the "clocks" property of the SYSCFG node: the SYSCFG is
a syscon, whose first clock is taken as the clock of its registers and
enabled around each register access.

Add a clock-controller sub-node to describe the mux with its own clock
inputs. It is required on STM32MP23x and STM32MP25x and not allowed on
the other SoCs.

Deprecate the '#clock-cells' property of the SYSCFG node, which is no
longer required. No driver ever registered a clock on the SYSCFG node,
so this doesn't change anything for existing devicetrees.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml        | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index a559f8b03b84..13c02844a91f 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -38,6 +38,10 @@ properties:
 
   "#clock-cells":
     const: 0
+    deprecated: true
+    description:
+      The LTDC pixel clock multiplexer is described by the clock-controller
+      sub-node.
 
   "#address-cells":
     const: 1
@@ -45,6 +49,10 @@ properties:
   "#size-cells":
     const: 1
 
+  clock-controller:
+    type: object
+    $ref: /schemas/clock/st,stm32mp25-syscfg-clk.yaml#
+
 patternProperties:
   "^phy@2[48]00$":
     type: object
@@ -78,8 +86,8 @@ allOf:
     then:
       required:
         - "#address-cells"
-        - "#clock-cells"
         - "#size-cells"
+        - clock-controller
         - phy@2400
         - phy@2800
     else:
@@ -87,6 +95,7 @@ allOf:
         '#address-cells': false
         '#clock-cells': false
         '#size-cells': false
+        clock-controller: false
         phy@2400: false
         phy@2800: false
 

-- 
2.43.0


