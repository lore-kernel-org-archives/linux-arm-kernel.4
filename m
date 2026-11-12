Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265D4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 05:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pxNesfQx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hNlfYdQobugmf9UW73UA0KZ3DncrTeY2FGpbRf8Ii54=; b=pxNesfQxF8uidYp6GsD9u28Z/L
	BwDS+4ife1arPPvWqpZwZantyzm7VOoiqBLdz+nfg1PSmt+Snu2zEK1Vqy+KXwglz+ZIZbsPJHl0n
	BgTccek7D3M5w52BUO2RA3gHzZssQ5KJFBdeewamhjaJxifKw3uf05Avk2cHMCggzUbVNd3hAJd6n
	YBSXGGLsmnZWsSaMAX/MZDJB3lWglx85srXn9Gx9SVEBs8Nl791p0rliZv60ZiyL4+Ynjp34CAaC9
	NpRXgfpUpFXGv61J3I7fBAot36JxHtuFztlFVLImbLdnw89NqsQ9ni48OUM4RdiW6e+noULzIjqb2
	wtLHLEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRNN0-00000008lHt-3stx;
	Thu, 12 Nov 2026 05:29:10 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRNMe-00000008lAj-424O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 05:29:10 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so35653955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 21:28:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461327; x=1795066127;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNlfYdQobugmf9UW73UA0KZ3DncrTeY2FGpbRf8Ii54=;
        b=nhipT389fY6WhAsn3rxbzPXyJT3EbRy2ei8rfyrjj/v20ln2DUwzr8KyKn9ju3VHzW
         U+LXt2VPtmIcpXkEP814VcUmJ9jsay3VS7cq97nNLdL5x1x4BVfOBl68u3P1Dpe45Nl2
         78auToc0nIwaCcHXzu+e4BJYoiOBYVCPRxBNOeh2zx90uPFYUiLoeIfWwlIsY+zwbpyG
         DhduMjWl1XsEDjXDE5bLpozWaTrZ1F4Gy8oTFGj8qC05VEqOiVKsIqmgfO3B2e7/ngNV
         978hvHHc8ZE5RdA0z9aio75baNpTe5XwShT8HWz0f19AB1UTEG9mFew16g6ybfI9pXk1
         Jncw==
X-Forwarded-Encrypted: i=1; AL+hErEmWezUk4ZbNQGQfJjfiDUsnO4gICyYVcQFFUvrmlQJ+bDxa6gkYuw+t8J5/LFHVZvWlDmBfLapi+7BT5sz5uD/@lists.infradead.org
X-Gm-Message-State: APuU4Z/vOZ37fZq9QqsANJFNvxhKsvdDjdkPuTvoLzUbZ8iZawW53zOv
	s9UqqUaW6oslfvG85qpY2fmZZacb2CvrTH/w0FGB9vtqrpOAVGm+lz1y
X-Gm-Gg: AYBFou2u9ra+gbUgnIkRsM6h1f/fkblOezFdOGAx5Zi3QaHdv0VNrUgR3PGBmMCHq1t
	mwGFVZKSDwE+rCfFm9Fm/aMNIi+Cv9TYdQRaEnM8U83vY2/Mnngf2ZLsfxcZDrGV8cfb1vZzIL2
	j2mk8KLGqgMWodwcgktjkLsxPDMmlIVVAWNL/cQioRiyvIW7Wah3dmySimwINF82YW6IBjeHaiI
	BpxcTJasrsGxa7+3yS90N52XoUk2D2yBWszZOV7HBUlbnVcKeOzWyjugloe6oZ+xV4BllN0rghI
	jHXUghuJNqYoyrXC+iON+JHtH7SUJTAbrtSjCaVNGisS2epLl9k5iGDQe/vGJhzY5XpNfP8jbHS
	KRokmWZxUFflWLUsyMdxcsAxI0LMThdw+zb35nDog60gyZ9Zc9nuTEfN+riO027YcGeghu6x9po
	DfcTjZU7sxJaT2ByalKwYqZWbcvJi4/pZ1hDeBBNrt8sh+K2Dw5m2uDoAVsNBlH3U8G5220Tq0Y
	VReWXHa7u2fkGcAyj93Ehk7IydLKeQjDb7NbGkKUgKiqNOJ/tuO7503nY13vnSkoV5Xgw90iOGB
	Gngz3h7LjfXApOYF2nLNWfaMpVJH0VrgbyH1W/hPSkFl10yAMQrLZgTXlzSmfVKLjNROpX7HEHH
	Bb2rwiHMSo4nXm/7nbKDOE87nbu5JRPxzcGR7SdSqHe8iqSiTv1tZPjimCNH4
X-Received: by 2002:a05:600c:8708:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4ba0931c364mr69232725e9.1.1794461326740;
        Wed, 11 Nov 2026 21:28:46 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49944d646f9sm11119109f8f.32.2026.11.11.21.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:28:46 -0800 (PST)
Date: Thu, 12 Nov 2026 08:28:42 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Dan Carpenter <dan@cryspen.com>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: Re: [PATCH] KVM: arm64: nv: Initialize hw_mmu to NULL for nested
 vCPUs
Message-ID: <avVOivX0YmlES4Pe@stanley.mountain>
References: <d3571fb535e1832d2a067649f294b83d824d4350.1794395321.git.dan@cryspen.com>
 <86ld6z1782.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ld6z1782.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_212852_793437_4F68365C 
X-CRM114-Status: GOOD (  15.72  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 07:46:53PM +0000, Marc Zyngier wrote:
> 
> I think this really needs a comment to explain why we repaint hw_mmu
> to NULL, because the next idiot who looks at this (likely me) will
> probably remove this line...
> 
> The other thing is that this means that nothing can evaluate
> vcpu->arch.hw_mmu anywhere outside of the loaded path, as it can be
> NULL. I *think* this is OK, but I need to really convince myself...
> 
> I'd like to add something like:
> 
> 	/*
> 	 * We can't rely on the S2 MMU being the canonical one,
> 	 * as userspace can restore a nested context. Nuke the
> 	 * hw_mmu early to ensure that we pick the correct one
> 	 * load time. It also means that we can't rely on hw_mmu
> 	 * being set to anything useful if the vcpu isn't loaded.
> 	 */
> 
> If that works for you, I'll squash that in.

Absolutely.  Thanks so much.

regards,
dan carpenter


