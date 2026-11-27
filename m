Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD733606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zFzqtKZj;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=arorA4YF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=euAVffpT37s5B+EfUwQFBrwWGmlInE5p0UfDg2su4Xw=; b=zFzqtKZj+d5+0ZZcewmAtea+Tv
	tpLW2NIJ3kekv0K9svIPt5RC8+RjsYqifQ209YTnIpt2CdF2PfXzPJu2wM3Wvmb6J68tGJFBu2FXm
	QKCiyCHLMJ630145k0c8S47T6lNOCs2YYJJhlExlJDD236iekSR9QKHV8YpbQgwTkFbEURsQWU9wm
	6Wt5wb4iai5JojZdK9sW0FdCiqmzh7/FHqM+ccSyzSuYOIU5edwDf/jhjCURVVQiIWJraGZtzcpDN
	FAD+o4bFYBZFAwTWDBth/y+MFmtWWTcSr/gusfCQr9O82nSpnB2ZOPLWAbOjFVVGK7caOPvGxlbgM
	puAuRkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWts9-0000000Fkm0-3auF;
	Fri, 27 Nov 2026 11:12:09 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWts7-0000000FklC-1tr6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:12:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+tjQCxAPTVEpNKPUyr0AWyfVvmb4QOjqyHYi2fUHQbeZ/ox9WXvY01BekkkFQ/0ADuUUIlY7dedbpd9o97scoZxjW8EKh3L99XcpG2vODkjO7Rr7juhskA2X5QhfCsulxjH0/fE0VN/Tk0FH1etwsA1rZeOIIxesvftbQagEm53UW7R0+0YzaYc+CJtPX31TYUYlXhsi5gzOWVJuGL+cwVsjX2Zlh8G8hi4EeSYBnEdQ+jxgQFFU0sGeUvXwIhvWyZ68A0+zXjGplEUTEP3JiuXkW83QNJOlTrXYOrsrFD3NsdxI4TqmL6USGNI33D2LQBocAtkuop20Um+zG1Kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euAVffpT37s5B+EfUwQFBrwWGmlInE5p0UfDg2su4Xw=;
 b=ToHYRbAB0csW0w0R/6SYVdk39U/nVGkj8GZr/W1c0aVilot606XVGmBsltg392ysoOkZD786e6Xxd4WGVreA/+58MX7sPQInwcPpb2bU+C6FL89JpQ5xC6VzdqbvwGA0tN8g2WzpRYiPx00u0UlHipVqqFRR/kJ2dlitcXp76fIaS+eF/elbGAgj9aCN6+6deHk3pIAFKgDtfbiZ3uSxHHr5CP/6MpzaXJsUgP4iEfEoPE7YAHjdUkMJv5tCLH/sw5MgpasrY4PqpH90wVNkbyKCTNEyrS2hiQHl3dNRKyop5kFE4/qB7fIlYGoL89FZLIIYh7J9ekkhYSLqAk6kdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euAVffpT37s5B+EfUwQFBrwWGmlInE5p0UfDg2su4Xw=;
 b=arorA4YFdMeOR95/NN3pQjd5oCDilptmKjrVKx71FJ8m1PfQYiR+DaYUbCifIuRp7wOjQ7hzk1Vwb0Vgjq6HO/5NLTqPCFo/3gWgmeksYrXRzENGIn36+sbZ4bTFTWvei20dylpnqL5q7T2qXhYvG1vddLkJfzFW4sXmNlkJUHkmi1HQ4iv9Yybi8B5Q+h8SKp3MgQKqsXPzuUPvj4hYsGQD0yWGpD3JsrjZUMvjPaaJ111hWhEfm6Ej86F1cxjj+vI/bXglNh48Jpc96TaGUjwjIlAkaHohy2LK2t5zt8CvNrVZSt2gz5MB7vZoUDxXh1EBqu2IeiI536h4Y7LGfA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GVXPR04MB10850.eurprd04.prod.outlook.com (2603:10a6:150:216::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 11:12:02 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 11:12:01 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: Frank.Li@nxp.com
Cc: qijian.guo@oss.nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco@valla.it,
	f.pflug@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Steven Yang <steven.yang@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2] arm64: dts: imx93-11x11-frdm: fix ethernet PHY reset GPIOs
Date: Fri, 27 Nov 2026 13:15:06 +0200
Message-ID: <20261127111508.2091413-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GVXPR04MB10850:EE_
X-MS-Office365-Filtering-Correlation-Id: 2000a1a9-1c05-4d5d-edcf-08df4c7742f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|19092799006|7416014|10067099003|56012099006|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: LHLe8ho5Kh4O/wU2YZ6n1mdBNHyapxl1WNwv1GPNX9OpWD0SQjVFFPLQ6MQM4nxkwFmMA8j6ydXOUvcQX5phHkW7Tb2UG1IHNPR8dP/x5zFk00pEhlerZezz7p+q9ZPdg5KSdo5uy4wTGQl5Tc4wk0m0rY9/Q7E+SwCJjqR3sLqzOIE5xi0wox0o1CTBkRlPq2qSKxa4KBHVRgeRv0vqUCKmq7aeqvS1NxAoCsn0+a+T27Daplx5sOwAA9oADpF4PTArDDfL2emq8uPdadnw7jVvUf0/PQrGZqG4rBvHrShAH4p1Nq6igVk4PDiTWw/9fLmO/nhrKMnNjLi2J81YmREghs7j2Mrjjdb7LyEiGc+S41xfxYC4/6kHsut4FFoVvzWLG/jcIPsu/g69NVW8vPkl/zG0cQ0h2JBGtRw1ExcYHODESGBdCOObHP611VtpsyGDdMRXmrwLi4cKpDl2LODW2wc7KGD9vTgIqkJER/QgiaaDyGH0EEZ9Js3zvW4TdAZm171HH+vlFjw5ysw21fOaZvx7sgPhGfvXYgsuLqO2zceDgEcWcQOkyihgI8QwP6dOCqbJmPzYW/UiX+iK2voiWcGARp8oSKxlmqVCmQuwrXUiuGxWWQ2hwdbpE1MS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(19092799006)(7416014)(10067099003)(56012099006)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/kDM+6EHe9HXRKI0z44dezpUm/OuTvqC8/PRSn0PNKMA31VjPZYbXDqb0+aY?=
 =?us-ascii?Q?XvnG3shIeB6kqcVn1ksoDbs75OVSJJ0HHfauLFgOIpsxBVifK7YqX0nPjKCg?=
 =?us-ascii?Q?a/F/5GCu0JHiVH4YQmYVZMEZrae8+KnkovRSvTCa+AnUrH1prmEtJCRECFHc?=
 =?us-ascii?Q?4hENDV8Q5MLpMPxquCOXnRj2iKr/sltNN15ZgG7I8la5/ufV4jyFI2YWcz10?=
 =?us-ascii?Q?cCaBdqthdpA8iSanzFnfD5xWLt7n/u5D9XIgax6s5/ap6WxXHLGLQ5UKRMjX?=
 =?us-ascii?Q?4jTAFynMmXNIZpC/8n9Ov0rIiOwk31h4iswTX2W+fA4OnPqNHnewGG4CCcGp?=
 =?us-ascii?Q?68pU7eHrS+/rAAUwFDJmrTC7dn+r1bWW/NaaJvAfDb8zJwuToJFxeUHXHlJH?=
 =?us-ascii?Q?LyNqg4FPVbYzgV0wA5IJP0Xet5dJXtnNFduPvi1l4zXu5xpNN21Zdv1RpSVv?=
 =?us-ascii?Q?uVcbgr4Kqz84SfSFj4ld3SvxMOE2CUQhQO0t8Bg6OqNqiky2WIi2giq55jkn?=
 =?us-ascii?Q?QMTvdt88GoN/X6yvdgK14QVFAmT+qgyuqXS+pw9s90tHIqXGmG/HYfsP8YTG?=
 =?us-ascii?Q?nUobvF4apJT/rDoHw57u9NeHIQG9UVd3p2imPIA+4TE0ej7LYHWvW4HjJuQd?=
 =?us-ascii?Q?EwPMnn7JO8cyPadho7DzFm3k0ngqMsz3slOl7fuCh2otOkhLwsh+MwtHDigu?=
 =?us-ascii?Q?No/TzcGOr2ivn20YzRejab2jT91Kw/2H/Bn7O3yxfK580SPvqZ438fJ8Yo/O?=
 =?us-ascii?Q?L6TTjFgYrM8ekFLAzNf4xfqiwEG/CCod0xXIiiBMihIjtAmYYNG1U/MRUrK2?=
 =?us-ascii?Q?lUv9t5RegAVvdGscH4zQPAvpaqqcECFv9JEYEBq0fOL4f1XnwlkXhtDNg8os?=
 =?us-ascii?Q?E2fvW66tKYfuWCp5A6jNp+0UK/Hgwg3cAZY0+lI7hGz9gV4gWMhQc/jtx0Ro?=
 =?us-ascii?Q?rZ3MMVI5CRhU8XIPqKm0E5Hno8BysC0PKd3JB2GragwD5NWzv6incyX1RVyU?=
 =?us-ascii?Q?zS6y4GWsdTIWt+K1tmwi7fL8zXzWFpaUT5WtKVCC3TRMqhsYUd3YACTMDvnO?=
 =?us-ascii?Q?sqiBpKv8KvgtpqFTBfhzQKCvd9xtSN3CCFTCaXtpefVFXK8c0ZK9RUpIZM0W?=
 =?us-ascii?Q?lm3gqmvl82TOHlxweO195z0U1BuxTYeJoZsQ3QTVCTTr3d15GFhzt2JYE68B?=
 =?us-ascii?Q?BgDrwEuyjplF5fB5vhjOH/zdPF7sCjPMS/kl4BIA6x4tnH00LjIBt53ze6xq?=
 =?us-ascii?Q?2170JhbB0463qRXd2Ziix2pSZc/R/FDDtca3xtc0rJanO3SJnqg+H3PJ5rbO?=
 =?us-ascii?Q?dVUL1rIVFK/B/b4yacdLdwtiVEY0g9sqvXH+JkVPzANozaIQpDRdX9z5RKg+?=
 =?us-ascii?Q?XGBZq8aWvB0rQh0Cv6YEW4D09ba2ds3fIukv5Hf3Fjm6VkFKFqflHfEilLUd?=
 =?us-ascii?Q?do8MRubCX1Jmn6Oe2qVzURFn4qe+mPmOq8t/lnQufkxnE9HYlVmCMYtJOCIU?=
 =?us-ascii?Q?3/5z3FGT0IfvosaErgr84L+5wEn9/RJEqcnlrTReEsmoZDALbDOB1DR9Rwyh?=
 =?us-ascii?Q?idvvjq7QddFi1xv1iaQndS/+MOMKb+vDKMjY3E3aaJBBGnLoQqKSxl1dXeOg?=
 =?us-ascii?Q?tkKu59cvchj4pscl45nxGoUMvFVXO65HUTM15st15CPDVHe5Vqz2CzlMBn+l?=
 =?us-ascii?Q?6uYx+VKK6kuk27EDkQBXOi+cgPZTHXd6534Zypl5p9Y3Od4KAlFVxEuCTay+?=
 =?us-ascii?Q?zJ70GBBEqw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2000a1a9-1c05-4d5d-edcf-08df4c7742f4
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:12:01.8994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0XfxholMKLZP5Lo23a55dWW165zWnWVaToW7vsxfG+70Ugg8CVVEQRe9iLspgm0gEYvrNHYxj7Nz+SzyCDX/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10850
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_031207_495116_1EBAFE7E 
X-CRM114-Status: GOOD (  12.90  )
X-Spam-Score: -1.1 (-)
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

From: Steven Yang <steven.yang@nxp.com>

The reset-gpios of both ethernet PHYs point to the PHY interrupt lines
instead of the PHY reset lines.

On the FRDM-IMX93 board, the PCAL6524 GPIO expander lines are connected
to the PHYs as follows:

  Expander       Net name (rev B2)  Net name (rev B3)  PHY pin
  P0_4 (line 4)  ENET1_nINT         ENET1_nRST         ENET1 RESET_N
  P1_1 (line 9)  ENET2_nINT         ENET2_nRST         ENET2 RESET_N
  P1_7 (line 15) ENET1_nRST         ENET1_nINT         ENET1 INT_N
  P2_0 (line 16) ENET2_nRST         ENET2_nINT         ENET2 INT_N

In rev B2 of the schematic (SPF-94611), the net names on the expander
side do not match the PHY pins they are connected to, because the
board is assembled with the nRST and nINT nets crossed on the PHY side.
Rev B3 corrects the net names; the wiring is unchanged.

The device tree followed the rev B2 net names and uses lines 15 and 16
as reset-gpios. As a result, the PHY reset sequence toggles the INT_N
pins, while the real RESET_N pins stay deasserted by their pull-ups and
the PHYs are never reset by software.

Use lines 4 and 9, which are connected to the PHY RESET_N pins.

Fixes: eb2f28413e23 ("arm64: dts: freescale: add support for NXP i.MX93 FRDM")
Signed-off-by: Steven Yang <steven.yang@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes since v1:
 - updated commit message with info about rev B3 as discussed in v1
   thread https://lore.kernel.org/imx/7652e6ad-a34c-453b-a461-6105d9c86813@oss.nxp.com/T/#m9665c439ccd322469ac0e1e61ad53ebfee230aef

 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index 33ed26aafde88..8c7b08894bc0d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -145,7 +145,7 @@ ethphy1: ethernet-phy@1 {
 			reg = <1>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
-			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&pcal6524 4 GPIO_ACTIVE_LOW>;
 			realtek,clkout-disable;
 		};
 	};
@@ -169,7 +169,7 @@ ethphy2: ethernet-phy@2 {
 			reg = <2>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
-			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&pcal6524 9 GPIO_ACTIVE_LOW>;
 			realtek,clkout-disable;
 		};
 	};
-- 
2.45.2


