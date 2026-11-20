Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AC1606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sYsFOsYc;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=JKusbFtU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E19SkSQNqMnbD6JXYFfN8Zy23J+ZHvJi/Mnbv1pU338=; b=sYsFOsYc3+/MS9
	vKbYRmJXBYNj4tOCy2XVs71dK5cG6dA3CHQ7iyhg9jzsLd4Ms0qvplGYTeY7UuY0hBrltyfZ5g3v3
	YwGFrRr/+7ZS3G5UUf7xKzO/tZ+tBYiwMKdczCTJgnHEWw/mUAm/EqV1CW9KelDSUvz+Ovjo31NDN
	5nVunpZ1Ahrz3t3bngk17+32cLxcHi0EiBuVOQL6bWyt3sA7hy8mXnVEN1Lwmg0NvvoEpnzt1aA3h
	0ceA4ikoZ7eqKaUT+TkG4Q+xIlfvrPyHs/HEescsZYYrK3U47DwlHwZbjf9b4TvSpTAwhOlUFZNS8
	9umnRuDvZVFeKl0+5qPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOKO-0000000F367-2iGA;
	Fri, 20 Nov 2026 13:06:56 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOKJ-0000000F35N-1Ad6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:06:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ey7LXluZrbXyyWhEa4ngQNbCpVMVrxMU64Fs4K1N6XcIRCllKsRQ2blRolQ+j1Y9PSLbSi86pRyozvXfwfO7gkvIJBusdq/W1Bv5ss/zXOyNZmQNluCq8dM7ubBXiWgxG0n2LXoJqqsTbhRgiD1kq5tiREIwRHoxeLaeMlLI0Nn4xk4VYo8leBEdmGFeVDG0GolFJgkeLvo1Ldl4pPsAIpoXNdRb+Vu4UvLEuqQVwZgdPQMgv7pfWC60Z9Qcw1vyxBOiQYZEs8sw53VvCuW5DoNS/+BHS3FMtUI9E7lbA6f/B4wr58iIySFnZIUcIAmAubyu13ezsy5QUYnqRtQKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E19SkSQNqMnbD6JXYFfN8Zy23J+ZHvJi/Mnbv1pU338=;
 b=Co5U2YVJnP1jhhBLqDPMa2ScWyLGuzZ0ibMU2GKbv61u+L5Ek9Jl4nroWxNd0R1H7fRcD3xhXMiN4bOlsA/uA/v7wIH5z+Hjl7EuJz2sRqyu6kqrmJkWwJYU1l4n02aDRntvGkagy7p3OtbD2mgKAibhr2sMAY353LlYCUamgB+Pfb1Sg8DFrA4zhZujnPE5dBzC5ep51/Ac9tcffE6qZiYCa+QymlXiiZckm/T4JKYLoKOINGwPVseI7+Zb2dlqLgV/ac7ilnG1r4wfBCxT4Y2dNn1KuQcAdM9fJcRNl9Jw/cJM/PCabHPYdoKlFQTsjumxBFrb6CQuN2qLQN5/Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E19SkSQNqMnbD6JXYFfN8Zy23J+ZHvJi/Mnbv1pU338=;
 b=JKusbFtUKFUKYMiqCQCMbbhFnyIBIZdlExG8b0wsjKGCpAWqKP+z9DXaKf4ktMZbZlWtMj0gOWQWY5YRwDr68pCO4cd1U1g+hl02owWRuQjnnz5ZyJ30+WLrBn4PJSWq3d8+eui3rW/n2eiD5V/vpHi/57ItF40LkKVx3/ONf60Qi2oA3zPATo95fziPtsATB+BhkaIMvQ7hkxnTq9TJ9mdaqO2mo3rxQLon1vIHbvxl1NfIkpSFK3TN5GDA/IuAuIJhjrIhavVjgVrO0zcc7Rgw3XKTIvbUIC5VRbRZtVV/PPWFyUyvu+p9kaKb5cMRt8p0oexd/7HH/WlBVKV3DA==
Received: from PR1P264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::7)
 by AS2PR10MB6446.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:559::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 13:06:45 +0000
Received: from MI3PEPF0000848E.eurprd03.prod.outlook.com
 (2603:10a6:102:19f:cafe::a4) by PR1P264CA0020.outlook.office365.com
 (2603:10a6:102:19f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 13:06:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000848E.mail.protection.outlook.com (10.167.240.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 13:06:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 14:07:30 +0100
Received: from [10.48.87.222] (10.48.87.222) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 20 Nov
 2026 14:06:43 +0100
Message-ID: <46796ca1-5a03-446c-bfa2-173fac805dc9@foss.st.com>
Date: Fri, 20 Nov 2026 14:06:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v2] arm64: dts: st: add PSCI idle state to
 STM32MP25 CPU domains
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Alexandre Torgue" <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261119185544.v2.1.Ia5e0774883d237f5825b7090962b454294922558@changeid>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20261119185544.v2.1.Ia5e0774883d237f5825b7090962b454294922558@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848E:EE_|AS2PR10MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: e730aa33-f230-4cda-aaa6-08df4707209f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|22082099003|18002099003|11063799006|261026121527099003|56012099006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|261102123227099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info: V73UNXaIqtJqNEtykHucqPiDZxf2lXlzafg3+wKvtkdcFzMZg6OjiWzrb45/dTRFPyjlvFWzmZmazv4mZF6fZdg8SZSUxoDNGzk9A7raLoOCaMjNvtvH0dMVvVqwFzx6odjEdedHg58uXaP/dcW0bFJHN22sKNlqhdd4Fgqy+VpU1Tr9u1MMBnYbGU+89IE5H3gC21Li0gkiYj9ErjaPEepqMITM96TcQI958gNq+TbAC37kUeVfUSJMLy3Sar9avOmuL3/3k3ma6y0HbphcieO/z/jjiporGogS45cLNmOogX77+yNwlaJ2XWm8LFqNzWGKSE1pouIQKAiyoKTcb6MQ/tYKbt3GKpgHgUD8BxKaXTZYG+S7PUQgfO+ABIdIcHBC767Z7AxVMOVpr8fdhC2rAW/Ko1+RxiGPxdofYCki37yUt5kZGjtN42gvsapjEgw85hkM9tV659F3KOb4qGy+uaibBQkEoJAxMJGRg6Lfe2hmo7OvHnolZevkbPborYy5NUlBuXPnmQ//ctohK8aFQrZqOLjcUasDxzriUwARfT+JQpyKZrWHo/rS39n5XdrPzMEpqDdsrXweCVkcNAjKJO/l2Tc5FE1s0qOm8pFY46oD3LoGqyCxun4AuMBul2vXFVRflyIGoicYSRu1Uke5dv/FpvEzbqs3FYguPx0=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(261026121527099003)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U+fEc6VI2gV+hMjxd3gvlKiJ3iwxxmwK9RdX+FB148j/B9jI4cNCyzVn5ngvIYNcsg9tKO+XQyugIRIe9yckQCgrHivM8UHuyGkcrae3hxRXSwGUzHyEkSYpCgWAllja/ej9tfNXhGvAWpVMvCAfHFnOPyux5IsW2JVinZ32Lqp4URWC4KW6zTZk8qcF6p63dFpTJM0GDagywBn0Me5iChgSc8KQFNVlBM2JssRcqse/CQDDLEQR/C2f0hN7Y+LC9KcOGH3NJvTlaKj6Rg2GD5zA5YJ0PiKWZgpV8EaV5dAuUtbKqPKiLr52hxmlqRbPY2tWFYadwGmCxtGRx/AY9dS44u4ebqpGR+wIsEygXEJb25KmimNZhC0MsTohus3Y26s3rPyABVfck5R2wpB9uRwVHGiQmLBQ5W6weRuCtCjLDmWNAG8o/a47oG9ebjah
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:06:44.7147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e730aa33-f230-4cda-aaa6-08df4707209f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000848E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6446
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_050651_509750_B4BC441B 
X-CRM114-Status: GOOD (  24.84  )
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

On 11/19/26 18:55, Patrick Delaunay wrote:
> Define a PSCI CPU suspend state and reference it from both STM32MP25
> CPU power domains.
> 
> In OSI mode, PSCI power domains are initialized as off. The idle-state
> allows the CPU power-domain governor to manage them, avoiding probe
> stalls for devices that depend on the cluster power domain, including
> SDMMC1.
> 
> Fixes: 9c8d852dabbd ("arm64: dts: st: add power domain on stm32mp25")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Tested on the stm32mp257f-ev1. The following logs
	root '/dev/disk/by-partuuid/e91c4e10-16e6-4c0e-bd0e-77becf4a3582' 
doesn't exist or does not contain a /dev.
	[   11.829563] platform 40130000.i2c: deferred probe pending: (reason 
unknown)
	[   11.830952] genpd_provider power-domain-cluster: sync_state() 
pending due to 40500000.ommanager
no longer appear.

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Tested-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
> Hi,
> 
> On kernel v7.4-rc1 and with TF-A BL31 compiled with the PSCI OSI support
> the boot of STM32MP25 boards failed because
> 1/ the domain are OFF by default since commit 6d3080bfe007 ("cpuidle:
>     psci: Initialize the PM domains in powered off state for OSI")
> 2/ the SDMMC1 uses the PSCI domain cluster since commit 4f454e51290d0
>     ("arm64: dts: st: add power-domains to sdmmc1 on stm32mp251").
> 
> In the trace we have:
> 
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: Trusted OS migration not required
> [    0.000000] psci: SMC Calling Convention v1.5
> [    0.000000] psci: OSI mode supported.
> [    0.000000] Zone ranges:
> .....
> [    0.242188] CPUidle PSCI: Initialized CPU PM domain topology using OSI mode
> .....
> [    1.604962] PM: genpd: Disabling unused power domains
> ...
> [   11.833535] platform 40130000.i2c: deferred probe pending: (reason unknown)
> [   11.834888] amba 48220000.mmc: deferred probe pending: (reason unknown)
> [   11.841607] genpd_provider power-domain-cluster: sync_state() pending due to 40500000.ommanager
> 
> When I remove the power-domain in SDMMC node, I can check the
> genpd state and all the PSCI are OFF:
> 
> # cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> domain                          status          children        performance
>     /device                         runtime status                  managed by
> ------------------------------------------------------------------------------
> power-domain-cpu1               off-0                           0
> power-domain-retention          off-0                           0
>                                                 power-domain-cluster
> power-domain-cluster            off-0                           0
>                                                 power-domain-cpu0, power-domain-cpu1
> power-domain-cpu0               off-0                           0
> 
> 
> I can confirm that without the PSCI power domain commit 6d3080bfe007
> ("cpuidle: psci: Initialize the PM domains in powered off state for
> OSI"), I come back to previous behavior:
> 
> cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> domain                          status          children        performance
>      /device                         runtime status                  managed by
> ------------------------------------------------------------------------------
> power-domain-cpu1               off-0                           0
> power-domain-retention          on                              0
>                                                  power-domain-cluster
> power-domain-cluster            on                              0
>                                                  power-domain-cpu0, power-domain-cpu1
>      40130000.i2c                    suspended                   0           SW
>      48030000.dcmipp                 suspended                   0           SW
> power-domain-cpu0               off-0
> 
> The proposed patch is the simplest solution to allow boot of STM32MP25
> with kernel v7.4-rc1 and before upstream of D1 power-domain and full
> PSCI OSI support.
> 
> V2 of patch [1]
> 
> [1] [PATCH] arm64: dts: st: add PSCI idle state to STM32MP25 CPU domains
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261104102837.1.Ia5e0774883d237f5825b7090962b454294922558@changeid/
> https://lore.kernel.org/all/20261104102837.1.Ia5e0774883d237f5825b7090962b454294922558@changeid/
> 
> Regards
> 
> Patrick
> 
> Changes in v2:
> - Add "Fixes", requested by Amelie Delaunay
> 
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 14 ++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp253.dtsi |  1 +
>   2 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index dac3d2d23ff0..bf1542818be2 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -25,6 +25,19 @@ cpu0: cpu@0 {
>   			power-domains = <&CPU_PD0>;
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
> @@ -145,6 +158,7 @@ psci {
>   
>   		CPU_PD0: power-domain-cpu0 {
>   			#power-domain-cells = <0>;
> +			domain-idle-states = <&cpu_sleep>;
>   			power-domains = <&CLUSTER_PD>;
>   		};
>   
> diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
> index 7e82f01fdc10..19b3e55a4414 100644
> --- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
> @@ -26,6 +26,7 @@ arm-pmu {
>   	psci {
>   		CPU_PD1: power-domain-cpu1 {
>   			#power-domain-cells = <0>;
> +			domain-idle-states = <&cpu_sleep>;
>   			power-domains = <&CLUSTER_PD>;
>   		};
>   	};
> ---
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> branch: master
> 


