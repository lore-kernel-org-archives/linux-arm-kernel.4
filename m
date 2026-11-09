Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6844D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 21:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sYcCSoK5;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SJ0fPz8C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NwqgeVLFMAw4H+tW72jySvQLUb9zUD/fSahQOrxSoNs=; b=sYcCSoK5p9KLd5
	uMfFlf4YxzyUjQrb87q2vqa8e8lqjMfTeZrlWEDglNGAZp47CE4g7IXGov2gHr9MFiHuoeOKAX2t/
	Mz5TrAz8RMQ0fo+1lkoiqSLrieucV3Zh+HyZBrzxtEvCP/012hHxprgM2+CHa818shzLtAO5aMd3F
	11Wa4RIlA2BaR1l5dyA8TcZWvUE/mEJ/q0AI0+5t+qLRHqQBXHR11BD6kdtmRy5mmZHvpwL6zBC1M
	dQVr+uypw4kwgq9nByk8ivJ5wvYddk6G02P/7OQbnbkNhhR2H1WAIYYUVvF6KKs8mV/hPiSJKh4gM
	/u827/74H3gf/Bs0ATiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWsE-00000001lE2-14sI;
	Mon, 09 Nov 2026 21:25:54 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWrE-00000001kP9-3tpH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 21:24:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+fyS9vutkwsa3cz7jOT6/1MoRq2F+vKRxXeQXY7tSw2Bb9Bc2WCDrcYOK6EGs1kPI5f2gpSe5Qq9/NhyAxmM4rvY5OGvvY2Frri4+PheLvaWVWGXEkob3H2EBHvhTdHDjjEgCi2wyb+QKdGQV1ybF0eVhubSg7APgHrSLeqrHsQIhFcJ8dn9pJ+3MaL/EV8wtIa/r5h/g077hRZGSqVYKNh79awMlL+NBfJNcGauj3GlnhGg4KU2cFXTqBUbXjF72Ttqo1RDviajNv4msvw1b1gRd2t+eH+S2KPFMxUzoAs7eyidBASj/ZYWwSFlafVp9JGgesr+9eFFWdrwFj7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwqgeVLFMAw4H+tW72jySvQLUb9zUD/fSahQOrxSoNs=;
 b=N0DCg+APl0FoKsglnrw8qsdUWX9AddyKCxRDltNrWq6IhKh5DIW0NxnDIA38SCfoORz2MSMyAWchs7/JQk4gtzzE0FGUBPlChCQMUPivniJR57+bvkvnTvCB2retB5gsxziXaKWF5jKIlqUXNJDPiFAUtsa8izQEME8GTGA5lxV44jmWS/HNmGq64aCfJogOWD6HcozmM95VyqScZNx+EWINMISdiatTTloxYsLnGFif4WDo220gslsh5Wv2rszguzBBi9Lw4h62vvLyDXZ10TnBmMkGRadedtpTO49dNXzcZ2Ck2gkyHHL/IPRzHhUd+k8gjR3O3SyzsmB3xwuMVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwqgeVLFMAw4H+tW72jySvQLUb9zUD/fSahQOrxSoNs=;
 b=SJ0fPz8CaoCfkvrBBhPA1f/JilQ/M8fMWyTt8dl/ZleMwwAPzDwZTWFB1jVWG3E0X2+UHkAXhwTPMf61N6/n3jkQrcxPzEGm97Y6ayfB6YejTfB9jy9oNHrnHTeIWT3ncrVjoPtb547RgTWLZ8ZGVkRQSSDm0Y/qggEgbnn/s1gVUPZ1pMO+UBHRjTXCSCBtXlffcBVUnS+sdEEKio+tlD30sKtvGjNM8TsWcXeuxqAbtdqziWhcW0yNw3awj7i6OQaKx4sheF9DYXSiZYZM0VsJ8ErQixY0LaMezD0kWUFtOZnuo1uuP9td7s88YopZxt7f3Ejh34yI3u7wBtf1Yw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SA3PR12MB176418.namprd12.prod.outlook.com (2603:10b6:806:513::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:24:48 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:47 +0000
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
Subject: [PATCH RFC v3 12/15] Documentation: resctrl: document mbm_NODE_assignments
Date: Mon,  9 Nov 2026 13:24:24 -0800
Message-ID: <20261109212427.1409204-13-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::29) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SA3PR12MB176418:EE_
X-MS-Office365-Filtering-Correlation-Id: f77b83de-23a9-4c9d-871f-08df3ea7e19f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|921020|11063799006|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|56012099006|261102123227099003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: lTkZjqZ6eaar9DpXn4/7Vh3ZBgIskrv5tTEsx0bKTYwJ7av7vlWABpIsWbJz6NOyY7iaiWQzmE9pFZHzyC4bFU9jB8l2KUstw8NlT/Y5NwGeUIcmnlH08AXl5tSMgRTFI6Bc7ETy/i3ZXVJuocRzv6QQGO9Fur/lYsOisiribEfllzQmk6Q5rKb6pyf1cMUER3LuKlwrEoRDNE3zVnAlN31hlY+WfpjnnN0MK9y5RVJEx16quoQw4fO0VWEr2e849dvcsmPu+nJkU5a8dFR1oyfydCPjjFTlHfQD9vvTqqGqIJnSTKKTM5KxVJKpDMKvc0IGmCSDL0wTm7r3XgO/Q8iOOy/Ad/TdrD0JrAIWsRZ1iUmVxxr+dn4/zveE+gp0ycdrLpuVzxDhJpntucZG1Kbx9FZ9wrg9SQgPziBu0Cj20M6rTKarFEHYDEVhq9czYkh2LtM8M1mKRCpz+MBK64wbRQmycIOe7HUxzGXZOL6ePWopkQqb9Ka3kufvIY+1c3CdjBvGzoI9xx6b87GDJUFwlcxrYK2y8XtV9nGub7A43l5MuiQLDMsjT3CysvwGFYVV9e85Td2DNm0yPpB37I90L7+tcQ4IZSp3lufiDlhKL30C1+hV0nxoezflWO/0AygkH/dnyjluHM4pj588nZq0Qx59cv4TrsS9rpbFHMj5P3nSy1O/nY3UNKD1/ztX7oG5cejMV1GktPAmD/WgYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(921020)(11063799006)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(56012099006)(261102123227099003)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ii+d4ToiQ7gF4W7EeuIywDfNLxEZSM3TmU2Z1q2p14LfjpVBz33bmVuUvVzl?=
 =?us-ascii?Q?4heAXAGqvZJNze2sg0ZbcQpNCzJYjvorRMs1uEmkcENIxp8usiwhQqzJL67+?=
 =?us-ascii?Q?t1rHPvd1ixDkNqDJbKMP+mPkz0kWn/iL9wuldriyQeOD29ycX7Onr9c9CbK5?=
 =?us-ascii?Q?+puAGymKoTAQmHAeiZ4jEy14ZgLWjQfwkfVfThDJQHJXWQVmOxV4xm1czXv2?=
 =?us-ascii?Q?pXvr7kilWpUZChkcNYUhWy5f+Nx71bOreJnEEcs9Lu/8gW2oBhj6qlSZoG+g?=
 =?us-ascii?Q?WwjmwVBgQHeG7hLJ9vR18PFOn52iuSKaijf5bbsuM2ou1iM1fdgfie4KnusA?=
 =?us-ascii?Q?+WzC0D/TKYZz1f932QrUbzE3UQQ5Mh0neeB1WwginXnnShA1AVsY/bnYYoNv?=
 =?us-ascii?Q?0qnZjpgtJPOhkf5QiVR51FXeN/xcrOjImwT1mYodY+bN5FI7EuysgjirxtQa?=
 =?us-ascii?Q?IpQ8oK6VHWQFo7UeyrRmd5W4+spkK0XSMHpfcD6lZI9rAiPpETd3XubIcNaC?=
 =?us-ascii?Q?q25FaELYmTIQ1ZqJluQXQIHcqSKd3KMvND6FyNnYvxOnK2kQKgYmmpEpohXF?=
 =?us-ascii?Q?CAnt79kV/zyDzvFjCYqiDk9eOt/W9WFK83eETuxbu0KdBeyMTBAZZ1HqdgrJ?=
 =?us-ascii?Q?sddNg7k0F7PnVPleoIhB7Mf6cn7ZXB1V2B1xRVa8i8a5Lwg9fRNPITI3rRec?=
 =?us-ascii?Q?Q1A9+04jMoOmwQK/k6LpHi0ZtqlV+GXMaff/s2A5HQK7tvUfrrGisPsUYwR4?=
 =?us-ascii?Q?md3o+HvMS9+nsHf2QJ6HoW/8oShFLuci//o6Te0kiSijQj6C59hjL7tq5YOM?=
 =?us-ascii?Q?vFijL0KGdPcIa4OKTx+jZDVZbfAjv3Xi8edmodavAWcWHTYdsTC0uE1BiGTO?=
 =?us-ascii?Q?X+jDIzI208B1kkXfViMpv7B5cneJXhoE4YFPFZAKsbccRGaDdmG417APKOZQ?=
 =?us-ascii?Q?WC2l+Kw9f4rVuq6rnKMZ2P2xqqVS9lyDg9tq6Q9Lr6hPByKUmimdlvkeKLxb?=
 =?us-ascii?Q?0kwxaWAIrthYAWdqW0M3HyVFlWXoHCMIWbx6M9zpvAoxNEof4F1MPk1PhgPA?=
 =?us-ascii?Q?MTDBq4xxfyw+ptRc/ygLIYD5XPJRnkkR12mVM261IKy7Xm1I+Cjx61DaFzE9?=
 =?us-ascii?Q?0hmrv/BHbPaW6+qgxhiNNMmTU8Et4vAjZdGn3sMjdccVYlnxF3VxXJf1jhpP?=
 =?us-ascii?Q?qG3tjrgSgoIZmD8SYzU0Mq215PC61qvNZ4kE0a7O4lDrchmvRWmX4RcxuGyf?=
 =?us-ascii?Q?AWLRAOqr3dePwIyFZosi6xX6afHRv8QPy9d1GQ68AYfEjKIhyBc0iDs5fLVf?=
 =?us-ascii?Q?v2put1T5P6FQHa1R8LGj46oKLEm/dVNtPEFRYL8ieB+G2r44/vdhG7+XI9BH?=
 =?us-ascii?Q?vM+YuJ+2wxTOwiXyjJBuTFy+TFnU39ZNM1bm5ifGFhwlFvTboCiXDni4UtVE?=
 =?us-ascii?Q?e/RNQwIzi4Pe1efSF5ffWHGsL4KVTEmcs6rjOfnO0s04dvRyjd8i+ndnFb1p?=
 =?us-ascii?Q?IzH9h0Vx4IQsU9wKDXnd6A16fpOzdcExNoTRkGoR7EVz3Jmb2pPXvaWe2obx?=
 =?us-ascii?Q?PrIyvIcu5A85rSo1eZ1hkxD81jMc0p6+pxg/dIlse0bgxkzihdZVjShdXfeL?=
 =?us-ascii?Q?KrA3Ax3uyMhCCoG03PdT/M1bbrgcOy71Mya/uMqw5YbpIojJQw3CwBSZe9vE?=
 =?us-ascii?Q?Nelbp9QvGQ2BPOi7Rtjj3ygZE37eGU0wHKTdYDoBxPdZu0j3rCx4gdsHyCD3?=
 =?us-ascii?Q?znAVTOgrpg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f77b83de-23a9-4c9d-871f-08df3ea7e19f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:47.7410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EO2qJ6G2BuKPFAbPqGJtVRKqx6xfjZ38PH37rNbVZo7PznKB9HKR12bcxo9XXYqIbh26MOH5McrKZDt/lm97IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB176418
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_132452_996141_A1389596 
X-CRM114-Status: GOOD (  12.47  )
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

MBM counter assignment uses mbm_NODE_assignments when the counters are
backed by a NUMA-node MSC. An L3-cache MSC keeps mbm_L3_assignments.
Document both files.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 Documentation/filesystems/resctrl.rst | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 434e6f42db4a..6ead819a7a2a 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -550,8 +550,10 @@ with the following files:
 	the user. Each event within a resctrl group can be assigned independently.
 
 	In this mode, a monitoring event can only accumulate data while it is backed
-	by a hardware counter. Use "mbm_L3_assignments" found in each CTRL_MON and MON
-	group to specify which of the events should have a counter assigned. The number
+	by a hardware counter. Use the assignment file in each CTRL_MON and MON
+	group: "mbm_L3_assignments" when MBM is backed by an L3-cache MSC, or
+	"mbm_NODE_assignments" when MBM is backed by a NUMA-node MSC.
+	The number
 	of counters available is described in the "num_mbm_cntrs" file. Changing the
 	mode may cause all counters on the resource to reset.
 
@@ -859,9 +861,12 @@ When monitoring is enabled all MON groups will also contain:
 
 When monitoring is enabled all MON groups may also contain:
 
-"mbm_L3_assignments":
+"mbm_L3_assignments" / "mbm_NODE_assignments":
 	Exists when "mbm_event" counter assignment mode is supported and lists the
-	counter assignment states of the group.
+	counter assignment states of the group. "mbm_L3_assignments" is
+	exposed when MBM is backed by an L3-cache MSC.
+	"mbm_NODE_assignments" is exposed when MBM is backed by a NUMA-node
+	MSC. The file format is the same.
 
 	The assignment list is displayed in the following format:
 
-- 
2.53.0


