Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E0C606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x1FaJ6Eg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KeEymhvz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qCTT5tE1AhTDSZqYcsIs/FSirloZ4VPfHTJpLpeUVGE=; b=x1FaJ6EgNUlyfRCDwB+Wwk2lzJ
	9BmbD+iok8NgaLghb8NgE3FA4ZGyRDcsUTn79mai5qkg88Xsokhtl42Wb+H5GbPZ7hbhgwOnSveQ7
	bEGji5Ec9dSk/EYLfkYvx0jkGb2ebiBd4K7ZLQgcrW51od8MeVQ6UXk2SXHOR40n0brUcDYoAINnV
	/4h4LM6UeBGjKV651khaMF/2eP5b6QGOApcAAFm9GMr590KLi5ubVNoAZP6oZcwPw+tLBgujuQzl0
	Jca+q9D2htxIkXSD/bxG+rH4C9s/y3srfvp6YcBkqVBwnxDa8FdwM+zrNfqbo6eDxhwRpYjVrs0j0
	+kIhtMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTY2X-00000007jyf-3oq1;
	Wed, 18 Nov 2026 05:17:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTY2V-00000007jyJ-3VLQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:17:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so4606505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794979017; x=1795583817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qCTT5tE1AhTDSZqYcsIs/FSirloZ4VPfHTJpLpeUVGE=;
        b=KeEymhvzMibnYUqE8xw9lS5im4Zq2OscYDQ+4eyUBWwwLFr4xMofbDCdn0X+MQK+7g
         neUS9EZc0aQIeIHZlLcGmM88I/5ctm35HAoCfnGVZJYJOgpf8qCEfWPzlYIrzCzmpeOZ
         CL5BtgaPYWPpdETmZHvcimo1ICzpx9YIYOoZtsp9JeDsZLdzQVaByahKzSo0FrSdhJlt
         IcEGU8u9wdceVyWxbKq1JNIXgd85N4zFLBGhP1XWylxv4H6AGDXVs+6Fg5XBNXjNHv71
         R/+0HLpgXpUocqpIaLlBLomLLktd0nUsks7Np9oY/vu6WbJ441HCDpu6wLEVVDJpSyfP
         7KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979017; x=1795583817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCTT5tE1AhTDSZqYcsIs/FSirloZ4VPfHTJpLpeUVGE=;
        b=FwPj4xdY2g9pE0NY2cIXrwD0PetkjaEzRmY2zQN75qC2L0bLhk2PpbyXkXDrsB7VJO
         RfCZE4WEwO5x/Yvdjd2S6aT/WESfwhgvP7p9IAktCT5aUVLnPmBlAGa0Cn5X4UgjryxD
         azkp46FYgmdoDHlfiptfJvaYVGYPZX3xMRa760GUDvCsRg0U3BYc5bpz28b6uLBvQ53L
         1dT/GLNiAPDg6suZ4FxOnzXxcF5C79dNT+x1Nrn4IvkcpH/LKN64JztMTzsSu1v/05Gg
         +EVP9eupV+CMg5MIXmyq+zWU/9U72ZiB02F/VFnJygrvAX3ZIc+NEEwkPEGh9xkAjTBN
         p4Sw==
X-Forwarded-Encrypted: i=1; AL+hErHE/uy7N3SmGmfBmcMoIkVdDGshJb1kv7ncBVHbwH1or3ReHy7QV2IpHr4y5nx1xMFZU+5lfLyMcdwG/JN+uSHq@lists.infradead.org
X-Gm-Message-State: APuU4Z+Jx4ObcxFXR+xyQomvYEVSh4dX1ZsuXY5SHOFNG4hPJEzhs74i
	wnyI2Dn6cSGax+f1XvDje8TpJLgdVdjtQOKTwQd2efvRWUmgs8YXl+pn
X-Gm-Gg: AYBFou1g810O/aQDlDFCKAcKLEoBZP+jYpt9OBKxhxPSXY2sak+wSgIdNDlYdLjJ5tW
	3pHn2j29GrMBm1/KlhiYk30lBooT6ma/W3RfjZvAu6jDF8y8uK2sWjSqS8jCbLexA9EGiZG4MI5
	P0k60tLQekZDdKaps0hgzwlK5kMRPI4yDwX81qRRFsibpn6M/kT+NfrGdAvEnZS0V5hrVEIYr1U
	WJ/zLJMm59on1NitvcSSrOWAv85Ho2VFU/nE9Xgq5hbHkqhKrxIDB4HJ5BAUhpauxRO24SNUb3+
	C8ca1IRckhWgbEiZl5mQQVMTZUZAapW1eCuGcKFW2dSfawYJUOfLHcvfhZ0g3vL5iGOxMPqzA1s
	s4az1a4fjJfLxZGvRyJdp9i5Qb3EJ/eLsM3EZHgh6PxvmyVp0AWAJppd/AkltOmnRXRHMd3667H
	pKDou3a2/iBp8h5LA+fLqqoxz3Qe0mu3JQeG8VpmJelFR0AfbCHUF5l+qsnI60Se/7DPhGA5One
	BlUDqjx7qcH/+btbJj7AeoIexPEwX91VtoHXrcSLntGiabcjgQL14UKc1sxvnDOx0+56xKEmFZD
	xx0APW8Zv+4eK27em/1aOlZ+GI2FOtqBozxGLLmr7J8H4XEyHaDS14AP1kyIJustxC6H0FnETx3
	j5vYIyo6cMEftURMNUQn8UUVJ
X-Received: by 2002:a05:600c:4e04:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4bb7da18a01mr22383335e9.15.1794979017177;
        Tue, 17 Nov 2026 21:16:57 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78346f4asm122582685e9.0.2026.11.17.21.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:16:56 -0800 (PST)
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
Subject: [PATCH v4 0/1] KVM: arm64: Resume stage-2 range walks where they stopped
Date: Wed, 18 Nov 2026 10:16:47 +0500
Message-ID: <20261118051648.74580-1-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_211659_917959_BEFFFD5C 
X-CRM114-Status: GOOD (  19.32  )
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
"Before" is plain 6.18.29. "After" is 6.18.29 with v3 of this patch,
adapted to the older unmap loop, and with seven commits already in
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

Changes since v3 [4]:
  - In __pkvm_host_unshare_guest() and __pkvm_host_wrprotect_guest(),
    ret is an s64, so no second variable is needed.
    pkvm_pgtable_stage2_unmap() and pkvm_pgtable_stage2_wrprotect()
    return the error or addr + size with ?:, as Vincent suggested.

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
[4] https://lore.kernel.org/r/20261113080233.640539-1-haseebashraf091@gmail.com

Tooling: the patch was drafted with AI assistance (SiemensGPT). The
statistics were collected with bpftrace, using kprobes at function entry
and kretprobes at function return.

Testing: the measurements above are from the 6.18.29 backport of v3,
booted on the machine above with Xen as the guest hypervisor. For pKVM I
booted a 6.18.35-based L1 kernel with kvm-arm.mode=protected (protected
hVHE) as a guest of that machine, with and without v3, and ran a
non-protected 8GB guest. One create and power-off cycle made 11 pKVM
unmap calls: all returned 0 without v3, all returned addr + size with
v3. Ballooning the guest made 2097163 calls (4K pages and ten 64MB
memslot flushes), all returning addr + size, with no new dmesg warning
and a clean shutdown. That runs __pkvm_host_unshare_guest() at EL2.
Write-protect (dirty logging), flush and the other EL2 callers have not
been run on hardware; for them I rely on a user-space check of the
changed functions on random 48-bit 4K page tables, which gave results
identical to the code before the patch. v4 only rewrites how the pKVM
functions return their result and v4 is only build tested.

