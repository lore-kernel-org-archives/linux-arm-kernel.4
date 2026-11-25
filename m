Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25EC606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xENbs8o+;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nnzpdv4a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JOVihf8AZVCZu2Aw4tH3FyKABP4IPNDzRcD+p1XLuhQ=; b=xENbs8o+h3xbXtb4RhVnqyNoOR
	HCqqIOrpe/K5tag2CY4L2k42kqkuKHr1K1pdn1dPwHOJgZthEft1DRASGcXjBDCQOo10Xfe9L6hNh
	CotG1LosGTjtFmQDzxfviwrwRlZG3gMuzMG+6eRDqT9z3zzML0IL2RNKwUBEZts+OUHZbQdnBs1z+
	dfkeEYocDMQhYmive/LvPA5nG7rjIBDw6nsm4MjNWzrrLIBDusc2WxQ04XHnX4YSvrakutQdStSXl
	NMAVvZMMQQbGBmMg4CHOM3AK6ZQoxdP3iUobz8gizYtXISTxPQh0DHuLdO/Ti1UpAdClycvZ/HbTm
	si2AQDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFGc-0000000AS3M-2hr8;
	Wed, 25 Nov 2026 15:50:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFGY-0000000AS1k-28is
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:50:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF45E2F;
	Wed, 25 Nov 2026 07:50:31 -0800 (PST)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 366B43F86F;
	Wed, 25 Nov 2026 07:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795621834; bh=3GXsX9Ej2LOPIEboRLqmNRTGHxu2WQYYYsQFaNYp5PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nnzpdv4a7edEwDoby/SAe1cCObZrbza1z5Uv2vVHjkcORf4t0MFuVhBElQK25OB9S
	 jsyrbmyqaeu43wvjJbZkCpMYMl7dZi5PTu8xZziTyAKzErV1kv3laReYhAPdJ+01A4
	 7yNbCFhBOGJKRmzvHKPvU3Pt8kmLeZF2xNh+xGIk=
Date: Wed, 25 Nov 2026 15:50:21 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH 1/3] KVM: arm64: Add enum support to idreg sanitisation
Message-ID: <m45vlff6a5pyza3enol4uebl6uixcfjqmua3mg3eq3jaqujjev@sbaxsxeedrxm>
References: <20261123192457.8700-1-maz@kernel.org>
 <20261123192457.8700-2-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123192457.8700-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_075038_646960_C6B710B9 
X-CRM114-Status: GOOD (  32.12  )
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

On Mon, Nov 23, 2026 at 07:24:55PM +0000, Marc Zyngier wrote:
> While a good deal of ID register fields are simple booleans, simply
> indicating whether a feature is supported, a number of them are more
> structured and indicate a level of support.
> 
> Reuse the existing framework in a nested way to expose which level
> applies for the current configuration. This relies on the levels
> being ordered from the most to the least capable, and the fallback
> to have a NULL callback.
> 
> Yes, this is pretty obscure, but the following patches will make
> this clearer (at least one hopes...).
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/config.c | 44 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index cfdb6c7133204..40965513ebacf 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -28,6 +28,7 @@ struct reg_bits_to_feat_map {
>  #define	REQUIRES_E2H1	BIT(5)	/* Add HCR_EL2.E2H RES1 as a pre-condition */
>  #define	RES1_WHEN_E2H0	BIT(6)	/* RES1 when E2H=0 and not supported */
>  #define	RES1_WHEN_E2H1	BIT(7)	/* RES1 when E2H=1 and not supported */
> +#define	IDREG_FIELDS	BIT(8)	/* idreg fields */
>  
>  	unsigned long	flags;
>  
> @@ -40,6 +41,7 @@ struct reg_bits_to_feat_map {
>  			s8	lo_lim;
>  		};
>  		bool	(*match)(struct kvm *);
> +		const struct reg_bits_to_feat_map *idreg_field_deps;
>  	};
>  };
>  
> @@ -73,6 +75,13 @@ struct reg_feat_map_desc {
>  		.lo_lim	= id ##_## fld ##_## lim	\
>  	}
>  
> +#define __NEEDS_FEAT_2(m, f, w, dummy, deps)		\
> +	{						\
> +		.w	= (m),				\
> +		.flags = (f),				\
> +		.idreg_field_deps = (deps),		\
> +	}
> +
>  #define __NEEDS_FEAT_1(m, f, w, fun)			\
>  	{						\
>  		.w	= (m),				\
> @@ -95,6 +104,11 @@ struct reg_feat_map_desc {
>  #define NEEDS_FEAT_MASKS(p, ...)				\
>  	__NEEDS_FEAT_FLAG(p, MASKS_POINTER, masks, __VA_ARGS__)
>  
> +#define NEEDS_FEAT_FIELD(m, ...)				\
> +	__NEEDS_FEAT_FLAG(m, IDREG_FIELDS, bits, blah, __VA_ARGS__)
> +
> +#define ENUM_FEAT(e, f)	{ .bits = e, .match = f }
> +
>  /*
>   * Declare the dependency between a set of bits and a set of features,
>   * generating a struct reg_bit_to_feat_map.
> @@ -1456,6 +1470,27 @@ static const struct reg_feat_map_desc *idreg_feat_maps[] = {
>  	&id_aa64mmfr3_el1_desc,
>  };
>  
> +static struct resx compute_idreg_field_deps(struct kvm *kvm,
> +					    const struct reg_bits_to_feat_map *map)
> +{
> +	const struct reg_bits_to_feat_map *tmp;
> +	struct resx resx;
> +
> +	/*
> +	 * Assume the enum values are ordered in reverse order of
> +	 * capability (from most to least capable). A NULL callback
> +	 * value indicates the ultimate fallback (not implemented).
> +	 */
> +	for (tmp = map->idreg_field_deps; tmp->match; tmp++)
> +		if (tmp->match(kvm))
> +			break;
> +
> +	resx.res0 = field_prep(map->bits, ~(tmp->bits));
> +	resx.res1 = field_prep(map->bits, tmp->bits);
> +
> +	return resx;
> +}
> +
>  static bool idreg_apply_deps(struct kvm *kvm, const struct reg_feat_map_desc *r)
>  {
>  	struct resx resx = {};
> @@ -1463,8 +1498,15 @@ static bool idreg_apply_deps(struct kvm *kvm, const struct reg_feat_map_desc *r)
>  
>  	for (int i = 0; i < r->bit_feat_map_sz; i++) {
>  		if ((r->bit_feat_map[i].flags & CALL_FUNC) &&
> -		    !r->bit_feat_map[i].match(kvm))
> +		    !r->bit_feat_map[i].match(kvm)) {
>  			resx.res0 |= reg_feat_map_bits(&r->bit_feat_map[i]);
> +		} else if (r->bit_feat_map[i].flags & IDREG_FIELDS) {
> +			struct resx tmp;
> +
> +			tmp = compute_idreg_field_deps(kvm, &r->bit_feat_map[i]);
> +			resx.res0 |= tmp.res0;
> +			resx.res1 |= tmp.res1;

This looks to me like it just forces the bit pattern of the most capable
enum value the current configuration supports. So if the user sets
something that is different but less capable we will just raise it to
the most capable value, is this what we are going for? Or do we only
want to sanitise it when it is over the maximum allowed value?

Thanks,
Wei-Lin Chang

> +		}
>  	}
>  
>  	val = kvm->arch.id_regs[r->idreg_idx];
> -- 
> 2.47.3
> 

