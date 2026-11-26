Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB08606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KubU7gMf;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SVIV6EpM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S/rDm9MSW0WTvPK5lT2NqtuJzmnuYBWQB0NK6jZGLPQ=; b=KubU7gMfR6CR90
	FS0WjJlCP3+IkrLeF02AHc5aR6ih6KsVoV0QFfw2fWiKHuunkl3Zf2neMh0MquIhkWtppePeFhfa+
	binW98QbfEX8mt3o3Vs50fTp22IgjKJLcIIjATlyBBfgBY0k569figwvGSLtqVa3LcPIb1A+rtjBB
	e61zWjyBb0DYpmpqHjG+wH5WtNqwsocY/cc7Zwc+odJsGR/q7tr8KO6ebqhdevImGEA6Uv29UJ0VV
	KG9KzD8GF+d3fWBK8aqMdWd0VFarCWrSKpQSN8p42H5FfL0tWMjJkKquQwI2drdsjA5Odf0h8SdVI
	317VfD/owoDH51zsVH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY00-0000000D46K-1AnW;
	Thu, 26 Nov 2026 11:50:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXzi-0000000D3yc-3g9d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:50:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E6CD1D13;
	Thu, 26 Nov 2026 03:50:26 -0800 (PST)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AB593F632;
	Thu, 26 Nov 2026 03:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795693829; bh=M6YJ067DYPpSDU4UXJ6oaiovDlaxST0eB8C0pfg04v4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SVIV6EpMIHaCeoj/be0YI77r6k/jNQxqGF3zQkn24yTuVZ5dChBpBA9mroGFuEkAw
	 TgDdRFjEjY+W54RiTdF6MTRTY7s8Y2jjLjWg3YvT9oB6Lm2/mIC6DSexpXWtWhdb+Z
	 YHsg8HB1e0Jflokm9UIlFBng2oYe3bsY26pMkLRM=
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-efi@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [RFC v2 06/13] ACPICA: Add TLBI table definition
Date: Thu, 26 Nov 2026 11:49:29 +0000
Message-ID: <20261126114936.864256-7-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126114936.864256-1-kristina.martsenko@arm.com>
References: <20261126114936.864256-1-kristina.martsenko@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_035030_957873_E368DF1A 
X-CRM114-Status: GOOD (  10.87  )
X-Spam-Score: -4.4 (----)
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

Add the definition of the new Arm TLBI ACPI table.

NOTE: This patch is not yet part of ACPICA and should not be merged as
is. The TLBI table description is not yet public and may change. This
definition is just an initial proposal of how it will look.

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 include/acpi/actbl2.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index 76e4a5bc79b4..98ef50b9bee1 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -61,6 +61,7 @@
 #define ACPI_SIG_SVKL           "SVKL"	/* Storage Volume Key Location Table */
 #define ACPI_SIG_SWFT           "SWFT"	/* SoundWire File Table */
 #define ACPI_SIG_TDEL           "TDEL"	/* TD Event Log Table */
+#define ACPI_SIG_TLBI           "TLBI"	/* TLB Invalidate Domain Table */
 
 /*
  * All tables must be byte-packed to match the ACPI specification, since
@@ -3708,6 +3709,37 @@ struct acpi_table_tdel {
 	u64 log_area_start_address;
 };
 
+/*******************************************************************************
+ *
+ * TLBI - TLBI Domain Table
+ *
+ ******************************************************************************/
+
+struct acpi_table_tlbi {
+	struct acpi_table_header header;
+	u32 domain_count;
+	u32 domains_offset;
+};
+
+struct acpi_tlbi_domain {
+	u32 length;
+	u32 id;
+	u32 descendant_count;
+	u32 descendants_offset;
+};
+
+struct acpi_tlbi_descendant {
+	u32 type;
+	u32 identifier;
+	u32 length;
+};
+
+enum acpi_tlbi_descendant_type {
+	ACPI_TLBI_DESCENDANT_DOMAIN = 0,
+	ACPI_TLBI_DESCENDANT_CPU = 1,
+	ACPI_TLBI_DESCENDANT_SMMU = 2,
+};
+
 /* Reset to default packing */
 
 #pragma pack()
-- 
2.43.0


