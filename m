Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0835060A2602
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X79BKMyi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PCl5paKLPQocqQRSpft8gNyTDLgCW5ShPpyIamnv07o=; b=X79BKMyi4d3XMxhsjY39zWkSre
	VQ+iVasN3mD4pjQZKAdTyODXqOjEpgBuP8Wo2MOaFcCZJhWEsCRbH41moem9KKFYX3at8w00eP1kP
	Ae24ETaI+xZfggbIF/mxp1VeUZDQN1hIzSPmn5qCF4kcoM+YsCvb9ccG3MvE0Iw9TG42QSP6tXQyr
	+kmMa9IOcM1fBeGh8ntE1j6Vxsazru+axlbaDfLWWMAOKXjbuyIExCK2NwZ/VJprG8AAuHuP6quDK
	jopI6KMZTMgCj25pBhQ8yO/5J6A3UfJZn2T2gnlWJ+ozBiWJZ7Bj1k1t7ekApNXeQiSRTzJcg4rq7
	i21WVMmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Q1-0000000BsVF-1FC1;
	Thu, 19 Nov 2026 12:39:13 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Pr-0000000BsOw-2QN1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:39:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMHU1zeHUjgEIjZi/s1YCWwbv4onF7VuSlVFbaMMF7CaHt+DujiU7K/G6a+vtrDyDGPpwG5o4jW8oBpkOUJrfeP2q/OL5ep866iYVrBR6g20OUSBtlSD9rBkQk0/0Zzs1UXGdOAEA7ZKZKi79+KiItys+OEVfS8RUHI0MIuNQ2c1MlqgSAOPmZwx3wNs/aJ0L+z9SRrB0QfT0pqpwXbUkdvdygXZpAb7ZeyIv0y3M8WdO3gf/MnEjErzWChnrN8b2Km437/tZcRPKucwjbwykHeTkgtAjujEeltKqLREQXbYnUtmRYGtYmuLTdJ0shlqTZfzvZbIoWm55roQGzBcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCl5paKLPQocqQRSpft8gNyTDLgCW5ShPpyIamnv07o=;
 b=LEsDSkRh9S1PY2IgRqeMFaj8uKXgrTr2kJu9ybuQdMQSxyWM1dwVPN4yzKGMOldzWri2PpedtlKV8TO2vk+MT39F53+X6QO3M6PbQEYfQ61jzNRIQh+RMkA9RL4Wp/wSSxpubFxdwrq/2uKKWNrfbVdw8gTnlIz3L3apLm3Bw9C+P8iLLP+0SDUSgui/0J0R/yhbyRmKbuO78KVnJ4ap9QGB+5jiLBdeYwEY/or55gqy81zcRtA3HTSYn+cbvRMwcAvZWHNe1l57sC6FVRq/ydh4gTms0ViyJHYIBSdY03l6ZGbdYB7hqqE58veHQ9mE2I81XfBmmYDbwq45nSrjhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCPR01CA0157.jpnprd01.prod.outlook.com (2603:1096:400:2b1::10)
 by SEZPR06MB6302.apcprd06.prod.outlook.com (2603:1096:101:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Thu, 19 Nov
 2026 12:38:52 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:400:2b1:cafe::9) by TYCPR01CA0157.outlook.office365.com
 (2603:1096:400:2b1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Thu,
 19 Nov 2026 12:38:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 12:38:52 +0000
Received: from cix (unknown [172.16.66.176])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4370540920E1;
	Thu, 19 Nov 2026 20:38:51 +0800 (CST)
From: Cunyuan Liu <cunyuan.liu@cixtech.com>
To: boris.brezillon@collabora.com,
	steven.price@arm.com,
	liviu.dudau@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com,
	daniel.almeida@collabora.com,
	aliceryhl@google.com,
	p.zabel@pengutronix.de,
	daniel@fooishbar.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	robin.wang@cixtech.com,
	cunyuan.liu@cixtech.com
Subject: [PATCH v3 2/7] drm/panthor: Allow operation without an OPP table
Date: Thu, 19 Nov 2026 20:38:45 +0800
Message-ID: <20261119123850.2994625-3-cunyuan.liu@cixtech.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119123850.2994625-1-cunyuan.liu@cixtech.com>
References: <20261119123850.2994625-1-cunyuan.liu@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|SEZPR06MB6302:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 98a9eacf-8ef3-44d1-d3e5-08df463a116a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|23010399003|36860700016|22082099003|18002099003|6133799003|921020|10067099003|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261021123027099003|261022105027099003|261021121427099003|56012099006|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: Ob7Yqw0ZFtcti/6y2vWkWHwN28CfHL8dYrToHeNswbzYlq2DUsng/YbFKocRwyK7JFzpnsWpwcw74X7gLqzkAXDnXGc1CurYO8E2AsTNV9opfSch5hCjXPySZdfwyfjwXuyhSjiv1kF4iBI+cUsq1w+QNVewLQkYRa6UwQZsW6mnjj1llWMvuip0FdH7j1h48J21A52y094lABn0FA7aBNs2phLEjAMadvuG2KK+vHRfKx3K/Bi0K50tfNCS/x4ULYfx5xgZ64gt0KdXDINQa74B/h1T3omM41l8Y/iwR6/GgDWJVZpQxhYodJcXhnittGftgiHpzNVEtml4anIVAbmAfIYXMM+PYWp6XDoxYBJIhqRg+wpRhaw+EfUlaWsRf2F0mJytgCK2AVSwCMUSzjldyCrOtGa9pmqedCE1EDu6ergfDjVbH2nXWf33TDTSNWZW0NN1Mi2wvaMptdK8ng/K4hUX6f8iFGr8NoVoQslYNXeGApyMgZ9vLVsMbp4S7G/2xY/eBlQBpqNBBuGzZovSHA/pz1WZz/Q5AZd4InCqw0xjEfaGQD0omrdLQOu2319VILiNXGoNTToB6MMyyZkASFhzeYavHYJB6WqR6V3l70rxrpTWrkhxiTGMN4DM5kk9YJK1wmYG3/YJ5e8MQHNEsI/BOs1jndQCsQl1mvqLIe6olmovyz6TnO0olK9uFaqwDadOrAijOg4OxpmBy8KadCkVrfquV8ezYBgny5TA62XCcXEP5WDD9ve7Asyv
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(23010399003)(36860700016)(22082099003)(18002099003)(6133799003)(921020)(10067099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021123027099003)(261022105027099003)(261021121427099003)(56012099006)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: y1tDQPFeFRN8s3DScqiRO/G+zZvziCiUV2sDb64gqHvBXemv5geHQ1L2PkMPm5MR6GU4c516Cv0v4eDMt+IQ+MyNHizQyhqI2jhYlJFwJDy26MDLCtOHk1xTq3CUzdzJrI91W7s9NsN2ZYCLnAac6sttjUgl//62d3IyK6UFtjPyA9jRzUu/R5lp22BaBxnes+ixCNDZuzHOyaHvfFkbznpx7nVWKC0AdWW8ybzbhTkpyY1eb6EaMANNU9Cr4jeLb0G4jeaYMq0Eo+VAEsO6eMYXXsbLx3UJ4iZRGVnsPK/2POfYYuGrLuxjtUhx1W/dSVTs2T1TDZJew/DyB5OUZ0MSTCqepOGTx2JMjgjmjcQJqmKqTWq8C3zJNes2RmgbafCA6Pr2xv33Y5nI7mNwVcSNm9Pyrc5TyC7foie5NzksrTi+SPQPA/CeHTgkVDXC
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:38:52.1731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a9eacf-8ef3-44d1-d3e5-08df463a116a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043904_831673_09C5C401 
X-CRM114-Status: GOOD (  14.51  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some platforms provide GPU clocks through firmware without an OPP
table that the driver can use. Failing probe when the DT has no OPP
table prevents these platforms from using the clock settings already
provided by firmware.

Continue without devfreq when devm_pm_opp_of_add_table() returns
-ENODEV, as Panfrost does. Keep the current core clock rate for
profiling and report the clock provider's rate when devfreq is not
registered.

Only allow the fallback when neither mali-supply nor sram-supply is
present. GPU supply properties require an OPP table to configure and
enable the supplies. Without these properties, the platform must provide
a usable clock and power configuration.

Signed-off-by: Cunyuan Liu <cunyuan.liu@cixtech.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 13 ++++++++++++-
 drivers/gpu/drm/panthor/panthor_device.h  |  2 +-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 2249b41ca4af..778c20f0921a 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -6,6 +6,7 @@
 #include <linux/devfreq_cooling.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
+#include <linux/property.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -172,6 +173,16 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 		}
 
 		ret = devm_pm_opp_of_add_table(dev);
+		if (ret == -ENODEV) {
+			if (device_property_present(dev, "mali-supply") ||
+			    device_property_present(dev, "sram-supply"))
+				return dev_err_probe(dev, -ENODEV,
+						     "GPU supplies require an OPP table\n");
+
+			/* Keep the clock provider's rate when no OPP table is present. */
+			ptdev->fast_rate = clk_get_rate(ptdev->clks.core);
+			return 0;
+		}
 		if (ret)
 			return ret;
 	} else {
@@ -324,7 +335,7 @@ unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev)
 	int ret;
 
 	if (!pdevfreq->devfreq)
-		return 0;
+		return clk_get_rate(ptdev->clks.core);
 
 	ret = pdevfreq->devfreq->profile->get_cur_freq(ptdev->base.dev, &freq);
 	if (ret)
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index adbc2e2f03be..f5353372c1ae 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -328,7 +328,7 @@ struct panthor_device {
 	/** @profile_mask: User-set profiling flags for job accounting. */
 	u32 profile_mask;
 
-	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
+	/** @fast_rate: Maximum OPP frequency, or the clock rate without OPPs. */
 	unsigned long fast_rate;
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.53.0


