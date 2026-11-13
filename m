Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1540606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d5G048sK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebbmbizW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=m2yVRZxHwu+H87tnkegJ2BGDddelTKfG+o3rRUob1Ps=; b=d5G048sKpYRH20+kRrteKzjjWK
	7ik5Uat8c2BYNT8CJdGQgkDZGcq9OOpQe0OELX/O3VYeSvGGd7qAhi8ymjrB4CwlgnYWQotCLIyw+
	MRDDCvYeybjlDptvlcQUXbui7vQ9WvzwGEonrUUrPRQUYOjVr5RFpv8OZSFurnlwUrB2uN2IkDvj4
	A+FbwBUn/kq1Kj2eD1J3l1yMmxz6JZnpvaDEqLxPKvlbKv9X9P/giTx/B+DGIC/7pcLgolUrRj4z/
	0rXWRkU9qBcTTuH8m/szEcrZO1We+bacg7DGRgFGbJQXsgtKoZUxf49mF8IHKVoBwTsT6oLye05VJ
	KkcOi4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmFJ-0000000ByXX-077p;
	Fri, 13 Nov 2026 08:02:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmFC-0000000ByUp-3uzz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:02:49 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so4323945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556963; x=1795161763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2yVRZxHwu+H87tnkegJ2BGDddelTKfG+o3rRUob1Ps=;
        b=ebbmbizWmxiQigSVdb1wdn6cycE8NHXiZlMKWC85/QsJYpXf96dS2ZjReS2i3ae8+2
         8TwcXuGiBD2NAI2E9nPXXY/Pi0frM9Lxmc2jMN3I3X7dFl8ySXbRN4SthNDnepbHdQ/E
         GVmEnLUF7iu/4Ztwzv1FEQPK1ilvFKpnEMxVUwI4SgE27mCff3cP7iMICzEzmPtsX/ZV
         cJD4B6XVtLa5lZ6gGQJuXGan8NBN1ilU3EcaZ0Evqcy6+LPgSnSte4IP1eyY9gh5WXFw
         R5c6epDJImAgoqID6J/P50uGAMcNp86iM/qycXTzW7OFFFXAFl43lSMG2wGEv+hmazGt
         aH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556963; x=1795161763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2yVRZxHwu+H87tnkegJ2BGDddelTKfG+o3rRUob1Ps=;
        b=zSc0PN8yKrdRMgMIC46FJREPmHi1A29KnnJqLhfNbNKscL1H//4jz9uE7/LqhGnQ+6
         GJ05VGyP9KdJNbCKFA83RjnFLCr57hEuiGXyTR/aocmNtB2HY0Qw+HIADcsAOkjLaHPv
         DheGinEk0xtpCauwm5bmF3rqA3pUocMd2DEgJkrMw1NcRapQRcCmDgJKa4rwvEYvmZ4n
         LTxszlUswsMLViAOigWGKuYSm+V+djs9GoINnxBSfLjz5qRfWtpB1GoqSEyGP7/P/QmW
         R35jk+3I3hiVJL5QVAGA+B6rMsMCFNFj95G1iNE4ftQjceW74DqaJ2nh1iUiVHR/4/i4
         byeA==
X-Forwarded-Encrypted: i=1; AL+hErHBAzRrV0zPaTEtNEuwfemdO2ukbQQ/lrnqC+EnXb825BEehMyru/m1avpFx1+EgFAHUPOs3xEVFg4i7XLBI17A@lists.infradead.org
X-Gm-Message-State: APuU4Z8v7ASSetpFQVjlrX5s44wiQXel72OnbwlYxZJUVC/cJYx1xnsK
	GgXO89TCSzGaJTNI+A3nhrBqSYCrFPLjEty514bFyfdC81DaGGNc5EU5
X-Gm-Gg: AYBFou1VZeaOrE5HKp/ksy8LQX+K7G411l0VgWr4H6ZJxuYseQUqcPaSGUc0ZI0a8+w
	1U5J+q8MqQ4Gd2oCIb8wecb3YMnE4JvLj7XVH74n2Gh75czbssy2JOMBoKXVWv+avOyusyRaSNk
	HEPtqnsO3WbB+hgE97NsGY2nBg68sGFfaSyrUT4PfA1YkSrh83C1qQG/m+z4LebdA8b2N2tLX02
	obDR0FJWgv2X/Ni0KwPgugDtUqvaYSRlQUwiFbTfIVQmCYRQI47Fd5eCJ7vQwxz6Xo/Z632FDaK
	eMQe5R7I35rKfUfbvkSrYgucySCmSIEBcEyE/9gPZrR6/r4hmk9oT78csWPho/zc3207yis9iw4
	81BSoRZ0SC3svQ9a0x7gQFxfqCCR4I2dJ2iYhZhdCjQ10sUc6O+xLpyqQm6UFsKBF5yqmBoNHW6
	xSIFCPFkFvEo8Jpa9BoCk3Gfk5dVJOmvmZFfnHxt/M3jjznUR927ESgKBrDf3UZy0NGE2jt9gIp
	ooqBmGOSqBFncisXIJQ5H4HTJL92RhqkWSUAE9LENbj37SbSutoJcsCPCNDMrBi1Ld4Z1tHL0iX
	50ZYpkWOOBHBNld5c2AiVYUMgTOrLDfpVLIABAoXpwSEduhIPNBxC19fUWlq8BSYm5/xgKcufHp
	ogNReX1ML8mF0l7sgCxPgpyQb
X-Received: by 2002:a05:600c:8b8c:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4bb55a7a460mr31197555e9.19.1794556962979;
        Fri, 13 Nov 2026 00:02:42 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.13.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm31815065e9.2.2026.11.13.00.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:02:41 -0800 (PST)
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
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] KVM: arm64: Resume stage-2 range walks where they stopped
Date: Fri, 13 Nov 2026 13:02:32 +0500
Message-ID: <20261113080233.640539-1-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_000247_107880_98EB822D 
X-CRM114-Status: GOOD (  18.08  )
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

stage2_apply_range() walks a range one block-sized chunk at a time. The
walker steps over an invalid entry in one go, but the next walk starts
at the following chunk, so an invalid entry larger than a chunk is
visited once for every chunk it covers. Each walk also ends with a range
TLBI when FEAT_TLBIRANGE and FWB are available. Unmapping the whole IPA
space of a shadow stage-2, as emulating TLBI VMALLS12E1IS and TLBI
ALLE1IS does, takes 2^18 walks with 4K pages and a 48-bit IPA space,
however little it maps.

As in v2, the walk reports the address it reached and the loop resumes
from there, as in Fuad's series [2]. v3 does this for every user of
stage2_apply_range(), as Wei-Lin suggested, so there is one loop: unmap,
write-protect and flush get it, and their pKVM counterparts report the
end of the range. The walk handles every entry it steps over, so
nothing has to be looked up beforehand.

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
  full-range unmaps                    226            672
  walks per unmap                   262144     512 - 1023
  range TLBIs per unmap             262144  same as walks
  unmap duration, mean            905.8 ms        4.06 ms
  unmap duration, median          906.8 ms        3.31 ms
  unmap duration, min             842.7 ms        2.08 ms
  unmap duration, max             941.6 ms        45.4 ms
  VMALLS12E1IS trap, mean         899.7 ms        4.06 ms
  VMALLS12E1IS trap, max          941.7 ms        45.5 ms

Walks per unmap after the change: 512 (8 unmaps), 534 (1), 546 (366),
547 (1) and 1023 (296), mean 756. The page-table occupancy was not
recorded, so I cannot tell which layout each count reflects.

Patch 1 makes stage2_apply_range() take a function that returns the
address its walk reached, or a negative error code, and resume from
there. kvm_pgtable_stage2_unmap(), kvm_pgtable_stage2_wrprotect() and
kvm_pgtable_stage2_flush() are that function for unmap, write-protect
and flush, and so are their pKVM counterparts, which return the end of
the range as they do not walk page tables. The other callers of unmap
and wrprotect, in nested.c and at EL2, only looked for an error: they
now check for a negative value, and those that pass the result on turn
it back into 0. The unmap of a shadow stage-2 also drops the guest
stage-2 records of the whole span the walk covered. The TLBI
VMALLS12E1IS handler, kvm_nested_s2_unmap() and the pending unmap of a
recycled shadow stage-2 need no change.

Changes since v2 [3]:
  - One loop for all users of stage2_apply_range(), as Wei-Lin
    suggested. stage2_apply_unmap_range() is gone. Unmap, write-protect,
    flush and the pKVM functions report where they stopped, under their
    existing names. Their other callers, in nested.c and at EL2, are
    adapted to the new return value.
  - The walks go through one helper that kvm_pgtable_walk() shares, so
    they keep its walk_begin() and walk_end() calls. v2 called
    _kvm_pgtable_walk() directly.
  - Measurements repeated with this version (the 6.18.29 backport of
    it). The ones in v2 came from its unmap-only code.

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
[3] https://lore.kernel.org/r/20261110164706.582879-1-haseebashraf091@gmail.com

Tooling: the patch was drafted with AI assistance (SiemensGPT). The
statistics were collected with bpftrace, using kprobes at function entry
and kretprobes at function return.

Testing: the measurements above are from the 6.18.29 backport of this
version, booted on the machine above with Xen as the guest hypervisor.
For pKVM I booted a 6.18.35-based L1 kernel with kvm-arm.mode=protected
(protected hVHE) as a guest of that machine, with and without this
patch, and ran a non-protected 8GB guest. One create and power-off
cycle made 11 pKVM unmap calls: all returned 0 without this patch, all
returned addr + size with this patch. Ballooning the guest made
2097163 calls (4K pages and ten 64MB memslot flushes), all returning
addr + size, with no new dmesg warning and a clean shutdown. That runs
__pkvm_host_unshare_guest() at EL2. Write-protect (dirty logging),
flush and the other EL2 callers have not been run on hardware; for
them I rely on a user-space check of the changed functions on random
48-bit 4K page tables, which gave results identical to the code before
the patch.

