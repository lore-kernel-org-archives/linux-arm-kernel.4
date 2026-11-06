Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA34E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 20:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vw6dngrw;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C1w1tsN3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=R5DTVliTIzgLtOjZqg2nUZXCBUkscXpY/488e6YJO8s=; b=Vw6dngrwHso8aeq0JdyS+PYtJK
	KlEv+gnSxUJBl9wKn9x2irVght0xvGgAjY7Q3c0qLikUOFgxytBQ0oXFD8gYSuCMSvNXFkMWzkOrZ
	snx+e+LG341RdxJSlnJ20/pQfkJ9A0F4H60tVup8pkkce4xRAQy3SXL2+zrJ31iq5rXQAxZTTNFIz
	3TLlIp703dfw6eumdDtUP1Rkxs0r9PZqq8lQvjRaucej2fjfiYkbaKSmUu7+6OZZRsmnXCynwRym3
	fO4YNRUGCYbuxNATnV5CieCIlwE2lL7ZxSwnROpuIuWitakFmlL6iFx0ABKdhln49JDrgeChrz8yB
	/xSWVkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPQ7s-0000000DZMF-04yR;
	Fri, 06 Nov 2026 20:01:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPQ7o-0000000DZLq-3h8z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 20:01:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C5572F;
	Fri,  6 Nov 2026 12:01:18 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DBB23F632;
	Fri,  6 Nov 2026 12:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793995281; bh=AePJOyAuyt/5pF9iqDjaLRnTEjhNW595aixOdlo0gN4=;
	h=Date:From:To:Cc:Subject:From;
	b=C1w1tsN3qDSrKSAXdDNWdeKBbpBF0ud7on1u94eY5VXyol6V27FbNCfPZbHpihMy7
	 fPnleO/Rn+rRH9tnX2X6so1vS1wYBAmGMbocGTLc45bm/kgWDu/zBCLe4Ph15NlVzl
	 WbZKKToTan5QL+G3QB0Z3gjABpCz+ejXlLRmyFtQ=
Date: Fri, 6 Nov 2026 20:01:17 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 7.4-rc2
Message-ID: <au4yDc-l14h7hwMI@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_120125_078624_AFB7EC79 
X-CRM114-Status: GOOD (  10.74  )
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

Please pull the arm64 fixes below: SDEI (software delegated exception
interface) handlers taking nested exceptions (looping on the KPTI
trampoline vectors and clobbering the interrupted context's exception
registers), TPIDR2_EL0 preservation across CPU suspend, a
kexec_file_load() memory leak and an overflow in the /dev/mem
valid_mmap_phys_addr_range() check.

Thanks.

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to 58c1eb84e97701c583605ba2fd553b69afba2245:

  arm64: sdei: Preserve the interrupted context's exception registers (2026-11-06 17:43:20 +0000)

----------------------------------------------------------------
arm64 fixes:

 - Fix nested exceptions taken by SDEI event handlers. With KPTI, an
   event interrupting user space left the trampoline vectors installed
   and any exception in the handler looped forever. Also save and
   restore ELR/SPSR/ESR/FAR around the handler since an event can
   interrupt exception entry or return where these registers are live

 - Save and restore TPIDR2_EL0 across CPU suspend. Its value is UNKNOWN
   after a warm reset and the task initiating suspend could return to
   user space with a corrupted value

 - Fix an overflow in valid_mmap_phys_addr_range() allowing /dev/mem to
   map out-of-range PFNs

 - Fix an elf_headers memory leak in the kexec_file segment placement
   retry loop

----------------------------------------------------------------
Jinjie Ruan (1):
      arm64: kexec_file: Fix elf_headers memory leak in retry loop

Kiryl Shutsemau (Meta) (2):
      arm64: sdei: Run the event handler on the kernel vectors
      arm64: sdei: Preserve the interrupted context's exception registers

Wei Wang (1):
      arm64: suspend: Save and restore TPIDR2_EL0 across CPU suspend

Zhao Gongyi (1):
      arm64: mm: validate /dev/mem mmap ranges without overflow

 arch/arm64/include/asm/sdei.h          |  3 +-
 arch/arm64/include/asm/suspend.h       |  2 +-
 arch/arm64/kernel/entry-common.c       | 40 ++++++++++++++++++++++-
 arch/arm64/kernel/machine_kexec_file.c |  2 ++
 arch/arm64/kernel/sdei.c               | 59 +++++++++++++++++++++++++++-------
 arch/arm64/mm/mmap.c                   |  4 ++-
 arch/arm64/mm/proc.S                   |  8 +++++
 7 files changed, 103 insertions(+), 15 deletions(-)

-- 
Catalin

