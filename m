Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB99606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pR+edBfU;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CWOkp8F7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Uw51BNnNSMZkfcts9aiEFizxk6Nl2DC+AS1z+RPufIo=; b=pR+edBfUXjTjk6qegr6BUGf0rL
	c4yacTwRHmzhHL4bCV5llqmLDpqGBuVheNviwvidaCOxs5+UZSUiAGKPHurVmphjq+5mrF35ugtoW
	gwSWEs6Qw5OKBrc3m3SxhybQTpYojmk6LvUxzDlh1Zfq55G9ZQwvEwJaE7hg/LeXBew+T27pi1+hV
	XvDDc2TGO3oEUhJQx1i3YaRH8V3mDDwSNS+J89zDo77y5hC9Bd2UapRgmByopInWtyRZ+fA/VE7o5
	AFc3AmBLOWVWhHd5FfLNSH2k3chXyjv4PaHMIXhIRE6WNePkyBMgTuoUD6l1W5yR9H3XRXN6k+Nus
	CuvoVa+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDqM-0000000A84H-2Fpy;
	Wed, 25 Nov 2026 14:19:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDqJ-0000000A82r-2Sg5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:19:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46AD32F;
	Wed, 25 Nov 2026 06:19:22 -0800 (PST)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D1D03F763;
	Wed, 25 Nov 2026 06:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795616365; bh=zOuTUXAl5Me8B3Bviry0NGcs0zsjWzErFF7qo9A3aGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CWOkp8F7fQmWiAUNbgy+iHiUf8mWp+DIO06axxeCI11H+sQ6pnGd+zxvlgwqzB9hj
	 1dmzmWI6vwm1F1TraqVf1cvJPFRIjM7bW54/QNRJWGi2SEwtorVa+EspH4/ZJdZY7V
	 58m2h8ivwmNm/x1k+jTPsSn1HB7ERn1w+30/1qdw=
Date: Wed, 25 Nov 2026 14:19:15 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Nico Boehr <nrb@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>, Paolo Bonzini <pbonzini@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 03/23] arm64: sysreg: Convert OSLSR to automatic
 register generation
Message-ID: <awbuY0mETtZ_mQh3@e143914.arm.com>
References: <20261106-sysreg-v3-0-75e95980fb10@linux.ibm.com>
 <20261106-sysreg-v3-3-75e95980fb10@linux.ibm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-sysreg-v3-3-75e95980fb10@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_061927_720787_7DC29A5C 
X-CRM114-Status: GOOD (  19.40  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Fri, Nov 06, 2026 at 05:07:36PM +0100, Steffen Eiden wrote:
> Convert OSLSR to automatic register generation as per DDI0601. As
> OSLSR_OLSM is a composite field using bit 0 and bit 3 the combined
> values are still defined manually. While at it rename
> OSLSR_EL1_OSLM_IMPLEMENTED to OSLSR_EL1_OSLM_IMP to be consistent with
> the rest of the system register values.
> 
> No functional changes.
> 
> Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
> Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>

Need to do the Sashiko suggestion, it does fail to build.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

> ---
>  arch/arm64/include/asm/sysreg.h | 12 +++++++-----
>  arch/arm64/kvm/sys_regs.c       |  2 +-
>  arch/arm64/tools/sysreg         | 14 ++++++++++++++
>  3 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index e3b60ee03023..2ec9ba9cd896 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -186,11 +186,13 @@
>  #define SYS_DBGWCRn_EL1(n)		sys_reg(2, 0, 0, n, 7)
>  #define SYS_MDRAR_EL1			sys_reg(2, 0, 1, 0, 0)
>  
> -#define SYS_OSLSR_EL1			sys_reg(2, 0, 1, 1, 4)
> -#define OSLSR_EL1_OSLM_MASK		(BIT(3) | BIT(0))
> -#define OSLSR_EL1_OSLM_NI		0
> -#define OSLSR_EL1_OSLM_IMPLEMENTED	BIT(3)
> -#define OSLSR_EL1_OSLK			BIT(1)
> +#define OSLSR_EL1_OSLM_MASK (OSLSR_EL1_OSLM0_MASK | OSLSR_EL1_OSLM1_MASK)
> +#define OSLSR_EL1_OSLM_NI						\
> +	((OSLSR_EL1_OSLM1_NI << OSLSR_EL1_OSLM1_SHIFT) |		\
> +	(OSLSR_EL1_OSLM0_VAL_0 << OSLSR_EL1_OSLM0_SHIFT))
> +#define OSLSR_EL1_OSLM_IMP						\
> +	((OSLSR_EL1_OSLM1_IMP << OSLSR_EL1_OSLM1_SHIFT) |		\
> +	(OSLSR_EL1_OSLM0_VAL_0 << OSLSR_EL1_OSLM0_SHIFT))
>  
>  #define SYS_OSDLR_EL1			sys_reg(2, 0, 1, 3, 4)
>  #define SYS_DBGPRCR_EL1			sys_reg(2, 0, 1, 4, 4)
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 2b28b929f9f3..8c91de6a4097 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3309,7 +3309,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	{ SYS_DESC(SYS_MDRAR_EL1), trap_raz_wi },
>  	{ SYS_DESC(SYS_OSLAR_EL1), trap_oslar_el1 },
>  	{ SYS_DESC(SYS_OSLSR_EL1), trap_oslsr_el1, reset_val, OSLSR_EL1,
> -		OSLSR_EL1_OSLM_IMPLEMENTED, .set_user = set_oslsr_el1, },
> +		OSLSR_EL1_OSLM_IMP, .set_user = set_oslsr_el1, },
>  	{ SYS_DESC(SYS_OSDLR_EL1), trap_raz_wi },
>  	{ SYS_DESC(SYS_DBGPRCR_EL1), trap_raz_wi },
>  	{ SYS_DESC(SYS_DBGCLAIMSET_EL1), trap_raz_wi },
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 997c62ab72e6..5d38f115bac1 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -122,6 +122,20 @@ Res0	63:1
>  Field	0	OSLK
>  EndSysreg
>  
> +Sysreg	OSLSR_EL1	2	0	1	1	4
> +Res0	63:4
> +UnsignedEnum	3	OSLM1
> +	 0b0	NI
> +	 0b1	IMP
> +EndEnum
> +UnsignedEnum	2	nTT
> +EndEnum
> +Field	1	OSLK
> +UnsignedEnum	0	OSLM0
> +	 0b0	VAL_0
> +EndEnum
> +EndSysreg
> +
>  Sysreg	SPMACCESSR_EL1	2	0	9	13	3
>  UnsignedEnum	63:62	P31
>  	0b00	TRAP_RW
> 
> -- 
> 2.56.0
> 

