Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AB4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 02:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NbS+rAec;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iregM1w4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VH925w7kfPGgKZNc3IozKt6lC0v4s7yTNNHwbQ8PpuI=; b=NbS+rAecj9y1JaJfUGkkJH2YZh
	ex0LOuv0KsYm8tiWqPFsFvcywY0mNgSAJm2LRZ2AJr0GbQx8T0fqfAaW65jN3jd6AxcSmffdXU/3t
	nd9wioK0Y8LM0bRRB9DuDPn357XJiel5YyXauMK5GTZsSZWcJ6YzOkz93fecYDRlHzr+VGkf9dU++
	hg/k89z+wEXT1FcR2VKjB5Zc45+n+VnXrLZfLasFQfLbLyebYfe8i8PhJE3Q9S7DQh1lFIQ27tt9M
	JjECE0tFCA9ALl90djC1haVFtHmggMF4fjJr0smS1QZtZNP9+1ebwK5tRFUe6O/YrlKRvd3aTi1Et
	CMqJkIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJVW-000000027V3-3w44;
	Mon, 23 Nov 2026 02:10:14 +0000
Received: from mail-northeuropeazon11011063.outbound.protection.outlook.com ([52.101.65.63] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJVT-000000027UY-3WjL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 02:10:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ME4dp/Jejg4dkWNb9hlWW9IaqnraYaGak2Z/HHjI6IKulg0JOCpl9fnDwsgHADYRXndzLIY9BPhDjcA4xA2eS5GRZuAxmACQEay//TWAvN8IY+tYms9fXMZ3KU0qoHRIkScnhYAqp4axMdEx8UtYvR+6p0C21xKPvwgCE3Sp9WZxNR8LtBb/6bLfDCH3D6+KOzS7ERVdIk/Q7mZiGzp9+GBONGjD84DQ+reM4GVVfM0FD1EbUpYWe4yEAxIQF0Z0ywfBQgYAzLb/bayty86a7Z/Bx5R8a+qhP+A4YHq72V42rDYgX6lEmpz/tKrO4TQlPMey8OHS8YQ5ZfmHmteeaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VH925w7kfPGgKZNc3IozKt6lC0v4s7yTNNHwbQ8PpuI=;
 b=TdgkwOb4/NzHhF1C8mgQn4NhWvkCFwaQQoKqGc1KDp2A+pRFZ5aGORXy1NoRZf3/LU2sKAaNtpDwvA8qe01h9TPz1k8CC9g3OV6WrcCnYczTzg1Pom/7lSJdRLGS7p9O8ds3ZNxapHWmWsuj1ItGOMio8jWfSVznaW0H8zbvR8ba2qts4Nvq5FfgPGN/lawIWcyx9MQh1ypT47y2AhhR24tdRtENHwdDTNt9nlKs6E031N66qs7dx92uS7wdZ+XUItdUSeqdZ/1jU88kgfptaYyGV6RenWNRooXLuzs3j6mPffYSzVjmjw4F4HenWBHU6MKWADXbdwjILh9posMG0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VH925w7kfPGgKZNc3IozKt6lC0v4s7yTNNHwbQ8PpuI=;
 b=iregM1w4bCW8n2seu8q4RRbsf1QXQNMNDkSj7mTmDJ/AaW77N2RIOc+8nW5HHK9nH67q9hyNV3qHJPTMCoSELMHeyBn04LlBMGvQvhbpMPvxaw2VhUBcjBsmSo61GxVGg8otFEVTAja9saqLUdld9iUCfwSDCIWWVWhyRDVsJy8dUQG3x5eQ+5x/gBvaDycOU6f3kjpuikypifjNj9IO5o2QW3ZID96y+axKbSPzUMB1mk0aFduFbI3PNTtNJco02fTvKY60MhzoYpJ0t+hRpzvf6mqJvnoy/p8XwQca5yXo7VemqnckHkCLKGxlMvfTh1DZalnSplUuNzYrxFrUGA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by DB8PR04MB6828.eurprd04.prod.outlook.com
 (2603:10a6:10:113::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 02:10:06 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 02:10:06 +0000
Date: Mon, 23 Nov 2026 10:15:08 +0800
From: Bough Chen <haibo.chen@oss.nxp.com>
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] arm64: dts: imx952-frdm: model CAN/GPIO selector
 as gpio-mux
Message-ID: <20261123021508.c2s6kxcev2b557no@shlinux89>
References: <20261120-b4-imx937-frdm-v2-0-5e27ceec02df@oss.nxp.com>
 <20261120-b4-imx937-frdm-v2-2-5e27ceec02df@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-b4-imx937-frdm-v2-2-5e27ceec02df@oss.nxp.com>
X-ClientProxiedBy: JH0PR01CA0133.apcprd01.prod.exchangelabs.com
 (2603:1096:990:54::14) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|DB8PR04MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 241ea47d-843c-4341-e5f4-08df4906e42c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|22082099003|18002099003|3023799007|11063799006|56012099006|4143699003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: AxExdeUGkHvX6eQCiZptr11fKO0YqH5BsmtO+BIPRkKbEV9Me9lDA2dnihSf8bMjrVBTPi7pgXWFaow3FStWMT1vBP2Yo9jJRv7phBRXxG0mgfjIVkm6RI1SlqNp4JgLxPglOtrazYBIfRYKz2m1xPCSNvYoq/0lVGXxSrb79a3gy0YsxZ1xZ+VTKKflqrEGxsXI5VSkbIuLF4d1eUSpZxMoOF/CPlGMSt6s6en3p0hsgR15gfaI7MOx7b3x1QxfXCGdqU8ZkkmzECiAfDRaMGVRF0/5D4tqyX7YihoUmbVVuUCipg1hJuSgvqrO8b+tVCZ0bCiYItm8AzG4gemjtoErrQmntj5T9FTEbsugIB/pmZR6IGXLPO1cALf6Is+E2rFlnipCb8fkt/1/MfzLP13nLjBWfaXGnWK2NxQVJHiZb6aSfSMNcyCkmRpPSZTZq+dF2m1WHWIXNooqmpgbPIG+wGUL2GSwjyvJwJct0N4AOD1vkpZqr8GoA954y38AuTifK42h0GpZbwxsexPyw2KMQZfm1hiSccVgXMdlcufDendktpSFeoSDgwguzC1h50WTx1XGecoguFFUELBWBjAvqIVau7wVxIXvn92R04NfaHcYeWQileKhZWMpYdhufDxmzaN/HqHA8uNhENZPOcNfYki3Hqs4CeApWVUPKVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(4143699003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0YDBxJdYtlcNrOK9QMsrPf48D4dU1aoSQg4A+ZhkotiKnhF8qxQhhvXnUung?=
 =?us-ascii?Q?+YGKtQY1uJqC+pvV3gveF6DgLihjfK2Fqu4vAOFwMj62vdabTo/5/spGggdX?=
 =?us-ascii?Q?g2Vgtmi86pekRLJT8yc5DJ2iRHX4floBdS1WLR+C6RKGKD+isYMJwRCtQ1Ql?=
 =?us-ascii?Q?2TZgzC32yE5Rd/Mr4lAsMqSWUvOiDOTth/CLIoZsuOrasG8DekdAnmZB0FtG?=
 =?us-ascii?Q?gUTr3/Lo0XPB3jZ8zov/9TJGqLUl5z0w4QylzskPqJuDQcSzQY4P3/eYQVIj?=
 =?us-ascii?Q?YK6dCTHs6tdQsuAalTZWpqJH2fPNw4SiYRR5kgh2mW8bnMKfH/iqrcSbykN3?=
 =?us-ascii?Q?aW93si/vbFLbo1eh6s07lipbiAeJhoECmoPYzs1XD9faTMJN1+prUqtdy5MY?=
 =?us-ascii?Q?L77bi8vLmunLBhbVeY42u1/eqgG4lbWwY/FXBYV/Rfm9tHMkv0C3A5sIhmig?=
 =?us-ascii?Q?FQelU3FM5nr7fbZs/xvMvHXVvCwMgFekeWLD8fC8mWOyAHZ2XutCAzCqfxMp?=
 =?us-ascii?Q?Jl2NXLGWWL0UPc6cbX3IbbotdD6HrFrHftgey5p7icThUsb4X73UDL7lLPk8?=
 =?us-ascii?Q?df18sMfveVJje50NZcuBt5ap3BbYqbhB3iGZ9qbErFNhGdcPad8rezdWsHZp?=
 =?us-ascii?Q?ozRNgJa9BiG2SAu1Fy4jca1jTeyy389YGbYWqGPJk2kyyM6K5emDOyOxlTPZ?=
 =?us-ascii?Q?LUYTiNCvPInHQWZnxdO+iJ2YDP0DpmzQvZeZZP+oXa1/ksoxSAnWXOzCFSpP?=
 =?us-ascii?Q?GB2o/xLVMI8Vqc3mbreQVwQFupJXnIIVeJuWmcMM1TSsR9v6kgPUSYNmCllg?=
 =?us-ascii?Q?kpxT+RJU5RehwZrD6AhfaUmJtzZ2UNA3OkkEjneWDcpzQpPKBNAUGq/GRewu?=
 =?us-ascii?Q?W01QCLMwYGCP4eKV+q2z8bqvlmz32Qh6bbnCjbXaD9zgoNrYVVX1OLLp5iQ9?=
 =?us-ascii?Q?Scb0Mm1QmAnqOK7hUNBVeQrdrIQPy1E2M2yF8DKCYroidzGS1gvAn6A2Hu0m?=
 =?us-ascii?Q?vZOJGycQlu9l/65SomKV06w1RhDw2iN3rnKSnZHCz87qGvYdNkKF+jS5hBmP?=
 =?us-ascii?Q?0JTdwas4h+NGUuN6xKHGTIHeS5k/kzt20yHZdANFIc/nvYHNqDhzmcnUF16f?=
 =?us-ascii?Q?U0LkTfgbw/Jph1hoo2F0I6TN25fj9cm+4T7iWjm0AbZWgEViLyr1p/ScmXcF?=
 =?us-ascii?Q?e+dieEaCGO82gk77F/5yRMDkcesdpdQTAcUvNY4g44dDss2hR9ktRjjJoG1l?=
 =?us-ascii?Q?QsTSsfAxw1CBUvyoNRAqIuzx58Fe8nBXIPiTgxF3WWHsuYzX6xTHcElMnNVm?=
 =?us-ascii?Q?WtDeDosswLY38kMmEwDmnXal7cXDXbzQYK/7e0dI7ilmWdrVwVHaWM5QOmui?=
 =?us-ascii?Q?OKVpWGLe0EVHYpawctmb2ShqaV9VN6GRsSOwkl9GNBMjKbTGWMGIpXwcgSFP?=
 =?us-ascii?Q?CBFaU5STKv9niOqM7/fT8Jx6uNOP/xSfyxBrGKvSD4WD9YfD5VDFevf6IMyR?=
 =?us-ascii?Q?i9Hwn97TENUh5yNISc3S0bgCzXd8/a1fpmR0UYjRiKd5gYQsU4KUTMA4Nq6U?=
 =?us-ascii?Q?lfB6CzTWd+4JZWxeynIMBgNUQS5rLaNsjxLXCDIuv90uldhJ08/IrwfAI/U3?=
 =?us-ascii?Q?h8lZSy636ieZqs6qu8r6Q4jNJcNmelVEdwggFoLsMfIfWqxKW0+pzNq4w0Wh?=
 =?us-ascii?Q?pMETVNJjOlsidI5V2ggpgXV0H5g7POWwJRiCi5DhSUhBQ3s7N6fN+WVkhC0x?=
 =?us-ascii?Q?6rp1pDkj73YMsXGhjHPEkZxzZu50W4VG6bE3vQ98KEYD6HLwe2f3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 241ea47d-843c-4341-e5f4-08df4906e42c
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 02:10:06.1120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wr2BMTeixXRiQ8CGGrso1Mi5OaK8onBOJPc9fCQcVbV8Lmlx/o8LPflzD3aKi32bBaCUPJjNU8GVtVVS/2OCVxCq8Lsizqt+pHbd9ziXxjlv2seSkDIwTNLECVLUbNAJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6828
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_181011_895952_F38CE015 
X-CRM114-Status: GOOD (  18.83  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 07:09:49PM +0800, Joy Zou wrote:
> Replace the gpio-hog used for CAN/GPIO selection with a gpio-mux
> controller and pinctrl-multiplexer states.
> 
> The board provides a GPIO-controlled mux between CAN and GPIO.
> Describe it explicitly instead of relying on a fixed GPIO state.
> 
> Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>

Reviewed-by: Haibo Chen <haibo.chen@nxp.com>

Regards
Haibo Chen
> ---
> Changes in v2:
> 1. add a new patch to replace gpio-hog with gpio-mux in preparation for
>    i.MX937 code reuse.
> ---
>  arch/arm64/boot/dts/freescale/imx952-frdm.dtsi | 28 ++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> index 4d325e848aa8..88e77d6e9c45 100644
> --- a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> @@ -39,6 +39,25 @@ bt_sco_codec: audio-codec-bt-sco {
>  		#sound-dai-cells = <1>;
>  	};
>  
> +	can_mux: mux-controller-0 {
> +		compatible = "gpio-mux";
> +		#mux-control-cells = <0>;
> +		#mux-state-cells = <1>;
> +		mux-gpios = <&pcal6416 4 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	can_mux_pinctrl: pinctrl-gpiomux {
> +		compatible = "pinctrl-multiplexer";
> +
> +		can2_fun: can-grp {
> +			mux-states = <&can_mux 0>;
> +		};
> +
> +		gpio_fun: gpio-grp {
> +			mux-states = <&can_mux 1>;
> +		};
> +	};
> +
>  	chosen {
>  		stdout-path = &lpuart1;
>  	};
> @@ -274,7 +293,7 @@ &asrc2 {
>  
>  &flexcan2 {
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_flexcan2>;
> +	pinctrl-0 = <&pinctrl_flexcan2>, <&can2_fun>;
>  	phys = <&flexcan2_phy>;
>  	status = "okay";
>  };
> @@ -304,13 +323,6 @@ pcal6416: gpio@20 {
>  		pinctrl-0 = <&pinctrl_pcal6416>;
>  		pinctrl-names = "default";
>  		vcc-supply = <&reg_3p3v>;
> -
> -		/* When low, select CAN; When high, select gpio. */
> -		can-gpio-sel-hog {
> -			gpios = <4 GPIO_ACTIVE_HIGH>;
> -			gpio-hog;
> -			output-low;
> -		};
>  	};
>  };
>  
> 
> -- 
> 2.34.1
> 

