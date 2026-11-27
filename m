Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A0A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nCBLMBvA;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=XVHGxq2M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=K5UnO/HVNaEZuU1ks4QKgaqDoGYKFkvZOzz6WTltCGM=; b=nCBLMBvAdmZNf6sUMfQEsiuBM7
	edtQHdr6wOuU2WRzXGpi0LOXnL+DFxO6FETt4rOIk/6NmxCmMOB5UHZq96beZWkK1L4NKSty919P8
	x009vUtWEkeydAymhRv/HvVKazoVAz9CcQNEWMMBVin+9+JDzZQROxk31bYwhmONpRtxX/x10B8nc
	NN9Jkdsq/oIXiS/2X/wv0d0lpG2Y84ChkZtv4yq3wulCYHIYPUaItW8DFSaAcuVu42l2SnFNBEMtj
	gt6QK6dXg17swQyeYFsAF6M4c7zoAihD9MXTymdzmPMAxVz7pV920727JYBFn5MyQOZbjlGNktd7l
	hh1yRBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWq6Y-0000000F5wc-2bAC;
	Fri, 27 Nov 2026 07:10:46 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWq6V-0000000F5vz-2Obo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795763436; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=K5UnO/HVNaEZuU1ks4QKgaqDoGYKFkvZOzz6WTltCGM=;
	b=XVHGxq2MX7JvD9SYmWGcHLVK5ePfUra3YYRo3N6KAjuYnq//jxhmyIqKuz9UbqHNtlBV/Uvav2J4Nc33+77NA2MG/kpj3cNhFqzeH7aIY5tzrKkyFrCD411NWbWew+UQ2CyXLg5cVSUQZw1bGUq53JG2JDVRy9Sj5UKYKKNV3iM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R361e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0XFX36Mc_1795763423;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFX36Mc_1795763423 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 27 Nov 2026 15:10:36 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jiangtianfeng@linux.alibaba.com
Subject: [PATCH 0/2] perf/arm_cspmu: nvidia: Fix TGT address-filter handling
Date: Fri, 27 Nov 2026 15:10:08 +0800
Message-ID: <20261127071021.820833-1-jiangtianfeng@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_231044_499236_49034C69 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Tegra410 PCIE-TGT implementation has two independent issues in its
address-filter handling.

First, an empty ACPI memory-resource list is accepted during probe,
leaving addr_filter_reg as NULL and allowing a later filter event to
perform an invalid MMIO access.

Second, the slot lookup can allocate a free slot before finding an
identical active filter, reset can match zeroed metadata from a free
slot, and cycle events can reset a slot they never allocated. These can
cause wrong-slot release, refcount underflow, and loss of filtering for
an active event.

This series rejects the missing resource at probe and fixes the slot
lifecycle without changing the shared PMU callback ABI or rejecting
valid zero base/mask filter data.

AI assistance disclosure:
Qoder AI coding assistant was used with the current upstream source and
the identified defect sequences as inputs. It contributed to the problem
analysis, code changes, state model, and changelog drafts. The human
submitter is responsible for reviewing the complete series and adding
their own Signed-off-by tags.

Validation:
- source-derived model reproduces wrong-slot release, zero base/mask
  underflow, and cycle/reset underflow before the fix;
- the proposed lifecycle model passes those cases and 100 x 500 random
  operations;
- independent static review covers duplicate filters, arbitrary stop
  order, zero base/mask, cycle, full slots, and reset-without-allocation;
- checkpatch.pl reports no issues other than the expected missing human
  Signed-off-by tags in this unsigned draft;
- complete ARM64 Image builds successfully;
- nvidia_cspmu.o and arm_cspmu.o build with W=1 without new warnings.

NOT_RUN:
- runtime fault injection or probe validation with abnormal ACPI tables;
- real address filtering, duplicate event start/stop, cycle/reset, slot
  exhaustion, module reload, or multi-RC testing;
- PCIe/CXL traffic, target hardware, existing Ampere/NVIDIA runtime
  regression, or long-duration testing.

Jiangtian Feng (2):
  perf/arm_cspmu: nvidia: Reject missing TGT address-filter resource
  perf/arm_cspmu: nvidia: Fix TGT address-filter slot lifecycle

 drivers/perf/arm_cspmu/nvidia_cspmu.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

-- 
2.47.3


