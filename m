Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BD1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OHGHpE60;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=g3LGciKe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HB0ZTSdDDmOkIsTidMqTBiLshJg4ThGdlzLSWF0DBNU=; b=OHGHpE60qWdpp/KNxXT7Wq1cop
	D/sJ3q8HmQRE168ltoYF9cJ+SxEpy0C5wJ0bmFeg6Hxpa3HZZ0YwiPX0Xi9F9UyLz0ATfAXF2CXrq
	DkzejIRc+FHIawU4C9MMKhvCFj2gZYpq/PIfxqWsc1MFDZiymCy4oIm3kSuttHx9CK8O5umi9junS
	YhgTxWC6tiuGGOwErd5kyLbY7smwyKET31F/4p+bXGMvA+2WHeTm6JCEEnLRj/5NlZ7sglEgtBNHl
	60kaWlYXjV/NcVNAv1r29UtCzb8OP4M1SeVpzDXTz3P26hXTiX6qgzNgWbAlLkub7ROHy97bH+ypN
	8qixiajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzRe-0000000HCv9-3WNG;
	Fri, 27 Nov 2026 17:09:10 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzRW-0000000HCu4-3fgG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:09:04 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-9213922de73so46342236d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 09:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795799341; x=1796404141; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HB0ZTSdDDmOkIsTidMqTBiLshJg4ThGdlzLSWF0DBNU=;
        b=g3LGciKetsIVjtBq0UPoX0BpkowKtyAgEXhOIQBOapzU/i4nwhE8Yw15TWDDmYTdMD
         /xAZqAvfe+DbxG0lCKGDupjuekdPzcFJrI54WiyGjzH6KAI7tX1IyDGGPnpvy9ghS9XS
         ngk8vy1kwjruICeOYdtZPftuqThMeh9ScFFg4rf6w1aLq4zyHFzsKMnEMFxhXSUrNziX
         mU50PwWbCesKj3pyBnLF9a7ofcCv+WGlH2t6tDfYVOV2iDnDfDmlec6Sid3qywEay421
         IVbDkJt/8/QFPIA27Tx3sRlsWIfqzjXNkVCb8NV0YZ3Uu0GspDDTufaKsIhS9yN0odhh
         91nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799341; x=1796404141;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HB0ZTSdDDmOkIsTidMqTBiLshJg4ThGdlzLSWF0DBNU=;
        b=oPf3sbfPCKD3fRVHdzYQ/I0G9FBgPyiCif4rfFPH1oI75uurkb+6drHv+/qBdgOwiH
         lbiOmsZVUsEXFkNmbRhdslME/elAf3EAnOLFr6c9ka5zeFGTuJpFq1/QW2B4/S597xgi
         WZ4I7Ib1RX0BKIh+TjjWUCFScgpdLSbXkvA0lm0gYrYEiyNfq/Rnk5tsT2mbRAmTmoMd
         Nse8Zgs+1+9Ld9PC2eQR+TF7rggIIBkrrT1dJG0eEYjpqytOHrYDyBwewe/5y4IQZN4E
         uA6d5IbUD5+2kw30HZQshhmTSoPDVZr3niRfExPhQK7CsGDDwZ42vLo0/pir+jlDjr9E
         HgxA==
X-Gm-Message-State: APuU4Z8AN7Pyer+UnpmDB21ZlEnOFOrejbezSmzY7MlGu/WTmYgiCXtR
	+d2rhr6gNoyaLFTjEceMvdrd8gkJc0CvTMgo/jiFlTDrm+mEj0Js0lQULzpoP3dj+O0=
X-Gm-Gg: AZFdTZcYX36c6CGaA6nTnQ/BZqKKOXUAmNd1vv7Whf65W5uAT71tV6GLToA3xurX8c+
	MNRIlOjEH4De/PLbhGwLM2Sy6ZtSWEPk6HTa9npMMeKzfeFxtHdvjWMaHSEhkBgdwQljwnL4Q6+
	gtmXQVNm9nMUHzaCKNRUJvV2cAtUP1UJ9UUnFrZvCZSE25MpTQa1X0NBKDk43z+zkGgCI38p37w
	xay6N4Be+7v0bAHaMog1Hmq/MqtR1Oji8da9X9JyTSl6hM3hDoz8O50tlX+mQsDE4vZBu/ftybH
	UZs3iHcbqO9KIuh/K0DVexSfOwANfwz54hzRkQJ54quiFFwgJ5/kHgTXstBEi8+hAUcEek2zGbg
	xME293xf3fus7zNXQsEqwd96UBCF4ntKbR3VaI/Ex+FsdN2C3GokRgJPkqP/xBtoLz0gL/sFnwM
	ybpDHL2EiJhZNFDZyLqNHxOJXMczXlUk6cwwMLw6lZEhpFKfT6jVP0QlbmR4fgqPy+2ifnKW3rf
	RGkTr47KjO7Tyfgmm8R9uMAFJrEr82DxoOayiJ8qm4K+P34FrN4BPEDpIOQhsYrciaVHBJ7VojM
	IPbxqQ==
X-Received: by 2002:a05:620a:7206:b0:94a:889:5a33 with SMTP id af79cd13be357-94a08896165mr1311739085a.30.1795799341642;
        Fri, 27 Nov 2026 09:09:01 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41a341sm1875035285a.37.2026.11.27.09.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:09:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWzRU-000000079ec-2Xcr;
	Fri, 27 Nov 2026 13:09:00 -0400
Date: Fri, 27 Nov 2026 13:09:00 -0400
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
Subject: Re: [PATCH RFC v3 8/8] selftest: attestation: add
 cca_guest_attestation_test selftest
Message-ID: <20261127170900.GU246011@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-8-df3230afce8f@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127-arm_cca_mr-v3-8-df3230afce8f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_090902_918672_DFB86C20 
X-CRM114-Status: GOOD (  11.49  )
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

On Fri, Nov 27, 2026 at 03:33:03PM +0000, Yeoreum Yun wrote:
> Add CCA Realm Guest attestation selftest to test evidence-get, mr_read
> and mr_extend interfaces.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/attestation/.gitignore     |   1 +
>  tools/testing/selftests/attestation/Makefile       |   9 +-
>  .../attestation/cca_guest_attestation_test.c       | 517 +++++++++++++++++++++
>  3 files changed, 524 insertions(+), 3 deletions(-)

FWIW, I really want to have an attestation userspace project and there
is where stuff like this should end up living..

We haven't got to launching a github for it yet, but that's the plan
anyhow.

Jason

