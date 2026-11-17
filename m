Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A25606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G2DXJwRl;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3aO3mdiR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bagDRukm05S0b1NBhBusVsQL822xrebrr7lacm2MVrE=; b=G2DXJwRlJbuSkcOCtjOcnlQ+Jo
	fTZQVFgiaE5/F0ooR4R4KzZoydVJ9fmcalGUEZAns9B2yfEuOY+1HMB2hZQnSaYKN3l+8EZJrXXQ6
	r01SKWw9YdljKZTJnhMUcLV9LTP6HnWjXqaJMu8z+mcFu6z6GkOaDlvDQnPCBJfKxCunfTm/edPpT
	HP2g2oPfgugYjTPF3qQUsnlBcPjgK6zi5fzcBA8F3T3HPGUjlwO3VT0td0ZseGhbT1kDO7+cq7WY6
	3mECARTKV7jhAgodf61bUKwTlnqnqG5Pkhs0cwOwlT8z1Er8Mj8ial0jm6bpx+vJ9ZPqWLbA436dG
	50S+YxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF0r-00000004yM1-2oo3;
	Tue, 17 Nov 2026 08:58:01 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF0n-00000004yLa-2jGM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:57:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNW3qEvQFGUzfoSICWyjuJSxoFbok9NPtiMmcudx7emBkfsiNMGQY66eq5dh4XfK55xlLcsSAzDB4Na1rYTL+cysrzajKjINUyZlz3iFhhu4SVkGff9zL5qgiJMQO4BnGxSVcUOz9Gtyk9i4vxoEJ49JC23VU/1YyadIiM1UO42YJRUCPXT60S3auj5DMMXtgvQPa/Zy5rdzdfzS2PDMAjp0uvcjntOBr4O3NTOhvI4apnnQ5rm9kv9WBWZBHFFqKbBW57Q5sqNjWcMdj9nBeZYxNxwukkzD5EtLdRj29odhqY6cDku4e5a71ROMDX+SwhllBPTZnGiNB72VS+Yeng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bagDRukm05S0b1NBhBusVsQL822xrebrr7lacm2MVrE=;
 b=HBUAyvwZhON74Z/LNT7N9YxzhnRrZkvSzOqM7heVFdtvQjaOi4WYgDfZwr+HEpcG2hzD+NOeTab0C92Ks21Cgx9uPgN2FONxpekDCKg114MVqQ15t6lhZIlVl0txDhMF34BeLRrMlmyMNrvZ3A6q/VDLJdHF1CV5hNP/BudNyf7ivWS6/+C53FrCtiW9NaN3d1Oc8Lji5zEN3F30EwzDtXR6DZrpyMGm6SLGnjXWgg+WCed4g+VjNs0lG9fAs2SwWlGcUmzeZUGZQxuH5t9syLCQWrSfUvOdg7DQZFk3pA6Wq8cSUPhx/GbYXgg7HHsP9fm1uH9kxy2i6npx8afJMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bagDRukm05S0b1NBhBusVsQL822xrebrr7lacm2MVrE=;
 b=3aO3mdiR+GmETchUxuYuABnhCvUwxsgWC4MSMV736YV6EnDnzHL+F3cGyQdAqpsDWW4c2aEAUoP0is2QcBcKht6AYNpy5ssOe9YKPTvGYTYnQPmLPcf024aAjiLM4iB68gLJc/HAZ6D16FJF0IwAO9C0in2adYMdrbh02JkszOU=
Received: from BN0PR10CA0003.namprd10.prod.outlook.com (2603:10b6:408:143::35)
 by MW4PR12MB6753.namprd12.prod.outlook.com (2603:10b6:303:1ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 08:57:49 +0000
Received: from MN1PEPF000793FA.namprd05.prod.outlook.com
 (2603:10b6:408:143:cafe::7) by BN0PR10CA0003.outlook.office365.com
 (2603:10b6:408:143::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 08:57:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FA.mail.protection.outlook.com (10.167.249.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:57:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:57:48 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:57:47 -0600
Received: from xhdrdevl202.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 02:57:43 -0600
From: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>
CC: Vincenzo Frascino <vincenzo.frascino@arm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Michal Simek <michal.simek@amd.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Dhanunjanrao Katta
	<katta.dhanunjanrao@amd.com>
Subject: [PATCH 0/3] ASoC: xlnx: spdif: switch to the common clock framework
Date: Tue, 17 Nov 2026 14:27:36 +0530
Message-ID: <20261117085739.3807943-1-katta.dhanunjanrao@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FA:EE_|MW4PR12MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: d408e836-f92f-419d-d66c-08df4488dabc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|23010399003|36860700016|56012099006|11063799006|261026140227099003|10067099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9KYNGwcCEius64JNDLgXJHGaWmjhlRp/wSMisMekWFfBljf8rQfXvEC8kaw/mLzl+//WQCXWmKjT87On95+BvGFCzQI+bG0GwxlY7EzQP9MtOp7mdEZ2/cckAqdZG9AQuRnMpsqxW+8Pztn8zSfaLpV9Eb5f5h+9VoiOJWMb1Hdxu/OT7ViX4h1u67z4kzIFRYM9dbAqr1awrguk+fjdZAgAUPEpb5YzVhVj7WTux2+Nt1Mv0bmRPxZDtOj8sbIzpmsifkkwNdXzWcdbEB8O0mkMDNIvNNIJeTj8Prycm9ro1ivWQGmajlIlSs8WdTuQNKae2PA5HDkBorfcLNYdZRmYf4zMIcPobMaOHqkIKdftRnLkSg+Bp1s2Pv1uczJYc4gh9Dnt4/mJlkO5Z3rQTHIPTLjs27+QFHPywyAiyP6CypvjqGrcEOj7/h8khhYxXWQEYFqh1tb4w6jBZ2chJZGPo0L9th6pIcMq+0mtfTU+4ac8q6g4gpqh+Hh4NVaZnRyNeEk2Q5fFb0bb0BxLX4FVZ04r9WFZPmHD3WcSFydlFkQh9AuIjx+KNzRtZPJdM2tHXiIeh9iZI1jnaHkbKpO12GJM9MNzJzECEjArhbv9L4q+JR54cDLumJHIBc39X9/L27AX/a7ZDnXWi+KAqUAKkmPCzRGb6ymGu3BpzMPtGbkImln8ITHTOqYolZ7l5YJrdLhvmCxGaAIrXc+sqg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(23010399003)(36860700016)(56012099006)(11063799006)(261026140227099003)(10067099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rmL7o5f//kH1KrO4rnSMWXwDmXxTrwBa/dALM/g6uwBY0QtpmJIVwFO5Y75vL/JeV1THz7gcLFnxbDsIK3WDPYEle8d4M5Apr0Vy+tQzGJYTlKO7o1EEfPeCD1RkKjAdh7RRrf2xgNUhXq9ICBEju7d5xtrQklwhKcKinurBNXsNQk8oMW5DFjaUNhoMLnx/BzIbIkyKiRdbYACpgt4z3jTKCRyobyIiQ4Sb9bNjpnkXepuxTGCD/u7Lk3FWZQyQrxBjVoLkECilnT9H/WNgU6MYrIUf8kSD9MiOkf+NACRAACQiRpVQx979vwIGWa0esdP45n7hskvezJ+Fc4gdwvpo8cJQ5me2skmxfITNgRsm2m2Jd0yU7lVkyp0wklP6rSpzNcaXqlKdesTtl9HGUQsrphlH91qBOiEwPZiT9k8yz84DMXaJSB31o0aEKZrq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:57:48.5511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d408e836-f92f-419d-d66c-08df4488dabc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF000793FA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6753
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_005757_715427_A4F59528 
X-CRM114-Status: GOOD (  12.43  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Xilinx SPDIF/AES3 IP is fed by three clocks, but the binding
described only two of them and the driver requested only one. The audio
clock frequency was instead passed as a plain number in the custom
"xlnx,aud_clk_i" property, and the driver relied on the firmware to
leave the audio and AXI4-Stream clocks running.

This series describes the third clock, requests the audio and
AXI4-Stream clocks through the common clock framework, and reads the
audio rate with clk_get_rate() so that the SPDIF divider follows the
rate actually in effect. A tidy-up of the register defines and of the
divider values comes first so that the clock change is easy to read.

Patch 1 describes the AXI4-Stream clock and selects its name from the IP
mode. The minimum clock count stays at two and "xlnx,aud_clk_i" is kept
as deprecated rather than removed, so that device trees written against
the earlier binding keep validating. "xlnx,spdif-mode" becomes required,
because the conditional that picks the clock name keys on it and would
otherwise also match when the property is absent.

Patch 2 names each register-field define after the register it belongs
to, prefixes the remaining driver constants, and replaces the bare
clock-divider values with an enum.

Patch 3 requests the audio clock and the mode-specific AXI4-Stream clock
through the common clock framework. The stream clock is requested as
optional so that existing two-clock device trees still probe, and a zero
audio rate is now rejected with a diagnostic instead of falling through
the divider switch. "xlnx,aud_clk_i" is no longer read.

Dhanunjanrao Katta (3):
  ASoC: dt-bindings: xlnx,spdif: describe AXI4-Stream and audio clocks
  ASoC: xlnx: spdif: namespace register macros and use a divider enum
  ASoC: xlnx: spdif: get clocks through the common clock framework

 .../devicetree/bindings/sound/xlnx,spdif.yaml |  54 +++++++--
 sound/soc/xilinx/xlnx_spdif.c                 | 108 +++++++++++-------
 2 files changed, 113 insertions(+), 49 deletions(-)


base-commit: 7cd6b1fd8f9c1fcb1da1b761d502649f50b9800f
-- 
2.34.1


