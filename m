Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C7B606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 08:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hch/tj7N;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GjIn1OSR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y/9Z+Oxaa18zcAW8dXB36QsjKCZKOxK0vvzwf7T1dLM=; b=Hch/tj7N4t4/a2anG264XIO13k
	XoTZIglyDj122oZ2AEg3Aajxdoheph4r94llAxf4RhMqlywUslxuXOET+0HzJ9ApxqK0/lo+Vkugx
	o311zajgdWAdS1GdYNdWRKAJ5ze1bpLH7Mp74zZyW7whciR4QBgdUZ9DkQqsyAWqn9ApBh/ISgXHK
	vbTpPt0dOgxke1oDxwb1QOjGWJ+Mq6ZY9yC01FNRZOvAm/AQ6GYLLYZxITHTzYiyWy9JwBnf59KJw
	OjlG4V4VgldYz1cI2OVegIk/Rw7OuXWnbTkVXwDp+CFzZTQPblfMLxjMHnr6rjkXuEE7hNmNyRyLQ
	wiVVcPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVm0P-00000005vQa-0Lnc;
	Tue, 24 Nov 2026 08:36:01 +0000
Received: from out-70.mta1.migadu.com ([95.215.58.70] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVm0M-00000005vNv-0oRK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 08:36:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=frRhWONZHUb4W+PwfONUFPXQmHE/jfkhamJXvxAVQwE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795509353; v=1; x=1796114153;
 b=GjIn1OSRQIiv/fPRI6Bm5GWJLmBdmI1KitLf6XK9SsvBo8KevU3KfOOFe7oMA4Yh0I0/6T+9
 FfBI0pP1NXtpJf7EfMkItqzSXqPBVMdQ2AGuaPl6c228lmB9g4U8HQ4k+UW1xq3cMkQoouf4FsY
 c1hVqV2WIrcQuXIqGSDeN0UU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1961f00bfc93d03c;
	Tue, 24 Nov 2026 08:35:53 +0000
X-Mizu-Trace-ID: 1961f00bfc93d03c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so20442e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 00:35:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErErNZ4lE+hsTb+xhntfefeY2a9VCfHJ4z4G3of1b/XyznRugo/fF9Eb1AHX7BsuQ73WlHxiFAM7Zzj28uLSjZmI@lists.infradead.org
X-Gm-Message-State: APuU4Z8EeFywbwvDgbJ/5xIAB1qyOjnub/hCRU7URBtHZdzfWvsc9qlk
	VvhHlrVB+BCo9ys3UQDEw6q6t2XTFw3bQILGyLI3nSZo5msVF+zMz+p8CFUY7I8zBlPB4xCMHsk
	gV75lpbVri7KZhvARtYKntjORqWfD1vBAwRG0Zs/l
X-Received: by 2002:a05:6512:3ca7:b0:5bf:f060:c0f3 with SMTP id
 2adb3069b0e04-5c21a26fab2mr329358e87.12.1795509350390; Tue, 24 Nov 2026
 00:35:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123192457.8700-1-maz@kernel.org> <20261123192457.8700-2-maz@kernel.org>
In-Reply-To: <20261123192457.8700-2-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 24 Nov 2026 08:35:14 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwsRNp+ThVP77L42OMV+CwMFMpRNzqAeKRjMHrpa1YLbQ@mail.gmail.com>
X-Gm-Features: Aa3M54rxabL4rIXwrzfAj-LSW2gkv_0xvrJLgjhQwGE1NK_mFU7OAUw9n46ykdw
Message-ID: <CA+EHjTwsRNp+ThVP77L42OMV+CwMFMpRNzqAeKRjMHrpa1YLbQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Add enum support to idreg sanitisation
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_003558_376398_E7A3F369 
X-CRM114-Status: GOOD (  10.77  )
X-Spam-Score: -2.8 (--)
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

Hi Marc,

On Mon, 23 Nov 2026 19:24:55 +0000, Marc Zyngier <maz@kernel.org> wrote:
[...]
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
[...]
> +static struct resx compute_idreg_field_deps(struct kvm *kvm,
> +                                            const struct reg_bits_to_feat_map *map)
> +{
[...]
> +        for (tmp = map->idreg_field_deps; tmp->match; tmp++)
> +                if (tmp->match(kvm))
> +                        break;
> +
> +        resx.res0 = field_prep(map->bits, ~(tmp->bits));
> +        resx.res1 = field_prep(map->bits, tmp->bits);

Sashiko flagged the res0 line [1]. With the tables in patch 2 the loop
picks tmp at run time, and GCC 14 and clang 23 builds of config.c
don't trip the BUILD_BUG it describes.

nit: could you still compute res1 first and derive res0 from it, as
Sashiko suggests (res0 = map->bits & ~resx.res1)? That way
field_prep() is only passed values that fit the field, whatever the
compiler folds.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

[1] https://lore.kernel.org/all/sashiko-outbox-229945@kernel.org/

