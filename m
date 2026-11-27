Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D87C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QoiH5mn2;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LBSQKh+U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nPX0jKAZGslc2s414W7GnzS0L4XLdhKncic17g8wWB8=; b=QoiH5mn2MPWv09FKX6Qy5AsBX2
	eZ7neabnXJuHqzkhxms8Phb/jD3b9a5lbNGYfFf7K/nKCDCWhIeKGtGlkZciDKTIG7dpIr8F4Eoet
	lwsNoS48MHl8ZnvuhtYrJUsnnbgQ4g9cNAWiK4/qT1PS8cAc/D9Yu8dywBZhDEe1r/o0SZ4gN4P2E
	Zkk/ZDD45M+CBddHBnMbZjg/w07hZfySps498THuvpFh7GbYCRXhk7Tu8LhhmFRo2s6CXK61/8xcU
	TGkgdeveQdDYJOpBYoTxHqVr4AfOMBHHwq751FibQJMv3jd3RtwRYwafFo27J1Ji8PrR1myfcdLZI
	z08xr+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0cc-0000000HPJg-2DFG;
	Fri, 27 Nov 2026 18:24:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0ca-0000000HPJI-2x11
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:24:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F1A51575;
	Fri, 27 Nov 2026 10:24:28 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 957C33F86C;
	Fri, 27 Nov 2026 10:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795803871; bh=tLEGXyc06QuVymTp9AwMRLhn4C3VvPR79JGgV7rqNd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBSQKh+UnuZvEmzVBMoqvxhxLlX4y9VCVIQ06t73ABXPt10R9qy/X5Y6ugaS7NPOo
	 d1AuoDSzKGcEpaQ259M2A/qNGnaky9MIv0reMcaXWdUmoiyfRYZaurw1lOYjN/TUTF
	 DBomwlpBErcMcNrZvxnSsO5JZUxKZNTysnK2dpM0=
Date: Fri, 27 Nov 2026 18:24:25 +0000
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
Message-ID: <awnK2c3kMq8p2a_7@e129823.arm.com>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
 <20261127170722.GT246011@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127170722.GT246011@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_102432_820216_CE315F00 
X-CRM114-Status: GOOD (  26.81  )
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

Hi Jason,

[...]

> Similarly the TCG log should work the same way.
> 
> I'm also wondering if too much code is leaking into to drivers to
> implement the uAPI. We should take a look at this vs the TDX one and
> make sure we have the right level of helpers and abstraction.
>
> I also can't help but notice there isn't a single comment in any of
> this, it should be a bit more descriptive why some of these things are
> in here.

Okay. might next around, try to add comments.

> > +
> > +static const struct attestation_evidence_format cca_attestation_token_formats[] = {
> > +	{ .vendor = true, .value = CTLV_ATTESTATION_CCA_GUEST_EVIDENCE_VENDOR_FORMAT_CCA_ATTESTATION_TOKEN },
> > +};
> 
> should be the generic EAT token type

Is there? but the content seems to be different according to vendor,
So would it be better to keep it as vendor type format?

[...]

> > +static long cca_guest_get_max_token_size(void)
> > +{
> > +	u8 dummy[RSI_ATTEST_CHALLENGE_MAX_SIZE] = { 0x00, };
> > +
> > +	return rsi_attestation_token_init(dummy, RSI_ATTEST_CHALLENGE_MAX_SIZE);
> > +}
> > +
> > +static int cca_guest_get_attest_tokens(const struct cca_guest_attestation *cca_guest_att,
> > +				       const void *challenge, size_t challenge_size,
> > +				       u8 *token, size_t *token_size)
> > +{
> > +	int ret;
> > +	long max_token_size;
> > +	void *buf;
> > +	unsigned long granule, offset, len, rsi_ret;
> > +
> > +	guard(migrate)();
> > +
> > +	max_token_size = rsi_attestation_token_init(challenge, challenge_size);
> > +	if (max_token_size <= 0)
> > +		return -EINVAL;
> > +
> > +	if (max_token_size != cca_guest_att->max_token_size)
> > +		return -ESTALE;
> 
> What is this and the related work? That isn't making sense to
> me. If the token size is not absolutely fixed when the driver starts
> then it should be fully dynamic and this just streams the variable
> sized token.
> 
> Ideally directly into user memory so we don't need to allocate a kvmalloc.

In case of live-activation. I think in that case CCA-Realm token could be
different by activating the new RMM.
But, in this round might we can drop this part.

[...]

> 
> > +static const struct arm_smccc_device_id cca_guest_attest_id_table[] = {
> > +	{ .func_id = SMC_RSI_ABI_VERSION, },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(arm_smccc, cca_guest_attest_id_table);
> 
> This isn't OK.. We only get one struct device per RSI and it gets to
> bind to only one driver. Given there are other drivers that will need
> to use the RSI, like the TSM and others, this needs some other
> solution?

Currently, this attestation driver is enabled when !ARM_CCA_GUEST only
(IOW, when this driver can be built only when TSM arm-cca-guest
disabled).

-- 
Sincerely,
Yeoreum Yun

