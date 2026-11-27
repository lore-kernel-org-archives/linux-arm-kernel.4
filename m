Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F4A606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 19:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xM4hNe0m;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bKotXA5Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=50QoXqpR5FtrwpAxWMllbEmdzpXvDytEkAHS/WeJp9w=; b=xM4hNe0mB7yI+1nXjBExo69RdC
	m1MsSDhXUr1qlm8lDAcCEjkGTftw7brHo9OjsvnjfTiprPlrg3LALnEch35vN7bj37x1ggFUzmPHl
	opY0In6JYpfePUxWcZLG5pADMDEz81xiGQYl/UlKNeMy1xkaoCxJX0hK58IVwKTM6OfppTQJm8Q2a
	NE5wJHklMYA8BRIeluZhEiycSezGth5uFOyAQSD6jL7/NKF3pEcVEt7bEgrM5/uZySkere7SfUMbB
	HK/tQe3qzLCdQtbkO8S8tQCeDbiniXQz9+WpN5meExtw8hgmF6AWNNsIalPl4lcQ85Whhi9uAQKUM
	b/x7RfHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1Nf-0000000HWoo-2cE8;
	Fri, 27 Nov 2026 19:13:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1Nc-0000000HWoP-3Ohn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 19:13:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C53E51575;
	Fri, 27 Nov 2026 11:13:04 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C6893F86F;
	Fri, 27 Nov 2026 11:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795806787; bh=Ptl2bXxMS7xhqgjXz9U4vKg515vAt7k3LH7ePZtgvo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bKotXA5QgZjSJReV2swYQU/C2RO7PmpFn7BRjcuBNqWFaKCwuP4hbDKrmsPOvIIwn
	 aZwmWDyDO6UBQX8IrtnihOYwuQOtHr88uwt/UvMOc6ohDDIFL6IkidwixdmSs7ymGp
	 q4w+d48eDHFBmtFt403dFxzDN9I1sGv9/ZDAmPlo=
Date: Fri, 27 Nov 2026 19:13:01 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC v3 7/8] attestation: providers: introduce CCA Guest
 attestation provider
Message-ID: <awnWPfTFyFUDkDrV@e129823.arm.com>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
 <20261127170722.GT246011@ziepe.ca>
 <awnK2c3kMq8p2a_7@e129823.arm.com>
 <20261127183550.GV246011@ziepe.ca>
 <awnV5S703Rgf5sh5@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awnV5S703Rgf5sh5@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_111309_012991_A902A5D4 
X-CRM114-Status: GOOD (  36.22  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 07:11:33PM +0000, Yeoreum Yun wrote:
> > On Fri, Nov 27, 2026 at 06:24:25PM +0000, Yeoreum Yun wrote:
> > > > > +static const struct attestation_evidence_format cca_attestation_token_formats[] = {
> > > > > +	{ .vendor = true, .value = CTLV_ATTESTATION_CCA_GUEST_EVIDENCE_VENDOR_FORMAT_CCA_ATTESTATION_TOKEN },
> > > > > +};
> > > > 
> > > > should be the generic EAT token type
> > > 
> > > Is there?
> > 
> > That's the idea. TDX uses EAT as well.
> > 
> > > but the content seems to be different according to vendor, So would
> > > it be better to keep it as vendor type format?
> > 
> > EAT is intended to be self describing, so if you parse the EAT then
> > you should understand what the vendor and content is.
> > 
> > Knowing the EAT came from RMM won't even tell you which ARM profile
> > version it follows, so I'm feeling like maybe we just need to tell
> > userspace it is an EAT and then userspace can parse it deeply to learn
> > exactly what it is??
> 
> Okay. might this would be applied in the FIRME too for PAT once the
> attestation patchset is updated.
> > 
> > > > What is this and the related work? That isn't making sense to
> > > > me. If the token size is not absolutely fixed when the driver starts
> > > > then it should be fully dynamic and this just streams the variable
> > > > sized token.
> > > > 
> > > > Ideally directly into user memory so we don't need to allocate a kvmalloc.
> > > 
> > > In case of live-activation. I think in that case CCA-Realm token could be
> > > different by activating the new RMM.
> > 
> > Then the size isn't static and you need to just stream it to userspace
> > whatever you have.
> > 
> > I'm expecting these unsized tokens to work by streaming them into a
> > memfd so that userspace doesn't have to try to guess how much space is
> > required.
> > 
> > I also think it is pretty broken if LFA is changing the token for
> > realms that are already running. How is that even going to work with
> > an RSI API like that gets the length then tries to fetch into the
> > allocated buffer? Token silently truncates? You need to loop?
> 
> I think the problem is the *max-token-size* could be changed.
> once the LFA updates the Realm definitely the contents of hash of
> firmware binary can be changed. this means the token's content could be
> change including the *max-token-size*.
> 
> For this, the RSI host call interface has the way to get LFA eventlog.
> IOW, after LFA, there will be LFA log is genreated and then for the
> time of re-attestation, it should deliver the LFA logs together.
> 
> And userspace to get a token, it'll check the *max-token-size*,
> So I think it's enough with virtual address not needing streaming.
> 
> IOW, after LFA, the max-token-size can be changed and it should
> re-attestat, get new token and sent with LFA eventlog.

But, currently the LFA eventlog spec quite ambiguous for LFA eventlog.
So, It could be discussed later and for this RFC i think dropping this
is enough.

-- 
Sincerely,
Yeoreum Yun

