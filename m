Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007EA60A5BC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XeVptGMR;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ri6h1arW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bYGGHsPoZjYTsaEOQPfJAeJDDbaWvCpXSpDXwCjUT4k=; b=XeVptGMRnasWG11LF0MvtiV3bl
	fR0bfK1NMqPDQjCckRwFePnS8qYwFK+V/GRxpvt2IA5VxR9Z8ItNEd2Jr2f82ymB3mAW/RFEZAKuZ
	T2ccHhQstS0GWDq1i859tvZKf3j1FwAk0/OejnDL1q3HLVFYEtyBmWIEuDULK2ImtzFJa/Gu4hZAA
	7O5sV2UmDmjMcihZb/j7NcL445KGMZi2zRlOcxySumftNJ3rINq7jCTPSb9WiWXkUbnaX548I6Qcp
	DOmlWKYCCsLiSRXYb5CX14voedIuiwf8F1IVo/NM3opLUJS+7Y0AaT7Kl1C2oOB8sH9GagLaBs0+J
	OKQBq8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH5L-000000082EM-2U4q;
	Wed, 11 Nov 2026 22:46:31 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH5F-000000082Av-02U9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:46:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOApiry3kA1zacUv55tMbizqIPnMM25hG/+NgFwF0E/Zp7mXAM9Qmd5ECC9xfSuEZN6ChYJtiRDPIRbZfhNLz7+h7F4DzjN+dq8JJervozgz8/eVayTwjcNYAKVdcTlT/4tHzwtBmVnScS2ZGWRRavaEIAGNBTTWQSF2tBCVMBvq74q4ccGSECEsGM1V8Wdn2B0Hfkn5izR6fNxV/fWbc/dJ8xGMN1k95nEWuZ9S/kYpJoy4j8yyuV6AUO1nNyu4rXhDH88FOrtjTDuEA/xKsueLtNNbqNYJHv05kMoh64RRiVTkZ6hA3Hlo4MdA0GZxj0om4xqDvxXfIaWxQH4BkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYGGHsPoZjYTsaEOQPfJAeJDDbaWvCpXSpDXwCjUT4k=;
 b=AgZAd1hjhlsceL/ATKzqe7KOao9FYcPha26wU/OQVOeOyWJor7AkoE+5xDumEpYmMklysr9i77CnKarhfR59Jslw5Zef69XY+58gWYeuZeYIc0nRqUwu0RqZG+auT+3JLHghJJBUnRn2p8nVgkZu/bWITTUh9p+dqgH8owrZE03lhuAS8TmilgvkLqS7bvfTGZTUgEADgI+6wNmh4tMB5JmhyTpaiyL7kLokFGIssUgdIlJnqyPbHj2Lh87tzCflzS8jsnBGTHIHGdJ8V6jqz5enaRDY3kfXCEAn9fbHR+BVDv6AD2IRuXcyoWto+o1CeakB7kX0xK1YDDlNZOvzrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYGGHsPoZjYTsaEOQPfJAeJDDbaWvCpXSpDXwCjUT4k=;
 b=ri6h1arWnF50kmW6ubHiYLBOt228w7yyBFrEiJbWtptbkI7Xczlb1HkNrZxXgZN5/jZ6Or4SggG4wPL1Eym0q7rp+pkFxEup6Hzbx6I2knPQ1mVOkPW3MeIqL4FvPYwVB2E0LNHPudZyuAb4s0pv6jN05SiVm92N/halXk7fU88=
Received: from SJ0PR13CA0027.namprd13.prod.outlook.com (2603:10b6:a03:2c0::32)
 by PH6PR12MB128275.namprd12.prod.outlook.com (2603:10b6:510:3da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 22:46:18 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::50) by SJ0PR13CA0027.outlook.office365.com
 (2603:10b6:a03:2c0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Wed, 11
 Nov 2026 22:46:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:46:18 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:46:16 -0600
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
Subject: [PATCH v7 11/19] fs/resctrl: Add support for hidden resource group files
Date: Wed, 11 Nov 2026 16:44:04 -0600
Message-ID: <905c67e0ea380ac150fa096c57025e39c79ba185.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|PH6PR12MB128275:EE_
X-MS-Office365-Filtering-Correlation-Id: b97dd279-7295-4e29-84b7-08df404599bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|10067099003|5023799004|56012099006|11063799006|261022075727099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261102123227099003|261028144727099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 7MnGeV/o764E5mUysdtcrw163tWfjGleqkeYYuV+HTz2uY9+rUjUzE4GAfmUOPe/EhrTyfADNS6B3vpSxG9vMB64U8NgSwJrWk6snHyqJpcngypVr+ASEt9SPe8K1rpHDzGMJgKRHsg+k6hXEkq7YSxmRmN3EEiUnTTRrsqdCxkkgC5NjiKTz8hr4SDXwP8JbBaxEauVLRV7OGh1qI84KHleMAZ1KeNErCmn6+hVRM80MYQtDNd1yR9DC2weTywBxl0BgEHb8/JrQSR40GSmpWi008MtSS0HJXk/tWgF0ZJf3vpYXozTCkUhMkcFt1OvwfCzMkdD3kZZtiSjLdPJQQNCYnIYqaFp2VUO38ffmPQxszoRfXG8JnE78K4QgbG6iiMeE6Iyw4KJERp7dV3tirlwOI7S5x++WKWUPxI5a9uWTQBF0T4k+9Jeg5sxNs9T2a32Zsf92ws5teg2XAmi+AeMhhVoFjZmywcjZ+C9PhSR2w+Dl1Pr7i1fnd8nN2eim2aSY5ZNOCY7O6xl3qxLoT5qfTsnFjSUpE8udUFDUD1u8hC5YHA/eggplRnsoschzjkGCQ0O57+ieOlzxR4td50AG+Z3j/IhSHtjOBJ5S8OtKIXvvT8HUtAHe9iUu8JaJ/OjKBEN8ewO6S/hDcgd2nOJKzVDG98rGM8ad46yQVl7xpKyWLDHfOctAan7VrunwhZqQR9XSnfuKTVAgVbY5g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(10067099003)(5023799004)(56012099006)(11063799006)(261022075727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BSX9gh7fjtnb95vfECqXY1+Hhg6o3xBnKXrHwDNca6Z6lI9dz5Mb300czU+VGotZgJFVfp72twsAniysp6WmEU7b7B74qnIhGM+DDN9l//jEYaFBgD8qJ43PubM6vfSqM1OOzUFGBp4bKRF2vS1IHHcDVDSDsdQpyToIRR2CGPErQ5apOHW7nv3Az7VsOpwHmeJfJrzg2AvmtuV2tqAIgNYNOHNJ13gzeDvgdIGF1ocy3SFHTUeWLZcVmCgzRt6q9rcswzYAOqgaz30DBoIpDKEpXqge5j7CLCIZOCJl/mkIsskOEq8387wF1CMKSIg+khoMnC652aSXPQhHVu9FDGtlsn1jm35Gg7w2dQFDsRAyGokxq3+Ev7ZpK2OyRSj86P1mojm9xnS5AvZBoAs3yU8HJ08VLMYKWyEiaPXo5YP09GXJzLT1FWRhyZ1lgEGL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:46:18.5127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b97dd279-7295-4e29-84b7-08df404599bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB128275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_144625_822048_205D9F92 
X-CRM114-Status: GOOD (  22.01  )
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

A resctrl file is visible to user space as soon as its resource group
directory is activated. A file can only be hidden after it has been
created, as is done for the info directory's BMEC event configuration
files.

In the global_enable_per_cpu kernel mode, kernel work running on CPUs where
the mode is active uses the CLOSID and/or RMID as part of a single backing
resource group. The files needed to display and modify the CPUs on which
this kernel mode is active are only meaningful in that group. Visible in
every resource group, the files would return errors when accessed in any
group other than the one backing the active kernel mode. Creating the files
when the kernel mode is activated, and removing them when it is
deactivated, would add failure paths to kernel mode activation that showing
and hiding existing files does not have.

Allow a resource group file to be marked as hidden so that it is hidden
when created, before its directory is activated, and is never visible to
user space until resctrl restores its visibility. This provides the
foundation in preparation for kernel mode support that shows the kmode_cpus
and kmode_cpus_list files only in the resource group backing the active
kernel mode.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Updated the changelog (Reinette's input with minor update in second
    paragrapj).

v6: Removed resctrl_hidden_files_set_visible() from the patch.
    It will be separate patch.
    Re-wrote the changelog.

v5: New patch to add support for creating hidden files.
---
 fs/resctrl/internal.h | 2 ++
 fs/resctrl/rdtgroup.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 38aa0c0cfb7e..909511e985a1 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -283,6 +283,7 @@ extern int max_name_width;
  * @kf_ops:	File operations
  * @flags:	File specific RFTYPE_FLAGS_* flags
  * @fflags:	File specific RFTYPE_* flags
+ * @hidden:	Hide file at creation; visibility may be restored later
  * @seq_show:	Show content of the file
  * @write:	Write to the file
  */
@@ -292,6 +293,7 @@ struct rftype {
 	const struct kernfs_ops	*kf_ops;
 	unsigned long		flags;
 	unsigned long		fflags;
+	bool			hidden;
 
 	int (*seq_show)(struct kernfs_open_file *of,
 			struct seq_file *sf, void *v);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index afbe0f94940a..9235f094245c 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -313,6 +313,9 @@ static int rdtgroup_add_file(struct kernfs_node *parent_kn, struct rftype *rft)
 		return ret;
 	}
 
+	if (rft->hidden)
+		kernfs_show(kn, false);
+
 	return 0;
 }
 
-- 
2.43.0


