Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E75C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jav6FrWx;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=oNX67Pph
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Nge4pP8XpGkAxcecF9enJhD1Hbto45A+Ya0d1Rf+P2k=; b=jav6FrWxJhbXh3
	9iQ6KLX17s6TWwdXNiLqRkbAN5lUyjPm999E78kgOifLbBNiI6F9cEaHq9eaM321KjasnCAJ7g087
	hr/cNeCnoiXOBRM6LyCmoWUmnCXLazhepYRbj5mjK1tLYIvd6V0ijcWLUHi+4mUJYJxdydZ3UCxV1
	0rnnrSwD/XhFnOeyPQJvYsqeeyupSK7GbZhhWIAPowgKquqwjnmM79EcpBrKq73ohVztnTrsKJ3P3
	HTQLZ4mmj+JwAZkaTnYwMaZEicBg7OOS1xgQicRGDkTiAJUcFK5igPUJIZ3kR/n7x1v+/9npxmj7T
	LBFIV6QnxkQwBHlbx1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMVZ-00000006UFk-1gpG;
	Tue, 17 Nov 2026 16:58:13 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMVW-00000006UEc-3lec
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:58:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcDZ/gvDvss371oO5TqZm8eFxdMqcK8k2sFvi7srz8BwGt0Jj9avm/BURldRfG7WDXwoke0KseL+jczlnawwannEOMEcmXyIaMiK7hrumTezx5ODaZKSVa2U64h67E+iPSu9IPCeToLHefEgWLDzP35CNl8cSFdt4O5VFLHorLkgsTD3Y6zHOV0qvFVTTMnW/tz/As+IOIXMjaiXX9/GFuWfLHgtPi+YFcDeh636TY/7vF3IRd0cu6Mn/6YAmhCpR6eZLTc0o3A7aeiEAhDBk8QZSHE8sg/6AmyRL54R44U2i6LbpyFvIsfch/454yCFOm0rVz4XvJ065tXURIWkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nge4pP8XpGkAxcecF9enJhD1Hbto45A+Ya0d1Rf+P2k=;
 b=zIMJK9lHg0m/F5z7ddfbcA9JV9hrCDqV1vZmoPqirgFkwUfGTUFJ8K5x/NZWQA3yjg91FJOcAqyPbAcnZ/dYmtjZp43YyBdKDP06Qy2omx01AoL6GXUrlOUxofCki5BS0GD3Nj1ow16rFwVgbteyjrDJR/OSvxUEVFp0g0rEyg15eBr4aS3sQdAMqvDM93h1BAnc/y7GyyDCSlznvP9lY5EA54Lgcgy3wOLFXS8hHzIvnlxTlPhgPPObD0wc+Z8JkqBD/JCv26+cNOxyp5+sWECxLY1r0uRfT8xJgoRiM5u5Db30IIMTxQf/P/Z7mYmnbNPobN/9nGMp5w9TPLgoWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nge4pP8XpGkAxcecF9enJhD1Hbto45A+Ya0d1Rf+P2k=;
 b=oNX67PphF/zwm5B3w02/K/cdOtC9C0zGeXS3pYVC8LYTgvx/E56idSShl7sY7CdaU06FpC/GzQ2sQ5917WA0m/aPTrS3mvAKREFojhPt4Xfd+a+BzqJGpJ7/qMqq/wx9yCX66F0vdw0AyTeZa6KfaKhPLx6Db+ROkWc2Ac5razzvZVefjYbAQLJrrXSXaMlRthNwWtqw9KEz5oeBrWqmrnrJd3i6TINxMVElFOIksvNvZfJdf+O9Zj0DGAcGPQXEYeri6ytzs3iIN1kwcDP8VaERav8Ci5VEd4SWOfSGRZc/ycLHZKKAQv8RGuvnbjm+mjsxbVjDNPR1uGe3Yb68Sg==
Received: from AS4P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::12)
 by PA2PR10MB8818.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:426::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 16:58:04 +0000
Received: from AMS1EPF0000009E.eurprd02.prod.outlook.com
 (2603:10a6:20b:5de:cafe::30) by AS4P190CA0012.outlook.office365.com
 (2603:10a6:20b:5de::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 16:58:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000009E.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 16:58:04 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 17 Nov
 2026 17:58:48 +0100
Received: from [10.48.86.101] (10.48.86.101) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 17 Nov
 2026 17:58:02 +0100
Message-ID: <c936336b-04b1-4860-9eba-4d1ab002adff@foss.st.com>
Date: Tue, 17 Nov 2026 17:58:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH 1/2] arm64: dts: st: enable eMMC on
 stm32mp257f-ev1
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, <michael@amarulasolutions.com>,
	<linux-amarula@amarulasolutions.com>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Christophe KERELLO <christophe.kerello@foss.st.com>
In-Reply-To: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000009E:EE_|PA2PR10MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 729e8629-4f29-4ebc-f710-08df44cbf223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|261009223027099003|18002099003|22082099003|261026140227099003|261026121527099003|261021135927099003|261021121427099003|261102123227099003|261028144727099003|261022105027099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: daqYJR/0IGYhGcOBHzSqJDD+XXf2r8mQ2f6L4/7pUCt41tn7JXYua5/2YCC4VUSXRTVFFMWFBlbEw1t8ypG5z4ZrmwrmJjIaI/O70+WQliUswB0zrCjEm3u2lBRSimTHVnVn5aHiJAWPcT40TKZ8kWGghfy1PqgybWFN5dJhP+a0tailwl8ZLHCJgJjDIVU/Rq6CF2vtJvCC3WWOiRMD7zDgrrEK0A2SPMes7mVtK6G0xk2y0NH3xbIcdx9eRYQmUWk8De+hcLCVBXLUwIqQLUW4Tme91E17JRLSc/T2kRnFtxhZArhSZMbF859fCn+CiOZboUYIR2pI8/0yU/U0SzEHghBoRrz4pl+4X/a2zrnh4dnqlU5MhoARsT+kDGOweNCx7I6dmeGmZHdJVvWikWMrJ2TiFFDTazwURjMmqBpLtkeb0SAFUE9vbCnRO0BUIqe2YZSXMCk7Epmx2U30cjZiy56nMtp6DtpEESrETUfmSfHXSQnlgvFFZHLoUlsQ7yizbEL+fHq088VAPPrsfpdZ29sA6KTGynt3WuaiouTaKB+cBZsCEw0tJN/CzJhqNYY3TumEOpUqSQnnSxA84B8ddJFPwdFXhAK///U/eDIpjhCqqPg3U6xnfAsDAjTyow4W+dZ7yoVAuiOumwVCimMgvr8DFlaUCqyVNY4wijDXDgxFEAioLm5UajmHsOdax3YGP3pi1+N03g0tYAvDGw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(261009223027099003)(18002099003)(22082099003)(261026140227099003)(261026121527099003)(261021135927099003)(261021121427099003)(261102123227099003)(261028144727099003)(261022105027099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Bnt57D8/L03KsHl3YyYDUBsMZXHuQsQelpuCXcyexKRxzM9d0UZkBgereMard6FwRVh3cB6E0KBg4Xik2rMN2T53TcrBJD+1cm3SpIyMi31Y4L5k4EPcaH7LGV9rNquiSZ+gR8GfaXoNtyyDTqA4J6A7xHgXgfW2lKHrh+lNnUUVfqJFL6YdMoH2J6GFSw3tRJiXNwMnzRo1ZMcDyxeYtaI6aqiGjeBqFqFDdjcDYQM58W6y44n+bXRUKzvN98QIPNAFUFYS3qJ9iqRIJeJOSfw3NdCU5RSA3SPghB6nMm1M8mRNoT1PXC0S9wBWI4B9IYYiwj/X4wiAMKlTXu7sZCsT4Aqj8/zRQlpnBO1rEWiaiRQGHdRNKk+4O5JCtf6v7Wnu/oFxSvUFfJXmqGjJg+RvxNrrf2N+GcJli7lxCZICSoP8v2HnjSlgWY+DW82W
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 16:58:04.0608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 729e8629-4f29-4ebc-f710-08df44cbf223
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000009E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8818
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_085811_286241_65C2CADE 
X-CRM114-Status: GOOD (  12.88  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Dario,

On 11/15/26 17:34, Dario Binacchi wrote:
> Enable the eMMC connected to SDMMC2 with an 8-bit bus on the
> STM32MP257F-EV1. VDDIO2 is tied to the 1.8 V rail on this board, so
> the DDR52 and HS200 modes are enabled. Tested in HS200 mode at 100 MHz.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> index 782b4bb843ee..9c38c4fe0c1f 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> @@ -431,6 +431,23 @@ &sdmmc1 {
>   	status = "okay";
>   };
>   
> +&sdmmc2 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
> +	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +	st,neg-edge;
> +	bus-width = <8>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	vmmc-supply = <&scmi_vdd_emmc>;
> +	vqmmc-supply = <&scmi_vddio2>;
> +	status = "okay";
> +};

This source code appears to come from ST's downstream Linux tree. When 
upstreaming from that tree,
please preserve ST author and Signed-off-by tags.
https://github.com/STMicroelectronics/linux/commit/d00ddc95c630ebf948ebe9c22fcbca145d771afc

Regards,
Christophe Kerello.

> +
>   &spi3 {
>   	pinctrl-names = "default", "sleep";
>   	pinctrl-0 = <&spi3_pins_a>;
> ---
> base-commit: 23c62304dde29abe92013d85910d03a77dada35d
> branch: stm32mp257f-ev1-emmc-aliases
>


