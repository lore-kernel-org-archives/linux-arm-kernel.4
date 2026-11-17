Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D940606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hYA+EW3W;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BartBUr6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4vnrUH1GRjckPRWmrfIxNgnhEnk8Xa/wgumm0ceW7tI=; b=hYA+EW3WKhyt4zW0qe7AgsZlxK
	aMBHc8S88rzlwzwLUfD7Pq2CRVagayJGZ+yQlmTLF7xWO6bR+SQqjhkIEeoDJrxoq/JlIbadFu2ey
	zgREEvUf5hft5EP1zG3G4NwHUGFfdKUbafVi/+UlRu3QAE+Ogxy6X2Ik1Bf7Z4wZqJx2IcZIcpEDA
	g8+R5LLUswJ3I0NlqWdn8h8DuUQCxKnmTrDnwbR6sz+w8Z22FLXWDpBzz9xvNEHlu+Pn2ShHaDMlU
	Ub/zrd9lkEe5q3970NLWIMZ3Kyr5Ok6vgqInt0obbDH/g+LnR/BEBO9XeKHx9oXCUEtkq8ZY/10RL
	ILO5uYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHvl-00000005WmZ-46Fs;
	Tue, 17 Nov 2026 12:04:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHvd-00000005WjO-0s73;
	Tue, 17 Nov 2026 12:04:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A559244EE1;
	Tue, 17 Nov 2026 12:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB411F000C4;
	Tue, 17 Nov 2026 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794917088;
	bh=4vnrUH1GRjckPRWmrfIxNgnhEnk8Xa/wgumm0ceW7tI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BartBUr6Stg07pLC0D2AtcCX9IUPXwbzyytX0DYnqSpCOIimST8hmkphcHHeU++bK
	 e6RwwUKsimCxqecV5NShikpsua8dkusxR3mHxnGNLECUkgGoflFMpcn8adtk+Wdrpl
	 YUcIM4BT10M+MxCdR+91P2cpf6D/ohd6a2PYX3ATaxLrkvnBN6xiynSOnCa0gJKDlC
	 IWyCDVw0VYOVuODbLLtpbTUmj7b8F/RETtDDrALEuv4Rgz68xTpNRr8RKnPpP4aVnL
	 4kKCgr4dHpYa4N5I2Q8enqkpioWyMRwdq6I4atxUCoO27dYl6mtCDM6uaIUaDPTp5N
	 +aIN4HNBU72NQ==
Date: Tue, 17 Nov 2026 12:04:40 +0000
From: Will Deacon <will@kernel.org>
To: matt@boondocker.io
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Igor Velkov <iav@iav.lv>, maz@kernel.org, arnd@arndb.de
Subject: Re: [PATCH RFC v3 2/6] arm64: Allow synchronous abort fixups for
 guarded MMIO reads
Message-ID: <avxC2NbBCa3Ilowr@willie-the-truck>
References: <20261116-rfc-b4-v3-0-0bf052b68f2a@boondocker.io>
 <20261116-rfc-b4-v3-2-0bf052b68f2a@boondocker.io>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-rfc-b4-v3-2-0bf052b68f2a@boondocker.io>
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

Hi Matt,

On Mon, Nov 16, 2026 at 02:35:44AM -0700, Matt Thompson via B4 Relay wrote:
> From: Matt Thompson <matt@boondocker.io>
> 
> An RK3399 PCI configuration read can raise a synchronous external data
> abort if it does not get a usable response. Allow an explicitly annotated
> MMIO load to return an error in this case.
> 
> Match only a current-EL synchronous external abort on a read instruction
> with the new exception table type. Keep existing handling for other
> faults, including asynchronous SError and translation table walk aborts.
> 
> Signed-off-by: Matt Thompson <matt@boondocker.io>
> ---
>  arch/arm64/include/asm/asm-extable.h | 15 +++++++++++++++
>  arch/arm64/mm/extable.c              | 20 ++++++++++++++++++++
>  arch/arm64/mm/fault.c                |  4 ++++
>  3 files changed, 39 insertions(+)

[...]

> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
> index 299a244..dcb84d8 100644
> --- a/arch/arm64/mm/extable.c
> +++ b/arch/arm64/mm/extable.c
> @@ -28,6 +28,8 @@ bool insn_may_access_user(unsigned long addr, unsigned long esr)
>  		return false;
>  
>  	switch (ex->type) {
> +	case EX_TYPE_MMIO_READ_ERR_ZERO:
> +		return false;
>  	case EX_TYPE_UACCESS_CPY:
>  		return cpy_faulted_on_uaccess(ex, esr);
>  	default:
> @@ -101,6 +103,8 @@ bool fixup_exception(struct pt_regs *regs, unsigned long esr)
>  	case EX_TYPE_UACCESS_ERR_ZERO:
>  	case EX_TYPE_KACCESS_ERR_ZERO:
>  		return ex_handler_uaccess_err_zero(ex, regs);
> +	case EX_TYPE_MMIO_READ_ERR_ZERO:
> +		return false;
>  	case EX_TYPE_UACCESS_CPY:
>  		return ex_handler_uaccess_cpy(ex, regs, esr);
>  	case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
> @@ -109,3 +113,19 @@ bool fixup_exception(struct pt_regs *regs, unsigned long esr)
>  
>  	BUG();
>  }
> +
> +bool fixup_sea_exception(struct pt_regs *regs, unsigned long esr)
> +{
> +	const struct exception_table_entry *ex;
> +
> +	if (ESR_ELx_EC(esr) != ESR_ELx_EC_DABT_CUR ||
> +	    (esr & ESR_ELx_FSC) != ESR_ELx_FSC_EXTABT ||
> +	    (esr & ESR_ELx_WNR))
> +		return false;
> +
> +	ex = search_exception_tables(instruction_pointer(regs));
> +	if (!ex || ex->type != EX_TYPE_MMIO_READ_ERR_ZERO)
> +		return false;
> +
> +	return ex_handler_uaccess_err_zero(ex, regs);
> +}
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index b227368..ebe8054 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -30,6 +30,7 @@
>  #include <linux/hugetlb.h>
>  
>  #include <asm/acpi.h>
> +#include <asm/asm-extable.h>
>  #include <asm/bug.h>
>  #include <asm/cmpxchg.h>
>  #include <asm/cpufeature.h>
> @@ -879,6 +880,9 @@ static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
>  	const struct fault_info *inf;
>  	unsigned long siaddr;
>  
> +	if (fixup_sea_exception(regs, esr))
> +		return 0;
> +

We've deliberately avoided exposing an interface such as this from the
architecture code for a variety of reasons, including:

- If you can trigger one of these, you can probably also trigger
  asynchronous exceptions (i.e. SError) which we cannot handle using
  fixups

- External aborts are usually a sign that something has gone horribly
  wrong

- In the general case of MMIO, it's not at all clear what state the
  endpoint is left in and so swallowing the abort is likely masking the
  issue

- It's not a portable interface for drivers

So rather than trying to fix the symptoms, it would be much better if
you could fix your driver so that the hardware doesn't generate these
things in the first place.

Will

