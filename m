Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8687D606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t3bmVX1p;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=doe5gyMW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iUOkhTViorBjXwVMNoDQvsI3GOnGrmqio/YBI7cO2Uk=; b=t3bmVX1pi7RkrYDJCoSGcTJkO9
	DWe5rNl93yWOq3PGhFf5zgqYFJvKk9Tdpns3Li26814WyXLm7Usv3BFXqTEWAJcyS4p8JEyYo068F
	HAOOo9CtolCUyCvJdN+MUPej+ZMfpMPP99QZ7wyZ5Uf1bq7AtJPbGPUVa/3EMFTg72MbAZc90C0bV
	n2EJdL4n8HQhAuFVttFE2wkWavPvKeTNeVKZZ4xs5jbK+14xB2h319K6Eti67bYCR9KBgS1SA+k4m
	7KEpYEqEd4mPaGY9p0E5Vgz+FAGy+aROHVdcig5pAVfEPdb8bny8ap8S3UYI7ljmiN/bszRRbAd4l
	1n1AFzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyjq-0000000H3Pz-2A33;
	Fri, 27 Nov 2026 16:23:54 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyjo-0000000H3Nj-11vc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:23:53 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-490f38e9688so5757322f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795796630; x=1796401430; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iUOkhTViorBjXwVMNoDQvsI3GOnGrmqio/YBI7cO2Uk=;
        b=doe5gyMWVYjgnx1jtctGeJhrOt9gn3FiuE3CyVrnFP9TadLTionF6Rs0Wk5YYUvY1c
         cOkv2pfGJ68klvV5nEq2o/uLhCE9pADBRDg1Q3gSVRil8uGWIgE+X66hbkZqvzWzGYtd
         GxaAuLE+kSwH08X4z6FBgUJtW5DIhR9LFNxHcYO1ZfBH+FKEA+AiZPk+TT6NSbbOejWS
         Mvm6fRQ23XlTSRhFmuGjPqwfCYx2Wn69V8pgz2TLqfkqoqKpk8I4PmyscTCqegkk1mWp
         hz7crQ+GSZqBk8sWmcTLlSxS6M/mlqc6JS5CCrVhYgsHkCbsjruRPRtZJYcvUzyfUR/2
         AENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795796630; x=1796401430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUOkhTViorBjXwVMNoDQvsI3GOnGrmqio/YBI7cO2Uk=;
        b=xP/XL7hbZWUD6LvbRzxEUIsmdT+Qi6y++gr+ZIKlfqoH/VoqiX/pZ39PiCzaCAaI3w
         8qjakP0ConR9zJxaPV5/PejcTX8UXk0Tm06hnNxK7breDHukNfcKsMAXUIOj5/ksEnHU
         EmLxzSpNc3edQeKvlucsuPa1wUGIAUJO4tjmsjvaPXiTPfIOuti9L2uQRcO2ygVZiDbh
         kBH8WTdn+3YLFkFDAq6nbHsxlOE7NTEW1G+7fMbU8qmaMpqS+KdMF+uQWFv93O7xMGEe
         C4YfBduL5f7Xvk6IY4AZKRjzfYvUL8A4UoEdplNzdpXO5YlXvESTRBvBN1UkynG4Ag5w
         D+oA==
X-Forwarded-Encrypted: i=1; AL+hErGdya8h2UhEFDpuS/XzHw9+O/iHd+RLLon6h2/XZHuHyIaHcJ7WcmEnumczT5bUlo6H2DrEAGRQP+2dQ2QwazlX@lists.infradead.org
X-Gm-Message-State: APuU4Z8UVsFXV5anpicBLBNDRm2/HPln1LCjgYC0u36CKHGwEtDsLlh3
	A0zb0c3xv0I8MRZoLffP0nBFhy1HH3a1JeUcX2jid34Acc3AgXIYhHnspDhHHDJk+5c=
X-Gm-Gg: AZFdTZewi3W44BmXMs0OOXN4dW5iRkTpygT+8JhAljb13l3vtwLwkqHrgOvGR/VxKdq
	7Q1p5gKF3DNOZ6/rmyhXLNKy6RlJHhxJ5B35jkU93vI0YPeW14s1PI+0BxMYGiepx1/6BGE7XLw
	Xyw99WLMrDmCFDs8Kb2H8+Z8NtSilNpQ0eF5KIMn5aa6OA6/XKlA4ESEUrpP/I/WZq9rWJhnovj
	nWF27tgw9Ke5iQs6elP1ncOh9sSQGjbYS1JeQFlBYx7olYF4zJuquQuThDfXNlPOb7///9P+65o
	37MSDMrfrX53dQfZoSjB5X0PVn8SNZxQ8PwUs9tL3WemE11sLaqN0tuoU/XhPYEBjLBjS8tdPZZ
	UdBRUnkyAzTGUVxdMA/+ATDndh3IuQipRGNrKWSQ99Y3xN/QX48uNvhjCeyWJDJ8Hkkj84WVw3T
	LrgSdUgtQwLKb6NKWy1nw0Rz8zg6WMG11n0QuP3lIBwu9XOGuVGLwTe13eIPbgMXxp17ybNMEml
	Bs/JB9GYAVF1yRn6dCS2Neg8xF6UwX78NmTTYbM73qqFot7UbO/FnCSDStXYnzFi9U5NryBhi7L
	NrBrIAGTnhxvT1L3r/Y=
X-Received: by 2002:a05:6000:2992:10b0:492:b1c5:6db6 with SMTP id ffacd0b85a97d-4abafd034aamr36481249f8f.6.1795796629954;
        Fri, 27 Nov 2026 08:23:49 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm48569879f8f.44.2026.11.27.08.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:23:49 -0800 (PST)
Date: Fri, 27 Nov 2026 19:23:46 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM: arm64: Drop a pending MMIO access when injecting an
 unmasked SError
Message-ID: <awmukv2SwxTt6l9s@stanley.mountain>
References: <20261125-serror-drop-mmio-v1-1-48076f59608c@pereq.eu>
 <CA+EHjTwi=nFyBKKT_beb60DHU8N98yGQsNHcFRSdc3Vcu7D24w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwi=nFyBKKT_beb60DHU8N98yGQsNHcFRSdc3Vcu7D24w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_082352_321943_142B7339 
X-CRM114-Status: GOOD (  19.94  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 01:52:53PM +0000, Fuad Tabba wrote:
> Hi Dan,
> 
> On Wed, 25 Nov 2026 12:26:47 +0000, Dan Carpenter <dan@pereq.eu> wrote:
> [...]
> > diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> > index 1d5dfd4b9e00..91b835bc939b 100644
> [...]
> > @@ -396,6 +396,14 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
> >                  return 1;
> >          }
> >
> > +        /*
> > +         * Like the emulated entry above, an unmasked SError cancels the MMIO
> > +         * access the vcpu exited on.  The host's copy of a protected vcpu's
> > +         * PSTATE is stale so checking serror_is_masked() doesn't make sense.
> > +         */
> > +        if (!vcpu_is_protected(vcpu) && !serror_is_masked(vcpu))
> > +                vcpu->mmio_needed = false;
> 
> Could you check PSTATE.A directly instead of calling
> serror_is_masked()? That helper treats SCTLR2_EL1.NMEA=1 as unmasked,
> but NMEA doesn't affect a virtual SError. With NMEA and PSTATE.A both
> set, the patch would drop the access while the SError stays pending.
> 
> Checking PSTATE.A also covers protected vCPUs, since EL2 always sets A
> in the host's copy of a protected vCPU's PSTATE (pvm_host_pstate()).
> You can then drop the vcpu_is_protected() check. Something like:
> 
>         if (!(*vcpu_cpsr(vcpu) & PSR_A_BIT))
>                 vcpu->mmio_needed = false;
> 

That obviously works.  I'll send it.  I wonder if it would be prettier
inside a wrapper like if (!vserror_is_masked(vcpu)) instead?

regards,
dan carpenter



