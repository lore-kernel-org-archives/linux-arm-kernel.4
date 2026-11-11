Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6123E60A260B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q/Utdtwm;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dvZA/CL5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WwlXh3LktFHI7zSBsD/SZac3qhtr52wShddo+pQGDSs=; b=Q/UtdtwmJmOk/W
	NTFNE6JGjPEeKh+VjZcbhPKXKTzVnP3voedlcfkgDiRr2+Wg+fYX9rvIgEhVKaGC9UgtUSEORlBh2
	Nl93TbWNSfQNoP+027t0QDsS99ub9nE8sO2WMmDcJt3RmeQba2fFmOyAmMfleZpPO4iHpuqIrnD/w
	+WUig+BoFxwAiI2Zlz5+YH+H/g9Mgo2K/6I13n2QtTBZbGdNX7SYrN8/jvUn0w5X5NZoXtbItnbD9
	94VRbKDI2VUBg7vrAfeO24TR1+MSCm5B/ZPGLT50J0melAYdSwroAsHFNGKQtDceB/9PcKKiezFMT
	f9z4UpZOIyZcL6xHD9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1jp-00000005lZS-05xh;
	Wed, 11 Nov 2026 06:23:17 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1jj-00000005lX7-1ZfN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:23:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=as2qgT5NypNCxEIJOhzDdLj82ypj59M9ZnrA9tBb3hXTS4f2G4D/a+wceDdiU4AYGDuk6XvJ5zxK4nv5+LXiZVE4368lDfOuNR6XvsxsGZQTY2qnh9PUhhckfCYR49VJlW3fdR348W3cNWNILzNLvF04x5gwvVjaLfrVmA/uHriqO1+yEX/SFSr9xUgEmIhpyKvHbQPnzFA38ZSy0jv492Y7xTTMZwJJlczl9KXXQqrZSGDeBbSNrYdXNCI6o/8J4BKba2R8wvYC4rndECvvVgPGabNZfQBOE9s+L9w1//fOnaDfS2lFWxtGdXMtNxbRDYuyUCOoHj507xKL+v0dXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwlXh3LktFHI7zSBsD/SZac3qhtr52wShddo+pQGDSs=;
 b=goA+nb8N9IMxEDrPUSIKQaA4wr3KSm9im+PHjXzhUqcWcJ+orBOQwfDy38nMj3qTUuSxAXX/RIXyZHt6SrzxFHXN4cWBZ/CGh9E2sgawb9nQ+/8+DPSFzShdN6MyIBx6CTH9/mXJX47obu1RC5tNIjxbxYAkOwDlZ7/JSp7AWSSfrS+F7RFdHDwBWnB/AYGCPrIh+A+hNyPBQqThA/GsQbc43cpUSr8335EFhf4b+twFxXazT9jlSCN6B2HJXbU+pe5WO1k6N8BtFQXmx/CQcO6R9qUgjsOxgx+22TOwa1wgMSgorv5h18o33J2BYVCNJtTGKEHQZJb7s7FOoyChew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwlXh3LktFHI7zSBsD/SZac3qhtr52wShddo+pQGDSs=;
 b=dvZA/CL5+sbdGiWsbpCYHQiyCCNH7gGEEIWW5rKtbwNp04JHUd0ZX9pt04DwcggKF8brVeyGB83DgS/r7JVXtjs8UcqMt+tOFSsYK9MMqetmxpo2h3z+q/uo3sFkpi6PIaRj/W3Ciamg5i7yBwl8C0o+J42TT8unZDCLvie4MmAlPbV2OFqyWIl8/aZajqGTPtALTgaZk2NIACUx6GwzoOSvqnN/Hod0oi6nDzscuCojfolQHyjsN/LrKS1fSUvYg5ZAPZecom5C7n2IIjjcu45vDl2jkGN+UKtShFIebuVpyCBYwNooCUMRhaugi3SUquVxsuhcfMYFsM0FGfKyNQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by VI0PR04MB10543.eurprd04.prod.outlook.com (2603:10a6:800:25a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 06:23:07 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 06:23:07 +0000
From: wei.fang@oss.nxp.com
To: xiaoning.wang@nxp.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	richardcochran@gmail.com,
	linusw@kernel.org,
	linux@armlinux.org.uk
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 net-next 1/9] ptp: netc: use ioread64_lo_hi/iowrite64_lo_hi for 64-bit register access
Date: Wed, 11 Nov 2026 14:27:45 +0800
Message-Id: <20261111062753.1397582-2-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111062753.1397582-1-wei.fang@oss.nxp.com>
References: <20261111062753.1397582-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|VI0PR04MB10543:EE_
X-MS-Office365-Filtering-Correlation-Id: 65dfa1bc-8eee-49ab-8a0e-08df3fbc4004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|921020|261026121527099003|11063799006|261026140227099003|261102123227099003|261021123027099003|261009223027099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9G3xvHxZD92h6hp31DlX6UCAK+knpWe18KH+Vdon2FnfMm3WSe1cjT+Yv1jhN5/1t9iNmY8sAJ+Nzer/oqYWpfCz3u4ZlzWQruoH3Vgw6Kb1uDh+AA3UZ7ax8xUOh9mws7eT9qMomSNakXdWtrHPl+kVnamWr8rjJF+avnoAET8oe27Mnzc3xC+TRo3H0T1P5xzTTOl9ZShwr+suZX2hqX9vi5KaszKbbGJO3cVCqIIgnaHN836QLwe9b7goqc1RYyokeey53jXK11f2VyBRuQ+gUOIXdJAdlijJwIq5FAKKeORoPNZIlgc/K04fJHHpWGiBTaiczHAEirtPbcx9xF++s0mWZgfzk4eELhLM2Zs9Pp1h3aHaiHj46FmgbmbqmOAT2lU3J5q7K8hU9+ben6xj5YBhZEcLY2jWts1nnWj0NCL8AwPJmMWYIgE4RmgORZiS4eNk9ijTH7La8FieIktw+Mf+lUi9fI93timM4WEO5nSGkH0h1kEzHcA+Kfi+K8qI82WiUm/Z2viYdwOP5NeAI6/Dq65V95tW50iXRaY5rXWd1l3D88U8D70BAPwp0tTsjHqsDAB5k18LRbrIEXW4jv+jZkwl3XxZukDxoOXQ1d3shNASo/SNJtxlWQEH5oetJ18TWN8eb9wF0AuxomGv9M/3c8hTmhY29h69U2+6dHxxPOkiH2xMRNDVx1dnLrVr8szNs8+wLGg/NJfgUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(921020)(261026121527099003)(11063799006)(261026140227099003)(261102123227099003)(261021123027099003)(261009223027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2na9MvlBCqZm0phWOWlhMq91n/g0gu2iO3Db5czNrO9Y19NSK/MmVqdGmK36?=
 =?us-ascii?Q?HVmfYxxAy3YGsHzzWuIrfLTW2KVfP578JieudlD59VX/EP3wQw4UD+97lAlX?=
 =?us-ascii?Q?s1QRJT1MO65zvB9uc35hIyDeRh/zdvb1CKxbEdDsPclz3s4fdsE4yG+qRGWB?=
 =?us-ascii?Q?FGeOKVmSNrImDkpQcJlmhMbm6DrT2TDfFVTgTVeT/SNY2JDI0agdhWtu/bv+?=
 =?us-ascii?Q?c30EYxpQ5XO9uMOl1sWMHWLvIQ258iiQ5/pv+kYD5NUnamRuYsW5nvIoECek?=
 =?us-ascii?Q?dUrg5qiHi9lt/cLkhYQw3ViIUoNrxXSZDT8oO8A6J+GW2Jf67xha5R0pLq8p?=
 =?us-ascii?Q?Cm2OhZwpxPwPvpJ/AraHCZldI0X4NeOqG7+b1HCUM84dKx3bEXDPtmRBUv4t?=
 =?us-ascii?Q?PqoHdEaD5dWFKNM2QDIymYmacRk2E2zF9SiQX1J1HKkp1TS7+QSri5aV/1HT?=
 =?us-ascii?Q?72rGiCFGfzXwZeN2etvGbZFXw0rqUgYKudVuM2+Xm+7Xg9wMBUb/xLEEj98b?=
 =?us-ascii?Q?Dz8Qi/hhlBAADwuVwXzExynH6NOOt2m5yqkWGRbPsNb2n71BmDJR1sjBL56S?=
 =?us-ascii?Q?mwL0zc2XE9fRakvS/H3toD/IjEVxGB7srULJ4ADLyzOMJM6Eabv5RqQO4eIz?=
 =?us-ascii?Q?ALVOILHz2ua5a32UjmsBdPui4dGP2ojexNUshu5Iu9lxQQsS0dd/pUt1lcMo?=
 =?us-ascii?Q?DPtpC+QAKhcYr3VHu6MfCH7e5GYXnmpP4zZJtpr2ALz5C/zAcqUpc4CBP2iV?=
 =?us-ascii?Q?qrHZd6XczgJoCur/NQq/sjcDOX9p6gi/mbgAdE3YG5DiqNcBxfF6sHxl0vAv?=
 =?us-ascii?Q?ptecBfTtum3vXD4ek93sgwT8r/NSrDLzyfyLQJ/QDJpRJQsygpZ+TQuTyVIa?=
 =?us-ascii?Q?LKxXrZzBCQpJjIEEItpGbiqs3Avx/mCmv6jZMmgH4aaCnkozPIf0T2ShSlsC?=
 =?us-ascii?Q?herk+F3auJEvbfIde+ItqMGXyCVD3R8gZBQqmgNM4Lxkokk3z/059QPgCs7h?=
 =?us-ascii?Q?wc/xOYpsu0y0w5/bc4gYbmSKv5mCuPOstm+KE2SzFhNIDnW+oKwtJOf0MGlx?=
 =?us-ascii?Q?GOWeA3cXWgeerf45aI5S8iqLERO0YdxTRl6U3pHUg2VM8UwK9FIZfum1EfDt?=
 =?us-ascii?Q?Law2u6xh+uL2pbIEvqIm7sArTMxRgA54ebpegDGP2s3mPrRCLmGAQQzGCmma?=
 =?us-ascii?Q?8ElVTqboVi9/oryx2fqJQ+0zkhEmzwVKtBCM2TNNk6eu6+hKdbEmkg5HDURm?=
 =?us-ascii?Q?77+vEjgHH9y3aF2V64seKeZxydaGWzaFQEVRT9KilLlp/YR4UtUG1Q6L27Vl?=
 =?us-ascii?Q?0QhPyU2GsCC5SslBk4enCIN70bCqswlEMT0wQHb6W2xWjjpnb1q7SKZDnjOw?=
 =?us-ascii?Q?H/F0/UNU6P+P/IF4/fKh4olx4ggHVYeAp/AxX2Y4eAc1V6zsACR5kscKMu1Q?=
 =?us-ascii?Q?Z3/MTf7yXEoJ4ADoI8I2oUIOZmXXhiQJIsU2UYFzDKjuA4SlNoWofPwrSbxi?=
 =?us-ascii?Q?TamV6amIfrHPGPk4U/B4IARE/CUebeZnUfYySQgD4bccxHa+hU44BF3xxCOF?=
 =?us-ascii?Q?itauxx6/ljC7UOMcElAXLleQhV8byyAiEBgBtz4B1c0FccrZHcGE4Ul1Kjk3?=
 =?us-ascii?Q?N7lAGPTLyJVKvgw/cEqklo+s0UbR7wspjFNYfRyXsVM6YC29wbdqUkj5o5Wc?=
 =?us-ascii?Q?Pnhr4L+R+/xT6gKxjlsajwbz6GvddLTQgd/kGc1hQX2KnSsrTfffXJv+qztm?=
 =?us-ascii?Q?uWec1aM0wLjkb5wLxuspK1dJPRGblO6kQzHU4VMy0WIsR3reg/4t?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65dfa1bc-8eee-49ab-8a0e-08df3fbc4004
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 06:23:07.1884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: peF98AbDyHKzFGMFsnZneaAoZDQg8LytPUN013dFugzFQAmqcOGk2R+kGKelLouGqRTWvw3W8o2Jta7dyFNBBhXsSxEkWhww6NjT8KOYncJk/lGUZH4BRpNZ1JWd3P76
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10543
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_222311_422723_89AAE9B0 
X-CRM114-Status: GOOD (  17.99  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wei Fang <wei.fang@nxp.com>

Replace the open-coded 64-bit register read/write sequences with
ioread64_lo_hi() and iowrite64_lo_hi() helpers. Introduce two new macros
netc_timer_rd64() and netc_timer_wr64() that wrap these helpers and use
them throughout the driver. This reduces boilerplate and makes the intent
of each operation clearer.

The high-half register defines (NETC_TMR_*_H) are kept to document the
register map; they are not used directly since netc_timer_rd/wr64()
address the 64-bit register pair via the low-half offset, relying on the
hardware layout where H is always at L + 4.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/ptp/ptp_netc.c | 72 ++++++++++++------------------------------
 1 file changed, 21 insertions(+), 51 deletions(-)

diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
index 19ca99d80e95..376b3b0d1a38 100644
--- a/drivers/ptp/ptp_netc.c
+++ b/drivers/ptp/ptp_netc.c
@@ -127,6 +127,17 @@ struct netc_timer {
 
 #define netc_timer_rd(p, o)		netc_read((p)->base + (o))
 #define netc_timer_wr(p, o, v)		netc_write((p)->base + (o), v)
+
+/* The 64-bit timer registers consist of a low (L) and high (H) register pair.
+ * Hardware requires a strict access order: for writes, TMR_xxx_L must be
+ * written first, which latches the value into a shadow register; the write
+ * to TMR_xxx_H then atomically transfers both shadow registers into the live
+ * counter. For reads, TMR_xxx_L must be read first to capture a coherent
+ * snapshot. iowrite64_lo_hi() and ioread64_lo_hi() enforce this L-before-H
+ * ordering.
+ */
+#define netc_timer_rd64(p, o)		ioread64_lo_hi((p)->base + (o))
+#define netc_timer_wr64(p, o, v)	iowrite64_lo_hi(v, (p)->base + (o))
 #define ptp_to_netc_timer(ptp)		container_of((ptp), struct netc_timer, caps)
 
 static const char *const timer_clk_src[] = {
@@ -136,66 +147,28 @@ static const char *const timer_clk_src[] = {
 
 static void netc_timer_cnt_write(struct netc_timer *priv, u64 ns)
 {
-	u32 tmr_cnt_h = upper_32_bits(ns);
-	u32 tmr_cnt_l = lower_32_bits(ns);
-
-	/* Writes to the TMR_CNT_L register copies the written value
-	 * into the shadow TMR_CNT_L register. Writes to the TMR_CNT_H
-	 * register copies the values written into the shadow TMR_CNT_H
-	 * register. Contents of the shadow registers are copied into
-	 * the TMR_CNT_L and TMR_CNT_H registers following a write into
-	 * the TMR_CNT_H register. So the user must writes to TMR_CNT_L
-	 * register first. Other H/L registers should have the same
-	 * behavior.
-	 */
-	netc_timer_wr(priv, NETC_TMR_CNT_L, tmr_cnt_l);
-	netc_timer_wr(priv, NETC_TMR_CNT_H, tmr_cnt_h);
+	netc_timer_wr64(priv, NETC_TMR_CNT_L, ns);
 }
 
 static u64 netc_timer_offset_read(struct netc_timer *priv)
 {
-	u32 tmr_off_l, tmr_off_h;
-	u64 offset;
-
-	tmr_off_l = netc_timer_rd(priv, NETC_TMR_OFF_L);
-	tmr_off_h = netc_timer_rd(priv, NETC_TMR_OFF_H);
-	offset = (((u64)tmr_off_h) << 32) | tmr_off_l;
-
-	return offset;
+	return netc_timer_rd64(priv, NETC_TMR_OFF_L);
 }
 
 static void netc_timer_offset_write(struct netc_timer *priv, u64 offset)
 {
-	u32 tmr_off_h = upper_32_bits(offset);
-	u32 tmr_off_l = lower_32_bits(offset);
-
-	netc_timer_wr(priv, NETC_TMR_OFF_L, tmr_off_l);
-	netc_timer_wr(priv, NETC_TMR_OFF_H, tmr_off_h);
+	netc_timer_wr64(priv, NETC_TMR_OFF_L, offset);
 }
 
 static u64 netc_timer_cur_time_read(struct netc_timer *priv)
 {
-	u32 time_h, time_l;
-	u64 ns;
-
-	/* The user should read NETC_TMR_CUR_TIME_L first to
-	 * get correct current time.
-	 */
-	time_l = netc_timer_rd(priv, NETC_TMR_CUR_TIME_L);
-	time_h = netc_timer_rd(priv, NETC_TMR_CUR_TIME_H);
-	ns = (u64)time_h << 32 | time_l;
-
-	return ns;
+	return netc_timer_rd64(priv, NETC_TMR_CUR_TIME_L);
 }
 
 static void netc_timer_alarm_write(struct netc_timer *priv,
 				   u64 alarm, int index)
 {
-	u32 alarm_h = upper_32_bits(alarm);
-	u32 alarm_l = lower_32_bits(alarm);
-
-	netc_timer_wr(priv, NETC_TMR_ALARM_L(index), alarm_l);
-	netc_timer_wr(priv, NETC_TMR_ALARM_H(index), alarm_h);
+	netc_timer_wr64(priv, NETC_TMR_ALARM_L(index), alarm);
 }
 
 static u32 netc_timer_get_integral_period(struct netc_timer *priv)
@@ -500,22 +473,19 @@ static void netc_timer_handle_etts_event(struct netc_timer *priv, int index,
 					 bool update_event)
 {
 	struct ptp_clock_event event;
-	u32 etts_l = 0, etts_h = 0;
+	u64 etts = 0;
 
-	while (netc_timer_rd(priv, NETC_TMR_STAT) & TMR_STAT_ETS_VLD(index)) {
-		etts_l = netc_timer_rd(priv, NETC_TMR_ETTS_L(index));
-		etts_h = netc_timer_rd(priv, NETC_TMR_ETTS_H(index));
-	}
+	while (netc_timer_rd(priv, NETC_TMR_STAT) & TMR_STAT_ETS_VLD(index))
+		etts = netc_timer_rd64(priv, NETC_TMR_ETTS_L(index));
 
 	/* Invalid time stamp */
-	if (!etts_l && !etts_h)
+	if (!etts)
 		return;
 
 	if (update_event) {
 		event.type = PTP_CLOCK_EXTTS;
 		event.index = index;
-		event.timestamp = (u64)etts_h << 32;
-		event.timestamp |= etts_l;
+		event.timestamp = etts;
 		ptp_clock_event(priv->clock, &event);
 	}
 }
-- 
2.34.1


