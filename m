Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4844F606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1MEoKKtR;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FVEU9eD8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sWfvSFMZfmrsf8evjK0P0acWAYWulyHyzSpvwoyBY3g=; b=1MEoKKtRnLoz1xwH99lS2KpCvL
	nfGVo5VRN9jx995HcqAiQ68h1Y//17kl/OXn2MXd8O2tMaeY7qi+c5QDTM/WSzr/DBdtVdaaLKx1C
	4/gRDHpRmsas8f4lLmEE2Q/rh+AcVVcXBz+jGlexDM5pvxs5CFSbufgpAoRGIr/9HiFhuHxPc4Y4u
	bow8l/xdND30CRQIInvg0fT+rCKVKKVoSlwli7iOomOge71BcpGiVUGbqwMjmMJOohmOPW468iV/U
	Is677Usr8CCnYpnqorDrpCS+JG8AX951z4xE4kWxEH3ddkjgPbWOVW9/9NUecXIy0UXUyvmiim7Go
	iMw4LY6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKUI-0000000EPl3-3ijl;
	Fri, 20 Nov 2026 09:00:54 +0000
Received: from mail-francesouthazon11011058.outbound.protection.outlook.com ([40.107.130.58] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKUF-0000000EPjx-2k1r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:00:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVFObLirUU+xFg7h8L+zGCiNjfL91BrFTq3z5ctYmDfAUBLdQ4xFaYp1Rz67kCmnbTTf2UIUNtoh7TMouLg73It4cvHQIwilzFidUz5zSXSs+BTY8UbiVkFo+K5VNU/cWfMXS9p/a9iNycKhlR+ahi+YbAwnPEtzNpGKlFmhtzL+IhTbNr/OIX5ripiIx5DQrN1yHj4XBXxkfJzsXpeicL9pU8XK4kVVXOCAdS5IZwiwXKghhK2C6o6uJz5iymDHlofMZNLEXAqlpU3YLPPTHSBcdgIXzAA+fQ3RlJnizn1m0w6YO1BtlF91QOsgpNmzH3CFJDlp5B8FEHFCTZTcPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWfvSFMZfmrsf8evjK0P0acWAYWulyHyzSpvwoyBY3g=;
 b=tlqMkIXWBlIM7yR5BRzu29zal3BdUw6DVJO60IyL5yUMWIKk+SnvoyDeccEvzHD485dNw60mSqM4FCTdGypumC6xBY29kbP9O6LhqwuqxDzHvBy0lPwwis6KvTM8QlGtXhNmcp9re8SVkp8LtLm0xKx8W1ELyI5LvwWlSQCn2XmqEGYsomRdP91Q35NxrNXWaF7xsDyINEAG2Lm1u/aqEulFfjnGjmHzDcu2MwC4k/bG5gfKCG50RFcQt9qO2D2SCd0igN7LpHykY45yFqTkXmf97diwK/XjtARjIOBzmhQ3KtX9RFDIDOHi+6MsdUzwwqzbRyCF4uFiJ2/T0aBFYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWfvSFMZfmrsf8evjK0P0acWAYWulyHyzSpvwoyBY3g=;
 b=FVEU9eD8Dk4L+z1Y0m6MJnfmfhVDiFtYzUOb33t43sO41oOFcCiUKC8xyx2zWO1RyzNEbgstoTYrYYTphqJcm/st6ta79QprNX5f1kW+cxSIOuaT1KqNwTvOKYLczebpz/BVXgC7z21sA5gY7o7mGZupgrrehOEZkCNzwfvLcMZxJGR9zfPn9MvOKwn/9QbNV5HIWCtQxGfJ0J8b3D5M1LniLHTQMhZJFO7qnqoBOe81foBO8zc64QxMl8lV/HWALTpP/WiQY6ukD1eMqVRT0W4ZDVwxHlgR4396mSks8Fzqm7rY32oZQKaJueZLUG//bAMhFu7F12dY0QP4T/4iyA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AM9PR04MB8083.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 09:00:47 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 09:00:47 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	chancel.liu@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	shengjiu.wang@gmail.com
Subject: [PATCH 0/2] arm64: dts: imx8mn: Fix and improve SPDIF1 support
Date: Fri, 20 Nov 2026 17:03:22 +0800
Message-Id: <20261120090324.1220501-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:295::6) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AM9PR04MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e350bc-c912-42ac-c086-08df46e4c431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|23010399003|18002099003|261009223027099003|921020|261021123027099003|261021121427099003|56012099006|10067099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info: XmmGpIb+ISlk/A7t6/5wchn3xszC8Fb4CYWPGf2I+mWKUSL4BM1PWXbWvuwAZQ3dj2RE3Oit5J0BziRICGY+7ETHqL+pDbcYpQULNK1K30dEV65h39LynEsH4GVDBGZPRg9YyNICQ9qS8PSmcmND35wzabrSBCuCsYjgfbAxR6imjnArcGtoWeLMJOpdAp943Sd9L56AiWdzmFsHPBHrUkwU48+Fi2stiYCdWnHpTR+LfHkjuUkXSA50khBroEoNnbd7I6utTsOx7PL9fUTlJEJrhOnEgLuaMcXBA4rkb619zFb1tbvdthzbaebxYiCFXnvIXgY2kCj7tg8Vj8Z+u2gTDp2AJN80aUsdVRnZOE/ZSDEp2tvBuy4QFf3KQneLFnA/gIMJIr+1li3Pd2dDvei0vR1doaL2XYIBmcsgvLhC/N8W+UpADm0mT71ab2FbGol/ZFKbfy1gJr0l8EgecEZkSNPZz2iN8VHEvii6SQ4PtEj3ClJze/c1BhFuD9/F7Mfp77Rx6Y+32LdWC7cgWtX1a32SGs+/MqJMRZpVYcZXHm52azivCIjShRqlyxpbJbJQWRZEEhrxxZ+a5Zngc4XZSrbye0FE6wgCRn1fhZDiEt5f4t8UbG4xeekXNhmBoQ0xQLEs2qP13xyeLt+QG6lyy1n+RdDQaqLpDhE0ihB3/AGVAwZe7AD96qXBKcXbm4rk9hpIdZvA6YxsnvJueQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(23010399003)(18002099003)(261009223027099003)(921020)(261021123027099003)(261021121427099003)(56012099006)(10067099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tFtWn+z1gZ/WGqSuwq7A4xCl6W2bP1KkClsdkK6gMccmh+GkKcup8SR1OVwg?=
 =?us-ascii?Q?rK/wqGgDahdL8B0O4+kx4fQvH5lErrDTqcsqEKTzEvjgK4FiHoQJfLpzXqeA?=
 =?us-ascii?Q?n1hzhpRUUXouL7XVZ88roxYrBEVk7PVPcrD3mCs8o265bqktI4KUbSakfdu8?=
 =?us-ascii?Q?ZN45729irbpkW+bFa2tw3scvM4GDXO+QCjb+FfHMgFQ7a8wCkkUL+nRpJEU7?=
 =?us-ascii?Q?QIhI8UIOY2eUte4F4V/GOBxDHqcUUsHJxj9+qAgiPorZcjVO8nyuDvWAsotY?=
 =?us-ascii?Q?CMF6zX1lzw7TmcVHWtxNuNsm/d8VlNyjjAbeHvBKNy+Q17WH07dXB5HMay3U?=
 =?us-ascii?Q?9uTxw0biFdRdhtQlP5swYW3hq1GHYILEcNaEnvxtGBAl68WxEEYsXUFF/Qle?=
 =?us-ascii?Q?yi1vt2IyScH7g6dm9h2X0OL8xLtvgZF59PdljFfVJF97u6Ynf3q4xNVnvj4U?=
 =?us-ascii?Q?78U5aG7vGj8E9FAkkiXy4wuihdQ3YDm0o1YaejBLtKDsaN81szTv364lIspP?=
 =?us-ascii?Q?4OkEna2awO/1/3XS5UkWx/lxhuImUSxmi3cp5xa3YPDrBdNmtPmlRFZNEb++?=
 =?us-ascii?Q?DZ1jb5B27VSXNvIOps1HbeWmb4Cpo4eACC3kR1AkUbNpOFFQs/Gqhd4Op1pz?=
 =?us-ascii?Q?2IuxdQX1m4bNUkwzUdSUuyZ9pCV5P21l5lLDfGHje93HBxaiMlrk3mB1Z+xm?=
 =?us-ascii?Q?6OJTGlD3rSAw0Vkcf6uYb2t4zxx+Sj/xV53Y5EhvAiCX70WqgO28sw3aa1Fs?=
 =?us-ascii?Q?1C+C9Z4v+MHBPjDiyCFp780ExayJWEEQO5rVAQhTE3KMq6FOqPrNgx9kkbCI?=
 =?us-ascii?Q?lmrUrGbAAnvLZQF3H/XNJE8NzE700lFzgBRLrK3KcVQaN+k4+/Wz2XhFW7WJ?=
 =?us-ascii?Q?Z2xu8fz1MFQuQJQIulU8blANg4q24+8eOPP9Fedg62zbDYS9F12xFWp8L9X7?=
 =?us-ascii?Q?wsOU4C9+7sKevC2bzEW5VnAlHV8jshJTN5TZGAoM46in7B4e1qmdcYS2bUfe?=
 =?us-ascii?Q?ktRP3Qy/SOC+HuDoG77z3WJTnSpLEU1hHc6X8aMTJs/+Mk5NwHuCTc10ZfCh?=
 =?us-ascii?Q?9JRlhXQx2P+Y1UmSuJMjTPk7lJmveoQ4tLA7CLiJfA8C7oHBYT1wAAwAgegE?=
 =?us-ascii?Q?oWjpBQINwgN3EIkbULusCkZe1Ikcz4XCX90AGPeu3Y6Qw4LM9riLQAqyTVSD?=
 =?us-ascii?Q?b71V8dGLSHLeJvQ+V1maOzTGquaNEsanKc9UFn4/A/1GJlwWviuzcJvZ8MoU?=
 =?us-ascii?Q?7qosGOi0t3JeLrnR5q5o7O+HOZlsA47PzqYlpHV+KTgnWiBbngBljcpycdq1?=
 =?us-ascii?Q?YnhiXVzJCJ+mOSNwUvILAlwpgdn6paaTjUGE5WFtvpUBXfdzteTEGYon/mc8?=
 =?us-ascii?Q?y/9qqvya/fQ58kL1bzpxj7oM5wUA2WfhoFXFVZOyV7fQHZVU6sphoueQVGFb?=
 =?us-ascii?Q?7b/U/apuLV3+SGfHdzOlYoO8VNJRJ7h5qphFdzqTmcQiY8RQN+aQE5y2kWBb?=
 =?us-ascii?Q?GBeHMauICvFjSq/YMnzJphcJNbIuG12UlciRhXFuCXfrVYN+pKGh1BcH8Dx4?=
 =?us-ascii?Q?P8HIT+jNtFKgy06bnVABbUV79gqESGDv7dCAyDyc4KitUIkui3WVJcV39wka?=
 =?us-ascii?Q?0XzQ/0lclZo6pRK2FCstiBrqUlLWugWUSIm2lY5N6mJvGR3DmuWx8EeKDcoN?=
 =?us-ascii?Q?wI/BufiDt+27jIZ9d390R4tvenqCyd7swAzv+Vz6DRGRQE8ySFazdNooR5S+?=
 =?us-ascii?Q?Y4pblfFEpGT1C2bz6R1VMWBEJgddofFwwnOkk5PujohPLMbD7o25w20haDeq?=
X-MS-Exchange-AntiSpam-MessageData-1: LqgOQOpdxVFmYQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e350bc-c912-42ac-c086-08df46e4c431
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:00:47.0596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfjYl4DfQo1JKPanp7qT0sXAjHSQG01a0vYc3lWlUKWs2ftPLfWBhYTZE+qGwUVIy6Mn1rdKBmRrG7Aoo7vdu51p5t1Lmr1yaLhlWYSoycfxfMpRUtmFsPc2abAM/YTk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_010051_698522_8CA87640 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shengjiu Wang <shengjiu.wang@nxp.com>

This series fixes the SPDIF1 compatible string on i.MX8MN from
"fsl,imx35-spdif" to "fsl,imx8mm-spdif", and adds the missing pll8k
and pll11k clock entries on the EVK board to support both 48 kHz and
44.1 kHz based audio sample rate families.

Shengjiu Wang (2):
  arm64: dts: imx8mn: Update SPDIF compatible string to fsl,imx8mm-spdif
  arm64: dts: imx8mn-evk: Add pll8k and pll11k clocks for SPDIF1

 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 8 ++++++++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.34.1


