Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B629B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vi0ty/1l;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=VL+/Fb+R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lCbOLlp39It0oRF/JMEXeED1kazwdZBz59iHTid9KAs=; b=Vi0ty/1lX6nTup
	YUiHub2mhLR2KLyREVTR7cRpKt1YvjOD0osaBfu1B8vSFgZzATKKvlJeF/oDGKJHOZ9f8GJ9QVmAd
	lZroir7aMlEBx2jo+8JW+n9Dn6KEUPEuC0fSCUTftVeqYJ5UE5LPhdEm/S43THTP1rSYAu1Lg5qaw
	47BOjhPdVBUpzzq/D4vA1bBiz7K29pO1M3JbOQAYfJ8bo/SdD17FV+mOnwcZ/VU4mt4rUpmR/H30d
	u9tj+izx/DUFu20og6n7vJZblJ6k4cev3OUNkQ+4yqZJ2QPumAyfSuXogWjnTKTwIuWLN+8w5lpQU
	DUB8E5GD3gVwJA7qBJwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTebp-00000008pJ2-2eOu;
	Wed, 18 Nov 2026 12:17:53 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTebm-00000008pHw-2QvW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:17:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZ49HktXgIswRMBwghFLkpVGDbldijTsW1TAE/q1lUWm0x3fqXW5OmruYmSbuDHoXaiImqBqy1uHWqiEIPSUxx4cOhTWc++kIwEsMHXZfixvhOgH//9rB9WXhL7HOitDYHLGnpQyvbdqQCGrcDnOwZZ7g+vkTWAg/8OelxHNRNe06T4wLQBJaRqZZpRvKx3Od9A59iUOs6RiRY4fbDS96BRpq+v2MW3b65aG1i/DBkvnQY4Tc6/zXEEQtg+knHioriVuUpQ+oeoKje/MHYUIZvFNTVamyyKfTWgFOa1wynmaW/NEl9jh6RsUY+TMVY83R6LeOQNT117UjNwyovGcSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCbOLlp39It0oRF/JMEXeED1kazwdZBz59iHTid9KAs=;
 b=vHJ04npvqBVLe2gRCnKb16iCB9wg7Rm/rtGHmMM0fIndGKDphmzSv3/TpUOX45qKGNhT1ZQUKDghhrB6bHJ6NWyk9nykrQtP5QMnAgvsnoLUycGwPBiA1KAus417TN+7mf46LkhVtcXcXP0+Bpac3KpN7hdTsDhf4XYAFyRDUSinbrbIxTr2x1W22zV/WwORA5fDoEpjlh1Cic2duomJ53kQv+3Y6+XgJ9bM1JjoMBjYFL++RQBl62zI++uUMwVZVz9N7nMM0Jz3eA431LXuCQefPbRyWoAoYOgAw/ldhzmnhBTY2Kbn09lD/evGrSY6tMCdY6lqt5+DptoacCuwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCbOLlp39It0oRF/JMEXeED1kazwdZBz59iHTid9KAs=;
 b=VL+/Fb+RToc54iTXitKYB6tqKJAfVQY1KtjePEW7zbpa/DPO98AhnG8WOOfugEKGDs503pb9bmOL+xXIUPnD0Ahnje9FU+StILTRlpnerQLvUrNvFfGdzCEuge8VH3PI7TDJAVmr7ak8o5uN1llKOWCbiuCRr9dpzzBwkjAa2tXZUJO3GHX9LakD67bIFL9F8YOFjXl23uJCAZLDpZP3aY8xjgmFgsMaKR56WdAP2JeMJG//EHZTiXum8EacVvq30Y39GQp0AKSBz24eYEKgHJSl3QqsSQSPiXsnRPcxBYkm3YaV6w6Zse7AVPrd7BbtbcEhelPMzY7X/05Z38pLTQ==
Received: from AS4P251CA0015.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::17)
 by GV1PR10MB9015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 12:17:41 +0000
Received: from ZR1PEPF0000E464.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::8) by AS4P251CA0015.outlook.office365.com
 (2603:10a6:20b:5d2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 12:17:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E464.mail.protection.outlook.com (10.167.241.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Wed, 18 Nov 2026 12:17:40 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 13:18:41 +0100
Received: from [10.252.6.76] (10.252.6.76) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 13:17:38 +0100
Message-ID: <c76d9618-1e77-4259-92dd-8b8b3d6ade2e@foss.st.com>
Date: Wed, 18 Nov 2026 13:17:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Add STM32MP25 SYSCFG clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, Dario Binacchi
	<dario.binacchi@amarulasolutions.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-1-624559bb8ec7@foss.st.com>
 <20261113-charming-admirable-pronghorn-bdc26c@quoll>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20261113-charming-admirable-pronghorn-bdc26c@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E464:EE_|GV1PR10MB9015:EE_
X-MS-Office365-Filtering-Correlation-Id: e0fc533b-59b8-4c86-39f6-08df456df0c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|7416014|1800799024|18002099003|22082099003|261009223027099003|3023799007|11063799006|56012099006|261026140227099003|10067099003|4143699003|261102123227099003|261028144727099003|261026121527099003|261021121427099003|261021135927099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: KH/w+UDF4g23V9bnEWsKI1QfbPxbT6MUIh0ec55rC7oIFRx/i66eFulOdt4amuspoISIwAIYbzyadwcAAAYg4MTUx+g1pWbZrfnywNJH4NIvv9dsl7/l7hI2MRF7PU/KFvrux1GsbEsgCVepgHPh1MX7iEdxuZ5zihhKG1K1OpvhvpnTFU/QojjLUj1wBAkUDv9AMbLDZnUV/FwxJ2DWDx3qHb+L11CFq+a9qUV+JT8RSThZNb/neu0CaUeTOSgMgZvdBcRZ/Xfn5wHy25Voqj7LDtGhTPPc8fUkiL9Ph3gskTg7xMJBnd0aVosbl30AnwAq4I5OuciGFZmWpEA84EFM6MJMB9kqk8lhCSAiOTi0Un0IFyYKFEWNyxTtdHUqcOOynS/ioJIFrlTpKXhefzeWGTJgyvKjkODySrW3WGYNhQZGOd9AMNRRsfhB87fB3/ysBKymgroZJlyykckEqGJQCMzJxMPnfdC6k5MkwynaiGixJ+gQcLlGHvQYINwgyIPaoOlyLW2LRpal++hkVR0mbbfoJ+1rJl2XgL7KVzllwvU/LD3BKZtlAxtKT9Gzm3x8/fwqIZgVtsbvLzWmYW3UPxzO63YDNI2Ofb1mX9H1652dom09kR876/O9fsg9/B4Y5gl8YhKHl6CtZjZNgA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(7416014)(1800799024)(18002099003)(22082099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261026140227099003)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261021135927099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7R2ew1OV35C/h6A6b4rvh3yNTXoPgK6FkIpiGwF22iTUXVFbK+QT6RUrzRVhzz0T5ouesZWXcAJ/2U4wp6WXMZJM/l8u3EklC7ZhuebgXcpLV9prx1owu1TGoBrORUTDrmE3CNiwwzMGFCvAV9pWdyq08GAxjglEc0oLBVgSIMoZtX/hu5BhqReXMNiF/iUy3gRh62M6QVEImbSVe578Q6soiRSoH6nIDP3pWf/tVOIWn1Yzd37TYWkT4tNXF0VBDLwRzVu5+8ze2mUD9KJJD7rQ0Oim1fyVchTu9fz018wa0OstmHw4W9MMV/yRMD71r3ymnHDX1arazU6YX5uF8uahkxzhxn6Pg2E0H1/rJizJQMxf7PrBFr4zctX8Y7bfFYbMO4qR9C6jbADkhSNKIc2J9eZb1Ak+2fbCQlkSBZkHnM5MnPYk5PtVlG9U7430
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:17:40.3046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fc533b-59b8-4c86-39f6-08df456df0c9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E464.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB9015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_041750_629257_2F7A4291 
X-CRM114-Status: GOOD (  21.95  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

On 11/13/26 09:22, Krzysztof Kozlowski wrote:
> On Tue, Nov 10, 2026 at 02:10:21PM +0100, Gabriel Fernandez wrote:
>> The SYSCFG of the STM32MP23x and STM32MP25x SoCs selects the LTDC pixel
>> clock among the LTDC kernel clock, the LVDS PHY pixel clock and the DSI
>> PHY byte lane clock.
>>
>> Add the binding for this clock controller, described as a
>> clock-controller sub-node of the SYSCFG node, along with the header
>> defining the identifiers of the provided clocks.
>>
>> A sub-node is needed since the inputs of the mux can't be described by
>> the "clocks" property of the SYSCFG node: the SYSCFG is a syscon, whose
>> first clock is taken as the clock of its registers and enabled around
>> each register access.
>>
>> The inputs are listed in the "ltdc", "lvds", "dsi" order so that the
>> ones missing on a SoC (no LVDS nor DSI on STM32MP231/233 and
>> STM32MP251/253) can be omitted at the end of the list. "#clock-cells"
>> is 1 so that the other clocks of the SYSCFG can be added later without
>> changing the binding.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> ---
>>   .../bindings/clock/st,stm32mp25-syscfg-clk.yaml    | 61 ++++++++++++++++++++++
>>   .../dt-bindings/clock/st,stm32mp25-syscfg-clk.h    | 12 +++++
>>   2 files changed, 73 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.yaml
>> new file mode 100644
>> index 000000000000..027d14f28b0c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.yaml
>> @@ -0,0 +1,61 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/st,stm32mp25-syscfg-clk.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics STM32MP2 SYSCFG clock controller
>> +
>> +maintainers:
>> +  - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> +
>> +description: |
>> +  The SYSCFG of the STM32MP23x and STM32MP25x SoCs provides clocks, described
>> +  by a clock controller sub-node of the SYSCFG node.
>> +
>> +  The provided clocks are identified by the macros defined in
>> +  include/dt-bindings/clock/st,stm32mp25-syscfg-clk.h:
>> +    - CK_SYSCFG_PIX_LTDC: LTDC pixel clock, selected in the DISPLAYCLKCR
>> +      register among the LTDC kernel clock, used by the RGB parallel output,
>> +      the LVDS PHY pixel clock and the DSI PHY byte lane clock.
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp25-syscfg-clk
>> +
>> +  "#clock-cells":
>> +    const: 1
> So you have 1 clock, thus drop the header and here you have cells=0.
Done in v3 [1]: this binding and the header are dropped, and the SYSCFG
node keeps '#clock-cells = <0>'.

>> +
>> +  clocks:
>> +    minItems: 1
> Why is this flexible? Device either has or has not these inputs.
Because each SYSCFG compatible is shared by SoCs which don't have the
same inputs: "st,stm32mp25-syscfg" is used by STM32MP251/253, which have
neither LVDS nor DSI, and by STM32MP255/257, which have both. The same
applies to "st,stm32mp23-syscfg" with STM32MP231/233 and STM32MP235.

The inputs are thus listed in the "ltdc", "lvds", "dsi" order:
stm32mp231.dtsi and stm32mp251.dtsi only describe the LTDC kernel clock,
and stm32mp235.dtsi and stm32mp255.dtsi add the two others. In v3 these
properties moved to the SYSCFG binding with the same constraint, which
is explained in the commit message of patch 1/6.

[1] 
https://lore.kernel.org/r/20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com

Best regards,
Gabriel
>
>> +    items:
>> +      - description: LTDC kernel clock
>> +      - description: LVDS PHY pixel clock
>> +      - description: DSI PHY byte lane clock
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    items:
>> +      - const: ltdc
>> +      - const: lvds
>> +      - const: dsi
>> +
>> +required:
>> +  - compatible
>> +  - "#clock-cells"
>> +  - clocks
>> +  - clock-names
> Best regards,
> Krzysztof

