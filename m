Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6345606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sECSVlmh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdxJBZGZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WT6C7Hu6Q9Eo/dM1QL4EzHwS0urSyLblqYy3glwBl5U=; b=sECSVlmhkfUH/8APqGqK9/pVf1
	FtvQHBLBiYtLaL8z+mZ+shGTZ2onsn/mk5GdoCVy4JGvbyX7khgIyync1fNP4EyNtzWdORnx9EA5C
	dlkPUfYY7dIyfrOn1hRqilEAUOL+6k6vRDMGq6DPi+f08z70RLOa3LBF/1dk255+q/xXkkwGYY2YT
	lgSMh4xSdqSPHlzpOJMjt0XJMx2bvugQeB1vq7JCcbx/MUiV4XQNm6hSN64tKIhSYlbEors1KTIHf
	TDe1jerkBEO2Hn9/C9dhhjQvUHELZHsIOJc5cIMjlVqMoh8N7+v5tiElNgG5I+6NuxZYfuAh6H9VS
	OPlUHmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp0A-00000004aVC-1pqx;
	Tue, 10 Nov 2026 16:47:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp08-00000004aUq-2kHV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:47:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a214af2076so16755315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329234; x=1794934034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WT6C7Hu6Q9Eo/dM1QL4EzHwS0urSyLblqYy3glwBl5U=;
        b=DdxJBZGZ8gCcVDrXglC2tu8yBPkJyVrYJZ8AKKoKMc4uhYcL/VOp0ay+K8dslHuXm+
         7g96cevkZykCdijCxsK8JJuM2Z8Nx3anZy4A9+YvCUDkzSOJHrG8LRKnYAR2EygvOZnV
         fwV3247PHPwNdeYsjffhG5NoV4hw/mlqF6KghCL2VlHO0u3arwZeQ6Qu4Zu6mlLXkRS0
         s2drYSPL1Aj5WEhg6r3HZzwFiRSW3xIFU8uz9nB1Hpwxb0QiAeZKiIOCkPpBjQ5VLJSR
         ayEwc9tt6vXA+KdcZ/3wdAOHrNzv8uwcd+iXo0pHf7c7IOi01lFze6RaZXj2R2R7tkCz
         DDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329234; x=1794934034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WT6C7Hu6Q9Eo/dM1QL4EzHwS0urSyLblqYy3glwBl5U=;
        b=pHVfYJDcySBDd5a0zH5J0fo5YRCyj5AfLFtWVF3hf6eJziCqMsJ7+BHCi9fjXSG0K1
         HkZYF95RzFE1vSHknZ5/A4rkmeUmfWnNsqbW53funnBmKnqjXXTrNRm2WFbTDlxAGVQZ
         nau44ORsQWyRn6hhpxAQqZI0TKTxEfr+MaX5K4MebOJgOsi80DRvBvvJyARvqeNuO8DU
         gSElmWVatxoS/ITkJD4Ue+8sYWA9rlDLCMtMBFONEkER8IGgeDqWfaIx3f194bYPclZl
         bCcWkX+N1a229aWbppgbVa6jWAv33wwlby9/rcE+MoInf4IB1K/LcyFk1JRswnCZWm7f
         vbsw==
X-Forwarded-Encrypted: i=1; AL+hErHE67ue0LhxQ3EvUJQc/4QFJJh4VWipcydvb1WMkDH6m3RUmX7LhzxQmU4v1NbbzKH8dySCgQ5FPaef706zZ1st@lists.infradead.org
X-Gm-Message-State: APuU4Z/dHfJYeRyzx1JU6pviYsote6vYOIW5e8HLxwVCUx5uvM5j2ZMQ
	OQ6U/KO85cE/DwtpTyeARrpfron2LfKE3CqfG8hHnmSxaDnFibYY8S3j
X-Gm-Gg: AYBFou22LlXMUBQwXpiZ/CTWIdgubgbwIuJ5ehseqrRyo5jVMx5uiDCGtwtNXgNm2TS
	Cl2ErZBnXFL8rApFGJvxx1FMEvAcqV8/4OBZlLEzX8YfqEXgt3zakSUI0E6uwNq1UNps+bdfiJ6
	3AmL8gf7qp5odxVvYHTAt5/UsYN+pcXoUl1Wsr0tkYC3srje36krZqalQ6FKX09DClndn5S32LS
	F8UIb/Ou3ZwD2wwuKGh9X0VXGUIToGYoE5bMOi1Ibum96kH1supPPLv5fv5uN3ikL8CJv4U/WSs
	Beka86dT/5KbrrQA2P/wYVluzcPPJn50nrKMlLz0WX77YeSZnQo7OZjHZD4F8aVppVCQPLkjRqA
	84UAOzGNZDKqFxzqf8iq4FnSbfSaKRfGhqJNhILnHvvLS52Dl1NqqYjWtU9r/FTcvQPLcNZa5TM
	x5XBeB0ZsWQeELMCwk6hQmgcd7T5CUnlplHOxwHXu+wC+X27w5XfK2mYHKZpK37gNrGSJYpGMu4
	u6tKEg0R704S+WxmYYyEbAiNBeLBopztEezW+H2NqpeyfhTXymSNhqTXsBn7x0NTwnF5+vIdERd
	lsDSz4ZBg9p6vLNtBM4/eZXRR3hXGerqE+TUKV7m2LG4JHQqKemAF9FL38ThgmkjckKMc8/EYFp
	MLfq3/jsc1qKrqHIgN948m8JR
X-Received: by 2002:a05:600c:4e8a:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4ba02345745mr59161225e9.12.1794329234174;
        Tue, 10 Nov 2026 08:47:14 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.65.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm84905075e9.9.2026.11.10.08.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:47:13 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: maz@kernel.org,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	fahad.arslan@siemens.com,
	haseeb.ashraf@siemens.com,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] KVM: arm64: Resume stage-2 unmap where the walk stopped
Date: Tue, 10 Nov 2026 21:47:05 +0500
Message-ID: <20261110164706.582879-1-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_084716_738519_E7E40520 
X-CRM114-Status: GOOD (  14.07  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Unmapping the whole IPA space of a shadow stage-2, as emulating TLBI
VMALLS12E1IS and TLBI ALLE1IS does, walks it one block-sized chunk at a
time. The walker steps over an invalid entry in one go, but the next
walk starts at the following chunk, so an invalid entry larger than a
chunk is visited once for every chunk it covers. Each walk also ends
with a range TLBI when FEAT_TLBIRANGE and FWB are available.

This version follows the approach of Fuad's series [2]: the walk reports
the address it reached, and the unmap loop resumes from there. The walk
already handles every entry it steps over, so nothing has to be looked
up beforehand.

An example shows what changes. Take 4K pages and a 48-bit IPA space.
The root is a level-0 table with 512 entries of 512GB each, and a chunk
is 1GB:

  Empty shadow stage-2
    before: 2^18 = 262144 walks. Each of the 512 level-0 entries is
            visited once for every one of the 512 chunks under it.
    after:  512 walks. The first walk under an invalid entry returns
            the end of that entry, and the loop resumes there.

  One populated 512GB region (RAM and devices low in the IPA space)
    before: 262144 walks.
    after:  at most 512 + 511 = 1023 walks: 512 chunks inside the
            region, and one step over each of the 511 other entries.

The example is derived from the page-table layout. Measurements follow.
The machine is an AmpereOne A192-32X (192 CPUs, bare metal, 4K pages,
48-bit IPA, FWB and TLB range maintenance present) running Xen as a KVM
guest. The workload is one create and destroy cycle of an 8GB guest
under Xen. bpftrace kprobes and kretprobes recorded every full-range
unmap (start 0, size 2^48), its walks, its range TLBIs and its duration.
"Before" is plain 6.18.29. "After" is 6.18.29 with this patch, adapted
to the older unmap loop, and with seven commits that are already in
mainline backported: 33346f8960c7 and e5843f4effaa (nested_mmus life
cycle), and a6ca6cba5959, c2778d14cd2f, 5491980c1a41, e6084aecaeef and
2064f15b0848 (guest stage-2 tracking).

                                    before          after
  full-range unmaps                    192            128
  walks per unmap                   262144     512 - 1024
  range TLBIs per unmap             262144  same as walks
  unmap duration, mean            907.8 ms        3.77 ms
  unmap duration, median          909.3 ms        2.46 ms
  unmap duration, min             815.5 ms        2.06 ms
  unmap duration, max             937.6 ms       27.8  ms
  VMALLS12E1IS trap, mean         957.0 ms        3.78 ms
  VMALLS12E1IS trap, max         1848.6 ms       27.9  ms

Walks per unmap after the change: 512 (10 unmaps), 534 (1), 546 (78),
1023 (38) and 1024 (1), mean 689. The page-table occupancy was not
recorded, so I cannot tie each count to a layout. 1024 is one more than
a single populated region gives. Before the change nine of the 177 traps
unmapped two shadow stage-2s and took about twice as long; after it
every trap unmapped one.

Patch 1 adds kvm_pgtable_stage2_unmap_range(), which returns the address
its walk reached, and has the unmap loop resume from there.
kvm_pgtable_stage2_unmap() keeps its return value for its callers at
EL2. The unmap of a shadow stage-2 also drops the guest stage-2 records
of the whole span the walk covered. The TLBI VMALLS12E1IS handler,
kvm_nested_s2_unmap() and the pending unmap of a recycled shadow stage-2
need no change.

Changes since v1 [1]:
  - Reworked as Oliver suggested: the walk reports the next IPA to the
    outer loop, as in Fuad's series [2]. This replaces
    kvm_stage2_unmap_all() and its kvm_pgtable_get_leaf() lookup.
  - No extra VMID-wide TLBI: each walk keeps its own TLB maintenance.
  - Measurements added.
  - Based on Linux 7.4-rc1, the same base as [2]. It does not depend on
    [2]; it applies with and without it.

[1] https://lore.kernel.org/r/cfa77cdbf14d9fd24c22ab1ef9b940a0d7411699.1794229714.git.haseeb.ashraf@siemens.com
[2] https://lore.kernel.org/r/20261106133000.453240-1-fuad.tabba@linux.dev

Tooling: the patch was drafted with AI assistance (SiemensGPT). The
statistics were collected with bpftrace, using kprobes at function entry
and kretprobes at function return.

Testing: the backport of this patch, together with the seven commits
listed above, was booted as 6.18.29 on the machine above, and the
measurements are from that kernel. The patch for 7.4-rc1 itself was only
compile-checked in isolation.

