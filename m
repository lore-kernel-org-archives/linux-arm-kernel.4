Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4A5606A688
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3jl6V+Cz;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=AV1MxwKi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ExEdfB9WwLHoUe7nHSiClkfqem+8Ndsrh2CmQFmZ+3c=; b=3jl6V+CzMElr7lWfdqpy326Rxi
	jbtO6pJvWU/BhVQdNZnUc8HCK/yuslUCY4NC8MhqDc5XDbsTgMzzqXvxw32awMoM0u1rQ7Xkkgw+1
	EzYofFsH3FEXuYsgy9V5YklbS4Oqj9UPpS3mt/urzchk20Ceo71WIEDg1kO08l0/7Gdjra8gTFRhj
	Bey/b8XkMjCpHJA3hpdbvS1LOnMZXOCzcjVh1+xtGZiKLyzaliqI4ftVrrzBIbcyAdZ14nDlgzkz2
	UeBSol8duxR88clRhNW353e455sEb+h3Lw6g+wioIrw8LjadxtmqH9+cAHOpz5e/9sHig5CNpHBaY
	sOAGXHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9fq-00000009NfL-2sQM;
	Wed, 25 Nov 2026 09:52:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9f6-00000009NNZ-3H39
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:51:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3458034f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 01:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795600295; x=1796205095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ExEdfB9WwLHoUe7nHSiClkfqem+8Ndsrh2CmQFmZ+3c=;
        b=AV1MxwKiPyP9esLZkmvMfjZev9k/K/iwEDj0ixp3tFZuTe3k/2TE5+kClZBgbzO122
         EQ6xnI3qdJvgLbZAawZCBShAURjZYQ1VcOFA3WnqwZKJnmpkuNC2VEZom1pQOgDMWsjL
         KPMwPYJt5Rbho1jJGHjfuqZaH16X8E6QyN4D1/cgCM7ZbxVEe3eE9POXyi0w1/BprO7B
         TYb4u5W44bU+z0ZNk/S9Bl6YjLxgfDE8Fk8O0BPQcKzhrVARQNHazIrrtEVza8UYPpzF
         SbO3rb3lMxEfbQ3aLJVE0ZYZur3E8iOr+kVcJLDOuJrlYGlFpppIn8L3jv/DEJDL/Mto
         nINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600295; x=1796205095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExEdfB9WwLHoUe7nHSiClkfqem+8Ndsrh2CmQFmZ+3c=;
        b=uRp78nUh12q4s8gM1urlZMSMk4KqsreSSgYj0BPJbKdbV7YxIti10V+v5wyz8S3Cjd
         QflT9oS4gCQn+una1TD7ME02/tHeVZf2bZT8bYGJ2af+853yUEVVHsyg9OECbXCDGylS
         Vut0jHWvrGMLwirx+7PiTd8jRo3DbrN85D7bDp1jrrPnCKUuRA/l7dw+XC3Isaz1E12w
         Sh8p3WG9/2+4IBpWZXJPTEsAVkUYDNwb81OGq73rIkLqAP8xrxkaWMMwEisXeS0ET/jV
         T9U5hjaIlZk5xXg3Zf6n4/tnROqPYeRcSAZvO7D3jI56hSYFLpVowZY8bevg1z1g2E5L
         krJQ==
X-Forwarded-Encrypted: i=1; AL+hErGD06BiyA66IxNMHzsJ/bH6QXKuRQVP9mBTKmArnjkv6MYrOnXOM76b3IcTqYoPN/vMGjMM67vjt8aEPleqlChy@lists.infradead.org
X-Gm-Message-State: APuU4Z+4JIVcMxGZ/ktd5vxuNQ+N/E+BsX0aNOkDTRr+u6Q/c3XcSNrX
	FPbPZ/rf7QwTD0OrPkvpJq28JWC1La8JwL4EOrgNj9AKBFz81EvKIN7gKYTHfVDtUD0=
X-Gm-Gg: AZFdTZdha6BWQqTX6Ftis3Agpj59vYiTg3CArkqD4kFvIXGw1noUCEmTOmM2duIS7j0
	zSpbhqmDa369p8bE9nnOtdHK0OyhgDQB10o1IXeskvjH2RKfmFyfO64TDpuyEhYXZm9go93XZXg
	N1Q/90S/nBOrM7ND2U50WYHNBO+oGnMC96dAPQfqI+V1YcrkI2AY+jt4rsZvAIWsiA2XEr2oV22
	t/HjQ9bJQ42gV2A7B5u47nFhYYt6Jm3vhxiP13jeg1y7PkpHuNdE9XqbjE3i3akh47ix92Iv80I
	wlG0byNl3v4B/Cc1k6HYjlw/BAuyV5ukzBls8ByveQkMLsW8gERZQLLY0PHMJoPIGYfVkyOw39y
	TZr6ySQfu0jbTajXJZvpzoEtBvzHaUya7TjJHqBoPe8X2w5RFaKzejHZ9Ly9XlIJJkIY1Hv+4fi
	Zwg7Uo5optDRPVxSxXO//BVqhr7aR/nFlQDSNahx+z9/Vq8MizEgEyleCBtgiWR5SW9GIR5sclO
	OganNoAIU3EsRHPZAgy2pE/xUmRJ/Z019t0ZjxYmo2U3VZ5Yau9zRJhKRs9E8oD2WFUp5T4Kaj7
	qNH8IruQCl5l+cHApdM=
X-Received: by 2002:a05:6000:4617:b0:4a9:760f:1824 with SMTP id ffacd0b85a97d-4abb19c153bmr33040480f8f.21.1795600294485;
        Wed, 25 Nov 2026 01:51:34 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm32867213f8f.42.2026.11.25.01.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:51:34 -0800 (PST)
Date: Wed, 25 Nov 2026 12:51:30 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <c.dall@virtualopensystems.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sebastian Ott <sebott@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	James Morse <james.morse@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 5/8] KVM: arm64: nv: Replace a pending SError when
 injecting a new one
Message-ID: <awavokPJT7G8J2fX@stanley.mountain>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
 <20261125-double_exception-v2-5-224689d8a764@pereq.eu>
 <awaVj0Aa6dMSksxX@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awaVj0Aa6dMSksxX@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_015136_839422_FF6CC421 
X-CRM114-Status: GOOD (  23.67  )
X-Spam-Score: -1.8 (-)
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

On Wed, Nov 25, 2026 at 12:00:15AM -0800, Oliver Upton wrote:
> Hi Dan,
> 
> On Wed, Nov 25, 2026 at 09:56:20AM +0300, Dan Carpenter wrote:
> > The kvm_inject_serror_esr() function injects SErrors as the name
> > implies.  The bug is that it doesn't handle already pending errors
> > correctly in nested virtualization.
> > 
> > In vanilla KVM the kvm_inject_serror_esr() function always sets
> > the SError to pending.  However with nested KVM, it might set it
> > to pending or it might deliver the SError directly.  We can only
> > have one pending error at a time.  Imagine we enter the function
> > with an SError pending already.  In the current code if we decide
> > to pend the new error that's fine, everything works.  However if
> > we decide to deliver it directly then the pend flags should be
> > cleared but they are not.  So we deliver the SError directly and
> > then the SError that was pending on the next exit or entry.
> 
> I could use a bit more color on how we got here. From what I can tell
> this state is only possible if userspace changed the routing / masking
> of the SError outside the context of a KVM_RUN. Otherwise, if the SError
> is deliverable on guest exit we perform the injection prior to exiting
> to userspace.
> 

Yes, but the main reason is that I'm changing the way
kvm_nested_sync_hwstate() works in patch 7.  Now every stored SError
stays in NESTED_SERROR_PENDING across handle_exit() so this situation
will become more common.

I will include that in the commit message when I resend.

regards,
dan carpenter


