Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CC9606A89E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v2BctpYG;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TODACXi3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X2q1Y3w8UBtDqBdcjx3Jc5i9683DelJXUbJUBHDzmyw=; b=v2BctpYGkPYaklXjWbRAuIoyj8
	f2zB5Tu0jH+hEjwFarh9QQPll6PqgYBX1coMSkyNh4POsLo4AIzdLC9Hd8ckkcJJV8tAJJW1nLheK
	ppb4ukFWr/aPRvvwE4bGU5goC3ujf9mj3+SEBTVY6+4U6IAuNIsZcfTb0byU8Nfy5OnsO9Ql20I55
	2juQWnBURhmt+dWvZQfh9dN42Oa5nKd5XY3YmAAIEeFTS3CvOhJcgOUHfKlHt0r0MssAQXnVP8PQa
	vYo+4I5ts29mujTQV7KLbZyKi+6zjGHD7BWulzC8ebsxw5V0712v3uKii3PVN87hI1blfCAejjQ0m
	f6PqIvkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT3OQ-00000003sRU-3BlA;
	Mon, 16 Nov 2026 20:33:34 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT3OO-00000003sQb-1oGf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 20:33:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XscMFZCT5LY7TWRZVQEiIMzhxRZFxzZFyT7zh8IQLz+0GVKHJ37VRgzaw85noGWOfxvMNGaPEe8sdZ/vHhU+uq1IwGmxz08gBmQ1/qtiU9wU9PYRy+ZJyqL0Cl/PMrOpIFiezOlYcB7VYB5jI1CJ3bMRjqwc4UxzSt57dG/ZspDUUH4v8dY/i5woo3c8lZkXY1vpWSBa9/n9ejjrwxA+Rg+KjmcSA5jQV8HmcTm0z6DGMBO5ytqijCijHD9kkvq6+aA0E+2P5nqQnvYFVYIyRtA4Fypz4gXzvwgAQGS974zaMFYDRZIh9LgNJBayJNKabbctY/42tRjxric1oZ1img==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2q1Y3w8UBtDqBdcjx3Jc5i9683DelJXUbJUBHDzmyw=;
 b=s/8oiO2OT81+Tgu7jY39vuOb3ASz1nJHgLbYVR9ju55Wt83Hiir/PrUA+xjfdvnx3ci6F8HJxXep/5vO1uZ0Shnv5/lgMKGCA3C5ODxD2RES6X/0OfDCPO6s/QLoQjLFhqRvkkCkW/l2+06uuyzogpfy+xIFH8g6MyUmGD04KOPFa2F/r8kS4rHDwnkgN0a+cSIqzLSlPO6cJhcUHDPnje+Wc0lNqqoGNiPp7tXGzUyUncoRCLhjwLCZiGKTfg746kP4nW9Cd/3FaxSDj7Lvotcpmplyfw284A7AEAsRicCESSjUtji+ZuI7vw4NtZONz9OyjL4l+XkqjQ/bspMo4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2q1Y3w8UBtDqBdcjx3Jc5i9683DelJXUbJUBHDzmyw=;
 b=TODACXi3ZlhMc/x/YWaGgHplZp/MiAAj/YcDiBPT7UAHUcf3NBHUXAatYBBLquskk+lMCqU8t8hz0Jwnox2dHEbtTjRwO3NGD1ORb1HjPVv01dmizCUG2BVzFHybjVulYkoRpccAtUvo+rWFqq74lLoS8bJCTaqI5OTNmHgUHeiDZFZBvz+hcfMfgreq97cZVI+WsiWURcuJoYMyEbC+aKiWSrUNt90DyV+O1KpwCphjas0aGEoECuqEnGK/mg5cAEkySkP15hGtij3bgHWMfgyrKHyxOgGRXJmVGr543yWFCa9qcbfiV4aoS53UlPm/reR3tkRFz7xRB2DDGU48pA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MIWPR04MB272002.eurprd04.prod.outlook.com (2603:10a6:290:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:33:25 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:33:25 +0000
Date: Mon, 16 Nov 2026 14:33:14 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Harini Katakam <harini.katakam@amd.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v5 2/4] dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net
 compatible
Message-ID: <avtoimDCfJ29h-WN@SMW015318>
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
 <20261106-adma_per_channel_reset_v5-v5-2-f9990669362f@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-adma_per_channel_reset_v5-v5-2-f9990669362f@amd.com>
X-ClientProxiedBy: PH0PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:510:5::32) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MIWPR04MB272002:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b97561c-8005-46ff-184e-08df4420dd99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|19092799006|10067099003|11063799006|4143699003|56012099006|261022075727099003|261021121427099003|261026140227099003|261021123027099003|261026121527099003|261022105027099003|261102123227099003|261028144727099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4/OAkLaIVHY03p7twbT4ZWLcnz5CSHbh0MFGZY1slPlkNqWv0tjBNcyhjp6R1oyl/pSgPAOVDBWPgtTa7dGnz+0JqDu2WLWOu429NlSeVUFl2GKVtPSl1KaXcPEAiu0WAnAbXcOdkDpD2+P+V5G76zyJkpoxNz8wAIyKy+POGAzO2QfhKSdT7uy2PujsKTGHdKsfDygqUckziTxJRS9Jm3dOUxy0x9JVjONf2iSh3dNyGchjB3+GjjoeUdPp1vSMt6GDaIkiiPV/4vPl7hWdT0ag449FLXwXDRbi0C3AghDufqOICQabO1HV/+vAAWuhaqFRwYC0Sh9DB+Mx5b9EoRhFmDFwLSxpfUHQVmCiAqtg3PbrhOtKzyHrmBHMTWKwElB7HTw49WGWPPOZ4qbs3n7/qITiJrPEovaoarGsJLoWA7UtqKfXM7VSLM7cVTHytGjFuTEgWSOzJSGDbBn7JJ/ABiWcne6yMJ+IScqHK4ibUSUts5RUh9Aui30snOzeAlw+QOooCP3TgBwd25dlhBdoCkprLQp7WN2TQcfm+H2wF0JJshktDLilt6BxInSie7qA8o033xE0rvj0gW2yxjbXmqyZcYhnFR30V8vcMjZqPhG69oC56TGkAlhMBmqZtvRjrNXhjwJ/ZWZ2siyZJCNdplZsHClpt69ii4RHvzo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261021121427099003)(261026140227099003)(261021123027099003)(261026121527099003)(261022105027099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KhU1zUnUR601cBfrmfxL3Il6d7Ds+fDxpFPXCHVdluAJr7Fx5mYyL5D5wwGI?=
 =?us-ascii?Q?VVYZDosT3cnGNEcMEW92J/P7qpfRXa3fzeXNUhH64tCNHiV73yDJmI6orjRh?=
 =?us-ascii?Q?y4C+CdZ6rLOlSF757k7TpnEgqH74unOzSE6URSoK4u6sjqyusFcMwsDItFXw?=
 =?us-ascii?Q?M/Y3Yjv14JXAhb3df4wYLJwLTRVpcstX6OgRFedmb2tNI21WxLDqcW0WBeeH?=
 =?us-ascii?Q?E4RY5zQN1FM4awqbxN4ojdKWamvoBMaSv1IGPmsbqwXUw/lPsM1hOe0VzYtM?=
 =?us-ascii?Q?Gbj1ZJjAb+V2e/woASyYegLCc1ER0szqDQGgCJspsTZ5WBkWzhros+udsING?=
 =?us-ascii?Q?tBErsR8U9HVufBaj7HhOU+pCo28Lvm8XU5gejpABbllAMvMsuamjK1jHProd?=
 =?us-ascii?Q?hqlFtcKuu9SHsY8ds+5mHZ/QettBR/iwPCozlnHuKcpF11vOONQkzk5lNZhE?=
 =?us-ascii?Q?47HnJ9xUsKjmnujKGtAvdai+Jq07UsCFstURxgNWURHOa9CKngSx3e8Ckmqd?=
 =?us-ascii?Q?8h7dDUKFnvGJMFI1r5pgXyYmztKbwNOeIpObl2XnrFYNRRmUoFg2tJy6PqC+?=
 =?us-ascii?Q?a3zn8K9boaD4TjvqUAODJJG+htZRrpDHwS+1NLv5AOcxfsLwNu3TFX/E61RI?=
 =?us-ascii?Q?mOiHKIdvBFCbcoa60+xaAyQcTKFa9iLlUPOKm4aDFYlmdcXmT5+RMFD3C+Sh?=
 =?us-ascii?Q?68pPPq0FbhDvqp0PZfBdCejdxjjqVa4grt9D1P5CY36R198gfAyaHds5vI6T?=
 =?us-ascii?Q?zk6UabHLmam276RckQlmYvZtOsOLAs75TlPXhBuUGCF330h6YPWBCQuqnH7Y?=
 =?us-ascii?Q?BMnllmiF33FQWoSRT4wQRKAR1kbTKf8vaEitkb3+42SAUzSG0GRlnQLdeZdd?=
 =?us-ascii?Q?RJ7zJOJ82mBkTVK3RVvhwkrf9RLJIWXzdlfHv1zei4YRlmx6+VFG0ZWyD1Li?=
 =?us-ascii?Q?aE06Y/7idx4mhDoIOyw8HSjwAiBpodVH0zmSqYjf78xVwqhwoA5vdGH9595I?=
 =?us-ascii?Q?Z4Y6Ru0Ajxg7TJpCEDnQ7ICFcgT3JYGP7UI4U4jhnOaNW+Mig+hCf+0nQWry?=
 =?us-ascii?Q?K/EUANYT+nT26gt8c4x4dvI6PCnK/x3Es4koUNfewIuEBDG5VFpU18Ueq5tH?=
 =?us-ascii?Q?h9aGzFhUJigz4K+X9uaWZZXo2R2qKB2dV5C5zmUdt/rBLoOOmlIfRmhKybvy?=
 =?us-ascii?Q?KYUjp7z1L9MGqx2FLGA4tT4K58CjJ+Xd9crNuImIxrAUXeFIaTuTRrWx6e2E?=
 =?us-ascii?Q?sTPawjJ9GxzwULO+/1pXdSPkAdXRBKqZOTY2ec0EeUIqEtTmQMEd5FCgn80C?=
 =?us-ascii?Q?h+UIH+lP7ZuoYZCS2MaiI2sITVb/1vu1BgY5HDnGmsSbzcgxHzT2lrcLzB7h?=
 =?us-ascii?Q?qs7Uuo5rhfA70PWc3vZNnV0Fq1jDx0U4Cp4tP5I/MvEbtnvFQr9rwL0YQa+k?=
 =?us-ascii?Q?gaUVVGQBJ9oFUmfm6ya1EF9dnaYVOW+KwNPW9Cb3q6yhDQOEGbCqCV8sm91F?=
 =?us-ascii?Q?HFiFUGQODIKK434HsDZ0+ixl/ThU9rJTjGxuP7p8RY93oPb5QCEycmqutNSD?=
 =?us-ascii?Q?PHUBBP2bzJfiRkXyb4cg6sIiYNiYbSu9MA/6IbjNwMhIb6W5UhttrKFYbYp8?=
 =?us-ascii?Q?8FTR0NkunmHdczW9ajKi9uBVMDyUL1Ksa3TLmQIA6WEaKeEn80mDfi8fAxYy?=
 =?us-ascii?Q?BhZqRpeXQ/tCduzz3hw+rBjyJHscnQM3BEKEVPpYJsu/gV08pQMSJafPDvSG?=
 =?us-ascii?Q?TtbskcX3ZIvT35qoNZ4oEodk9nG8JHTg81NCV1VKxOkBSxd8lg4y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b97561c-8005-46ff-184e-08df4420dd99
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:33:25.9374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6/Q1bYkt4ek4+QQBn/7k/b1z+DIomd08+CqLjeABlKdBpGMgET0k0Lzy0V0dXkwUM5zTL8VxQSw7NR7N1JlWnl8lmMSoFrry8M3xAYfzZATQlZdwWY1E6/BYe3O/2WH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB272002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_123332_482051_314423C4 
X-CRM114-Status: GOOD (  15.60  )
X-Spam-Score: 0.0 (/)
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

On Fri, Nov 06, 2026 at 03:40:24PM +0530, Golla Nagendra wrote:
> Add support for the amd,versal-net-dma-1.0 compatible with
> xlnx,zynqmp-dma-1.0 as its fallback compatible.
>
> Include the Versal Net compatible in the reset requirements,
> making the per-channel resets property mandatory for Versal Net
> devices.
>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml           | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
> index 59dec441307e..7efbcf282a14 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
> @@ -21,9 +21,13 @@ properties:
>      const: 1
>
>    compatible:
> -    enum:
> -      - amd,versal2-dma-1.0
> -      - xlnx,zynqmp-dma-1.0
> +    oneOf:
> +      - enum:
> +          - amd,versal2-dma-1.0
> +          - xlnx,zynqmp-dma-1.0
> +      - items:
> +          - const: amd,versal-net-dma-1.0
> +          - const: xlnx,zynqmp-dma-1.0
>
>    reg:
>      description: memory map for gdma/adma module access
> @@ -78,6 +82,7 @@ allOf:
>            contains:
>              enum:
>                - amd,versal2-dma-1.0
> +              - amd,versal-net-dma-1.0
>      then:
>        required:
>          - resets
> @@ -91,7 +96,7 @@ examples:
>    - |
>
>      fpd_dma_chan1: dma-controller@fd500000 {
> -      compatible = "xlnx,zynqmp-dma-1.0";
> +      compatible = "amd,versal-net-dma-1.0", "xlnx,zynqmp-dma-1.0";
>        reg = <0xfd500000 0x1000>;
>        interrupt-parent = <&gic>;
>        interrupts = <0 117 0x4>;
> @@ -99,5 +104,6 @@ examples:
>        clock-names = "clk_main", "clk_apb";
>        clocks = <&zynqmp_clk 19>, <&zynqmp_clk 31>;
>        xlnx,bus-width = <128>;
> +      resets = <&reset 0>;
>        dma-coherent;
>      };
>
> --
> 2.43.7
>

