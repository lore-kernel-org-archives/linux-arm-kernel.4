Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7883C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fxm+IGbM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sg+Hr6MK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EL1rGzuTeW3MVgLe5/KZaT1wUaWiPydzOexl70Ne1SI=; b=Fxm+IGbMplNFmo
	X41PfI2NYbHjE9USDuTOvRxJ+3P0pN4p7yyGjcik6WQjzJnxVRVCEHEdGPeYGOnHJj7Hfds7y7nop
	q/CT4YWsf1z31sa5YwqYK/wBosdzD8eSkHl09TjjIQS+BeIoyfTNi2X6uw6OruBoMaNRJ7i4k25Kp
	jYv747xjMccnKCGsAsmEeOLrPqrj+MKdfPCEHSjhMHRbrk2kDhNOrvLI5jtRiqBuHsQHAdeWrVJuV
	oW/+3EvRXOrw+U4zAvCQO2WGjzDtal3IdMNOkrywGXCHJ+4IQaWxFpkHtWgADebbnqN+s8741/bdF
	cqxV7I1qEsrJn8GuG53A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY1C-0000000D4i7-26gF;
	Thu, 26 Nov 2026 11:52:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY07-0000000D4F3-0wAY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:50:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A47481CE2;
	Thu, 26 Nov 2026 03:50:51 -0800 (PST)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CD8C3F632;
	Thu, 26 Nov 2026 03:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795693854; bh=BAzpj4e1o9HZLbqYKvamfN3ccwawKGBx7s3KRS4gDEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sg+Hr6MKDsS0eivBvx6N2sk0aF+F8MRF5M2sQFgSJRyQYHznSza1v9EhzYEBrS1hm
	 8THRimgD3p1aIaCT8x2/7B5w/Z4ZUl7PhXeGdC3JTg0+QWuXeuq+QQgQNS7xSEbQiQ
	 Rj18EDFHUSe3XyXJMIjdoqepJk8Oi5UuR8WstqJM=
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
Subject: [RFC v2 13/13] arm64: tlbid: Add documentation
Date: Thu, 26 Nov 2026 11:49:36 +0000
Message-ID: <20261126114936.864256-14-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126114936.864256-1-kristina.martsenko@arm.com>
References: <20261126114936.864256-1-kristina.martsenko@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_035055_359960_73947250 
X-CRM114-Status: GOOD (  11.42  )
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

Add documentation to describe how the kernel manages TLBI domains. The
bitmap approach is based on ideas from Miko Lenczewski.

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 arch/arm64/mm/tlbid.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/mm/tlbid.c b/arch/arm64/mm/tlbid.c
index 2615ccb6bc56..85b6e33c82b9 100644
--- a/arch/arm64/mm/tlbid.c
+++ b/arch/arm64/mm/tlbid.c
@@ -19,6 +19,24 @@
 
 #include <asm/mmu.h>
 
+/*
+ * FEAT_TLBID enables a TLB invalidation to target a subset of CPUs instead of
+ * the whole Inner Shareable domain. It can improve performance on systems with
+ * many CPUs.
+ *
+ * A system with FEAT_TLBID contains a number of TLBI domains. Each domain
+ * contains a number of CPUs. Domain 0 is always present and contains all CPUs.
+ *
+ * For each CPU we maintain a bitmap of domains that the CPU belongs to. For
+ * each mm we maintain a bitmap of domains that contain all the CPUs that the
+ * mm has been installed on. When an mm is installed on a new CPU we reduce its
+ * bitmap to only include domains that include the new CPU.
+ *
+ * When issuing a TLBI we use the smallest domain for the mm instead of
+ * broadcasting to all CPUs. The domain bitmap is ordered by size, with the
+ * highest bit corresponding to the smallest domain.
+ */
+
 DEFINE_STATIC_KEY_FALSE(tlbid_enabled);
 
 static u16 *domain_ids;
-- 
2.43.0


