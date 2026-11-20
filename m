Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F826606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q9YzEMpW;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W9dfn1oh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GA+rgY4utwY9kf5LrkartVA8tfESwwP7tCFlkDbq27U=; b=Q9YzEMpW77slprCKl4qi90BmVg
	vU4w1PqpWBfzOPm8K2EvA6yo7csgWhQkX22sgQhOzBVvXxgURIGJV9KuFa//5Q0wepVWO08tnccI8
	vELjNjkccS8Oe+TnQa1qfVFSmTaDXS3bO9lUHEhs0TELRi1PyQuxe44Qfc6QtZO5fT0pzXqOy3lTV
	s+M+sUmiD1sEiT/So3Q0+sVC+4TFL6clCaX7LudusmLhivU0patm1k8zon3vCEVXqeWv/Hgwub7Xb
	5FQocN1bZLDL9+l3NsJYBZtsgB77pUGcurUuMYGFaBGZXD4fZSy+RD+c6TS8jgatF5sjYguoe/fn8
	n4N8u0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM4Z-0000000Ed40-2Qsw;
	Fri, 20 Nov 2026 10:42:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM4U-0000000Ed2r-3Y8t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:42:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 430201477;
	Fri, 20 Nov 2026 02:42:18 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 402D33F632;
	Fri, 20 Nov 2026 02:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795171341; bh=KZjE07y4SmOyc71lJCM0v3KfRKAEC8tpOiHDkICt3Nc=;
	h=Date:From:To:Cc:Subject:From;
	b=W9dfn1oh5FlzZ73WblhD+zWKPJ7uT5LolA/jic0JijGNPiGabqk6eYLevYw1FHokE
	 LvueUommEyQ/clmqLH0a663hprd6eMCuR+huVn+B/4ytt7i3IFpfCJ73wRkmHQ3nzZ
	 zaEugB1c7WMtqdqvYsVIaTSiHYV1gaMzmAE5nx0E=
Date: Fri, 20 Nov 2026 10:42:17 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [GIT PULL] arm64 fixes for 7.4-rc4
Message-ID: <awAkCf3K4x8CtoKf@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_024222_984046_947F7914 
X-CRM114-Status: GOOD (  11.43  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

Please pull the arm64 fixes below: BBML3 allow-list corrections for
Cortex-X4 and Neoverse-V3/V3AE following updated errata, a kCFI oops
during kexec relocation and NEON intrinsics type mismatches causing
CRC64 and XOR build failures with tip-of-tree Clang.

Thanks.

The following changes since commit ad3fc05c7e65009355effeea06aa629a687acef2:

  arm64: suspend: Only track cpuidle context for idle tasks (2026-11-13 17:12:34 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to a041bdbe1f3a8efa8a527a89c84d3771232b4942:

  arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h (2026-11-19 00:10:15 +0000)

----------------------------------------------------------------
arm64 fixes:

 - Remove Cortex-X4 and Neoverse-V3/V3AE from the BBML3 allow list.
   Updated errata documents show that revisions previously reported as
   fixed remain affected by load/store livelocks when changing mapping
   sizes without break-before-make

 - Fix a kCFI oops during kexec image relocation. Give the relocation
   routine a type hash and enter the copied code at the correct offset

 - Fix the build with recent Clang versions by removing the stdint.h
   type overrides for NEON intrinsics. The CRC64 and XOR intrinsics code
   no longer includes the kernel's type headers

----------------------------------------------------------------
Ard Biesheuvel (3):
      lib/crc: Don't include <linux/types.h> in NEON intrinsics code
      xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
      arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h

Ben Cressey (1):
      arm64: kexec: use a typed entry to fix kCFI oops

Ryan Roberts (2):
      arm64: cpufeature: Remove Neoverse-V3/AE from the BBML3 allow list
      arm64: cpufeature: Remove Cortex-X4 from the BBML3 allow list

 Documentation/arch/arm64/silicon-errata.rst |  6 ++++++
 arch/arm64/include/asm/kexec.h              |  2 ++
 arch/arm64/include/asm/neon-intrinsics.h    | 24 +++++-----------------
 arch/arm64/kernel/cpufeature.c              |  3 ---
 arch/arm64/kernel/machine_kexec.c           |  7 +++++--
 arch/arm64/kernel/relocate_kernel.S         | 11 ++++++----
 arch/arm64/kernel/vmlinux.lds.S             |  5 +++--
 lib/crc/crc64-neon.c                        | 10 +++++-----
 lib/raid/xor/arm/xor-neon-glue.c            |  3 +++
 lib/raid/xor/arm/xor-neon.h                 | 16 +++++++++++++--
 lib/raid/xor/arm64/xor-eor3.c               | 15 +++-----------
 lib/raid/xor/arm64/xor-neon-glue.c          |  5 +++++
 lib/raid/xor/arm64/xor-neon.h               | 31 +++++++++++++++++++++++++----
 lib/raid/xor/xor-neon.c                     | 16 ++++-----------
 14 files changed, 89 insertions(+), 65 deletions(-)

-- 
Catalin

