Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5138606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZWZfOz6A;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AWv3qtOn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tF50Nzkiz8TetU3KuqsmLR2UYlH9w5XpGjZivIOBBHo=; b=ZWZfOz6AE5JpYkHaGL9avITha6
	1SsPpvF5zNnEoXNxDP/Cf4wuVX01W4dcJyjOUz0Bd5MQh+GWx9ZUVZVBFRCKB9a+1qBVsy8r14JF9
	AJDud7hpcj8GIqdFkzEhCTM8DCNVkOLFL5JLoDnO8npBSzYG4otFr8l4E55coYaKZybGgrZMXFt2X
	BNGzNTyoYDx0tJpmi58fvucjbCj4g/krdOt9Dwx69lVkysise1kAZyZMxXDfwgt03DMgLfDy0FFX8
	ex0b+FKSQFQOK/Bkt9e1FPru0pqhFcoYePnhO15NddbXCwY6hn3PZIMCdPYlQvdyV8v7gREsgPTQF
	bOYYfeoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0nk-0000000HQmt-39Gn;
	Fri, 27 Nov 2026 18:36:04 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0nY-0000000HQl0-33Jv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:36:04 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-55ade1de0b4so94185651cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 10:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795804551; x=1796409351; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tF50Nzkiz8TetU3KuqsmLR2UYlH9w5XpGjZivIOBBHo=;
        b=AWv3qtOnSRxowTiEXcoZYBGY1kP0mp0dYl6kh/AVc533xxmH/yoi0h2TiAMxeUV0Cp
         7eB5TPOs6KAmdpIFKI2wGU1xaViZlQgulGsfGtqlCcEviBGi3QsK1HEST471ZDe+7t+w
         Ximo2zSu8656VBa//HMTABCx3fvNDtexJfbvcQI9zj0eKovFHZohv2JCve+3wkwqxbzq
         9Eb2n+5dkcJVHH+m3D60CKE4Pj2J5Ac4I53xKYjnrfZKio2sUfTxQeiFU1QaZWXsMpTR
         d5FjhqosKMH5mH6L5SfJjGkAkhZwpO8z3DVc3wTc12t5i8E7BaMe1f2IOwxbJZSuHWVI
         2YHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804551; x=1796409351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tF50Nzkiz8TetU3KuqsmLR2UYlH9w5XpGjZivIOBBHo=;
        b=sOgtO8ZfVthBxgR0KQGw6KVCcpfnmfsHWbkX2sl7Zn1dKtZytK6W8fYmsR2oySOXwK
         X9idiGi3GSWGoDIZ+53J4znjboTyQXbQKnbsUu8+F3DDaWTS4wEdRxhM5jq97TnnQRS6
         2tTP9i3z6k4Q4ZISQdvv8H0ioppSd9LJs0LxU+qPNjwyuoHGQgjoi5fYzsKXrjECBkTP
         o+DTK2OGxH+xK5A6DkqXkaNQ9ICarzZnB6QYmJGPgPZTXgs1+Pw/7nRD5a6CTS3kxZZQ
         VCPod9oF3Tb+FwKTfhVx10jcU+Uu6VzuuP4BPOGHGdPT4T/O5MpL+oz6PyBZ5hazo49a
         PzsQ==
X-Gm-Message-State: APuU4Z+zwvrZO61sOfYv4D3W/6XuwYeT4SmiJrSOpMwWavGWBoSlPGSz
	GISJQQGgzuV3LHhwK5g/M1YhNE0Emo9dKXgXh6Er3otT/NJD/g5r3XeKgCeTtAVnrN0=
X-Gm-Gg: AZFdTZcs/evfqTGvkVMwC/zFHMl/n99N0FNwc5Si0Z25+QPxtKpJgePJLsoih5xBws6
	9QL2jfVp4hEcUQJUqs3PWLJTHTC2TY5sdxQf9rfL/PhPiLpUysw3IsjS7HV+I+ccdP91nadgr4k
	CkVFTaGzezFp6/OlxYDhepOYuxN92GH4SN432/JxeTgqts8KzAgyVjMpNBzRqbpPk7BBFEj4V+Q
	T3Yw8RaOmgQOFg6TY7qnZKOFCz4Ih05H+9r++t753W/UHVFoYkec1hOKbOvkLDO8w45sEqrXedb
	TEZyiVaeYA+qB9DlOWj5AIhs9jexqGHow5o75QKcZqYgJrLSc1mRMkPlgR0/Z3R+iXFQo9xoIdj
	EaIVNQccyvWI21PkttSBrVlTrVGiXFz2o8MwWr2GzVw2tQ7iyWw2xFW0+KXk9x9W2TP7rkGWjix
	i6ouIy/3iwRUhUMBuGUNZ5kjT4cFF8seqe+SsxluGLSmM7ya+RNko0S51rHua1wVgVC8CIvuNWw
	KMaJ9+pCZbHQGY9whFSmPb9UAtKpcnSRYAl73sRGY3soDoKIoZ6+ewKO5eCEW6kThRc2V+3op6k
	1x2U3Q==
X-Received: by 2002:a05:622a:5a0c:b0:54d:812b:ac2 with SMTP id d75a77b69052e-55d76aa5123mr463929871cf.28.1795804551241;
        Fri, 27 Nov 2026 10:35:51 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dc8895b8bsm36322411cf.10.2026.11.27.10.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:35:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xX0nW-00000007aGg-0jpi;
	Fri, 27 Nov 2026 14:35:50 -0400
Date: Fri, 27 Nov 2026 14:35:50 -0400
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
Message-ID: <20261127183550.GV246011@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
 <20261127170722.GT246011@ziepe.ca>
 <awnK2c3kMq8p2a_7@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awnK2c3kMq8p2a_7@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_103603_214398_CA749020 
X-CRM114-Status: GOOD (  28.66  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 06:24:25PM +0000, Yeoreum Yun wrote:
> > > +static const struct attestation_evidence_format cca_attestation_token_formats[] = {
> > > +	{ .vendor = true, .value = CTLV_ATTESTATION_CCA_GUEST_EVIDENCE_VENDOR_FORMAT_CCA_ATTESTATION_TOKEN },
> > > +};
> > 
> > should be the generic EAT token type
> 
> Is there?

That's the idea. TDX uses EAT as well.

> but the content seems to be different according to vendor, So would
> it be better to keep it as vendor type format?

EAT is intended to be self describing, so if you parse the EAT then
you should understand what the vendor and content is.

Knowing the EAT came from RMM won't even tell you which ARM profile
version it follows, so I'm feeling like maybe we just need to tell
userspace it is an EAT and then userspace can parse it deeply to learn
exactly what it is??

> > What is this and the related work? That isn't making sense to
> > me. If the token size is not absolutely fixed when the driver starts
> > then it should be fully dynamic and this just streams the variable
> > sized token.
> > 
> > Ideally directly into user memory so we don't need to allocate a kvmalloc.
> 
> In case of live-activation. I think in that case CCA-Realm token could be
> different by activating the new RMM.

Then the size isn't static and you need to just stream it to userspace
whatever you have.

I'm expecting these unsized tokens to work by streaming them into a
memfd so that userspace doesn't have to try to guess how much space is
required.

I also think it is pretty broken if LFA is changing the token for
realms that are already running. How is that even going to work with
an RSI API like that gets the length then tries to fetch into the
allocated buffer? Token silently truncates? You need to loop?

> > This isn't OK.. We only get one struct device per RSI and it gets to
> > bind to only one driver. Given there are other drivers that will need
> > to use the RSI, like the TSM and others, this needs some other
> > solution?
> 
> Currently, this attestation driver is enabled when !ARM_CCA_GUEST only
> (IOW, when this driver can be built only when TSM arm-cca-guest
> disabled).

I saw in your FIRME series a solution to this problem, I think that
would be good to get out on its own and apply it first to RSI as
well. We will have the core RSI stuff, the realm attestation and TSM
driver at a minimum..

Jason

