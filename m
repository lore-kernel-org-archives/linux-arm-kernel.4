Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0559606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SrFFPl3X;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cjYWCtUM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U/1LQptGCCkV63Too82uQzQ9rERQJ0sbNJbOvd1Cdwg=; b=SrFFPl3XiT1fPr4NfXljtF1chK
	n+1734lJzQwBVuA55VqDI9h1qpSyA2NgTUReFzUedlAyO/sao6fDYJEC6O1v3/kSzo83rPbcPxyJW
	Z3k05q7ZgGnogtswtfNdLKQd1QEuUVOshHDZP/zY9CxM7ldPA4jPRppkYo0Mf3vhwVm7SzUA8Cg3I
	6MhgxX5JUb7nGH7/Z8Yu2NzEjTev0wjAncKTAXlB4r/hskTckVRMg0je8frYjBwIyvAw1Q9jA/tld
	1x/N8atp+lzNjigAUPRbtQWnhEcWTVHBS4f8MeYWspudbkxWIdR5SfshQ9y4fYA4wR1c9DVFqHBi9
	90ax9UdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPQ2-0000000FEKg-3Ead;
	Fri, 20 Nov 2026 14:16:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPQ1-0000000FEKG-1kuW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:16:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 838A362C7F;
	Fri, 20 Nov 2026 14:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472551F000C0;
	Fri, 20 Nov 2026 14:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795184207;
	bh=U/1LQptGCCkV63Too82uQzQ9rERQJ0sbNJbOvd1Cdwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cjYWCtUM6lKJvt1CQXbKgezqEJzlzoasNOuzQboEOmFpMGIwoX0FdUQnLqQSvoTEX
	 HYfMyzvYVI2Cdcd6a16auZ+9rzIRTz7uyKJvZlmJ/7WUYowzsWNo93/QSVYTnFB1J1
	 de7U/NH40PEhMC+G3be8XgIHiyUBnmoTxQc/8JSMEBNCqKrT66/NWqGdPdwjxklVKr
	 gJW2As1U5v62ksjr1FKbxqCgI/M5tY+8cQsJ2neckjnSAcQ69NX8IWZz5aY1mXyxvh
	 X1JSoY2QsWyzxmYeX0gi3rqIBO1R2HVGEz9btWL6bVFOLU/5v03YJ6iJWZkHwz7RNm
	 hI+HFx232+iOg==
Date: Fri, 20 Nov 2026 14:16:44 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Han Gao <rabenda.cn@gmail.com>, gaohan@iscas.ac.cn,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
Message-ID: <20261120-gorgeous-poetic-hummingbird-628d5d@sudeepholla>
References: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
 <20261120084335.3492524-1-rabenda.cn@gmail.com>
 <CAMuHMdUrCkbjJW3Ld1nFbfj_Dfa4YwhUoK5g7rAn89yz=bYy4g@mail.gmail.com>
 <90f6f5f1-ac62-4dd0-828d-d16fc9dc773d@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90f6f5f1-ac62-4dd0-828d-d16fc9dc773d@amd.com>
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

On Fri, Nov 20, 2026 at 01:37:13PM +0100, Michal Simek wrote:
> 
> 
> On 11/20/26 09:51, Geert Uytterhoeven wrote:
> > Hi Han,
> > 
> > On Fri, 20 Nov 2026 at 09:43, Han Gao <rabenda.cn@gmail.com> wrote:
> > > On Fri, 20 Nov 2026 09:26:47 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Fri, 6 Nov 2026 at 20:40, Han Gao via B4 Relay
> > > > <devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
> > > > > From: Han Gao <gaohan@iscas.ac.cn>
> > > > > 
> > > > > The SCMI core and the mailbox and shared memory transports only use
> > > > > generic kernel interfaces. Transports that need architecture support,
> > > > > such as SMC, already carry their own dependencies.
> > > > > 
> > > > > Drop the ARM and ARM64 dependency so that other architectures can use
> > > > > SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().
> > > > > 
> > > > > Suggested-by: Michal Simek <michal.simek@amd.com>
> > > > > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > > > 
> > > > Thanks for your patch, which is now commit fe87ede443a15969 ("firmware:
> > > > arm: scmi: Drop the ARM architecture dependency") in scmi/for-linux-next.
> > > > 
> > > > > ---
> > > > > This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
> > > > > now goes on its own through the SCMI tree.
> > > > > 
> > > > > Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
> > > > > no HAS_IOMEM, failed to link devm_ioremap().
> > > > > 
> > > > > Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
> > > > > and arm64. On UML, SCMI can no longer be selected.
> > > > > 
> > > > > [1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn
> > > > 
> > > > > --- a/drivers/firmware/arm_scmi/Kconfig
> > > > > +++ b/drivers/firmware/arm_scmi/Kconfig
> > > > > @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
> > > > > 
> > > > >   config ARM_SCMI_PROTOCOL
> > > > >          tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
> > > > > -       depends on ARM || ARM64 || COMPILE_TEST
> > > > > +       depends on HAS_IOMEM || COMPILE_TEST
> > > > 
> > > > Please extend the dependencies to RISCV (from the link above, I assume
> > > > you are targeting riscv?) instead.  There is no point in showing this
> > > > option on architectures that have no users of SCMI; one already has
> > > > too many relevant symbols to configure.
> > > > People who want to build test on x86_64 without OF, i386, loongarch64,
> > > > ppc64le, ... can just enable COMPILE_TEST.
> > > 
> > > Following Michal's suggestion[1], I'm dropping ARM/ARM64.
> > > 
> > > [1] https://lore.kernel.org/all/3d38c4a5-1a12-4af1-ac2e-413a457ce4c5@amd.com/
> > 
> > Yes, I read that.
> > 
> > For reference, other firmware interfaces are also not exposed to the
> > whole world:
> > 
> > $ git grep -w ARCH_SUPPORTS_ACPI
> > arch/arm64/Kconfig:     select ARCH_SUPPORTS_ACPI
> > arch/loongarch/Kconfig: select ARCH_SUPPORTS_ACPI
> > arch/riscv/Kconfig:     select ARCH_SUPPORTS_ACPI if 64BIT
> > arch/x86/Kconfig:       select ARCH_SUPPORTS_ACPI
> > drivers/acpi/Kconfig:config ARCH_SUPPORTS_ACPI
> > drivers/acpi/Kconfig:   depends on ARCH_SUPPORTS_ACPI
> > $ git grep -w "config EFI"
> > arch/arm/Kconfig:config EFI
> > arch/arm64/Kconfig:config EFI
> > arch/loongarch/Kconfig:config EFI
> > arch/riscv/Kconfig:config EFI
> > arch/x86/Kconfig:config EFI
> I can see it's usage with x86 too.
> Microblaze is another one which can also use it.
> 
> SCMI from my perspective should be open for any architecture that's why no
> restriction make sense.
> 

IIUC, Geert's concern is it now shows up asking the users to choose on all
other architecture. We should have to default off on all archs that don't
need it now and can enable it if needed. I agree and like that approach.

-- 
Regards,
Sudeep

