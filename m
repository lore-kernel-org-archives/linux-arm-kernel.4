Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01178606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 18:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PwfnkK4H;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Pr+Vy0pz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Hya1Buefjf7E+p3J1xU60NGV6U31Z2YTOjoUlR1DW+I=; b=PwfnkK4HvQV+pGMtEG0elBp8QE
	0vDKqRsfaQJqojkxAGsDkGWHt0Q85ro+Jd1q8Tl6nNNaZgkxfdyFzAjNcPDbIbnpFsPHbzk5tjr6/
	rs95JvzQfOClh5CWsHLsC9uDQSRecZ8GAotpfebs0+ABkVtPw8lDOTdv5Yr3YxD85GdTCeYv1JSqb
	k/S7VnpkST2EgWimPOXJSJkLf5fgaLeHVJooN868J5L12AJMPhsBzrjXh905Fqi+1djUU7sIKCswv
	pGNbk8Iljd0fYALKCpUwUY9ZP+loSzgvACesT5laZh2SAYPjST5oFPHiF/8wkjJ77PVVbhxwcAvCg
	j0HwrCQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSIWO-0000000GbeF-2oH9;
	Sat, 14 Nov 2026 18:30:40 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSIWD-0000000GbW5-2B1a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 18:30:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1z5B/k5vELgox+R2bzentcAvwoGSfrfc8k5AZWjlYPnf9K8h5T9PhWyuz0IYfYicAA+00MnBgfP34RZbTxn0T6oZN4cjdVbXToXV4Y05n/T9L808O/W/BZz8lJHK541BJu1Yy1RBraFBhHGihdV8phS7wiOfVPg9wGUlVgz68a8kc+/uBlQub+iVEN4RQqqHjBLZ3en6GeRWP8Zbx78WTv39b+VqJZ6ljahWbRMstu5f64KN3CBFY1FmRDf4Nh2xA8DBKZWjFZ80BVs1vvfgGRS3vpbplD1TiZbVmTS2QiiXPEjojbG1qVPBMnA6Cf9agOBBTKdgMjZocNAl8vMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hya1Buefjf7E+p3J1xU60NGV6U31Z2YTOjoUlR1DW+I=;
 b=fRXRc2kn4pG8AHN8VQ3bWWjcpCEsYF/nnrt7XaAHGe9IHvbotvaFju4oOdh8ZONQV4RgCCFqAGHM0g5Anzq82/Oy3mF/PjZy3BKpWC+oIJLQ0gOTiAFv1umJHJ0BtLLUEnO7vnFSD3c4lV4uDH3NkIPfheAU6THRZKozNiLYX1pxjdKjWWFe2JUENA/UXDu+cxf2u/HwfjJ1fHZuBAjHsxjqP+Q2k1A5iYcNll5Pz05bd5qENd7Rw8ihRZrGiHGahOzqpW2V70ISTZ2MqgxxkJy516Rb9Dim34n+FHLcNTnxMUr8B+WWjLjy3mRBPgvARqkS5wYWqAm5DUeC/mOqhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hya1Buefjf7E+p3J1xU60NGV6U31Z2YTOjoUlR1DW+I=;
 b=Pr+Vy0pzkEYyCaJuFsHycV+fER8tut6ySkfiDMsu8TIOrE/PejQ0xgJT1jusfCtffhMNdz9dnt9oeXZPVCPKNFxul/OMaupm1OCNRG31GCt2nLvbA+916Zx2hk19hiXRevPcN4pAS1i8CY8MfBQ4i6YEAt+p3CRTNC4A7DtNF7A=
Received: from BN9PR03CA0656.namprd03.prod.outlook.com (2603:10b6:408:13b::31)
 by IA0PR12MB8350.namprd12.prod.outlook.com (2603:10b6:208:40d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Sat, 14 Nov
 2026 18:30:21 +0000
Received: from BN7PEPF00000094.namprd03.prod.outlook.com
 (2603:10b6:408:13b:cafe::57) by BN9PR03CA0656.outlook.office365.com
 (2603:10b6:408:13b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Sat,
 14 Nov 2026 18:30:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF00000094.mail.protection.outlook.com (10.167.245.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 14 Nov 2026 18:30:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 14 Nov
 2026 12:30:19 -0600
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sat, 14 Nov 2026 12:30:15 -0600
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Michal Simek <michal.simek@amd.com>, Russell King <linux@armlinux.org.uk>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH net-next v5 5/6] net: xilinx: axienet: Dispatch statistics through axienet_config ops
Date: Sat, 14 Nov 2026 23:59:46 +0530
Message-ID: <20261114182947.2908628-6-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261114182947.2908628-1-suraj.gupta2@amd.com>
References: <20261114182947.2908628-1-suraj.gupta2@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000094:EE_|IA0PR12MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 19779b87-676e-4643-99da-08df427d5727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|7416014|36860700016|261022105027099003|261021135927099003|261026140227099003|261026121527099003|261022113327099003|261022075727099003|56012099006|261021133027099003|11063799006|261021130227099003|261009223027099003|261026130827099003|261021123027099003|261102123227099003|261028144727099003|261022115727099003|261021121427099003|6133799003|18002099003|22082099003|261026135527099003|10067099003;
X-Microsoft-Antispam-Message-Info: lOwtFrplvbbllkBnUjnEgRlJskDdzd+bjK9l0rtfo2n1r2+I2giEuEoZLOSUtlWayoLs73NgAguUR1f67xmofNj92N5iWAGKhi06RychJR/WCgjatb3LPjgYYnn4xtV3TKt3ZeM7Ii6uDmpeSJ4TM+zDs60dlmOU8KDYovQlQUgSA3j+zEbViobde0IPJ0PZ/0LfwIyl78EZN3smBvS5eIStPWhqd3w05BfC3hu6e07BZm5kmtlUzi5NmLGyaWLMadCVgXDguoAFYeXePshCzCReVGutaNktg2mN5X0PPsMTc0IlCqLWLVP9UcgG8/2mJvzxz2bGHAJDWu1ntR6ip+upLZQrbljHTWAfVTCgTFYlLlKF0utngR++2N/Rq4lCsdkBYS+faE9BmTI+r05s1wVM/2QOO4Z9E0/Xs9SZTl7hfWdJ1m6qZddP5bbAVLF4CTf8qhkYI3h5rMu7e5lg0ZQhcqRR7zzZL7+pdK3lKkcl4MXOlI7yk3bPRrd3Sp4jGZCszuDN/fLKn6QMcUmDYTfdYboJLTAMsNrZgyhtVnPNl1z30O6mA9ORgddJwnDTPpF3PktCouyROpiRLu6RJ+AaBV6TJ0YrVx+8UF3IUOMI209lRvPmLZwF3sAbglqqU8p5JfDUQmbuXZSq9BiufLkE7SR+vJshIF92FxtVwXPhLMohp1WSq09ywr2COhGu2/ijmjS6sINVMqdaqbESSg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(7416014)(36860700016)(261022105027099003)(261021135927099003)(261026140227099003)(261026121527099003)(261022113327099003)(261022075727099003)(56012099006)(261021133027099003)(11063799006)(261021130227099003)(261009223027099003)(261026130827099003)(261021123027099003)(261102123227099003)(261028144727099003)(261022115727099003)(261021121427099003)(6133799003)(18002099003)(22082099003)(261026135527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SXqduq7jTc7wnlyzHxEXpCxGhV8w2G6d2v5pu3ptZOkrvdzi77RuRPp0ONXGkSvHDuiFhzDU4jZWm1sq6M2Y94VJd8aVsJT6+c1tKQFWMyfBzhleiOTNKk0XjKYNLnNangkPoK14n4qmhwxezSFHCkzczL3MMBJ7s2iCNyyREsCFn/elHlf16jrS9IKTQUssrmKumjfq8Cnci+Q/gcCKQVhBGNhCwikPOuTxV+dVNtbSZ2FuV6My0bV9/b/KyKbYrwek+FT2NY58pq8Ucu+xB0h4HEso0MqQ/zRS2NuvcT/xssaKuFzeTq373FtQYk803ZEUv3g9fcUC5UJ7/gnI093RU8iOX3NbG5mmo74MxGCZkrc0P+8exE4Qy9aeXVYOcnb1uWBkLWJVgYTJZC3cUEmvrP6H9tKURhh26EiPNXO327ffIorERORyN76Uylj7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 18:30:21.0066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19779b87-676e-4643-99da-08df427d5727
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF00000094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_103029_637498_AE4E6012 
X-CRM114-Status: GOOD (  19.15  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ndo_get_stats64() and ethtool statistics callbacks read the 1G MAC
hardware counters directly. Supporting a second MAC type this way would
require an "if (mactype == ...)" dispatch branch in each of the eight
statistics callbacks.

Add statistics operation function pointers to struct axienet_config and
route get_stats64, get_ethtool_stats, get_strings, get_sset_count,
get_pause_stats, get_eth_mac_stats, get_eth_ctrl_stats and
get_rmon_stats through them. Factor the existing 1G counter reads into
axienet_1g_*() helpers and populate axienet_1g_config with them.

A NULL op means the MAC does not expose that statistics group, so a MAC
without control-frame counters simply leaves get_eth_ctrl_stats unset
instead of open-coding the special case in the callback.

No functional change intended.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  23 +++
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 171 +++++++++++++-----
 2 files changed, 146 insertions(+), 48 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index 56570b49574e..7468fed1416e 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -666,6 +666,15 @@ struct axienet_local {
  *	     is set, as the PCS is registered without a further NULL check
  * @stats_update: Callback to latch/accumulate the periodic MAC counters, or
  *		  NULL if the MAC has no periodic statistics counters
+ * @get_stats64: Callback to read MAC counters into rtnl_link_stats64
+ * @get_ethtool_stats: Callback to read MAC counters for ethtool -S
+ * @get_strings: Callback to fill the ethtool -S statistic name strings
+ * @get_sset_count: Callback returning the number of ethtool -S statistics
+ * @get_pause_stats: Callback to read MAC pause-frame counters
+ * @get_eth_mac_stats: Callback to read IEEE 802.3 MAC counters
+ * @get_eth_ctrl_stats: Callback to read MAC-control frame counters, or NULL
+ *			if the MAC exposes no control-frame counters
+ * @get_rmon_stats: Callback to read RMON counters and histogram ranges
  */
 struct axienet_config {
 	bool mdio;
@@ -691,6 +700,20 @@ struct axienet_config {
 				 struct phylink_config *config);
 	const struct phylink_pcs_ops *pcs_ops;
 	void (*stats_update)(struct axienet_local *lp);
+	void (*get_stats64)(struct axienet_local *lp,
+			    struct rtnl_link_stats64 *stats);
+	void (*get_ethtool_stats)(struct axienet_local *lp, u64 *data);
+	void (*get_strings)(u8 *data);
+	int (*get_sset_count)(void);
+	void (*get_pause_stats)(struct axienet_local *lp,
+				struct ethtool_pause_stats *pause_stats);
+	void (*get_eth_mac_stats)(struct axienet_local *lp,
+				  struct ethtool_eth_mac_stats *mac_stats);
+	void (*get_eth_ctrl_stats)(struct axienet_local *lp,
+				   struct ethtool_eth_ctrl_stats *ctrl_stats);
+	void (*get_rmon_stats)(struct axienet_local *lp,
+			       struct ethtool_rmon_stats *rmon_stats,
+			       const struct ethtool_rmon_hist_range **ranges);
 };
 
 static inline struct axienet_local *pcs_to_axienet_local(struct phylink_pcs *pcs)
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index a37aad4432ce..329b6adf2475 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1992,29 +1992,11 @@ static int axienet_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 	return phylink_mii_ioctl(lp->phylink, rq, cmd);
 }
 
-static void
-axienet_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats)
+static void axienet_1g_get_stats64(struct axienet_local *lp,
+				   struct rtnl_link_stats64 *stats)
 {
-	struct axienet_local *lp = netdev_priv(dev);
 	unsigned int start;
 
-	netdev_stats_to_stats64(stats, &dev->stats);
-
-	do {
-		start = u64_stats_fetch_begin(&lp->rx_stat_sync);
-		stats->rx_packets = u64_stats_read(&lp->rx_packets);
-		stats->rx_bytes = u64_stats_read(&lp->rx_bytes);
-	} while (u64_stats_fetch_retry(&lp->rx_stat_sync, start));
-
-	do {
-		start = u64_stats_fetch_begin(&lp->tx_stat_sync);
-		stats->tx_packets = u64_stats_read(&lp->tx_packets);
-		stats->tx_bytes = u64_stats_read(&lp->tx_bytes);
-	} while (u64_stats_fetch_retry(&lp->tx_stat_sync, start));
-
-	if (!(lp->features & XAE_FEATURE_STATS))
-		return;
-
 	do {
 		start = read_seqcount_begin(&lp->hw_stats_seqcount);
 		stats->rx_length_errors =
@@ -2042,6 +2024,33 @@ axienet_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats)
 	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
 }
 
+static void
+axienet_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats)
+{
+	struct axienet_local *lp = netdev_priv(dev);
+	unsigned int start;
+
+	netdev_stats_to_stats64(stats, &dev->stats);
+
+	do {
+		start = u64_stats_fetch_begin(&lp->rx_stat_sync);
+		stats->rx_packets = u64_stats_read(&lp->rx_packets);
+		stats->rx_bytes = u64_stats_read(&lp->rx_bytes);
+	} while (u64_stats_fetch_retry(&lp->rx_stat_sync, start));
+
+	do {
+		start = u64_stats_fetch_begin(&lp->tx_stat_sync);
+		stats->tx_packets = u64_stats_read(&lp->tx_packets);
+		stats->tx_bytes = u64_stats_read(&lp->tx_bytes);
+	} while (u64_stats_fetch_retry(&lp->tx_stat_sync, start));
+
+	if (!(lp->features & XAE_FEATURE_STATS))
+		return;
+
+	if (lp->axienet_config->get_stats64)
+		lp->axienet_config->get_stats64(lp, stats);
+}
+
 static const struct net_device_ops axienet_netdev_ops = {
 	.ndo_open = axienet_open,
 	.ndo_stop = axienet_stop,
@@ -2474,11 +2483,8 @@ static int axienet_ethtools_nway_reset(struct net_device *dev)
 	return phylink_ethtool_nway_reset(lp->phylink);
 }
 
-static void axienet_ethtools_get_ethtool_stats(struct net_device *dev,
-					       struct ethtool_stats *stats,
-					       u64 *data)
+static void axienet_1g_get_ethtool_stats(struct axienet_local *lp, u64 *data)
 {
-	struct axienet_local *lp = netdev_priv(dev);
 	unsigned int start;
 
 	do {
@@ -2495,6 +2501,17 @@ static void axienet_ethtools_get_ethtool_stats(struct net_device *dev,
 	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
 }
 
+static void axienet_ethtools_get_ethtool_stats(struct net_device *dev,
+					       struct ethtool_stats *stats,
+					       u64 *data)
+{
+	struct axienet_local *lp = netdev_priv(dev);
+
+	if (lp->features & XAE_FEATURE_STATS &&
+	    lp->axienet_config->get_ethtool_stats)
+		lp->axienet_config->get_ethtool_stats(lp, data);
+}
+
 static const char axienet_ethtool_stats_strings[][ETH_GSTRING_LEN] = {
 	"Received bytes",
 	"Transmitted bytes",
@@ -2507,12 +2524,26 @@ static const char axienet_ethtool_stats_strings[][ETH_GSTRING_LEN] = {
 	"User Defined Counter 2",
 };
 
+static void axienet_1g_get_strings(u8 *data)
+{
+	memcpy(data, axienet_ethtool_stats_strings,
+	       sizeof(axienet_ethtool_stats_strings));
+}
+
+static int axienet_1g_get_sset_count(void)
+{
+	return ARRAY_SIZE(axienet_ethtool_stats_strings);
+}
+
 static void axienet_ethtools_get_strings(struct net_device *dev, u32 stringset, u8 *data)
 {
+	struct axienet_local *lp = netdev_priv(dev);
+
 	switch (stringset) {
 	case ETH_SS_STATS:
-		memcpy(data, axienet_ethtool_stats_strings,
-		       sizeof(axienet_ethtool_stats_strings));
+		if (lp->features & XAE_FEATURE_STATS &&
+		    lp->axienet_config->get_strings)
+			lp->axienet_config->get_strings(data);
 		break;
 	}
 }
@@ -2523,24 +2554,20 @@ static int axienet_ethtools_get_sset_count(struct net_device *dev, int sset)
 
 	switch (sset) {
 	case ETH_SS_STATS:
-		if (lp->features & XAE_FEATURE_STATS)
-			return ARRAY_SIZE(axienet_ethtool_stats_strings);
+		if (lp->features & XAE_FEATURE_STATS &&
+		    lp->axienet_config->get_sset_count)
+			return lp->axienet_config->get_sset_count();
 		fallthrough;
 	default:
 		return -EOPNOTSUPP;
 	}
 }
 
-static void
-axienet_ethtools_get_pause_stats(struct net_device *dev,
-				 struct ethtool_pause_stats *pause_stats)
+static void axienet_1g_get_pause_stats(struct axienet_local *lp,
+				       struct ethtool_pause_stats *pause_stats)
 {
-	struct axienet_local *lp = netdev_priv(dev);
 	unsigned int start;
 
-	if (!(lp->features & XAE_FEATURE_STATS))
-		return;
-
 	do {
 		start = read_seqcount_begin(&lp->hw_stats_seqcount);
 		pause_stats->tx_pause_frames =
@@ -2551,15 +2578,23 @@ axienet_ethtools_get_pause_stats(struct net_device *dev,
 }
 
 static void
-axienet_ethtool_get_eth_mac_stats(struct net_device *dev,
-				  struct ethtool_eth_mac_stats *mac_stats)
+axienet_ethtools_get_pause_stats(struct net_device *dev,
+				 struct ethtool_pause_stats *pause_stats)
 {
 	struct axienet_local *lp = netdev_priv(dev);
-	unsigned int start;
 
 	if (!(lp->features & XAE_FEATURE_STATS))
 		return;
 
+	if (lp->axienet_config->get_pause_stats)
+		lp->axienet_config->get_pause_stats(lp, pause_stats);
+}
+
+static void axienet_1g_get_eth_mac_stats(struct axienet_local *lp,
+					 struct ethtool_eth_mac_stats *mac_stats)
+{
+	unsigned int start;
+
 	do {
 		start = read_seqcount_begin(&lp->hw_stats_seqcount);
 		mac_stats->FramesTransmittedOK =
@@ -2596,15 +2631,24 @@ axienet_ethtool_get_eth_mac_stats(struct net_device *dev,
 }
 
 static void
-axienet_ethtool_get_eth_ctrl_stats(struct net_device *dev,
-				   struct ethtool_eth_ctrl_stats *ctrl_stats)
+axienet_ethtool_get_eth_mac_stats(struct net_device *dev,
+				  struct ethtool_eth_mac_stats *mac_stats)
 {
 	struct axienet_local *lp = netdev_priv(dev);
-	unsigned int start;
 
 	if (!(lp->features & XAE_FEATURE_STATS))
 		return;
 
+	if (lp->axienet_config->get_eth_mac_stats)
+		lp->axienet_config->get_eth_mac_stats(lp, mac_stats);
+}
+
+static void
+axienet_1g_get_eth_ctrl_stats(struct axienet_local *lp,
+			      struct ethtool_eth_ctrl_stats *ctrl_stats)
+{
+	unsigned int start;
+
 	do {
 		start = read_seqcount_begin(&lp->hw_stats_seqcount);
 		ctrl_stats->MACControlFramesTransmitted =
@@ -2616,6 +2660,19 @@ axienet_ethtool_get_eth_ctrl_stats(struct net_device *dev,
 	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
 }
 
+static void
+axienet_ethtool_get_eth_ctrl_stats(struct net_device *dev,
+				   struct ethtool_eth_ctrl_stats *ctrl_stats)
+{
+	struct axienet_local *lp = netdev_priv(dev);
+
+	if (!(lp->features & XAE_FEATURE_STATS))
+		return;
+
+	if (lp->axienet_config->get_eth_ctrl_stats)
+		lp->axienet_config->get_eth_ctrl_stats(lp, ctrl_stats);
+}
+
 static const struct ethtool_rmon_hist_range axienet_rmon_ranges[] = {
 	{   64,    64 },
 	{   65,   127 },
@@ -2628,16 +2685,12 @@ static const struct ethtool_rmon_hist_range axienet_rmon_ranges[] = {
 };
 
 static void
-axienet_ethtool_get_rmon_stats(struct net_device *dev,
-			       struct ethtool_rmon_stats *rmon_stats,
-			       const struct ethtool_rmon_hist_range **ranges)
+axienet_1g_get_rmon_stats(struct axienet_local *lp,
+			  struct ethtool_rmon_stats *rmon_stats,
+			  const struct ethtool_rmon_hist_range **ranges)
 {
-	struct axienet_local *lp = netdev_priv(dev);
 	unsigned int start;
 
-	if (!(lp->features & XAE_FEATURE_STATS))
-		return;
-
 	do {
 		start = read_seqcount_begin(&lp->hw_stats_seqcount);
 		rmon_stats->undersize_pkts =
@@ -2681,6 +2734,20 @@ axienet_ethtool_get_rmon_stats(struct net_device *dev,
 	*ranges = axienet_rmon_ranges;
 }
 
+static void
+axienet_ethtool_get_rmon_stats(struct net_device *dev,
+			       struct ethtool_rmon_stats *rmon_stats,
+			       const struct ethtool_rmon_hist_range **ranges)
+{
+	struct axienet_local *lp = netdev_priv(dev);
+
+	if (!(lp->features & XAE_FEATURE_STATS))
+		return;
+
+	if (lp->axienet_config->get_rmon_stats)
+		lp->axienet_config->get_rmon_stats(lp, rmon_stats, ranges);
+}
+
 static const struct ethtool_ops axienet_ethtool_ops = {
 	.supported_coalesce_params = ETHTOOL_COALESCE_MAX_FRAMES |
 				     ETHTOOL_COALESCE_USECS |
@@ -3010,6 +3077,14 @@ static const struct axienet_config axienet_1g_config = {
 	.phylink_set_caps = axienet_1g_phylink_set_caps,
 	.pcs_ops = &axienet_pcs_ops,
 	.stats_update = axienet_1g_stats_update,
+	.get_stats64 = axienet_1g_get_stats64,
+	.get_ethtool_stats = axienet_1g_get_ethtool_stats,
+	.get_strings = axienet_1g_get_strings,
+	.get_sset_count = axienet_1g_get_sset_count,
+	.get_pause_stats = axienet_1g_get_pause_stats,
+	.get_eth_mac_stats = axienet_1g_get_eth_mac_stats,
+	.get_eth_ctrl_stats = axienet_1g_get_eth_ctrl_stats,
+	.get_rmon_stats = axienet_1g_get_rmon_stats,
 };
 
 /* Match table for of_platform binding */
-- 
2.25.1


