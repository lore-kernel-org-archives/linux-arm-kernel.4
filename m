Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C861606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XFlLwOuA;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oYOSrc+m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iIDdrX9Im0YtrcnZJ8KtkgD4n/tK93wVoTEyhvvYAHU=; b=XFlLwOuAeUor/9w3J7y53LqC8h
	pRzk/V/xcIBCFQAFSeen27uon2OXQAOGHvRUtb4kwuK2Zh5po9GlSH2nRWEfITC/UFiN3Unz77ClX
	qzC7woC3CAoHXxVgWeeREqvav/myult5eYepdzggGakzM1bjdo2K7NvI5EazJW2w55IOJyLnWuNWY
	tO0Utr+Gtl1c8MsieU8jwD0+OLk3weXmcbwuxJOwf//TUDt0oIDxzoOEnfChMT6X6bYtXtjvo2foC
	t3xhU2i0AbQtDqU9N1dddDsbte4Q8UuB+LS0cuyzVQq3mW3vj9wZwihgT9g3JJz3NOrc3UTQVkodz
	yIb60SxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzPz-0000000HCYJ-2Krv;
	Fri, 27 Nov 2026 17:07:27 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzPx-0000000HCWi-1agu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:07:26 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-53639b8903bso99128561cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 09:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795799243; x=1796404043; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iIDdrX9Im0YtrcnZJ8KtkgD4n/tK93wVoTEyhvvYAHU=;
        b=oYOSrc+mCC3D8OfqWbl6IaxMSPbu3rDnE1I9PMv+TzJL5Z5mZlKdRmaVnHRvTZbEZS
         Fo440ZLEGRT3vzATaYToT5v0tIuiuj8K9K6JGoSftSb8Gusxa4wv1ZP/lvKIfuc1tawf
         fBSpFQMER20d5TbV+//Y05GKq7udk7lzWTnqG2cS4CXeM3W1ATknpoA9T6i7oGyra5AX
         Q/+plBypMGhpDCKWhjcbNbUyaZTS2wYeevmp8n21HQkYTrXL5Ac9MnuaCY/hvfDbvVkm
         LCP3hkNB1OJ0jMBH8JpgGuq0rt9TqzWeD9VvAjvRe+fbIB8sOw6dpTxDmkjF8+FgjZfg
         wBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799243; x=1796404043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIDdrX9Im0YtrcnZJ8KtkgD4n/tK93wVoTEyhvvYAHU=;
        b=UDVY4wZc9GDxsjLixMD0fD/kAt9uae5EK9yMMr17HBaxy52+Jc2WvxUu2sIgbWcpOt
         LonaL6NKAP1vRoz1euG6UrDpprPNie22eTl3G9FwHY/TMTufKBZmtwTuD7dDKeDj7Nkk
         K0AJjJmmeCmYVGRvbc/PdociNpvvgHxtwqr5EHlhACfrxAQ+fZFEdru2Olr+fOU+FmKo
         SQUwL2lq8FGlvx6CMuUHkxrsYOpggWkaRZM/bTN6zdMPbc83Urqn5sVd7jc7uhvD0xWA
         KyRtPatp7+Z4levP2eglrZ6PZmEf360hKfAMTuY/VhCKWMpnunxZtC/z35D9NSCqIufn
         0tzQ==
X-Gm-Message-State: APuU4Z+Lu37wQC3J/r/AFd0N52qaumZUcSgrQ2Jo3yf7zfJmR6Y1DJBp
	/07VrhZY2HhXsnO+9ky6AX0bcQ8qfiAeMb2dIL4TM6TbRWWeQsRMIVdJ+93VD73Dfwk=
X-Gm-Gg: AZFdTZfYlYuMqvcwVf9s3VISu9KmoQfu1aMhT2dUJ8Lpq047gGckjC5aZZxkXfSbz9u
	EFH7RDFEoAElendfkGJoA5eEhtzmE7ZePb0MbWGabKSmezRFsQh7L0bVi17jjJ9VSGD+t0PPqOq
	TVHs5yIMqq9Fn7g6WkK3TzPp+PTmblrJNUaTZ9zSCcXckYEP5kz+3VrQGxYWpcTlBqbpJUg3BY8
	4ilGc41Kl8M5g2iNJwNSVH50VFOAtAUfsLnNKUTimrMebpQQPBBjCQWH0SH57at0dIQW1x3a1lx
	J7xO2KMTXWPt4YMgt49wIltcQZmPcAP/u/c2XHGYsJwrLW6IkqMtKBPqXY59jxonvojJPmIO0nI
	SGwBOgF6XXlE4CoCTenSh3fcJ6defuxbehAwXLL8ehD1N4QXcgN0kttPQWB2K/1l57XIIftpW9F
	QXxwhvRd6tN18fc3qUga9lA7thOxSl/shcjCv9tduBSyv9ddBYagW8Eo+cd6GHMTae67mzfAUKU
	732u4crFBqk2Z1Fjzi4B9VP6qIn8kq7xUlWPaGc0FbTYaevRYXoPWVAcRSb1cB225eIiT3R2jB1
	T7bKAg==
X-Received: by 2002:a05:622a:400d:b0:536:7f96:915c with SMTP id d75a77b69052e-55d6fbfc5f7mr441942441cf.5.1795799243423;
        Fri, 27 Nov 2026 09:07:23 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e32dsm214830511cf.13.2026.11.27.09.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:07:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWzPu-000000079Rg-05Sr;
	Fri, 27 Nov 2026 13:07:22 -0400
Date: Fri, 27 Nov 2026 13:07:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
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
Message-ID: <20261127170722.GT246011@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_090725_509556_6D9E2517 
X-CRM114-Status: GOOD (  33.40  )
X-Spam-Score: -2.1 (--)
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

On Fri, Nov 27, 2026 at 03:33:02PM +0000, Yeoreum Yun wrote:
> Introduce CCA Realm Guest attestation provider for retrieving:
> 
>   - RIM, REM0-REM3 measurement registers.
>   - CCA attestation token
>   - CCEL event log
> 
> used for CCA Realm Guest attestation.

This is great to see positive proof that the API fits CCA!

> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/attestation/Kconfig               |  10 +
>  drivers/attestation/Makefile              |   5 +
>  drivers/attestation/providers/cca_guest.c | 582 ++++++++++++++++++++++++++++++
>  3 files changed, 597 insertions(+)

But we need to do alot more work on this to make the drivers slimmer.

First, we need to pull drivers/virt/coco/arm-cca-guest/main.c which is
the evidence part of this driver into drivers/attestation and build
the MR stuff on top of that.

Second, things like CCEL need to be handled by core code. The driver
should only indicate it "claims" the CCEL if the core code happens to
find one. TDX and ARM shouldn't have any direct CCEL stuff beyond
that.

Similarly the TCG log should work the same way.

I'm also wondering if too much code is leaking into to drivers to
implement the uAPI. We should take a look at this vs the TDX one and
make sure we have the right level of helpers and abstraction.

I also can't help but notice there isn't a single comment in any of
this, it should be a bit more descriptive why some of these things are
in here.

> +static enum hash_algo cca_guest_attestation_algorithms[] = {
> +	HASH_ALGO_SHA512,
> +};

static const

> +
> +static const struct attestation_mr_props cca_guest_attestation_mrs[] = {
> +	{
> +		.id = 0,
> +		.name = "rim",
> +		.algorithms = cca_guest_attestation_algorithms,
> +		.algorithms_count = ARRAY_SIZE(cca_guest_attestation_algorithms),
> +	},
> +	{
> +		.id = 1,
> +		.name = "rem0",
> +		.algorithms = cca_guest_attestation_algorithms,
> +		.algorithms_count = ARRAY_SIZE(cca_guest_attestation_algorithms),
> +		.has_register_index = true,
> +		.register_index = 0,
> +		.extendable = true,
> +	},
> +	{
> +		.id = 2,
> +		.name = "rem1",
> +		.algorithms = cca_guest_attestation_algorithms,
> +		.algorithms_count = ARRAY_SIZE(cca_guest_attestation_algorithms),
> +		.has_register_index = true,
> +		.register_index = 1,
> +		.extendable = true,
> +	},
> +	{
> +		.id = 3,
> +		.name = "rem2",
> +		.algorithms = cca_guest_attestation_algorithms,
> +		.algorithms_count = ARRAY_SIZE(cca_guest_attestation_algorithms),
> +		.has_register_index = true,
> +		.register_index = 2,
> +		.extendable = true,
> +	},
> +	{
> +		.id = 4,
> +		.name = "rem3",
> +		.algorithms = cca_guest_attestation_algorithms,
> +		.algorithms_count = ARRAY_SIZE(cca_guest_attestation_algorithms),
> +		.has_register_index = true,
> +		.register_index = 3,
> +		.extendable = true,
> +	},
> +};

Jiri this probably isn't going to scale when we get to 32 PCRs on a
TPM.

> +
> +static const struct attestation_evidence_format cca_attestation_token_formats[] = {
> +	{ .vendor = true, .value = CTLV_ATTESTATION_CCA_GUEST_EVIDENCE_VENDOR_FORMAT_CCA_ATTESTATION_TOKEN },
> +};

should be the generic EAT token type

> +
> +static const struct attestation_evidence_format cca_guest_attestation_log_formats[] = {
> +	{ .value = CTLV_ATTESTATION_EVIDENCE_FORMAT_CCEL },
> +};
> +
> +static const struct attestation_evidence_challenge_length
> +cca_guest_attestation_challenge_lengths[] = {
> +	{ .min = RSI_ATTEST_CHALLENGE_MIN_SIZE, .max = RSI_ATTEST_CHALLENGE_MAX_SIZE },
> +};
> +
> +static struct attestation_evidence_supported_object
> +cca_guest_attestation_evidence_objects[] = {
> +	{
> +		.evidence_class = ATTESTATION_EVIDENCE_SIGNED,
> +		.formats = cca_attestation_token_formats,
> +		.formats_count = ARRAY_SIZE(cca_attestation_token_formats),
> +		.challenge_lengths = cca_guest_attestation_challenge_lengths,
> +		.challenge_lengths_count =
> +			ARRAY_SIZE(cca_guest_attestation_challenge_lengths),
> +		.max_length = 0,
> +		.binds_mrs = true,
> +	},
> +#ifdef CONFIG_ACPI
> +	{
> +		.evidence_class = ATTESTATION_EVIDENCE_EVENT_LOG,
> +		.formats = cca_guest_attestation_log_formats,
> +		.formats_count = ARRAY_SIZE(cca_guest_attestation_log_formats),
> +		.max_length = 0,
> +	},
> +#endif

Jiri, same scaling issue, CCEL should be handled by core code so it
needs to be inserted dynamically into the evidence list.

> +static long cca_guest_get_max_token_size(void)
> +{
> +	u8 dummy[RSI_ATTEST_CHALLENGE_MAX_SIZE] = { 0x00, };
> +
> +	return rsi_attestation_token_init(dummy, RSI_ATTEST_CHALLENGE_MAX_SIZE);
> +}
> +
> +static int cca_guest_get_attest_tokens(const struct cca_guest_attestation *cca_guest_att,
> +				       const void *challenge, size_t challenge_size,
> +				       u8 *token, size_t *token_size)
> +{
> +	int ret;
> +	long max_token_size;
> +	void *buf;
> +	unsigned long granule, offset, len, rsi_ret;
> +
> +	guard(migrate)();
> +
> +	max_token_size = rsi_attestation_token_init(challenge, challenge_size);
> +	if (max_token_size <= 0)
> +		return -EINVAL;
> +
> +	if (max_token_size != cca_guest_att->max_token_size)
> +		return -ESTALE;

What is this and the related work? That isn't making sense to
me. If the token size is not absolutely fixed when the driver starts
then it should be fully dynamic and this just streams the variable
sized token.

Ideally directly into user memory so we don't need to allocate a kvmalloc.

> +static int
> +cca_guest_attestation_evidence_get(struct attestation_dev *att,
> +				   const struct attestation_evidence_request *request,
> +				   struct attestation_evidence_result *result)
> +{
> +	struct cca_guest_attestation *cca_guest_att = to_cca_guest_attestation(att);
> +	size_t i, length;
> +	void *buffer;
> +	int ret = 0, ccel_obj_idx;
> +
> +	ccel_obj_idx = cca_guest_att->ccel_obj_idx;
> +
> +	for (i = 0; !ret && i < request->objects_count; i++) {
> +		const struct attestation_evidence_object_request *object =
> +			&request->objects[i];
> +		struct attestation_evidence_object_result *produced =
> +			&result->objects[i];

I feel like the core code should be doing more of this for the
drivers... Drivers should have an op to return a single evidence, for
an ID that they control. ie the core code should be returning the CCEL
for its id, and when we get to SPDM other common code will handle ids
too.

Maybe the evidence itself needs an ops?

> +static const struct arm_smccc_device_id cca_guest_attest_id_table[] = {
> +	{ .func_id = SMC_RSI_ABI_VERSION, },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(arm_smccc, cca_guest_attest_id_table);

This isn't OK.. We only get one struct device per RSI and it gets to
bind to only one driver. Given there are other drivers that will need
to use the RSI, like the TSM and others, this needs some other
solution?

Jason

