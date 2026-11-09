Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EEC606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u0k8b9u7;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o740+3yA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OCgYpXH58qINyNwsYRskFASB4t/CiniG84M2T/tv7W8=; b=u0k8b9u7amaePfb8j/x/1anucr
	hbAA24KKiv+pHMLoIpCi6Wn3c0z8paRG2SgZqawA+s9phQJTwg/WLFRmZ6DitzrU+tlORh6mmV3WC
	fha6UdvuiDedGnn2HYW4VOnw802LTvnMWJxUwdp14GMVFByzRu/E+vCqeU+IrhSQihS127icqRB2s
	WEHS1rKR5YGmxm+AWCjSxOal8jfSx6LMM1Dzh4yeYlIszRgBB6E1M80nyt5mOXLdsvsWkW/QmPAGS
	X75XehdI7NRJ3npPLbexxPfOlTuUchZhtLjHvgtPluLLBEh2q7DGoThYwgySeRTyPgqn25AitFfnI
	my9tOUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNZo-00000000WjZ-0Ld0;
	Mon, 09 Nov 2026 11:30:16 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNZl-00000000Wiv-1fY1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:30:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so24485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 03:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794223811; x=1794828611; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OCgYpXH58qINyNwsYRskFASB4t/CiniG84M2T/tv7W8=;
        b=o740+3yAVwmxYpBSXdgLFwwu1xqbB5xsLHtHD2tYQ1tx1PtwQTLIr01Yd7kM54mZ6K
         cqT2n7r7R5omHXWQb5vlJqqfBhi50Zj4Y7hXJ/pChP1nb/3/JcFOLWuWh0BtBlH7hK4v
         joabhXHdsMLyFVTrcY0nogNRL+ilmneyLHPZ7MkGyauZ5hpR5YSf2MtZ/6I9eQvLrJmm
         lmNW4U8DqP8vYXYf3UCcf9NLeVmiomXP1aaGAUL3Ptd+euOf2bvwJvQRcEpj7VIMK5E9
         fQn4XcndToijevKSLCwN2tJLfluQXECsSsuDopVBh3WvE6d3ivfecx5fqmrYZoHv5sec
         OnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223811; x=1794828611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCgYpXH58qINyNwsYRskFASB4t/CiniG84M2T/tv7W8=;
        b=D3IwVbFjEZ+ljC8PFWix9zZFSfzI/PqoVMFJqteNTePCurX4M0AoFYK5i23klISe/U
         KV3C7mGn45UaJcESR6bAR3uWo48Ju71MqLjOEAiOvLLM3gfTLeKODCKsxT4V0bSiewF1
         K92oWkCQJCsPT2izFux7koYeVlXFEC3CsGiqtTLstTTw6H5vsTDYjHfdeYnIB8om152+
         qiT7iGDTMmgwIEymjcI4IsK9TEJNyrkBKHt6moQkPjqfXu4HAW+ZweCfL2/ldDiklXN1
         NpIZ5kN6JP6gndbJUfXnZ6WZK4uvIQ6ffjnpjIlZYz/5u6YtQkKW5FaHonbypbU2e1Ec
         1aXw==
X-Gm-Message-State: APuU4Z/sxJf2H+PVEWJmgZohZLCkumh4T0gbln7OXTFLGYeoasoTmWbl
	l3XVeOVYr4waWg9m8CfsvfmhZ2UCMmGMvDkrD9T/ywtl9T75JqROw0/yC0ElWZCWzA==
X-Gm-Gg: AYBFou0hbzkypECTJvvW/XTbue03QW1gg6n6NHz09ekAuIiqJwVLZyozTsLaXEpv6vb
	q7JVG/HiqQoX+QwQtqWyLv0BLUL2m6Lju4K4Bx9jr6WlgcNGgWXbEjV8GD0GJkvurEC01nIybml
	JafQ0Da3VgevyJ+5JxX98reidf4qhDKEuVpKexu+MifvK1xX+HUnFsePQcGQ/7bQXb/htaSpeaS
	qH4zel/aM/TOqcWTlg0LI9jMn/gWYsMZIxMGyjszOD9U/6b5P9+VE34lh5+rmBC3YXnJNrrK3Uj
	9G3zrYkXg2l+GFMrw8yddycklrnLE54ERG0Lwz1MhcghXMjXbpgyf2cw9C+AIqBkq8SSnKu5QK5
	outiMBVsfDW9BBeKhXwPusrfbDO5p9urmKHJJ32Yr3DakDWyF8mx4dLcQF+8rBChg1EQZcH21uN
	6IHaEUWJ+qJUH3lF4MpYi+DCYmQvcpXmEACQ+gWi3Ei3+mVkLsn9WnzW1E6GUu60WkH/GSn/olW
	a1XDFpLz1tpg/gwQXC72WklTlURcgixYSMLU2P7gqceVx1gOhrEf3KR1IiGBTCWFVLet6Wv7V7F
	5ischTDvYrxqir9++XmRmL8yuYBV1TTerQEg5ewUN5rD8l0o0A3ZZyY=
X-Received: by 2002:a05:600c:a599:b0:4a1:9c54:1853 with SMTP id 5b1f17b1804b1-4b8190fb89fmr1464795e9.5.1794223811041;
        Mon, 09 Nov 2026 03:30:11 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495974660bdsm8966088f8f.37.2026.11.09.03.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:30:10 -0800 (PST)
Date: Mon, 9 Nov 2026 11:30:05 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 14/25] iommu/arm-smmu-v3-kvm: Shadow the command queue
Message-ID: <avGuvQ8uiYRGitkj@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-15-smostafa@google.com>
 <au0XJPD81XkBgpyF@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au0XJPD81XkBgpyF@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_033013_457972_EC87E5F1 
X-CRM114-Status: GOOD (  25.42  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 03:54:12PM -0800, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 08:08:45PM +0000, Mostafa Saleh wrote:
> > At boot, allocate a command queue per SMMU which is used as a shadow
> > by the hypervisor.
> > 
> > The command queue size is 64K which is more than enough, as the
> > hypervisor would consume all the entries per a command queue prod
> > write, which means it can handle up to 4096 at a time.
> > 
> > Then, the host command queue needs to be pinned in a shared state, so
> > it can't be donated to VMs, and avoid tricking the hypervisor into
> > accessing them. This is done each time the command queue is enabled,
> > and undone each time the command queue is disabled.
> > The hypervisor won't access the host command queue when it is disabled
> > from the host.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> 
> With some nits:
> 
> > @@ -23,6 +25,15 @@ static size_t kvm_arm_smmu_cur;
> >  static void __init kvm_arm_smmu_array_free(void)
> >  {
> >  	int order;
> > +	int i;
> > +
> > +	for (i = 0 ; i < kvm_arm_smmu_cur ; ++i) {
> 
> s/ ;/;/g

Will do.

> 
> > @@ -158,6 +268,14 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  		break;
> >  	/* Passthrough the register access for bisectability, handled later */
> >  	case ARM_SMMU_CMDQ_BASE:
> > +		if (is_write) {
> > +			/* Not allowed by the architecture */
> > +			if (is_cmdq_enabled(smmu))
> > +				break;
> 
> Sashiko reported the same WARN_ON issue. You might want to confirm.
> 

I replied to sashiko about that, this is by design as I also mentioned
in patch #13.

> > @@ -170,9 +288,16 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  			break;
> >  
> >  		if (is_write) {
> > +			bool last_cmdq_en = is_cmdq_enabled(smmu);
> 
> Maybe cmdq_was_enabled (local) and cmdq_is_enabled (helper)

Sure.

Thanks,
Mostafa


> > 
> Nicolin

