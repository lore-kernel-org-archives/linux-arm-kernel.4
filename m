Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5669606A8B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0lHgZHVC;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3SfoRGis
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=urtcCVDZ0ACMntiD8yFZkAoWtHfGygLCQYrOmcndWSE=; b=0lHgZHVCSgUt9I4kI0gULCa+qR
	Uzsz8ocdOGIbSJiplEt5ZNaHUZbLC3dCHeMEq7fZD/LoGwJUYrlOiHD6FZL0WDelRexyZasgmRwEA
	wSQEW2fMC5T8/v2z5YhNeevxp8JNlIKcJCROR5kgtHWlJI+A+1L/HJ2OGCavKViYYER/lRi74XM2S
	CjRTP1aWAUqBi1o6YqT+1keHPjgKupL+8U/J8epLTQVZt6mJUt/t8l3Dh7/mb4GBXPDcBsgofBlX3
	MZHYf4zEe9qlNVidnfaFY1xRBRMf1AnwIrX8Bv9i5l8V/pL52wTQrq1yXsU0U9keqeUBAhs9SitjJ
	9XmDXShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH4u-00000008228-40ah;
	Wed, 11 Nov 2026 22:46:04 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH4p-000000081zZ-0vuM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:46:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ucj/nunbZmfW49a4qwJ9d6TegKGy/90eNgv5dI5tBWu8k1SqwCUtkqfiVYO/KzC960p9qVu+dqHS+8yEVcBNgMhCHxtElRlZkMxsG5qpUAes3dH5vN8K7My17JwkcxLYx+UyOu5SHquK9nvp2OJGPeE7un//uZWl3g/UdKbETzY3cVuAvd4hKD22aRHVyZsH+xL456KSDq5m7XcFBj01FVFJnUxd7eRhhDHx+PkfXeYxfIvGrKV+bzAGzwflTkn0VIVRGbwTgONeuxJXMUgufxH54qRGismHcZjGkSdpBq/CNV+MXgUWVpGRDuBk+nNV4XrIGma/FZaupDWIet/Xug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urtcCVDZ0ACMntiD8yFZkAoWtHfGygLCQYrOmcndWSE=;
 b=AWUekrimIOgm6c1+Ai87Y2dMgUyu6vnImA1aZP94yej9bpFqmRmP78FUVN8grJlCTD+CuMf8mYD49HKlFDNGy06mkArSSxhJ4ddG2M4vzwCMbBf1650PNwIs3XPZAYZ0hulv3vp8oYRXN75dpLI3TpfjZRoYqxjP3RG3k0700FKmOP75VtJZVm8Bne8zq5+6GKGIUvOWOwoB0n3KRmfTOubVJhYPEeeQSqxOa4H0FldjwLSitah2TQ3jRFmAlAhNffZYtlpB8ikIBm/d/tocF2NPRbaN9T2KvRB8hkyrLDOEzXcxzAGbr2g+kWijW0xAtiezoAUCFxr8sT753p5cQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urtcCVDZ0ACMntiD8yFZkAoWtHfGygLCQYrOmcndWSE=;
 b=3SfoRGisS9bq1arQnMHxqMVcu4z0PGJVHJRr1P/pyBPpKW9s0ljUCqODNMrndHVIwIPmVnBFdfwG9BZi+ddkdcEiYScYmsX9cgB5r1+GPwovLI4qMyILVk1twOZZ4RzBv4/6X8u2wcYTEDJEi5Z4FgSsqqk04c+mA9OcZGZkIsc=
Received: from SJ0PR13CA0023.namprd13.prod.outlook.com (2603:10b6:a03:2c0::28)
 by PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 22:45:49 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::8d) by SJ0PR13CA0023.outlook.office365.com
 (2603:10b6:a03:2c0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 22:45:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:45:49 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:45:47 -0600
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <ben.horgan@arm.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <x86@kernel.org>, <fustini@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <jlayton@kernel.org>, <seanjc@google.com>,
	<ewanhai-oc@zhaoxin.com>, <binbin.wu@linux.intel.com>, <nikunj@amd.com>,
	<ashish.kalra@amd.com>, <peterz@infradead.org>, <superm1@kernel.org>,
	<thomas.lendacky@amd.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <ricardo.neri-calderon@linux.intel.com>,
	<darwi@linutronix.de>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v7 08/19] x86/resctrl: Register RESCTRL_GLOBAL_ENABLE_PER_CPU when PLZA is available
Date: Wed, 11 Nov 2026 16:44:01 -0600
Message-ID: <ddeebe4ac2708a57cc91a3a34e08e7978bd4a8cc.1794437052.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794437052.git.babu.moger@amd.com>
References: <cover.1794437052.git.babu.moger@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9d9815-46b2-449d-8178-08df40458844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|7416014|261009223027099003|10067099003|261102123227099003|261021121427099003|261022075727099003|11063799006|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3e8Qka9ZRhlVS1yyVa9UOkNasbfPsedjDjFhJ4JjvfFo/ww62vlIh3U0gK6UX6zAUE/xntK178u/1Xo7W1i5YwBGbCTezYaIe4pvq05u0eOZ/1BfdYyuQY30hL/a5e3OZ+1I3cYf9IEtBx07mXj+cHac+293jTq0NPRhiBoUfWItvhZgq/0P4Na6Ez9CXyrBQUz2wBILn/ZA/JPOYWad03RXxVMG4gRI0YvlntFmsFHOaRHpmg7dFiuiKKXIZSMFK1SNwKs9vIPkCLjcbwzF+4cvY20Q8+BeiZ2TxF2kvkFyKI5CALYL0y1gZrms2KTBiMxR1LekZRQUB0fLlZ+YLe13EDe5lrPGOwx6J4hUAM0v9TOyr2ioYM7Va/5ZY+/tc9ajhUUhzvmPVuiipVSYqgM+EiQacd15UJ6y7t98qG2vwTHYut1opoo0O65xROkXOCm+ohNeGAuDWXIFnYvzRrxmJBO78zzIvcvCVAeJ1MNZkP/xyAZ5pEdaegkh09zvixOuHap6XIipkag4VCaJ/3q6fZVTu91NcESiOAClaGsjl+ZxMuXzyu31UHyAoNDNqNaHnRygnR5vbg13ROaG20vt5POtdJWsVUiAbct2Y7qlBo7gQYJ4n2kwafXBqkijgXRjFgDzm2y7vQsVJSMPzIDaM/bEmAvsyaZqXJAODemHzItfObmT85SE1vTMmSLsVavTf4km8NvSuxJTe86eFA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(7416014)(261009223027099003)(10067099003)(261102123227099003)(261021121427099003)(261022075727099003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PdB6f1GKohKWkrTtFyr/5fyC26MsTK5LCdR7yqDjKlUvgtACxJVMdC+iI4Ufphi8poImQNlBuOuagTpEeOZW73ipENz5R1brzDtc0YAsQHexHC/D1wnT1Lzg9UmF+sREDmI3Ck27vz/7xFofMzzRfHsrcn8y815MB3v/sPzaCSm7iqg9Dvmjlnav31XPMbi2pf7gJ440T010l6r1/cr70qrsgm+Iuf7BMx6WqfEKkwkOfTxYqlfyhkGRd/HDAWmjyCHfyCQ2RhrUQ4kMLQeKQKkU1hyGusgczvAM9HHHWb6EjPR8Li3lWjuJMdsuNkyu6EpA1KuCYph4AgDEwxF1Y18Rb9fTwWhb/Koqcpby97BLg7yAcC8LUf7s7ETZrohMT4O9T2P4wX8i3Upvz5DpHkQ9+K8hTfHD2g/Hdz3/mvg8cupFUBqo2XCoxPQJcyhW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:45:49.1750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9d9815-46b2-449d-8178-08df40458844
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_144600_233131_96D87215 
X-CRM114-Status: GOOD (  13.47  )
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

PLZA (Privilege Level Zero Association) provides the global per-CPU kernel
mode, RESCTRL_GLOBAL_ENABLE_PER_CPU, which enables a CPU to use a different
CLOSID and/or RMID association when executing in kernel mode than those
used in user mode.

Register the RESCTRL_GLOBAL_ENABLE_PER_CPU kernel mode with the resctrl
kernel mode infrastructure when PLZA is supported.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Changelog Update for consistancy.

v6: Use RESCTRL_GLOBAL_ENABLE_PER_CPU.
    Rewrite changelog (not a bugfix).

v5: Update the patch to adapt new data structure and resctrl_set_kmode_support()
    changes.

v4: New patch to set the supported features during arch init.
---
 arch/x86/kernel/cpu/resctrl/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index e64e9191184e..14530c11bbd7 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -990,6 +990,10 @@ static __init bool get_rdt_resources(void)
 	rdt_alloc_capable = get_rdt_alloc_resources();
 	rdt_mon_capable = get_rdt_mon_resources();
 
+	if (rdt_cpu_has(X86_FEATURE_PLZA) &&
+	    (rdt_alloc_capable || rdt_mon_capable))
+		resctrl_set_kmode_support(RESCTRL_GLOBAL_ENABLE_PER_CPU);
+
 	return (rdt_mon_capable || rdt_alloc_capable);
 }
 
-- 
2.43.0


