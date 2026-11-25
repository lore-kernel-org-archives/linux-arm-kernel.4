Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6EB606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tTGnG6ml;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BvYI005m;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wb0d/hd+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dxctmJflRuL9zAMiAR3q+0VjVS8neVLlMXccxHlJrzs=; b=tTGnG6mlIzYnfPKYscdI5pa/mB
	ilsi64WTou1E4cfBE+/Z3mU2LPcII9VS6x32bM/neUA6NFGS10iDE893YqbWRrPBzQsM7ajm6rOIl
	NjcblWqvDcILeIr6LOmR3qstJ/0poY27KzMosHz01l9QkiKM2WF8Ud2kd/mdbPbDT28g8PB3bhF3n
	rx1YflxCllAlad+0wuu2zfNEr2CEeLewkpt8xLQVOrbOedFn7oZKXTOUz9VsIB4dG1R6aXM/rlI3q
	p8/5DsGGP9iHUFnUtiDQTRo1qm3ECll9ssB/9hIkrORPU/8lNFbD6DJKtIqksbkDYEdlTpOYAygKW
	y9Ptj8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBWu-00000009iu6-25t0;
	Wed, 25 Nov 2026 11:51:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBWs-00000009irX-0HZG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 11:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dxctmJflRuL9zAMiAR3q+0VjVS8neVLlMXccxHlJrzs=; b=BvYI005mjiRNaD+DlYxQSyD4Q8
	vz/OUsoTBnELjXHUW2QmvZ4srX53BVdz56BJTScFyBg8unaonSLP1WGl7qvbPxM5t0pitfbMBCvt+
	nMSetw9BmGUajFkI0Z6fnS3itdAX3/jadz756hFKAz7zXSiI837xPFSLm7oP9AFMvcAATVpOHuucj
	vc8VKma6CQie3+WgckE8lVUjBuBPpDwtCFPN1nKlkv/nGrac+8p0uTRBULERrzHMBaHcj7EPG4/L4
	YOuuOfNtH7fRu72Zx/LwYHjqNKs7MD34z+WU7m1zqTOgvAVXXgQtuvAzbhzXVzgy0R46CzlfXuNt6
	82G9gpWA==;
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBWo-00000005G7a-27H1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:51:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+PCgK/LJkXOiHwR8v6efZEpM8UiAO9kuyr0pMXidwGRtviZIytxf9nZr/omPr5eMjtd7dvIuotoaEMD7nvOIhiHOpMueZvXIsVq/IU6r0PU9t7zwfIwgkSYNdh2Y6lycPVY2V8/g6NlfHH2sElPSDDohdlMqiPVLSEQnf+qJSYF676+7R6XLsvdm5W6bwA23RTJBy3tp0lhhdH4taWzltY95evLJVPTcC+zRWzr9O+BuP9XCWopkYJbc2nmdrPnOZYy1a/la7hdntUcGiip89NHJUsMerVZfbu8k3BH8W5iH4qDriAUlafPxzKIDGcSERWW1GcqZuakifAUCVNmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxctmJflRuL9zAMiAR3q+0VjVS8neVLlMXccxHlJrzs=;
 b=qNzqsoiyTvc6ls06ynva0NE0sU6Bb7gJD6LIznoCQnPesOlVTk2oKucEBMt0ZVXz8E9lh2grXZO5aS++E1UK4nwj9l02jhb7h/GdHilPfzCSgVJrdGdfwZNqmhFe94ELLRrTLwtW6+DCa9jPQBMD8LUe1q2pt+6UBasgS9fYAMhr4sKOQiHjWtXPTG3yIXbidWc9ZnNDKgARkj4F48248KfwgjPi550vpbyrocY1c1y6Bs1yUgTy/l0fOHVGfH3QIPEIoZGifZKes7D5V9k4vcLzYaldEJOJJ6LudaESwVjHQ03t5MVqiK8PTzaDvuNLuvAdOyCLLR6mxiz262WUQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxctmJflRuL9zAMiAR3q+0VjVS8neVLlMXccxHlJrzs=;
 b=wb0d/hd+TnEGmvr7qh+EPcYOpCEzk45slXd07jR0W6uxcepRcSL8e1wQg5ecQqp7lkWkTB/G7PVp3SoE6d/MkVoRwKKaUoSATpHhIzvUvHXlgpIabklaFsk3Q1kvLGLlnJhN1NjSNROs5VaAU5FVeSl5S19RTJGMgjjHvhdPoqo=
Received: from BN0PR04CA0053.namprd04.prod.outlook.com (2603:10b6:408:e8::28)
 by DS6PR12MB349270.namprd12.prod.outlook.com (2603:10b6:8:52b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 11:49:12 +0000
Received: from BL2PEPF000352CB.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::41) by BN0PR04CA0053.outlook.office365.com
 (2603:10b6:408:e8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:49:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352CB.mail.protection.outlook.com (10.167.249.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 11:49:11 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 05:49:07 -0600
Received: from xhdrdevl202.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 05:49:04 -0600
From: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michal Simek
	<michal.simek@amd.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<naveen.gaddipati@amd.com>, Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Subject: [PATCH 4/4] ASoC: xlnx: formatter: advertise up to eight channels
Date: Wed, 25 Nov 2026 17:18:39 +0530
Message-ID: <20261125114839.3642735-5-katta.dhanunjanrao@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125114839.3642735-1-katta.dhanunjanrao@amd.com>
References: <20261125114839.3642735-1-katta.dhanunjanrao@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CB:EE_|DS6PR12MB349270:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cfa01d7-da23-4f94-0e38-08df4aea1f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|23010399003|36860700016|6133799003|261009223027099003|18002099003|22082099003|56012099006|11063799006|261028144727099003|261102123227099003|261021121427099003|261022075727099003|261022105027099003|261026140227099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: 5nJMA/n18zvORyrKuSxivzH2ACDoo53iPQAepAseh2vunheBosC3ABoA0P9Bp7kiA45reOO5ALLCTQGosCQRB9PwNi7PMHVhY5avsKuYkyx2TXiWJhYf0UoZUF88l4VpXktcWFJKwijtPGoR+zrHdUkQhVRlp28sP6Dy9VD+ufw8EL2dDUUpXJtBemnJYd+kYfwy+vI2O5kvXkyKAav8Fidb2W3U9wSPo5Ht3F3srBLH25P6xJzjAFTTjQHOmQ/pynjdPO2P0bGn8pTACkCJUptX1oTPTORlci+ZbnqfmF33NRwdm9WJVkAr1Mv7lm2G6UXyFO0/kMrjzOoxd4OI8uG0XXlEdgJVaqZxdzXzPCxSXC+NBShvq5gvlODDtGPYJ12LRL1JwTFTWBE37oBtzqFiP/1Ror0/Dp24JdcgsuI7RHKTFPJwB0tM3T8QEEOZLq/Wr/m6rcjn3a/v9XfbTF/yKd9B2enCKuXm7qXtzrhT9HmJAKoIepI7RW5Xe2Hxt5q8WLDWn3iqwzfIRKvwG/aBEqAdLm2maWDWYtfhs+vq6ciDlGH8hG9pGyuUfsknjlFlPXlug1n3xa/0650KPj+y2sgkuy/QhzuavX02R2K4MxnUGNE5AndR66YETNH2Dhlq4FvDq7iQU6nrIZhSLuH+0DNym2HN2AIdejpH3V+PIW/miB75uk7VKIqTQV5i
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(23010399003)(36860700016)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261021121427099003)(261022075727099003)(261022105027099003)(261026140227099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: agENXkjJci49Z/uasldl6sz9yODvfBbr32FaUXQc+0Jg3Fs7R5U2sgM/fQxg3kVoQOtW4+6IV+61hvkxqupzePA/UkJ7Bb5Wjzto6aFHqJlSgOvtwlUNvWGFqg8OyTXScLjbkFq4NLKCnCH0IpbBQ1VF68GWpsNC0+lGMZKwlbsDqsAPdVU3h7tEkSspPjRYREjGpKsFafW8YOWzDNRtN2NqfxeSuODGwhY5IifRzqCI2rInA+uxsq6tOGk9KuQTUHrhMwwy4dPL7X50FgrdmxCQxCyWpuEe6CYNUs8U4SDpjertIsz5k+UKPF69CsheZJjZnLGz5U5R7NOc+c/O4bV0Ff7HejttbS/oxs+4GwPimKcK69nufhi0odLC1mvq51zgPpzxufF7Kh2uyP4bxfp0NVT+bdmafV3pxWHJ6B9hdDvCaCEVKu4IAB2KXq41
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:49:11.9264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfa01d7-da23-4f94-0e38-08df4aea1f68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2PEPF000352CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB349270
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_115110_465165_DA77E598 
X-CRM114-Status: GOOD (  15.97  )
X-Spam-Score: -0.2 (/)
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

channels_max is two, so a design synthesised for more than a stereo
stream cannot be used for all of its channels.

The active channel field in the control register is four bits wide,
and hw_params already rejects a request above the channel count it
reads out of the core configuration register. The advertised maximum
only has to cover the widest configuration, so raise it to eight. A
two channel design still refuses more than two.

Signed-off-by: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 57901c9466a0..d64b27a84177 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -109,7 +109,7 @@ static const struct snd_pcm_hardware xlnx_pcm_hardware = {
 	.formats = SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE |
 		   SNDRV_PCM_FMTBIT_S24_LE,
 	.channels_min = 2,
-	.channels_max = 2,
+	.channels_max = 8,
 	.rates = SNDRV_PCM_RATE_8000_192000,
 	.rate_min = 8000,
 	.rate_max = 192000,
-- 
2.34.1


