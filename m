Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8863C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xyt2rT+Y;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=mLw9lvpu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X1Wcq9WTXiKWb5nk8BFrG3BUZ1YQY0s03a068+uKLHE=; b=Xyt2rT+YA5cjQI
	pL3aw9IUWxmtNdm8ZjZt0aM87nmAfz3eSAi9OZrEJBFfQkqdx2HwNA0nyLHP0oGNmUlsBo93XF+nJ
	rGH5dR8ccAjBlUhsQV39wldVY0ciJ2jCXSB+5LtfjEf2+iv+QFrSkW/pVS4CPvnpWFlUs1M9rIJuw
	wli/gek0GpMb+Vh8sMT2sGOIIIxMAzmr2nrx2wakwl2IwLnu/J7L2l9FVbzQLvXIvXTZ/hTVqYzkq
	DrViV0fd8daIzIeRD77RC4Nbq+7pjCLKHQIOZGJr9dkBqZ9zI9C9vk2FazMD3jZHYzs+JvhFiU8Xq
	vVKSv+tPzzfiN38OuVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeZ0-00000008ozL-3oU0;
	Wed, 18 Nov 2026 12:14:58 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeYy-00000008oy9-0anl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:14:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZimR3m8ip41iy1fkGmzlExSC5HBWJ6napqq6YvmqbkBW0FiO+Jjk8Tb5nFFqLO6IYaoLZ0Hu3wgBg3USeBtpn0CYmlEYtTnjWFxb3Qll4pP0FB1Bg6C9/ZNBq+03fAZbJf7hCVu2bVvYaf8GJIbPXUeFcAjyxg65v+vctAIcZ6FXDCrWJfpfyt1pPvh1xWdbCxg0dsLv2P/6QAShPpgZ8RSCtxfqrzRUP1TNl6Hx5YYlfu7nOcG+LjFCz9nvoFRpYcfcwKxBpT+bspll7iLDpOt4LITRkmz4spVd3BnNc5J0RmVUF0h6SlM0vzitJ5plmbE4ZWX3i4oVXzikAunwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1Wcq9WTXiKWb5nk8BFrG3BUZ1YQY0s03a068+uKLHE=;
 b=TMihUCCGwO34yjNkPa5gXx3STPSJeRV3xYvSHNtZs/fzrlvGWpruncK+pOzWhfsFjuGNeOFujbN7iSdk70AXuf8H4ycjKfF1+w7ZceXeZt3rzwEL8OPkRt8EaAmISEHaQ3qFDz1Sm4ONFkkyVFrc55WsW5ZDtmzykszR7Z9OuBg8UgvChePfXqqyGM7kILkFC4BWeud+nf2POBYyPwXBPnDKCbWp4iD2yYmh6JUpGIsZfK3iBZMXNEg2NYOqD1fWuxgpbsasDYibjwpV0+5E0smz6T9yAC3v1OuIgL9LTsjsE3rw8+U93Mx2m9dqv0DVy2gRa8y/1rCTa/p/UmdzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1Wcq9WTXiKWb5nk8BFrG3BUZ1YQY0s03a068+uKLHE=;
 b=mLw9lvpuM6wc7z8DURcnAIkmLxUD8CZDjndOwvYtu+u98bTdMTGbdzwAV6O+wJputA0dqiftSIDf6DX4wn1sodLIBKlth6MeZ4HCzuN/NEfwU1HN5NfQxIEp5sHEm1GyTa0olsDn0A88DTlDoN9CL4pQh8TTLFpKKNXi01l6u71qQncpMW5nyZByuuwjdXnJq6hwRCJF8p/qiNPb883FBB5iWo/RoWaC6jmeVX4t/zt2yESYd6D9FuV4ssZw5HlxIocyvmTFaeeXaE2vkpCSmcpm0F604UtkIywtlg+aIvgDAkxKHaIMaWJ8itHkp4T1KRNZw7iUzYdLZVC3gAa10g==
Received: from DU2P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::25)
 by WA4PR10MB368572.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:1d0:106::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 12:14:46 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::90) by DU2P250CA0020.outlook.office365.com
 (2603:10a6:10:231::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 12:14:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 12:14:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 13:15:30 +0100
Received: from [10.252.6.76] (10.252.6.76) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 13:14:44 +0100
Message-ID: <2aec79a0-54fc-4593-b4a9-7a2387f2c6c1@foss.st.com>
Date: Wed, 18 Nov 2026 13:14:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: stm32: Add clock-controller
 sub-node to STM32MP2 SYSCFG
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
 <20261110-ups_mp25_clk_syscfg-v2-2-624559bb8ec7@foss.st.com>
 <20261113-honorable-competent-lynx-b1d5b8@quoll>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20261113-honorable-competent-lynx-b1d5b8@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D08:EE_|WA4PR10MB368572:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ae6991-93cf-4858-ea7e-08df456d88e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|18002099003|22082099003|3023799007|4143699003|11063799006|56012099006|10067099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: /l0sM+VR6913LMAWTMzZlcQjVnWQ95b9lYHCTcbPSB0x2lEk9veHCmkmP6i/2DujqRT+9FBtxZTEr9NHpD5gy2016uVT0rC/ewr57fHOKKNIefbYe7/dgx7IVOPJB/MVNuvDx4/jXHhtEfXUniQ4FdpNEIPuj5Mjw+apb9Iqj/2qODMemUY7WKdm9bp3vQTtr+ON0o5Lap79sLpxd3twjNmVgBU9uLhIBgUgqmu9vgdYmI0N1Jm8IkPHcHxM3Pc/YwX01oChohXYya+Mkx5YZulOpHrQ4/bJZA6iWlabfaGxTgjMUY5KpmkgZkH8p1i25h5j9e1U/rKH6zZ5gNVFe3o+kbB8C7THYImfCGUiIL1qLJrqbQBvtjOQvJkOkQ3jmVYFXPxfIfaeuLq0ZchTJAQngCiD1jAQ6a3PdSSAaEYNVz4+4dmfpfD39AFOYhfH6broAC/ks9th5SX89mUw/RIFq+sulxVZHT3wU7o41/XuyRuLYlcxe4+OifUhLeRTIAW0haLugVJZo87rmWtOgLWAdEjeW9Z+QK74CrzjD2k5E7OtoIImB4gGE4UHXnmBqQHTUz+NgyThZwVdBFQXwSAqUljg3aT+b2yEzWelK/usdaFEVxsU1s6ddBo9TI8RXcuynghH4+WGtfg/I4sZHdhC4kBwthUYNKMnxJEnQl8=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(4143699003)(11063799006)(56012099006)(10067099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Rw6mThnM5MPGVJtxDOcbcaQMUxIdrPN6Tmxa+oFXiKGiJg28wYktjRo2n759mfb9Z28datruswjtfFJBRkGfMfCgUP1hdoDZuSj8LzqRGdWTG8SBwOCBSkJ3o1olRI5gXVQnXoqVO7njy/0aAMJTQkZvEnn0paiF8iRkhNMfUjVj+cEZL9qpVudMjTXh++QBvKNpJ2wYjvlu5g/96Gza1iBn3SR5j6+HubUY6JrToJ5cRu5P2n89ntvMPiZZOriDIvtyXNFKTAAKXnaxUXf9QFE9fXMXWdFOLT5YXRGhi90dK5CNzjA7anmJ1gfH+ow4Y1XiEVw4Ya9LWRWbLrT6OZwJhM2Pd2M0b9jFGA1kKKriWxFmLEHtQRAwTUlkKIUQrO992Gc1lwkBWL/HSUOJQyixvkpQZP9LxgznIpgqkYQWlkIzXZd+sx8qgQ+yv+j4
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:14:45.9106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ae6991-93cf-4858-ea7e-08df456d88e3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR10MB368572
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_041456_199213_B282AB0D 
X-CRM114-Status: GOOD (  21.68  )
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

On 11/13/26 09:24, Krzysztof Kozlowski wrote:
> On Tue, Nov 10, 2026 at 02:10:22PM +0100, Gabriel Fernandez wrote:
>> The SYSCFG of the STM32MP23x and STM32MP25x SoCs is described as the
>> provider of the LTDC pixel clock, but the inputs of this mux (LTDC
>> kernel clock, LVDS PHY pixel clock and DSI PHY byte lane clock) can't
>> be described by the "clocks" property of the SYSCFG node: the SYSCFG is
> Not true, you can.
>
>> a syscon, whose first clock is taken as the clock of its registers and
>> enabled around each register access.
> That's a driver problem, fix drivers.
>
>> Add a clock-controller sub-node to describe the mux with its own clock
>> inputs. It is required on STM32MP23x and STM32MP25x and not allowed on
>> the other SoCs.
>>
>> Deprecate the '#clock-cells' property of the SYSCFG node, which is no
>> longer required. No driver ever registered a clock on the SYSCFG node,
>> so this doesn't change anything for existing devicetrees.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> ---
>>   .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml        | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> index a559f8b03b84..13c02844a91f 100644
>> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> @@ -38,6 +38,10 @@ properties:
>>   
>>     "#clock-cells":
>>       const: 0
>> +    deprecated: true
>> +    description:
>> +      The LTDC pixel clock multiplexer is described by the clock-controller
>> +      sub-node.
>>   
>>     "#address-cells":
>>       const: 1
>> @@ -45,6 +49,10 @@ properties:
>>     "#size-cells":
>>       const: 1
>>   
>> +  clock-controller:
>> +    type: object
>> +    $ref: /schemas/clock/st,stm32mp25-syscfg-clk.yaml#
>> +
>>   patternProperties:
>>     "^phy@2[48]00$":
> As you can easily see, each child needs addressing. This is one more
> argument why this is a fake device split, done only to match your driver
> limitation. Please fix your drivers.
Agreed. Sorry, I sent v3 [1] before answering here.

v3 drops the clock-controller sub-node and its binding: the mux inputs
are described by the clocks/clock-names properties of the SYSCFG node,
which remains the clock provider. It also keeps '#clock-cells' in the
SoC devicetrees, as you requested on patches 4/5 and 5/5.

The drivers are fixed instead: the STM32MP2 SYSCFG driver creates the
SYSCFG regmap and registers it with of_syscon_register_regmap(), so the
syscon core no longer attaches the first clock of the node to it. The
clock driver is an auxiliary driver, whose device is created by the
SYSCFG driver.

[1] 
https://lore.kernel.org/r/20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com

Best regards,

Gabriel


> Best regards,
> Krzysztof

