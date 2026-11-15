Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB26606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 00:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f+jGfmZ2;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=l/hFXcNe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kHIIHcLqTbRuwWpPuK1atPf48K3n1KHOK4sFy1WmaxY=; b=f+jGfmZ2d8ghKznyloWrcHGr2m
	7JX09WhPvp2Nulg0pzyjBmsCX4+iTtB3EH0wBPWOfcWzfdmJ2NNhbEsUSjyxTKCN5uwbAe+dDbZ3q
	ieUtD7fx8r8HiXFgUOvlp3Y9seYN+dJVvLmzOcx6BTWAQv4e8OgilmQ5U3PXSgRSJhJS25/5wmPbT
	t78Ts9D0jdzt398S+01oqCMIa3nSiFoWgQWYfDYX8Fxie03oPr3OvHWyg0e7Q1hAX3RE+3fUdIEtb
	qsxJMcZKQ/bb5/a3yjGki6jWVNeMJyQAp8z1oCBv8iUKMiIXKsyCko2Vp8TUi9b3PdnK/r0xAEslj
	MoDnMtRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSNw5-0000000GuiF-1NZX;
	Sun, 15 Nov 2026 00:17:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSNw2-0000000Guhq-2TNu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 00:17:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3CD7143D;
	Sat, 14 Nov 2026 16:17:23 -0800 (PST)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3B413F673;
	Sat, 14 Nov 2026 16:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794701846; bh=kxN6iZQ2hHfg8DYo4csM3MJfm3vVSM5qRDmT3A1+2W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/hFXcNe8QEyaDd4jcOXCx55+lmgETEBj2/kKhVTD/bva2xXH7EwHo8zRK5h90eqp
	 jJcOmEZd/XnSZJLLNtqOgJugnslkeGoAEaYuygjR++Klc0hNPsBLLrQB3BxFZ3x2YO
	 xGITULcfZFoG+tqE/7EeWQhAcExE2i200ZhG2uig=
Date: Sun, 15 Nov 2026 00:17:19 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, peter.maydell@linaro.org, 
	lpieralisi@kernel.org, timothy.hayes@arm.com, fuad.tabba@linux.dev
Subject: Re: [PATCH v2 11/16] irqchip/gic-v5: Enable direct injection in ITS
Message-ID: <jjok7alo24golbl53cpyo2j7ypnm57eheoz2cimsizied6l5ru@nt2wy2klyoiq>
References: <20261102194454.4086911-1-sascha.bischoff@arm.com>
 <20261102194454.4086911-12-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102194454.4086911-12-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_161730_778210_8450FCEE 
X-CRM114-Status: GOOD (  18.53  )
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

On Mon, Nov 02, 2026 at 07:44:49PM +0000, Sascha Bischoff wrote:
> Allow KVM to replace a host ITTE with a virtual translation that
> directly injects an interrupt into a guest. Add an irq_chip callback to
> install and remove the virtual translation, and disable lazy masking
> while the interrupt is forwarded. The KVM caller is added later.
> 
> The ITS writes the ITTE before invalidating its cache. If invalidation
> times out, hardware may still use the virtual translation even though
> setup failed. Allow disable to restore the host ITTE when the forwarded
> flag is clear, and retain retryable state if restoration also times
> out. Keep lazy masking disabled until the host mapping is restored.
> 
> Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c   | 141 +++++++++++++++++++++++++++++
>  include/linux/irqchip/arm-gic-v5.h |   8 ++
>  2 files changed, 149 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 28e39b065de0e..d91f4ea1ef440 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -61,6 +61,48 @@ static void its_writeq_relaxed(struct gicv5_its_chip_data *its_node, const u64 v
>  	writeq_relaxed(val, its_node->its_base + reg_offset);
>  }
>  

[...]

> +
>  static const struct irq_chip gicv5_its_irq_chip = {
>  	.name			= "GICv5-ITS-MSI",
>  	.irq_mask		= irq_chip_mask_parent,

We should also update gicv5_its_irq_chip.irq_mask/irq_unmask to consider
direct injected vLPIs right?

Thanks,
Wei-Lin Chang

> @@ -732,6 +870,9 @@ static const struct irq_chip gicv5_its_irq_chip = {
>  	.irq_get_irqchip_state	= irq_chip_get_parent_state,
>  	.irq_set_irqchip_state	= irq_chip_set_parent_state,
>  	.irq_compose_msi_msg	= gicv5_its_compose_msi_msg,
> +#ifdef CONFIG_KVM
> +	.irq_set_vcpu_affinity	= gicv5_its_set_vcpu_affinity,
> +#endif /* CONFIG_KVM */
>  };
>  

[...]

