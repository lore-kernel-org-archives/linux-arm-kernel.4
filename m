Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB34606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3W3ZQK0M;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=d5bzjfrL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sEo3B0b3YJ79VGmPGi4PMfronPfPnTjtUxrQu64BATY=; b=3W3ZQK0MNxyxDr
	HNZKuMYk9wqCF0wvjE6yLoqQ6palnp0mcJqPqUQ+zDEKAbJnJvx6sD7wWtaSjWBQ4jEYeDZKtIrlj
	1esegahwLPA7S+vw5o+xfCUARzoVGCzsoTGIwiw2wCBFxoexljIsgpiQ1CJR1jFZQ0fIzoeo+FiYD
	a/lkeuIPrv+FsYkxVzJ6g5l//eoPlP5bnNozy686rNhbEiYmA+5yKtSd0NSTg2mylmNlNYpdfHzCH
	yVqswc41j/FZSEtHl8dStod4/XYWXibB3HGcPsIYt19NhI2yD5BcLKI61/8H07ru1rbkeGVa72bEo
	4N76LSp9/e2CRKzKk0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOCq-0000000F2G4-2G8a;
	Fri, 20 Nov 2026 12:59:08 +0000
Received: from mail-francesouthazon11011046.outbound.protection.outlook.com ([40.107.130.46] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOCg-0000000F2D5-11iZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:59:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BU/v27MLUOLtcbpHCrC2jfLgmwef1/fQnkTnJEWH3/OAs65GSZHzkYUNyGmSV+FfnE8JHjChRFubAj2vC6EPwlRweJtww60uBJWYG0hAMyaL8JZgWuLwFBr9lchKWSFgg3mfW5zzUZcwPHEZmysRBA2UnHlrofflu5HDyjbyYYcp60wVRP+1oZ0J5A9MSJD2fRl0y4MX5Uc3f1SBsNuO6bIywOL1s7AMrDW9m4qAE+cGdTG3rvRxFJ1/fUZfQbOtKUIkCaFeG1ycVmzgJkrNO27lpWfQnFuyXbrn4X53zMT4zY7ZrQnEBBPLpLcGcnHz4c2vaavD4avvUqZOml2qTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEo3B0b3YJ79VGmPGi4PMfronPfPnTjtUxrQu64BATY=;
 b=jSUyzN1ikvWluPAGT+vk5xUyoNQS67MQOQMDubzYaNWmgvIS2/8FLJmmxsd9dX6oo64nOJG2TGESH1I5vfgFZFK6eZOp7LBxTPPFSMIDLHx9ICfyCujD4g7L0ejWco7hLWpitdrbDzroRsVuBQPTAZqY8KSK9ofeJItBVwRQTB6S4bN+G4QGgT8BlsszN+Yn+fvWyHcPXec0qCAVwCajb7NCh53ex7WgCMYy4JT7PRsFIz+yGZqQJan75Dki8SK+FrIYqHPgMpmsFnf1WktIcfKCZqg4/ec2GmXRqJYCV4n58Q2Lsys5unQrH2GZjQxDKwd32arjVQXOOKxgpuipMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEo3B0b3YJ79VGmPGi4PMfronPfPnTjtUxrQu64BATY=;
 b=d5bzjfrLbxUeplFVLp5tYJVjkJFt8kFcVw2S8oFV7EH/TuN5wOXvEsaY7M0TSk8HZ1MFBlaowrTkdkN6d6tmcdm4JiuXDI/LJEinpJIZryyioq1TOtCf6CaLKnnjrGTijtdJvfN3R+F5mnKKmWeulhJuUFQf6nBm6xtGWTL3ZfW/0ekFx7/SE+Zg02KSeg+jS25D4kit96CaW9sJe4HIeiXOkcdOtyg33lIrRC8oFbXb97lkDNJG7shSJh5nYylSNPlcj+tOQEnwriEHgY+sOWnG3FBxuupCIeEhzcAwzFKzmNjr+226zx5andGX4aTWqBT0Qmwr5UkkxfzsYyhHvw==
Received: from PAZP264CA0153.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f9::8)
 by DU4PR10MB424460.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:5d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 12:58:52 +0000
Received: from MI3PEPF0000848C.eurprd02.prod.outlook.com
 (2603:10a6:102:1f9:cafe::9d) by PAZP264CA0153.outlook.office365.com
 (2603:10a6:102:1f9::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 12:58:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000848C.mail.protection.outlook.com (10.167.240.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 12:58:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 13:59:54 +0100
Received: from [10.48.87.222] (10.48.87.222) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 20 Nov
 2026 13:58:51 +0100
Message-ID: <cf0e61c7-b603-4dd6-afdc-bf38884ee7dd@foss.st.com>
Date: Fri, 20 Nov 2026 13:58:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: st: add PSCI idle state to STM32MP23 CPU
 domains
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Alexandre Torgue" <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261119184209.v2.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20261119184209.v2.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848C:EE_|DU4PR10MB424460:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba6dbec-58e2-4432-761f-08df4706070d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|22082099003|18002099003|13003099007|11063799006|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261009223027099003|261021121427099003|261021123027099003|261022075727099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: M4+QzLUryuEbSXHBtmf//oGDnsbPmr3HQ06vRwn8p3NmRFqoe2f+JZGS0aYRjQ38p6pzVXrz9vHvUy7glwnxGJYygV/FOs/zkfEcaZAS4G0MZ1vpMuUvxo4UqIpPLJZDDBZq2+48wsjIiTN8ujKuJGpjck/SYYYIqCrfws72x3Wz6QjeMdm52aXozeA7yhAHHsE0O++SOpN+eisNv1OkX86dHJbdRzgIIUZwIh2sDPZuyfNfr7kC+3hP7SizITDeBsiFppoXbBXSGLdeqg1ex+oV8xbnEBEBq/R4GeQOWzonqZM8nHfPqBFXY1HjUq6hBNcIMSygBpL0zzsX+H+ZZoVtjxV/T8dXpS2DarhDNOUPvZ3f34iiMh6Mw939n5wS6Abjkhr++je2pF/On9gFpH/GtUjAM4FHIstsek36mi4/Htmgc3a1qTfSUU0Cgl+Ldqbj9GAOm3NiEANCJCtUVMz6MTYpZNBxOFGt3zD5NAP3QPOiesQHcl5T+Q0+BSpg4tDCoX6JYG0rHgW6md6JEhoG0wUlDG82btpauHwJq5eahXqFhz/BYqFpAnX7uTQOk2/XgFOyFv6AfRHUn5ccVDFcIfRDsP9Q/s2NYfeRq3v948GLnjhu0IbmJqCs/CRAjw0rEaC9+BNOUGdb4K4igg==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(13003099007)(11063799006)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022075727099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UUaT9N9HUMQIoIpPHzLBR5/MTCx5X1x47u3DJ8fNNxn5VRY+a34IbI8ANh+LOtVJkPbVXvYobQt7C2F7HkyGXWw2chB2lZAIbNRob6qvbGsenuHoIFimknMQMVKLrUIwtg50p3F0CpoB8uTrbRnBt6gT0bbanLxrzT5QAfTNS4CXQlhpYRbD6EqIzzxG5Cwt1+g5UjLUKXOI1Z1lESJ1szwLALrQdGNCQ24Oii6m8b//JtNIv6gnJaSER8YzSEgIG8PqpSnmJWzTcRW1Nw+P+3Vt8euGd+4ywg0NffsCGm4U/k5/9pHhPP7GVmwzFDbxvFJk/rrV39RO6gSoCpfAPgUcOq5khKjD0kmj+8hOA5cZbdjQMs2HVUqtE6vn2aMSQK4xkZxRfzLCvsAwkZYt1nc+2F3Rh2QdzgJj+UfHKbbbZyd46ekN91kRuZSHdt+H
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 12:58:52.3196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba6dbec-58e2-4432-761f-08df4706070d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000848C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB424460
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_045858_843430_232C7E8E 
X-CRM114-Status: GOOD (  18.75  )
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

On 11/19/26 18:42, Patrick Delaunay wrote:
> Define a PSCI CPU suspend state and reference it from both STM32MP23
> CPU power domains.
> 
> In OSI mode, PSCI power domains are initialized as off. The idle-state
> allows the CPU power-domain governor to manage them, avoiding probe
> stalls for devices that depend on the cluster power domain, including
> SDMMC1.
> 
> Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
> Link: https://lore.kernel.org/all/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
> Hi,
> 
> It is v2 of previous patch [1], with only update of commit message.
> 
> I add a link on previous patch [2] which changes the timer node with
> compatible arm,armv8-timer, see Sashiko issue [3] for details.
> 
> [1] [PATCH] arm64: dts: st: add PSCI idle state to STM32MP23 CPU domains
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid/
> https://lore.kernel.org/all/20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid/
> 
> [2] [PATCH] arm64: dts: st: mark STM32MP23 timer as stopping in suspend
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/
> https://lore.kernel.org/all/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/
> 
> [3] [High] arm64: dts: st: stm32mp231 cpu-sleep local-timer-stop conflicts with always-on
> https://lore.kernel.org/all/sashiko-outbox-197300@kernel.org/
> 
> Patrick
> 
> 
> Changes in v2:
> - Add "Fixes", requested by Amelie Delaunay
> - Add "Link" to arm generic timer patch
> 
>   arch/arm64/boot/dts/st/stm32mp231.dtsi | 14 ++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp233.dtsi |  1 +
>   2 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> index fefbf6f4f153..27231e140fbb 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> @@ -24,6 +24,19 @@ cpu0: cpu@0 {
>   			power-domains = <&cpu0_pd>;
>   			power-domain-names = "psci";
>   		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			cpu_sleep: cpu-sleep {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x00000002>;
> +				local-timer-stop;
> +				entry-latency-us = <150>;
> +				exit-latency-us = <200>;
> +				min-residency-us = <1000>;
> +			};
> +		};
>   	};
>   
>   	arm-pmu {
> @@ -123,6 +136,7 @@ psci {
>   
>   		cpu0_pd: power-domain-cpu0 {
>   			#power-domain-cells = <0>;
> +			domain-idle-states = <&cpu_sleep>;
>   			power-domains = <&cluster_pd>;
>   		};
>   
> diff --git a/arch/arm64/boot/dts/st/stm32mp233.dtsi b/arch/arm64/boot/dts/st/stm32mp233.dtsi
> index 78f4059fca5d..cebefd99906f 100644
> --- a/arch/arm64/boot/dts/st/stm32mp233.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp233.dtsi
> @@ -26,6 +26,7 @@ arm-pmu {
>   	psci {
>   		cpu1_pd: power-domain-cpu1 {
>   			#power-domain-cells = <0>;
> +			domain-idle-states = <&cpu_sleep>;
>   			power-domains = <&cluster_pd>;
>   		};
>   	};
> ---
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> branch: master
> 


