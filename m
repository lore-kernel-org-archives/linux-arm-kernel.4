Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02754606A8A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sRH+jOXU;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=C/3NkhXQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IcmTle238mNgEDn2d3Lcy5P3M6+ZVKroga4xFhudLtI=; b=sRH+jOXUP7b6N7Sbd+4Ixj4QZ5
	p3rD27BRDo2vte1fMlx0XV4NzHMEARVAfVgeLK1WB7LyA7Ipe3Ea+YJfdUbUv0a7rd0gWVE1u5zjI
	S8gcDdat3PWqS1VRwHTE2GutjUp4nycY0rBa5PfJki8ZOT01BnANl/AuduD4NqECj6VWnnBplQDm5
	ntEpXZIP+ln6KHvMJbootZcc/26H8WnZML7IZJAlgV1zH77Krf8GXM+92EfqKl2W1HILnAMDMmeKk
	wdcfFmJq+Wy3jZ0/58q0ymPF+v9zFuq6tl3mvP17iT5MUEE7wp8K09fWVogrGMJmWaO0BcP86snKP
	UTLhBlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH76-000000083W5-2wMY;
	Wed, 11 Nov 2026 22:48:20 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH6k-000000083Mf-1iFG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:48:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWHvTJRv5rcUb4YnO4kNg9QSyjp+WEqJjxoTSTzhuRYGc02L8knU2qpm1gnJswp/hYTHJeBZlinRwC3e4GOXpRyGu1Yr9dQei3UCE1T9VUPoy5CyiAZWTKSmXusXrtXAANjaoGvjFm/KBAu6ryxJxiisW5Q+GT/awrmrtyBKFa59bLAFL9hbMnprxPQotQW7SLyGlE8CDrBSn4TmKFhCjyF1/DmzSU7uStroaeU/7sotOjnVissJz55i2hYOhBi/UAPmALtKEVGUEftf5y5ioP0GxVQqRIZxooJuzCT0fr0rJbg9XHdrsIOWO5uwXpkDxczjKAI58kCrBYa18FkXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcmTle238mNgEDn2d3Lcy5P3M6+ZVKroga4xFhudLtI=;
 b=xyiv3O0UdwMki8pw0gwS4hZ3RrTbKyUZCq10xxKNtj11E7kl3k8nZtNWu/h/2lxUAmNXjl9QY0NbhwkZruARJo5Ns4GujzrHj94kg2YX7UYaY3Dg52unJCYijELpMZg9fzy9cdJ4ITk3LZdfqHU+G3/nMcK3QFPgmQ4+SuZeiaDOHZsENJJ/n9Yohhyavvha6Sgv9b/r8NiCB0yLEuZFRfmZiT+7U/Niy7gi0tDo+T/VORLB1/OvYHm/ljuRb6WlBQGQT5jUoEb5dawcjZKgaQrOD3Q7oXB02F4IwolNWRXeOZ567LKmwRl9YdOnKxKpe8+YEnmruyCZClajxDSZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcmTle238mNgEDn2d3Lcy5P3M6+ZVKroga4xFhudLtI=;
 b=C/3NkhXQa1F3rOZH2O1+9JADoNhYFjtJVZDjWLlaB/VnWPfzrXnhONTW97cVJGsnGgK7ONhnM2xZlU3EMVUsJJDTAV+DILHowSdSeUaeO4alWUMVpq3UgKr805JpJbppbV/wNvlg7fyBuejvErZQe3C6gdbjLEUs8VYMN3SMvAI=
Received: from MW4PR03CA0132.namprd03.prod.outlook.com (2603:10b6:303:8c::17)
 by PH7PR12MB6490.namprd12.prod.outlook.com (2603:10b6:510:1f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 22:47:51 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::a5) by MW4PR03CA0132.outlook.office365.com
 (2603:10b6:303:8c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 22:47:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:47:51 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:47:29 -0600
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
Subject: [PATCH v7 19/19] fs/resctrl: Add kernel mode documentation and examples
Date: Wed, 11 Nov 2026 16:44:12 -0600
Message-ID: <1cb9f3dce6a99351583b4f5242816e41a877b2b3.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|PH7PR12MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: 71882739-3ecc-42da-1256-08df4045d11b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|23010399003|261026140227099003|11063799006|10067099003|56012099006|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261026121527099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: dq8vsH/H/p7FkpAylEvAWkwnvejvTB31dJJTBZSsRmHNW1+MOPUlgClPvpc82xvEDFNVvMctEyYKL2r6s3ONUAvZ0IjvxoYAt0k8MIli8UmomPlelfOc9hMdQYR3bmiO/AiMLyzTTKrIsATkVfX3gforOkJAvj3K3fRVlPQE1o4JjVTtG8iLojVuniFf/S2nm5Us3gEDNbwTzsPY8jB39fEe8d/NhB+bGYf6IvkW9RiPizP/ENsYJxCMbpJh8pCGjFKkYfI32U8tBo3qYcdZpV81AWrdaB4Fj5uM+7uH6Z9GQvt+pIJpEN2LDnkIF4Djbni1hfoDI0NLq9lushq3Yj1yaiBmVPWbjrtqkgKKkfYSgnyCVIX3UqNLouQIBSqJYLQJHQEYeUIXUE1RJGBakteYIEOYvS6IKQNda4wpXzIyoOjyu+Xao14Nht8WFiAEkP691A8jSpmtrEtFdx/M03Fm/J+RLKR3EKYKQMtYGc1ZhZ7fvz5rWWVTi9RqXHF8JVCbAYCkQ7pJ39pu8+YvXxxd6ePD/nQZW8LbsvBH8kgESWHr8M8aEjmJVXUU1shtujWDyFb77n0hN42LzK3bbUjeS0NaRXKTaK7GVGlnf4cYYCJB4AAcg1sofFYfyjsbcq8tLT92l7CuvFov1Nfg1FznWDPZGuqCWfkdi1BxfwCBjqHpB/rJjlEFwUh7l7thqZ0SWrUh2/TD5GOageW5EA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(23010399003)(261026140227099003)(11063799006)(10067099003)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jA+YK2+K9aMNJ5ZRqJ47y0IEQjGgeaIey5ze6ob5nba863J5XzQQFPKbPVLojBjrcs7m/A/yCgjQNQrP3C05HTJGQFaDV/NSwshVggtGffVi+x9Gb3dq99bAEdo8fuwV5GMQ/dZIwEuUSXOcBZP0lVJvm4O2OtoPKFEfTIFnBEOaVHDdKNfepaLWq0RG5u4iKrxCF+wz6rZ6BUUb+7OXArUIpucdgo7HTkjhfDB7p3SlTUAGkslJZU6dCPVPytB/QyZHJtSpkIuFCGzZrqu8twUunEUNYTjzIsggx6VjornDpszpwLnXgEEUNHHSrL0ix+nOwdVVXXkStUvGYtWNl4pe/lxuAkusMDKIr2VULjyseBRsq5Hdg4loiYDKd1cn+HNS3deYHRJFhYfGW26VeDGSCKp7mo433otmbDQh1dQClogJLfMMX2GpkGkczHzg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:47:51.3767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71882739-3ecc-42da-1256-08df4045d11b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6490
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_144758_949882_279997A0 
X-CRM114-Status: GOOD (  16.94  )
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

Kernel mode configuration is exposed through info/kernel_mode,
kmode_cpus, and kmode_cpus_list.

Provide examples showing how to query supported modes, configure kernel
modes, and manage per-CPU kernel mode associations.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Changelog update.
    Documentation update.

v6: Renamed assign_global_enable_per_cpu to global_enable_per_cpu in the
    examples. Replaced "policy" with "mode" throughout.

v5: Update the example for the collapsed kernel mode model:
    inherit_user and assign_global_enable_per_cpu with ctrl=/mon=
    association options, and <CTRL_MON group>/<MON group>/ paths.

v4: New patch. Added examples in the documentation.
---
 Documentation/filesystems/resctrl.rst | 96 +++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 2f0f6f01766f..d161c51fe6e8 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -1933,6 +1933,102 @@ View the llc occupancy snapshot::
   11234000
 
 
+Examples on working with kernel_mode
+====================================
+The kernel-mode interface spans three files:
+
+- ``info/kernel_mode`` - select the kernel mode, configuration and backing group
+- ``kmode_cpus`` / ``kmode_cpus_list`` - view or adjust the CPU scope of the
+  active mode (visible only on a backing group)
+
+The walkthrough below covers a typical workflow on a platform with PLZA
+(Privilege Level Zero Association) support:
+
+a. Discover supported kernel modes
+::
+
+  # mount -t resctrl resctrl /sys/fs/resctrl/
+
+  # cat /sys/fs/resctrl/info/kernel_mode
+  [inherit_user]
+  global_enable_per_cpu:ctrl=assign;mon=assign;group=//
+
+``inherit_user`` is the active mode. Kernel work inherits the resource
+allocation and monitoring of the current user task. The second line
+shows that ``global_enable_per_cpu`` is available. In later reads, the
+square brackets move to the active mode.
+
+b. Create a control group "ctrl1". Activate global_enable_per_cpu mode on the
+control group.
+::
+
+  # mkdir /sys/fs/resctrl/ctrl1
+  # echo "global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1/" > \
+        /sys/fs/resctrl/info/kernel_mode
+
+  # cat /sys/fs/resctrl/info/kernel_mode
+  inherit_user
+  [global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1/]
+
+``ctrl=assign`` uses ctrl1's allocation.
+
+``mon=inherit`` uses the monitoring of the user task.
+
+The group path uses the ``<CTRL_MON>/`` syntax; a control group alone is
+written as ``ctrl1/``.
+
+When the mode is active:
+
+- ``ctrl1/kmode_cpus`` and ``ctrl1/kmode_cpus_list`` become visible.
+- All currently online CPUs are added initially.
+- CPUs that come online later are added automatically.
+
+c. Narrow the CPU scope to 0-3
+::
+
+  # echo 0-3 > /sys/fs/resctrl/ctrl1/kmode_cpus_list
+  # cat /sys/fs/resctrl/ctrl1/kmode_cpus
+  f
+  # cat /sys/fs/resctrl/ctrl1/kmode_cpus_list
+  0-3
+
+The write replaces the CPU mask:
+
+- The mode is enabled on CPUs added to the mask.
+- The mode is disabled on CPUs removed from the mask.
+- Offline CPUs in the mask are rejected.
+- An empty mask disables the mode on all currently online CPUs, but later
+  hotplug CPUs are still added automatically.
+
+d. Create a monitor group and activate the mode on the monitor group.
+::
+
+  # mkdir /sys/fs/resctrl/ctrl1/mon_groups/mon1
+  # echo "global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl1/mon1/" > \
+        /sys/fs/resctrl/info/kernel_mode
+
+  # cat /sys/fs/resctrl/info/kernel_mode
+  inherit_user
+  [global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl1/mon1/]
+
+Kernel mode work uses ctrl1's allocation (``ctrl=assign``) and mon1's monitoring
+(``mon=assign``).
+
+- Resets the CPU scope to all currently online CPUs.
+- Hides ``kmode_cpus`` and ``kmode_cpus_list`` on the previous group.
+- Shows them under ``ctrl1/mon_groups/mon1/``.
+
+e. Return to inherit_user
+::
+
+  # echo "inherit_user" > /sys/fs/resctrl/info/kernel_mode
+  # cat /sys/fs/resctrl/info/kernel_mode
+  [inherit_user]
+  global_enable_per_cpu:ctrl=assign;mon=assign;group=//
+
+Writing ``inherit_user`` clears the active kernel mode and hides ``kmode_cpus``
+and ``kmode_cpus_list`` because no group is backing the kernel mode.
+
 Examples on working with mbm_assign_mode
 ========================================
 
-- 
2.43.0


