Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CBC606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K7N4kxfp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Cbe4BnRL;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=krHXn/oo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tj8moKFFD2hrdeliYnviN11TyNiCYHRIIsNsTPwMhGo=; b=K7N4kxfpAy6Ef+
	7+cnOnnzo4gnb0XJjWI15uqLfSTAAPHJ73yW+O5zRzX7Ngn7G5mQd1Rlf5n/8wAZUCCgjIyAi/C4N
	adXiZAi6WNpzIm0JWTK6QiS7cVEI41MtjDRlaPchKaWvVgWuY/q2Rh5TvaIQlCsWax2E26YvKI0Og
	uAwT3OQXhbYPzyn/QoOZC+V0iJJSrFPyV21gJUhlI+uw8+xhICmvNwisyg4qXZ2r50QJAJavEZ423
	eJqRf5vlEI/ulQ3YIKwd2GnoIcnAy43GNnS4UziYTH+tUpzh5w7B206BHVSEzmKWFf7g9dwIx0q/C
	98gtUlBckUX0gkczoQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtSs-000000077u8-2ZDW;
	Tue, 24 Nov 2026 16:33:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtSr-000000077ty-2Bfx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Tj8moKFFD2hrdeliYnviN11TyNiCYHRIIsNsTPwMhGo=; b=Cbe4BnRLU7iH9sDRQX95uG3rVE
	5JDaX2CbUzuM2HiNqbjNaEF7eDicVWetiYJyy68zrspRZDGkDMu3+7c3eER7aEMj8fABcv+WqVgaE
	tCakiykzHqOvrk+nL2J2+UR7XUOk9gQI4i4Bgq/GcowtkTGYQmEMuc9Ll+lfRvqZspvSDyWesNDFy
	N01if9OzFxATqq/Hlw1CSl2+sfN7zafDaunpKrZO4mGIXuGBd71bkaDtCcLVe59OBve+Oj61e5/N1
	TlPQ9JM+jEyVKwrvw6zqDOUZhWtgVjf9dj+tF3vrBGSymvwYdNwSYNvRjetjwNALJaMN3rnj64M3p
	IOj37bTw==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtSe-00000004Ldq-1RX8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:33:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/0bC0qCjMTUYdzt7gW7JefDBQqThJdyJfoawYjntZ4oORqqdWzSlkz7oCitmbqvzqIeckHtD/R2efLDWVxFTwiriJ2DGSyFtmZxScplwJ2p8K6ekq7iXdA8vcNy2seUcypawi//oQ/TFz/zzTaR85L7VIIPgTEpOeucDFJWRx62jEKOzAx4bsfBXxxxNLQMEwSo3OZajgzWJ4wCsv2Lqjz9VzuEBcZ5NK2qdgoHClB56cI9aXDjVlTkFYLYPuq1HE4xlVfWLuPHXUJm5Y6TPkLRmBj65ovIG3uA5A0I3gIWzxcbmEXDXSpYXipnR0wGduPYgOqZmhcNssxsNJJ13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tj8moKFFD2hrdeliYnviN11TyNiCYHRIIsNsTPwMhGo=;
 b=JSE39yx+0L68JN3//XPdPXy3Y3gRonWP5ncp5kZoZWuqJkOLH/iq9e2cWOyahuses3QMvTphIyFgHohMjXBl6CN6cyfsjTPeC+OCrbLX/C+HWFSIMna7/i3+YOCfCsvFPSnK4VPK//2tSSJ5g5Bt9lL3uv2+T5sRYaMjnBeT1NG8AiaigtXLGeapZTxXBm5/V9byTEnMscAESYCoYoz4ktkxBfn+C4fVC4ZN2Dx1PaR5shI00IH7cE9D+X8VcXPkbokh6KfI+FKrkpcnAcJl4fDqAZ7W5u0zR8pPEs0x9BELzakAJ19MU3cEsy2VAbk6SNZj8I4MJFEISlgXeQ/Fgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tj8moKFFD2hrdeliYnviN11TyNiCYHRIIsNsTPwMhGo=;
 b=krHXn/ooqvbIy5f2lxMW/AGqWulh9oucqD+LWlMVWZOFupu4l89BQbR4I5PpNktsaXA97S8Mt5px3cgaq7PmARBqiDkWeFJwR6D9J4kIjiEzLPYgOafZQoVDv8XhTSvDFqh+c2FeqJHx/EnrSz72HFIJO0nALm7yuWTH2/VBP87f8iMndAlqKVv2Ykx3owfXFccS6mZvVbfTGAdHwn96oYEUqjrdVpTz/jZU8XkQoWppexjGRd1Y49Jv6UcbfhT+XqQnddMv+GKIKRp8Z+lC53SuKKYVw4/jgBUmoYqEo8b9srmWqFjMDYdEYXMVrUbHJKVI1lZp/WFK4kOCluSTiQ==
Received: from AS8PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:20b:312::27)
 by PAWSPRMB0035.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:366::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 16:33:29 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:20b:312:cafe::10) by AS8PR04CA0052.outlook.office365.com
 (2603:10a6:20b:312::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 16:33:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:33:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:34:33 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 17:33:27 +0100
Message-ID: <760311b0-77ac-427b-a64a-a3ea3e670e0c@foss.st.com>
Date: Tue, 24 Nov 2026 17:33:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ARM: dts: stm32: adopt hex format for timers
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Christoph Niedermaier" <cniedermaier@dh-electronics.com>, Marek Vasut
	<marex@nabladev.com>, =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?=
	<goran.radni@gmail.com>, =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?=
	<boerge.struempfel@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>
References: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|PAWSPRMB0035:EE_
X-MS-Office365-Filtering-Correlation-Id: fdba4d55-d559-45b7-5618-08df4a48abd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|7416014|1800799024|36860700016|376014|18002099003|22082099003|3023799007|13003099007|56012099006|261102123227099003|11063799006|261021121427099003|261009223027099003|261021123027099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: mUTqssFsBe46e40ltmDD/es9asNh8zBVPjG56fFIwUkEy/LyEECbAAnCxRcaGqaSEjTHY391FbheoOogFc7BpxgMS2YCt4ytEqaagnWcQAkwfWDHCMYn9Z9DNQbDWLRwuY2gXn9+s/a97yce7/q1fTrlrYxJGQBOzOTAXu+ev5QnepuLuubR+a45zGefBxHnfDYzDcjzqD9hj2wIk+fIuj2p9NaNx8XxUTjukTs8H5cFjiCIzDh/YsSDpc3FjwqJP1cnoUkDmni0a621h+RFMFno/pSI+OEmDGaAFJzbmghHs1R1KfTnIl+PotQ+pId87JuXcrljSTQX5zvm6m94r96UdGXqWkwLaWzruRRPhaJWR+Q2X6tsBKJmL/odvaiFrok8te/Ylc7sN7XoBuhJ00ha5s9xyCxso6zqq+eT26QYvTK2qWggQKXstfKODH1Lf9graWofw6AvmtSbcnB846U6tdXESTJCuyPpyxQc2gzthgE0w9tP8QKFIwaPhv35djifDjUiGVe0L9h8OrfiXME+0BYzyQnHQYr40W6DNvFhcKyOkHwmvZLR2KrAzL7Hqy5dn5X+hDcgZbFQ5FrD2y/Ko6jMB5oN40UvVXxf53XbloWO3r8+bNhYJejY2DQKSh26iRxq+wBvybSi9PHs/g==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(7416014)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(3023799007)(13003099007)(56012099006)(261102123227099003)(11063799006)(261021121427099003)(261009223027099003)(261021123027099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ye5fXzrhv7dEDrKuuuWcopBuqQKhHHqjLhLhb0UuUrryyHhaLlHH+fdp48V6YYLwmPN/PFjAglzn5TEuABqKVUobBEkxsZvUio2cx07LVrx3H/7aW5BIKixU3AsYAC+fvE633SUio7qCSV76S19K4rb3ChiXJ0cKcXJMi8tP0rb8ilzbHU2oX4LNliJv/mDqWmMb9ZeYSXP7EW9LXO0rLJ/FUjb/Ppwjo8wNyIOem9Dg6MX+e7PH0fVohArOSAMHz/c9dXeJh+bVmGVmHMWYylrG2Mq4G5uPyMTdL2XgQJiRDi5fAr9YBv4QzBt8341WiG7T+f3LuSrh78wM5u4p8OfmnKteTvtLd/MZ62girI5AJRlbP6AKCsH6W5dNBeCEQqOY8dG5JMLv5NU0thxG/jI8G9pHZkPxXvGqq130MvuevIKygCh2ZLn89AGiLu3Y
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:33:28.9725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdba4d55-d559-45b7-5618-08df4a48abd4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWSPRMB0035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_163346_610613_53E93647 
X-CRM114-Status: GOOD (  12.60  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Salut Fabrice

On 11/9/26 17:25, Fabrice Gasnier wrote:
> This series intends to comply with hexadecimal unit addresses for timer
> subnodes as described in  ("dt-bindings: Use hex unit address patterns").
> 
> Also update hexadecimal format for 'reg' property in these nodes. Take
> care to update the boards accordingly. Note there aren't in-tree overlays
> impacted.
> 
> Purpose is to avoid upcoming new dtbs_check logs like:
> make CHECK_DTBS=y st/stm32mp135f-dk.dtb
> ...
> stm32mp135f-dk.dtb: timer@4c00a000 (st,stm32-timers): 'timer@14' does not
> match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
> from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
> ...
> 
> Link: https://patch.msgid.link/linux-devicetree/20261102135330.2493332-1-robh@kernel.org/
> ---
> Fabrice Gasnier (4):
>        ARM: dts: stm32: Use hex timer addresses on stm32mp13
>        ARM: dts: stm32: Use hex timer addresses on stm32mp15
>        ARM: dts: stm32: use hex reg for timer2 on stm32mp15xx-dhcom-overlay
>        arm64: dts: stm32: Use hex timer addresses on stm32mp251
> 
>   arch/arm/boot/dts/st/stm32mp131.dtsi               | 46 ++++++++---------
>   arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts   |  2 +-
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts            |  2 +-
>   arch/arm/boot/dts/st/stm32mp151.dtsi               | 46 ++++++++---------
>   arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  2 +-
>   arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts |  2 +-
>   .../st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi    |  2 +-
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |  2 +-
>   arch/arm64/boot/dts/st/stm32mp251.dtsi             | 60 +++++++++++-----------
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  2 +-
>   10 files changed, 83 insertions(+), 83 deletions(-)
> ---
> base-commit: f39a4c5c819bcf18c7543cccdfd2215ceb4daa53
> change-id: 20261109-timer-use-hex-unit-addr-545d9dbd3331
> 
> Best regards,
> --
> Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> 

Series applied on stm32-next.

Regards
Alex

