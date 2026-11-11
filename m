Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDA660A3825
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uOB9+z46;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=M9BlCQ39
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1uAhvTTGDEyBXxQUR3bd9mBTxKd++D7F+LWAmADL9+E=; b=uOB9+z46mEJgMsOAs/Otu51/x2
	zJScfpTnIwuq6r1wWxEHANsm6Tpepqg2kmnG+X2WkeV8PH4jCOGYotY/Ly9waETAFAQo3I1piAvxv
	80wVKQm8E6aCKva/8op4l8UBtTok80H+C3c1bVk7N1Sw8eN0o15cuyN+J12d9+RtpDKUESBDPLiGN
	/lt6k5/iHomnL+Gg5PJmGFStjT4JTEGUXpqeHTn6xjYwUmXIJ/bLv4LfMOLB3wTEmJKVowx+PbLCA
	D6floqs478Hv3eHomdOsiX4shMJ7nqLxMyQ/qQnEDdrBW+ub4gZGSh7JmDwgzoi1DoFCrQ14HAiWa
	E6Y8iBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH45-000000081ew-3pvL;
	Wed, 11 Nov 2026 22:45:13 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH41-000000081cZ-1pbz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:45:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7A6FND0OEiArNkyRBYHD8ickK4jaLb96lYjgyV31tLCD2Ve1+rkP7GqL/aIhlKNzfxLfhof2uVVUOmmKrpxbyofCUwI4/exQCL/aAUZAW1Afg95v8fjtzGycfzPWa4su60kEpEW12FhaECDJUnrN/zvPl96Ll+ogx2Da91o7ac+09BOjWpErXJiW4uDJEpH4DN6CF4uiTmxOPxATvCF7Ikpd0ewakWSoWZiP1uh1qSqzpWuh2CmXh8IIHaCi6v55CVUf2KD02IOkYo0lVCRDzRJsi5R3yWZDEV80dkyJRd2iLr3UV7Rel68bykGDhXNYyqpo+ev1Jr0IniYkOZf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uAhvTTGDEyBXxQUR3bd9mBTxKd++D7F+LWAmADL9+E=;
 b=h3wgCCc5dqxgSHV3hiUdD1P2mSHKIQA512Ni7NWVrUw4RFIxcda+/kJ2XeZsLr3zKLOM15aM/LFFHLtqRLyZJ/tINTZhj4MG8W0gAjq7w7wAfkOyYeH6sHHzlZ9OJpW6tPbHTWVSBA8kf1MvMDBwTPNR6pYCKla4ayfe4lYdq+4Vu1uVDD9UgUucIaiTS2a9Kj8qV9xWpzD+yMmdOSt8PE1bN3kvFsyfH5CBMsfweJkBkZ+r1d/IrBe8cA895mHw80ATuz6MvETWA/FuXsh42PKXaasS2EpfqaBqe6ZcPTwfJHIClMRskayZ8DMjRBnFJqz3RIP6u4gUfm+/jITjtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uAhvTTGDEyBXxQUR3bd9mBTxKd++D7F+LWAmADL9+E=;
 b=M9BlCQ39RcIUHfX4izGnPyz6S5BxnSyabzvURonp+gftG+jNno5acz9Vm+6iWPFVbHCE2dDrGYQrWtWrQsxZZZwpUQ/3niiC+WimUjVxxt5j+YeEagfZMPDwM+iyCYbUJgRA6ONc+ZnQUIlPdp5YSA7L7CjfI7RURN+eeMRxLS8=
Received: from MW4PR04CA0226.namprd04.prod.outlook.com (2603:10b6:303:87::21)
 by CH2PR12MB4200.namprd12.prod.outlook.com (2603:10b6:610:ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 22:45:02 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::49) by MW4PR04CA0226.outlook.office365.com
 (2603:10b6:303:87::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 22:45:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:45:01 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:44:58 -0600
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
Subject: [PATCH v7 03/19] x86/resctrl: Add PLZA MSR definition and field layout
Date: Wed, 11 Nov 2026 16:43:56 -0600
Message-ID: <bae2ddce091c40f38cb61900828b655014dd88d0.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|CH2PR12MB4200:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a7ffc0-0e93-45dd-eb2e-08df40456bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|261028144727099003|261026140227099003|261026121527099003|261102123227099003|261021121427099003|261022105027099003|11063799006|56012099006|10067099003|260925022911599003|260925021911599003|260925021311599003|22082099003|261009223027099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: lILq2TKuEXLznl2DuOlt1B7j/Ca/5XFWmowUj6aMsiTXCQj4bZfTGsDaQb0XgkOFU3TbUVndDd3NuDKdMBjvvKr+dd92ER23sauTGpD3KnbT8XR54zsqdoQbD0MPFXiMgJ3OZis2K5xYpRtK/4rn12uoiQJJjthc32rZtLaNIufgGc7HOp0hQS3U3YgdJWCTHSb2L4yIp7aJOO5ZZPz4sEhxmp5nnIROQdeuL5WWUCRvEFC31CzXnDp1Xk3WKlGqUlyHijnxZRubN1sNQYxeJLDdVnCTkcXV2VUUQHPMWkH5cqUL/KlV6Hox6G7GSwyTytwUbbz1cc51qSo+SqFC4VrZ/LTEcOv7XVm/03Jak3kov2R/u6eU+dXLmNS322cmemgJtcU0P3B4UanStqzU1ndjOkZ8ladpEnHFPcuqwlDtsSI+NZtm1gNAB9BPaRwqY0p9dOpo2dX0tEu6waE+Gdg3sDJ+O5u9RiaSxDMONLC5ls+ipGpcNMlpCdJHbY73gVtlW12Unf1SqgdM/XvlifWdcOF5eeJsfiaT4VC854JzfNI5Rpu+/e43aRGyWqy23QmC5VsW+Jeypk2rXnR75Pb0xtky8GQGv9p2wx4QXgGsQJ8FHLFDTdngFzxAttUxkuYtUDx3g9vFbVcGhWoj1w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(261028144727099003)(261026140227099003)(261026121527099003)(261102123227099003)(261021121427099003)(261022105027099003)(11063799006)(56012099006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(22082099003)(261009223027099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: enmDUQ71Tr+ZS/Mj6zzbhG8eFlhaf4/G/DKzqH8BRc06gKvJNZdhk4MoZck2vDUcPJte733mjZtjVVsp/5kxWn1VUFOX9qghg0RTv8N7ai1V46Bme/goLb+rpCplw6k5oA0qAx79YClaIj06i2Fx75sCA/TgY/idPBlg0du+E+HH2l6tvDhKOYcZJzQIuFuZCx9OXPV75W/oXFva2BdoJnA2GXG1Sph3RelG/AKkzD7dMv0NT3jwuZiOwE6DfhpKbfCf1FntdVlT8+YY8goOB8T7jwynNd22J9YTQuYu3RHDZ3rKblWCiLU4ldGGKB1QhCO8mo2+RXpnvjtEVu5T8jC9m/h6wemlbrWiCUxndsesY5WwSEMhD/CzMRqMbGGiVHybHYpXlScrCG3psaoIuRilArt+Ad8gDlPcV/RdBHZkiNM04POYyPz+ndFio4g7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:45:01.7313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a7ffc0-0e93-45dd-eb2e-08df40456bfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_144509_502148_F4B1EC2D 
X-CRM114-Status: GOOD (  18.93  )
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

Privilege Level Zero Association (PLZA) enables a CPU to use a different
CLOSID and/or RMID association when executing in kernel mode than those
used in user mode.

PLZA is programmed per-CPU through MSR_IA32_PQR_PLZA_ASSOC, which contains
the kernel mode CLOSID and RMID, an enable bit for each, and a bit that
enables PLZA on the CPU. All fields except the PLZA enable bit must be
programmed identically on every CPU in a domain.

Make the register and its field layout available in preparation for resctrl
support of PLZA.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Updated changelog(Reinette) with minor changes.
    Minor code comment update.

v6: Updated the code comments to match general format (members first and
    details after).
    changelog update.

v5: Sashiko reported:
    https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=3
    Fix the union truncate issue on 32 bit systems by using u64.
    Updated the changelog and code comments.

v4: Re-wrote the changelog and code comment.

v3: No code changes. Patch order changed. Improved changelog.

v2: No changes. Just rebasing on top of the latest tip branch.
---
 arch/x86/include/asm/msr-index.h       |  1 +
 arch/x86/kernel/cpu/resctrl/internal.h | 49 ++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index c0914829a925..13f81a0587b4 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1306,6 +1306,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_PQR_PLZA_ASSOC		0xc00003fc
 #define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
 #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 03cb22f4e607..d75013ede600 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -226,6 +226,55 @@ union l3_qos_abmc_cfg {
 	unsigned long full;
 };
 
+/*
+ * Privilege Level Zero Association (PLZA) is configured via
+ * MSR_IA32_PQR_PLZA_ASSOC.
+ *
+ * @rmid		: RMID programmed for PLZA.
+ * @reserved1		: Reserved.
+ * @rmid_en		: Enable RMID for PLZA.
+ * @closid		: CLOSID programmed for PLZA.
+ * @reserved2		: Reserved.
+ * @closid_en		: Enable CLOSID for PLZA.
+ * @reserved3		: Reserved.
+ * @plza_en		: Enable PLZA. When enabled, PLZA applies to the
+ *			  given CPU.
+ *
+ * The MSR_IA32_PQR_PLZA_ASSOC must be programmed on every CPU in a QoS
+ * domain. Each domain supports a single PLZA CLOSID and/or RMID, and all
+ * the fields except @plza_en must be programmed identically in a domain
+ * to ensure consistent behavior.
+ *
+ * CLOSID and RMID selections are controlled independently. When PLZA is
+ * enabled (@plza_en = 1), CPL0 uses CLOSID and RMID values from
+ * MSR_IA32_PQR_PLZA_ASSOC depending on the corresponding enable bits. When
+ * PLZA is disabled (@plza_en = 0), the CLOSID and RMID are always taken
+ * from MSR_IA32_PQR_ASSOC regardless of privilege level.
+ *
+ * - @rmid_en = 1: use the RMID from MSR_IA32_PQR_PLZA_ASSOC if @plza_en = 1.
+ * - @rmid_en = 0: use the RMID from MSR_IA32_PQR_ASSOC.
+ * - @closid_en = 1: use the CLOSID from MSR_IA32_PQR_PLZA_ASSOC if @plza_en = 1.
+ * - @closid_en = 0: use the CLOSID from MSR_IA32_PQR_ASSOC.
+ *
+ * This allows PLZA to override only RMID, only CLOSID, or both. If both
+ * @rmid_en and @closid_en are clear, the effective behavior is the same as
+ * when PLZA is disabled, with RMID and CLOSID used from MSR_IA32_PQR_ASSOC
+ * irrespective of privilege level.
+ */
+union msr_pqr_plza_assoc {
+	struct {
+		u64	rmid		:12,
+			reserved1	:19,
+			rmid_en		: 1,
+			closid		: 4,
+			reserved2	:11,
+			closid_en	: 1,
+			reserved3	:15,
+			plza_en		: 1;
+	} split;
+	u64	full;
+};
+
 void rdt_ctrl_update(void *arg);
 
 int rdt_get_l3_mon_config(struct rdt_resource *r);
-- 
2.43.0


