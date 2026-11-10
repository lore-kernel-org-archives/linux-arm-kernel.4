Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FCC606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o/eFgwux;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h5fXhKox
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y24OJW4EoMO7yGiciR1HwijWYO6KOqn+1jLKGBtMcXQ=; b=o/eFgwuxawGyjYsXlr4J6kjtoS
	XNCMc3exOJ5LD1f8+6rch9tSi+ZQ19bWAecN4HWGUXHc+rNAUJqrPlnBiTjS3YjKJKsKIrgqUFeLj
	VI9NHWZo/nYvstMj9q5TSDBoMp6Z7+raaxGD8ctGxgWlGAHtXoRFU6pb0ExCVh6XyYOvfzKPw5aiD
	3UbDIgdv4ATZ5Wy2ppqRijdFmMoWajMDXY6HkQedUTl9CbfiF3/1QG69tTmwPTW0fk0OEDLp/Phpq
	UcHpu4wY4+9AtBPDsDXK7MHpRox0iKomKdVgdpuKuDAChMnVc6PdoAK1qs1jVBNmmy37xevlkMer3
	Tddye1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgfe-000000031hA-3giL;
	Tue, 10 Nov 2026 07:53:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgfd-000000031h2-1P0u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:53:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EEBDF61C72;
	Tue, 10 Nov 2026 07:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CC31F0089F;
	Tue, 10 Nov 2026 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794297211;
	bh=y24OJW4EoMO7yGiciR1HwijWYO6KOqn+1jLKGBtMcXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h5fXhKox52kfKh8xPKdROW1J41XfVM6s1edNgF+4g9jUIHHejuA1wc7aPjybnWEWf
	 PrwPMGqSl+OQFWqmKSI5FaZWEUQGujSZ3KYdL9Y+WV8UFfgivQQiqxOtIS0IWEKWGb
	 AV4gOAZsauMm3OEkp0bzbmI4ItKDnGXoVuEvXITWxCVPlGFfGVnkCoEbuyyCQdfoq2
	 Bxjt6zXEQi8G3j5hfn+pUze/ILV8X/dHQEoZyPYHmoWTU4YaVBzMltqKU7VCVnekKd
	 mGimdAz+4InpAXtD56kjGHZSJNEn9/au87Sm7bKWHAUT7jkfwsA0kjZwA54pv6vFxU
	 jjeGTILQU7aEA==
Date: Tue, 10 Nov 2026 07:53:26 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Arnd Bergmann <arnd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2] firmware: arm: Group interface drivers under arm/
Message-ID: <20261110-elite-shrewd-jacamar-d6c7e1@sudeepholla>
References: <20261106115046.62344-1-sudeep.holla@kernel.org>
 <c5af474b-a475-491e-a45b-5c026a5645ad@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5af474b-a475-491e-a45b-5c026a5645ad@redhat.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 01:27:24PM +1000, Gavin Shan wrote:
> Hi Sudeep,
> 
> On 11/6/26 9:50 PM, Sudeep Holla wrote:
> > Arm firmware interface drivers currently live directly under
> > drivers/firmware/. Some use an arm_ prefix while others use generic
> > names. More Arm firmware interface drivers, such as:
> > 
> > 1. Live Firmware Activation (LFA) [1]
> > 2. Firmware Interfaces for Realm Management Extension (FIRME) [2]
> > 
> > expected soon, which would further crowd the top-level directory.
> > 
> > There are couple of other possible arm specific firmware interfaces
> > that may need to reside there.
> > 
> > Create drivers/firmware/arm/ as the common home for Arm firmware
> > interface drivers. Move FF-A, PSCI, RMM, SCMI, SCPI, SDEI, and SMCCC
> > under it, drop the redundant arm_ prefix from the some directory/file
> > names. Update the Kconfig, Kbuild, maintainer and documentation paths.
> > 
> > The resulting hierarchy provides room for upcoming interfaces without
> > continuing to add Arm-specific directories at the firmware root.
> > 
> > [1] https://lore.kernel.org/all/20261102165421.3651202-1-andre.przywara@arm.com/
> > [2] https://lore.kernel.org/all/20261019-firme_interface-v1-0-27895c9cebaa@arm.com/
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> > ---
> > 
> > v1[1]->v2:
> >   - Rebased on v7.4-rc1
> >   - Fixed missing rmm folder movement in Kconfig and Makefile
> > 
> >   [1] https://lore.kernel.org/all/20261022090003.3083557-1-sudeep.holla@kernel.org/
> > 

[...]

> > rename from drivers/firmware/arm_sdei.c
> > rename to drivers/firmware/arm/sdei.c
> > diff --git a/drivers/firmware/arm_sdei_nmi.c b/drivers/firmware/arm/sdei_nmi.c
> > similarity index 100%
> > rename from drivers/firmware/arm_sdei_nmi.c
> > rename to drivers/firmware/arm/sdei_nmi.c
> 
> There are other two source files where updates are needed to reflect the
> renaming (drivers/firmware/arm_sdei_nmi.c -> drivers/firmware/arm/sdei_nmi.c).
> 
> gshan@gshan-thinkpadx1nanogen2:~/sandbox/l$ git grep arm_sdei_nmi\.c
> arch/arm64/include/asm/nmi.h: * drivers/firmware/arm_sdei_nmi.c implements them when active; a future
> arch/arm64/kernel/smp.c: *   - the SDEI cross-CPU NMI handler (drivers/firmware/arm_sdei_nmi.c),
> 

Indeed, I have a patch that I plan to send as a fix once this lands in
the upstream to avoid unnecessary dependency/conflicts across tree for
such silly thing.

Regards,
Sudeep

-->8
From 60c25986d81c86b0e966159715cf982d63308422 Mon Sep 17 00:00:00 2001
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 6 Nov 2026 13:49:13 +0000
Subject: [PATCH] arm64: Update stale path references to sdei_nmi.c

Commit ceb90a70d571 ("firmware: arm: Group interface drivers under
arm/") moved drivers/firmware/arm_sdei_nmi.c to
drivers/firmware/arm/sdei_nmi.c but left two comment references
pointing to the old path.

Update the comments in nmi.h and smp.c to reflect the new location.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 arch/arm64/include/asm/nmi.h | 2 +-
 arch/arm64/kernel/smp.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/nmi.h b/arch/arm64/include/asm/nmi.h
index 2e8974ff8d63..e2956b24b627 100644
--- a/arch/arm64/include/asm/nmi.h
+++ b/arch/arm64/include/asm/nmi.h
@@ -9,7 +9,7 @@ struct pt_regs;
 /*
  * Cross-CPU NMI provider hooks, consulted by the arm64 arch code before
  * its regular-IRQ / pseudo-NMI IPI paths. The SDEI provider in
- * drivers/firmware/arm_sdei_nmi.c implements them when active; a future
+ * drivers/firmware/arm/sdei_nmi.c implements them when active; a future
  * FEAT_NMI provider could slot in here too. The stubs let callers stay
  * unconditional when ARM_SDEI_NMI is off.
  *
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 014b163ce658..18e117fea1fc 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -881,7 +881,7 @@ void arch_irq_work_raise(void)
  *
  *   - the regular IPI_CPU_STOP and pseudo-NMI IPI_CPU_STOP_NMI handlers;
  *   - panic_smp_self_stop(), a CPU parking itself on a parallel panic();
- *   - the SDEI cross-CPU NMI handler (drivers/firmware/arm_sdei_nmi.c),
+ *   - the SDEI cross-CPU NMI handler (drivers/firmware/arm/sdei_nmi.c),
  *     which reaches CPUs the stop IPIs could not.
  *
  * The IPI stop handlers pass @die_on_crash true. The SDEI handler and
--
2.43.0


