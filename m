Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D6C606A6B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3z9G0F8j;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=dHecZnux
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DvfoQdX5TAh9acAbfEpdCjhrYNF1g8HYHnrBWffEvp8=; b=3z9G0F8jYAcv+2
	/liFgP1/Cw8t7zbQlq5beY9zhQH/1A/B87Ou6ECMsw0MCxqPgYiGKsh61lNXpyJh3mHEu4g2MuQ/I
	K6D19+Q+mhDpE2YtFpeqUkO2GGBY4mADjqPclOBOaREXG+EmgIa7C3FSP+0OKYNB3ljPJDx398LxT
	oJy0m3kbii/p7bxBVsW5Wr0fRIz87idKUCn1ReJVIcPR32xGpF7U3AeQkNPYO7pR2b1/NDbUgwIpH
	8N0qU6MqFykfa2I84oViN2Cj5TfAR0chJPnvaZLiN0S4oPFo4258+3H1eDxnu3Yi9GXE6DMulxSKL
	Jmvs8Wq8W/W5dCod2Tgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrDL-00000006iSS-0hGL;
	Tue, 24 Nov 2026 14:09:43 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrDH-00000006iRl-3eXh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 14:09:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSj0WvZoIDToDfYaeJhmZXKGmsQmy42kt3KaAusVSC7yxGF2jpZW8lOZZjkVvg258ZeiV2Qrh1qGFUxgHSc8YpWU9fecSBFQTpxhe+8qBFDzlxGWHv8TGDGnVTKhouAQ/q/aBkVYxV2mOYZ6oQtMN8Op+X6sJxXBZD2JqHcozZ7ETFTVaWQessg4xmwIPvQcw9lHzZKpl+PcEpVUH+O5OyPvoKy/ScRwCJIPKLrtwLVQai8SF9lfSGTOFQyMGiEfpNSUcrSflw9uGGiwfLDtbFnLiLDQEmCD181vVCoH8o91PKrsubNPl3xHaaRiVE9DGHBs/JbmSyH3cn615iAhuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvfoQdX5TAh9acAbfEpdCjhrYNF1g8HYHnrBWffEvp8=;
 b=m7pKOgFncJ9hVH/QljhUtyQBMJE38csc/W0LSY1mXU1hnyc71kSB8+fjuvezNv+72CNVl15kLx080ABmoEdYORz5UIdbs2zTi6rlvpZ6ZOn3os7bg11uCK082JqNpy5VBzEZzvv5Nm49cHhwYkPD/AY0uzVJ5/BgbFVLIyQLidp8ImlQzqulDJM9MV6SrPI1Kbds3TqX1AAsENG6VDjoXrmfnHCaw89pAk3xdtk9oZFBIT0haFSNdHKh10wiLQzhlCM02PzTAe8pk9CSnygVpi1W4vGoIVgIaDtT7KMSpQjUJOsmBdUG5dzlr4IXwnX3Bf8IAxRx0bDkS0O5tKYPFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvfoQdX5TAh9acAbfEpdCjhrYNF1g8HYHnrBWffEvp8=;
 b=dHecZnuxs8oNjA31B729cK3dcF0kkDkPQN1IIKG2SjNrULGKk01W7hrKzeOJh9GQzEOFfoVDJccqozq+0BFNk9SOGjvvGuJGhP1FsNTzW/Dgq1FHLdx1jjcFw+r6D7Y+bn6aoILYjmHPCFeuGQ5tbDeIIfyiaA04FCkElp7B8E0uK9MGsf0AqkzsXFxp/+LhwdY1NvknVkNxrd7Z1Dvv9TNhwXMpDLg9zj+1cm6lHnYipF0qJ44XgYg+jaF4nCNUfDR7H63ymjt//LU9IxZnx/rzvg5aYDSTedzWEFYxb4YaCafwup/KUICt+pbKiikuq41VzU+JtgQblV2OxbaplQ==
Received: from DUZP191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::27)
 by AMBPR10MB422559.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 14:09:32 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::a7) by DUZP191CA0010.outlook.office365.com
 (2603:10a6:10:4f9::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 14:09:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 24 Nov 2026 14:09:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 15:10:18 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 15:09:12 +0100
Message-ID: <f3025431-c426-4c7a-b196-ae09aeb617a0@foss.st.com>
Date: Tue, 24 Nov 2026 15:09:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: add firmware reserved memory to Engicam
 MicroGEA-STM32MP257
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: <linux-amarula@amarulasolutions.com>, <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20261028105807.2567225-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20261028105807.2567225-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D04:EE_|AMBPR10MB422559:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e1b695-9623-4582-2bde-08df4a348fdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|10067099003|56012099006|11063799006|261026121527099003|261021135927099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: ZbyFuaE3z9mrCtj52TnjUyzNODjq3dPh4tIUGgNsEJYy86wqCt1DCOhc87ZaXoVMp7A67zPMh/y/EWFNal1o5BItP+KfAxMQD0Jq+WcuAZQDZlqxXa8aOkh8Kvo3dpTlO5GvrKIUeEKspRdb1pzZtAKbWSkr90ly4K6iSh47L6AWHJkx527Fyht1yp5sZg+OZicxeyin5FrSUTp8sAWQMebRO+4dG+tPpizr/V7Kuy5VxOHFFtzvi/gMscdBszJcjd87SAN7cr0TQRdAOfL3IybYdHO4qKRJMEDB+Iv8sygTkJhXXjnlkfcvmkkm9H2iEjHd9sNgblbHba8wjJ4sDEg6mz2veiMBdnDOU1TLb/ljVZD5J93cMHzCBjK8ZkRVcxhvGKC/5XPIHT1YcvQK/mlpa24HPTeV5x3qEmsc7LYEwJb71sYZBL4tq8KFzTerbgKPeNzRRc4MHjSCSuvkgQeHdpenCotmYpv5FK/DxdMKmGs2sFtgFIjFU6YSEem/ynNftCXJJPm6OTi1VQXH+5n25QV1GdJIoELGMFHmHJAro9H0eVTAfF86KLcslDqy81tk4Z4qw0jF9UXRYs1gstskjd4rbEP6aqy9kzbeLlR2y4LJzsSM11ylWCbrswiTtXl7rbQcPc9AKfhM1YOHKwVvF05KoT7r5ZptTTT8URHXqvDA0Qwjjnfe3O9HLmBNbV8RWZdLt3+r/0pEQwoigA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021135927099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UIweNWCt4vSxo5GbkkKo0rNxOHgrpDr0rUNYv2Uv0liz1W4hCkUJpgSN9mZPNAhxLrT+kAh2WqF9ZUk5ei2smlhvSL48W5YFBnnO2TiIIda6VrFG6i7FyWlCGR7gztOlqDGewFI0EdQ+xpe/RD4iCmWtFqR0O4NEw66XRqdKBtYRMXcVZSdxJ/nuYmPP2ml0/4JjxLBQv0CHqTc5fWTl89HPuY+I0nieksHUS9e72E9rtankmhF499lVmt1XXYV/xwZaUTukDCh/4IdnxPFAGULFRazQ44vSa/IfWzvvYB108d9woAmO05sFFzkVCSwWAIzdiXYUEqYsL1y73SBX7xFJFd7Oq4n34JFBlQ64j4pBJGUxTBl6Y39/+LrEd2HoGMBUlsIUSf2KFlJ4lHt/j6gDgAFyCM+AwrZhyyQAT4amUPnP0UWqdEVrloirCZqN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:09:32.0587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e1b695-9623-4582-2bde-08df4a348fdc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB422559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_060940_304884_FD9F70AB 
X-CRM114-Status: GOOD (  14.63  )
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

Hi Dario

On 10/28/26 11:57, Dario Binacchi wrote:
> The first 64 MiB of the DDR are used by the secure firmware (TF-M,
> Cortex-M33 firmware, BL31 and OP-TEE) and are protected by the RISAF
> firewall. Without a reserved-memory node Linux allocates pages there,
> and the first access triggers an IAC exception and an OP-TEE panic:
> 
>    E/TC:0   stm32_iac_itr:197 IAC exception ID: 137
>    Faulty address (IADDR0): 0x80000060
>    E/TC:0   Panic at core/drivers/firewall/stm32_iac.c:212 <stm32_iac_itr>
> 
> Reserve the region, as done for the stm32mp257f-ev1 board.
> 
> Fixes: c5ce8d7bcc78 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>   .../boot/dts/st/stm32mp257-engicam-microgea.dtsi     | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> index 5b4287e86def..6cd64587ecdc 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> @@ -19,6 +19,18 @@ memory@80000000 {
>   		device_type = "memory";
>   		reg = <0x0 0x80000000 0x0 0x80000000>;
>   	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		fw@80000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x80000000 0x0 0x4000000>;
> +			no-map;
> +		};
> +	};
>   };
>   
>   &scmi_regu {
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> branch: stm32mp257-engicam-microgea-fw-reserved-memory
> 

Applied on stm32-fixes.

regards
Alex

