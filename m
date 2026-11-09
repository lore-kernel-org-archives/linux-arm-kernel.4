Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8DE60A2631
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 21:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ajx8VNIf;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oK370N7P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+KgaJKaL0fS1dIVFu0rr1uU7UK5Z7gfzjoKXoKR5+o4=; b=ajx8VNIf+LmKG9
	HKnTnBX5bhiAeCsiy14fbG49n22FtsmGz6GCDOqhRmZChAJ3yUy04Tlz9/ecM8mr31awB/y9uSpp0
	UghsA2LZpXA16iFgmhEGw0nNdQKqciJVsRtKoAQ5tBjk0dv6QUxyYyRcYc2F2oL9uQC5Eomd8c3V6
	cxQ33G28DnODcDiYjOscBtvw/mxd1aQzaDlkN+lalmhoPM4NVJcvXnzWYBdGtDOMdB0/95d19iSn4
	Plxoa1acN0OfKKhNvNUcqbOn7zIEiqtBYd0e15Lz4ndaQt1MGiVvdkSP+eIKNQa7KQPltJ4KtI5W5
	qhriUlcZohPOT/HDEO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWrE-00000001kQ5-3m8w;
	Mon, 09 Nov 2026 21:24:52 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWr5-00000001kLd-1PDC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 21:24:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2IINL3BQ+ewHAKj78uCkIyl0ZUDM6ggKTEV6GZnjvcnf+u/WKWlhwEBCgbTSdultEAnvj+GfOCytADdd/mDeuQdBW1hF7RRp5eBHQK8quv4uqhe2Xo0pCXltXKJzVGapX3HsA5QHL/Flu2FalTaqT4qX1CNsgnorTCcaSmwHWyNOAcnDcALbtT4+U6plGf9RmBF5NdyGLu9mCGtm58IZdpKRR1lBulthvXK1SaooiDagn8HNMDOk0JQCnrSjS/QudXP+F+W8lBp8fuwUtyto3lDvnUqiWLPfZXqf7yllzxlhfKPNlRIXAHSgQ6BA12Z0Y9djLYggBmYr9rsRSoxsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KgaJKaL0fS1dIVFu0rr1uU7UK5Z7gfzjoKXoKR5+o4=;
 b=cEeitpYFNX+lnHzAXuAV4hln67PeqXQafouRVG6TSAz4YB3Wzhqjtbj1HWHlf55oyVfrw6Z3GjIRldaulMj/dBiRIt0FVJVGnVfJ+sVn3x7SJDDPJsIei47vQNRpG+kETz6tLf1xwLQxSR6k89EyCcoRbKFtW9uxPuIK4riwl9+fhev6RSQ+k7ari7NgiT5+2TuBoBdTIGNs4EuUehnZP+kqreFV56Uic7BVhK3oA24NvI/tjO8R8EmrzpzDillKvbZTxn7vaajA3jtLqcK3bPLt4Jh7nzApa7PNkJ+NHYpU272GWbY6HqXiJ7xSdOTIUq4gx3T+RwCmfqkGhHDXUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KgaJKaL0fS1dIVFu0rr1uU7UK5Z7gfzjoKXoKR5+o4=;
 b=oK370N7PRN/ygv7NqMO3JrvhUMQbzPeD+jvURj4wijg53OVLUpDzcn4jtraowhjgpv3yoU/muwOs56uC5p0Uq3HCdLDGomQb88HkJe8zSzk1Llu6eirIy51JYDZRG3KV7w80TjopVGAa+SpgThI5o5t5IqMSNCuE1aXrTpC/KJVzwLJsVOuktjjcC0ILci2G7jdD4AHLyzsHHwtDdOfn8j7Cxjs4YvA1IjRObHSl7G8Rpn4GLrpev1clSeG4WUml1B173rsz7BpIs4KLbtZGlOmhuVBrTjhKPld0gGR9nOO44xp9eQ5RpQ4d80KO/rQ4XtvReNRlIW0EtAXz9jObGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH7PR12MB6811.namprd12.prod.outlook.com (2603:10b6:510:1b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Mon, 9 Nov
 2026 21:24:36 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:35 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC v3 02/15] resctrl: Expose MBA MBM counter assignment sysfs
Date: Mon,  9 Nov 2026 13:24:14 -0800
Message-ID: <20261109212427.1409204-3-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::6) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH7PR12MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: b295ca4e-e405-4f16-87a1-08df3ea7da67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|261009223027099003|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|6133799003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261022075727099003|261102123227099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: b37AKZBdCV9Viqg+00x6Gh/tpJtDL6ID8/Q0lRdXAwGeRJVTJv+RztiD93WQbeeHyxjuQ8qRiqVhyIGbh/+rlo2ylIx/IJYA/U3NuIY1Dtj9cpktCJ3YwKmv5CYfoU7NTD8SB2uUo+2FklpAHzxg0TAQLCwixJiimH2kER2OyenkVJXYHcT21coF97MqeJfVcTah9hLCCaXvvL/MyrD7RY5EEk0+RrtR0aTDNgp7Ia9T1KOQXikOvWpb3D2rfxWqXw7of717dcg3FzxPGgPjZG5vhM9ROPO2eMIZa3JA2ONREbxhB7Jb9oZcdidibQPyf/o6epxpr+++4UX6G5YmrTyXXIXHKmLyIQkWVC5IWECkHohJGH/sNuSSUt3w6Xvfrx1PFkQZKz58kIRAOWAEufowAqrPTkJ6LFTH4VboEyVdCqnEZZL4cdpXQRIcCZSJ3USdzINEzh7NBIk2y3RpkYzZQPXFah9AZRwEVGwMK4B5rFzUSpIupk2nRmDsu7oXEU8N7NskHhURvibkFw8+t6XFmCIwn2MQAJltxaBuGqkzXxLKDSoctgLLTH8ZCS07OtfvTNsDFZ8kMUJVp4XtMCorFsTzxSkwc0i6VO73A7ecZrpaje2Kw35IHj9sf9dYUPdy+6Bp21Lzt/hsq+hYWod/GuG3aiwkuQCHhxO+zosqCbNlm7RikKdl5/MJEeBLjRdMstbggy4DH63NzMY5pQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(261009223027099003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(6133799003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022075727099003)(261102123227099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XD1oW2zRviGoadjNqegW/tH5sF4y5BXKdxL/GIqPTpHUIQdpl8cSyjI8L2oW?=
 =?us-ascii?Q?4dxVax6NAtbfZYCG1GK4DzYpFs3pZjoDugo8V2LteHW17KPPqW3m+QoYFhhu?=
 =?us-ascii?Q?9iAEk64Zqwk9gcBuXMqSlGoD8HB0UKvurIpOSZfh4pfmvLz0LYh9TKj/afhD?=
 =?us-ascii?Q?LUiS+tvW/V3EWTH2YrGkd15Qsfe+xFPZnvotQEDuw9xCgcB8FhbMNBbInBxP?=
 =?us-ascii?Q?ZTDh2rwUaIiadHBN9sauO65BcG8/jnLwacdaBb8nXOhlM6R/gWC+MupXe/v/?=
 =?us-ascii?Q?le42Tm/RuFyaha5ca0AutnBLE3ag8Gusyy1eGZ4EHPGiqeSk5xuKMBGDIVjg?=
 =?us-ascii?Q?IbSlfqKxO+2E1gBO7djqOd1Xr6dc7Zm58Znv+llx/wsUiz6eBGWVWVcwfemf?=
 =?us-ascii?Q?YR2LUGkgE4Kn+b9bysLvIBCbB1FAP3KVGs+AuFBigaItAvd7EEHmSW42gPME?=
 =?us-ascii?Q?rTMs95C2cw0Mcs6XqoGodHIMcoZHRQkTrTPuFGNwZt2jMzw4hI4gBtgzjrw2?=
 =?us-ascii?Q?yIaHFlrMciA81spKduRSBAOz4OYjNdbdR6rNviZ5yHa07IsLjSpx0HO5oi5q?=
 =?us-ascii?Q?gisIAI5vFmTT05enN8/e9fjjnGCIaqB/BxxEr3TOZ+de/dga0/uOUmmST7BU?=
 =?us-ascii?Q?E4zdlVSx9KlqSCHT2mqBuWJyihuOSeqNd5lpQvV6S3GWP6PrZLOYSULL2oe5?=
 =?us-ascii?Q?C+ySTQ8rHCinSGynf9vkZ2T4nl/H5nn1KJsCHS/oftVtSq+r2bjRX4qsqs5F?=
 =?us-ascii?Q?C8apZbxP61Eely5WbvBRJO3MtKOLO9tFjV/lTr+afTsR+r8t07Nd/Po3APPk?=
 =?us-ascii?Q?DqjN03C+nOBkLNWv4vrZiqphGx5zOobRi/idr/zSjeN35+nd1K/LwrRBy+cc?=
 =?us-ascii?Q?TsLCjcmRDeFCi7Y3iWjRHkePqAhoDkIfrtSSVblwjNc++WZSWBC5QQW0MrTE?=
 =?us-ascii?Q?7ls4eTtdKefFwxwVIR2PlQLJ2kKuDrLMSzBxKlbNiGGeoegkEADaHQJfGajw?=
 =?us-ascii?Q?+ILT4hn+HJoSSoCMzPQPcQzUJ9MvPiTKUEWRiYlIyobDQc4I5g83ovG915mp?=
 =?us-ascii?Q?6ahvpo9yEb72MafI1vSa2Rhzkz3qrLGGPCiuRM4IOh3fI6MRgqiX5QOcLEeO?=
 =?us-ascii?Q?Tc9sxwqQBrLUZuc/xR3kkD5x8uT5zX4mnl0zkO7qZ62b2novUErR2tWst0hs?=
 =?us-ascii?Q?8mF1865gEKHancwmhqg1htaLDvq3X8OS8BgLyieh2cslsiTx4dnunXpHLYeN?=
 =?us-ascii?Q?+OTvU87lNDOHG0a4VhOl652xhgXYYyAzm4ASXd9A6SKfpvxL62MFTJ5PihtN?=
 =?us-ascii?Q?j/LzxIif3vqrr0jubtYtONP6qmPqBkhl+r0SOaCMSHpktwIsrRU5dPsOvSpT?=
 =?us-ascii?Q?mKvpjzo1HjLc90cIbCD1UYq3/8subQusS0wZr/k3PDXn5pSbxqx32k9qUOV8?=
 =?us-ascii?Q?W0REwgTjiM6ANjgmiBS1jIgTC/CCwfRBxUSsKBg+xCBPkXcEzuS4ZY0bNz2i?=
 =?us-ascii?Q?pGI15c7rFyRbLxoeUznBoe+fWYhUMwDufKgFQMY8dtVtFqhlhEXE3bcgsg3c?=
 =?us-ascii?Q?9WPmllNhCR2Nkwgiqmx2D0LwvZL6sltFlM1tMwkTphs4HKszA0AOaXaD7Jo8?=
 =?us-ascii?Q?o4p762JMxZ5tgEu8rW7J1GXZwNMkyaOFjtpStnMxlqjAQPapjL4YkQ6GqJWh?=
 =?us-ascii?Q?JgjrZdW2wbiNY9LBu/zz5SqKIF2jOZXhNYEnGMeP7WPewjCMPN+bJpwYWBaC?=
 =?us-ascii?Q?977+Vsg8zw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b295ca4e-e405-4f16-87a1-08df3ea7da67
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:35.6205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YN/AMOvDB4Y/SWcF5pCoCQW4fZ7tAwnAsp1ZQRadUPiuJ0DwPTYERouSSzVu0r/FrpSpC3G2nJndBp4k6yAHbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_132443_958806_2AD1C51A 
X-CRM114-Status: GOOD (  17.03  )
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

When MBWU monitoring is backed by an MBA resource, userspace still
needs the same counter-assignment interface as on L3, but keyed to MBA
domains and exposed as mbm_NODE_assignments rather than
mbm_L3_assignments.

Add the MBA-side sysfs hooks and initialise MBA monitor metadata during
resctrl_mon_init() so mbm_* file visibility follows the resource being
configured.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/internal.h |  5 +++++
 fs/resctrl/monitor.c  | 27 +++++++++++++++++++++++++--
 fs/resctrl/rdtgroup.c | 11 ++++++++---
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index af2e6e0b2af8..32c7d53790ec 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -480,6 +480,11 @@ struct resctrl_ctrl *resctrl_resource_ctrl_get_default(struct rdt_resource *r);
 const char *resctrl_ctrl_name_str(enum resctrl_ctrl_name name);
 bool resctrl_ctrl_is_default(struct resctrl_ctrl *ctrl);
 
+int mbm_NODE_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v);
+
+ssize_t mbm_NODE_assignments_write(struct kernfs_open_file *of, char *buf,
+				   size_t nbytes, loff_t off);
+
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 2b5654f05480..5865a509174c 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -538,6 +538,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	switch (rr->r->rid) {
 	case RDT_RESOURCE_L3:
+	case RDT_RESOURCE_MBA:
 		WARN_ON_ONCE(rr->evt->any_cpu);
 		if (rr->hdr)
 			return __l3_mon_event_count(rdtgrp, rr);
@@ -1741,6 +1742,12 @@ int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, voi
 				    resctrl_arch_get_resource(RDT_RESOURCE_L3));
 }
 
+int mbm_NODE_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
+{
+	return mbm_assignments_show(of, s, v,
+				    resctrl_arch_get_resource(RDT_RESOURCE_MBA));
+}
+
 /*
  * mbm_get_mon_event_by_name() - Return the mon_evt entry for the matching
  * event name.
@@ -1890,6 +1897,13 @@ ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
 			resctrl_arch_get_resource(RDT_RESOURCE_L3));
 }
 
+ssize_t mbm_NODE_assignments_write(struct kernfs_open_file *of, char *buf,
+				   size_t nbytes, loff_t off)
+{
+	return mbm_assignments_write(of, buf, nbytes, off,
+			resctrl_arch_get_resource(RDT_RESOURCE_MBA));
+}
+
 static int closid_num_dirty_rmid_alloc(struct rdt_resource *r)
 {
 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
@@ -1933,7 +1947,7 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 {
 	unsigned long fflags;
 
-	fflags = RFTYPE_RES_CACHE;
+	fflags = (r->rid == RDT_RESOURCE_MBA) ? RFTYPE_RES_MB : RFTYPE_RES_CACHE;
 
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
 		mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].configurable = true;
@@ -1969,7 +1983,10 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 			resctrl_file_mode_init("event_filter", 0644);
 		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
 					 fflags);
-		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
+		if (r->rid == RDT_RESOURCE_MBA)
+			resctrl_file_fflags_init("mbm_NODE_assignments", RFTYPE_MON_BASE);
+		else
+			resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
 		resctrl_file_fflags_init("mbm_assign_mode", RFTYPE_MON_INFO |
 					 fflags);
 	}
@@ -2002,6 +2019,12 @@ int resctrl_mon_init(void)
 
 	resctrl_mon_resource_init(r);
 
+	r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
+	if (!r->mon_capable)
+		return 0;
+
+	resctrl_mon_resource_init(r);
+
 	return 0;
 }
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a658e4958562..a0635888a0a0 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2307,6 +2307,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= mbm_L3_assignments_show,
 		.write		= mbm_L3_assignments_write,
 	},
+	{
+		.name		= "mbm_NODE_assignments",
+		.mode		= 0644,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= mbm_NODE_assignments_show,
+		.write		= mbm_NODE_assignments_write,
+	},
 	{
 		.name		= "mbm_assign_mode",
 		.mode		= 0644,
@@ -5199,10 +5206,8 @@ int resctrl_online_ctrl_domain(struct rdt_resource *r, struct resctrl_ctrl *ctrl
 
 	mutex_lock(&rdtgroup_mutex);
 
-	if (supports_mba_mbps(ctrl) && r->rid == RDT_RESOURCE_MBA) {
-		/* RDT_RESOURCE_MBA is never mon_capable */
+	if (supports_mba_mbps(ctrl) && r->rid == RDT_RESOURCE_MBA)
 		err = mba_sc_domain_allocate(r, d);
-	}
 
 	mutex_unlock(&rdtgroup_mutex);
 
-- 
2.53.0


