Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A916B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RueB/PX0;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ep2Xbu9t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RzcN8ipRXfPFoZcXCVEK2wVxpyT4qgwWkbcZIigmQvU=; b=RueB/PX0Ue1+Le7O3DQ+7xlfRv
	lZYILEtgXOgBNluOqvlQU02xhYCpy6v3RlRBzn+wAh6eXT5jPAsaR4/6nh0S0XwDX3lrEM3+KPX6s
	rgPbzZimyp2+zFJawBHjsRtYmkSXzP8ZfoMJgE+KqYv+joGNi9zDbgTWGciZJKoflEJKHABAbfW3h
	hLwc+5LF0zW4NtGt/MGIBo/PuajVnXkrYPLnckcP5TSBvbzIKxfR1fB88G7+wbp591Ep9LPHp0PwP
	xW+MaERpqcOTSnoumXqLdB0NzkaZx6DbzmRhUIV7X7RvcVnypeiorEeAj69mFX7AL3V5KQuAtO2F7
	yVJ6mfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfel-0000000EQID-0JnM;
	Thu, 26 Nov 2026 20:01:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfej-0000000EQHY-1XPl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:01:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so20799135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795723279; x=1796328079; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RzcN8ipRXfPFoZcXCVEK2wVxpyT4qgwWkbcZIigmQvU=;
        b=Ep2Xbu9tP5DpYaf14nTc09ouZY1hIl+0uQuYiOVVRmRT1B8+PVXE9Fu0BiQ4inSeg1
         pqzQzPzyB643IlupCCHG4h6HtohK9EsMeRAQiaLFWAh+5NFzPyLX94IeE6V+7QPbbUqs
         VmtqQlGP2AhF5ucn+ls4PmxDig7amTQhvJULKlM6hVvAbhpC/HIIvQM/ESiqHkfA0D3j
         byo2H6dCrukcZxyJ9GwYWywuHsE9SUBGBFwZhbsHXcGgUwHyCVXIvryNDQAwT1rAhw1z
         DgHfJvdkgCR/tIiml6Y8/pBFe7c9/Dt+fh6BSa4ss0DFt2nFJe6B5R86uQX5NOOor50B
         vpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795723279; x=1796328079;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzcN8ipRXfPFoZcXCVEK2wVxpyT4qgwWkbcZIigmQvU=;
        b=HljyEfxTLYH+5OIlqnyx3eNEYjFfXg9MsmtvqchVrRAbds1s9TpiQV7LnVBQGmfxLO
         v2oKN7MMPBb0fmzy5RpUL0DSkHMB8mhFzDRUze+NyZGXcm5FerRRCLvQlhCJL4E6uqRr
         lYKa3caGJuA4Q5+x8Z+EM431wRD5EdQ4mC29/MNhXXMwFTsCjk+Tz/TfNwd5Kpf7pjBY
         Z0rWHDLb0nvprzv2PImFaofhWW6EYiVTVzFH7FrMUVnUfNCuV1b09B9Afh5MR6bAN9Jz
         R6HwG0PJsLWFg8qG/053S8XdOemL4TST9lEfaU9AuBDqQIU8XqLwy4ZPblvFecnVx8uy
         bYPQ==
X-Forwarded-Encrypted: i=1; AL+hErEOqjrgN9y0OJb2mPnayfY/2W86inSMBE3ZIy5Y658ldH0fv1tXQGsmWgmGqd7XQ3P1vbjQHHkjyz7KfaQWOl19@lists.infradead.org
X-Gm-Message-State: APuU4Z/3IydUCCnBW9yCQ5iJqq/+Xu1ei0t+aFoexWZnTYtysGP4RdPQ
	pq2etUySGFLbbDCOikPrSzMZ6hOMlj6OgDfvowx1hKWrRMjja4ePJUwxmXL1PEFRVA==
X-Gm-Gg: AZFdTZdghEkC0z945hQ01xIhsy31QcdzxPWrrlCWWAZ+aaQ6UGtoYoSX5NkkpqpZk1Y
	dasOeWb6WMThiJ/gns4rFq9Fn+oTuIZy7xRg571v3xqhNiHlwUqnxn7ibNCwNDJLMydb7FFW78V
	CqWM/37Vx7cy7bjkcKD4P5ZItuoBNm3sLnfWl0SHg6dpVBBoYfrMJadSVBIMJiUKI/PRVTgfOEA
	ia0F/qVPpPVUj7je/XrPH927A6CKxwXUseo2xgwxcpVPU8ztcpHbS4J7Syk8zU6g++f0UqxqyQ7
	lmZDDv3SlmdfNt66NpX3iTA5TpucUrlHoXKZxGymJCsl0N+goVovunM/5swyWyQYuukDHH9AAuk
	3vZ5zotHJ6uorRMLsUkq/ITYi61Tjn8+DtIv0fstrHktM5SiJtqN9zUIhBV2IcEgvSzo8Aq5Hs/
	WrQq7MlxdzsUAx6UKZWLzdPfU/s4NrOKNDoSCCpDPJ3LEz3x7xe1gyqAn/bnn6tqyBs6O7qNhdx
	Z01/S/XsTD1HXQ1C0rfo5YxPz0OGZDy6buLHSfc4q7G9jzrp0tAUXO0BNmaIe7Fjdew+vTEz4gt
	+vD19lG3eCeAE/lUGIoVdJWIHYOjt5EoYhSOtiYI2D6OtA2Kd6x+k8CSGkAafsXnzU/W25O4uGl
	+hXzQUZJubz9g1tOHnLyFcO8=
X-Received: by 2002:a05:600c:4ec9:b0:4bb:6a5a:782d with SMTP id 5b1f17b1804b1-4bb88925fcdmr459719625e9.17.1795723278915;
        Thu, 26 Nov 2026 12:01:18 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8533579csm543682885e9.2.2026.11.26.12.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:01:18 -0800 (PST)
Date: Thu, 26 Nov 2026 20:01:15 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com, weilin.chang@arm.com
Subject: Re: [PATCH v4 15/23] KVM: arm64: Add a range to pKVM ownership
 selftest
Message-ID: <awiQC1Mhw9Y_gwhK@google.com>
References: <20261117174403.58762-1-vdonnefort@google.com>
 <20261117174403.58762-16-vdonnefort@google.com>
 <CA+EHjTyzbeZ34bp-TnvVibHubgwZFuFbLZCRRSF-kbM1wXb=Wg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyzbeZ34bp-TnvVibHubgwZFuFbLZCRRSF-kbM1wXb=Wg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_120121_421768_8A777497 
X-CRM114-Status: GOOD (  16.25  )
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 07:56:49PM +0000, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Tue, 17 Nov 2026 17:43:54 +0000, Vincent Donnefort
> <vdonnefort@google.com> wrote:
> [...]
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index 4c80e0960154..ae53c701206a 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> [...]
> >  static void __init pkvm_ownership_selftest(void)
> >  {
> >          unsigned long pgtable_order = 5;
> >          unsigned long pgtable = 0;
> > -        unsigned long page = 0;
> > -        long ret = -ENOMEM;
> >
> >          /* Memory for the VM page-table */
> >          pgtable = __get_free_pages(GFP_KERNEL, pgtable_order);
> >          if (!pgtable)
> > -                goto out;
> > +                return;
> [...]
> > +        __pkvm_ownership_selftest(0, pgtable, pgtable_order);
> > +        __pkvm_ownership_selftest(PMD_ORDER, pgtable, pgtable_order);
> 
> Could you skip the block case with a message when its allocation
> fails? With 64K pages it's a 512MB contiguous allocation, and the
> selftest prints a failure when it can't get one.
> 
> Cheers,
> /fuad

That's a good point. I'll also GFP_NOWARN.

-- 
Vincent

