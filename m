Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6FF606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 17:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h9SGiCO9;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S0le8NaV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IGymzurcCAqkuazrSBLvvuD8i7vbGW+naOWdeyf6NCQ=; b=h9SGiCO9F77JExD8tg5uxYIfA6
	Q4INIez6P/tchSca7/1h9DdIA8EbZckZXXRk4EDZkPHsQfe8a/uS21rnlEaB8xhd/neExGD148KUr
	e54/pE8ue+/DMykGBItS9ZzCxMsvnOPVg+9s3Fudx8CeGuLnFNeRBnDmiD+hdq1jFskdSm1rM9pIK
	hnYBqXSf1xooCzMcAFJfGWXtbboPOx7BwrLcjfHPdpSFkcgW9zmnneK2Hr1St0kqk8kT/96XdknkO
	z2vpE5ri+2nxTx53V3JsrWpzS8qOM4ZZyuBrE4EJVE+bSHxX9hq+0/Usf6rdCmHPekMgveVA35/ky
	ZaCTErkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCGs-00000007JtB-3g5z;
	Wed, 11 Nov 2026 17:38:06 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCGp-00000007Jsf-2B1r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 17:38:05 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so4339350b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 09:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418682; x=1795023482; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGymzurcCAqkuazrSBLvvuD8i7vbGW+naOWdeyf6NCQ=;
        b=S0le8NaVJvMLQDtyXRXwSpIMVtgUworP9+i9nA8uZYwJLVCjVde5lSWpKIe20/3JEn
         AT/druITtgnIE15+uE/wWm9E6GBlYgqXarFFbFO556R3K7j7qukEmA1WeA5kGsw1HkVx
         LBX9Uo7cS/Ewm8C6wOLr625z1He/vYttz37WPh/xjpg6P8JjJckPPDJeoLoMkbvyWuaX
         nBy5vlqy7Vmjkg3O9NOR+mDnGsMk+tXtmb3J0YWNKD2LOP2uUVx28rdGsP8qZAcCeVUI
         tp1hr5aHoPpLk5tmH9v28NFYSPxf+ZqGlJ5VMcU2icPgdUBcbOy7bCm6tm7kvIyE7fnJ
         S3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418682; x=1795023482;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGymzurcCAqkuazrSBLvvuD8i7vbGW+naOWdeyf6NCQ=;
        b=JeJ/goxAPQ1I2RldKzg7aU4DrL4+gXi3TMlgkuinvmq8lne38oi4+21fmXky0rDqQq
         8yY3JaFnLRZcoE++n8Ij5ZqgAuBmoXeIQOw6DM76UXvNb/T34R4a3hF4sccUnno/MmZt
         NikXR5dRnX8K7dhNhh12oeftxRynRUT1MMbseuAc5ZcSx12JERH6j6ZvQahjGAmS8xrW
         +ykHAXeRbYEseHASAoG1enGiQ8OCsNscJw6Tree7sRzJStmIi+lVGg8MqpK7/nYx7ybU
         bge5nwJ0uYMQNNhcnQT3Ao0u2gCakKzlQA3JlA1VJ85UPmmadMLULKUI1JrTabNMBIdX
         bi0g==
X-Forwarded-Encrypted: i=1; AL+hErFy/Xa9YIy1oPl0EkDuGC8e9w2D/y1mzi6KDRYIUgJ1i2xGrXGh8DRnuLjeGzUuQwB6UZ9HMAE9+ael3gdq+pWa@lists.infradead.org
X-Gm-Message-State: APuU4Z/4M7f2DBZGwU+BcACgEd2hv18Ui0HMak/l8q4ZZfbcV91QOm5k
	FahWWYSxgWXc70qt4w6H300YOFO5c0WTNPWYBiyEIAJgPUSP/38gpRkmSlQe1gLjEdYQwRyWjXy
	xcM5jQQ==
X-Received: from pgoo5.prod.google.com ([2002:a05:6a02:3485:b0:cd8:b51c:c0b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7349:b0:3e2:6b5a:fea3
 with SMTP id adf61e73a8af0-3f2ff4cfa62mr3490465637.71.1794418681497; Wed, 11
 Nov 2026 09:38:01 -0800 (PST)
Date: Wed, 11 Nov 2026 09:38:00 -0800
In-Reply-To: <auzSxEsGAcm3MYtN@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20260714160411.302386-1-alexandru.elisei@arm.com>
 <amPCdAswlk24Xilf@google.com> <anxAGkdyPYXBlS00@raptor> <autwsR83Ii-tRrqF@gremlin>
 <auzSxEsGAcm3MYtN@google.com>
Message-ID: <avSn-IW8DMybO-Tg@seanjc-mac.roam.internal>
Subject: Re: [PATCH v2] KVM: Ignore MMU notifiers for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, pbonzini@redhat.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oupton@kernel.org, 
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, david@kernel.org, mark.rutland@arm.com, 
	ackerleytng@google.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_093803_561899_35075B2D 
X-CRM114-Status: GOOD (  24.26  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026, Sean Christopherson wrote:
> On Wed, Nov 04, 2026, Lorenzo Stoakes (ARM) wrote:
> > [updated David's email address to @kernel.org]
> > 
> > On Wed, Aug 12, 2026 at 10:42:50AM +0100, Alexandru Elisei wrote:
> > [ ... ]
> > > On Fri, Jul 24, 2026 at 12:52:20PM -0700, Sean Christopherson wrote:
> > > > It'll probably take me a few weeks to circle back to this, as I finally crawled
> > > > out from underneath a pile of urgent and am just now getting back into review
> > > > mode, but this is fairly high on my todo list, so with luck we might still squeeze
> > > > this into 7.3.
> > 
> > Hey Sean,
> > 
> > I wondered whether you'd had a chance to look at this?
> > 
> > After discussing this with Marc and Alex it is clear that this is really a
> > blocker for Alex's SPE series, as we need a sensible means of ensuring
> > that stage-2 mappings stay in place.
> > 
> > So ideally would prefer to get something like this in in the next cycle,
> > if you don't have any objections to it? :)
> > 
> > If it'd be easier, I think a smaller version of the same patch would also
> > give us what we need? I.e. your snippet from June with the page ageing part
> > dropped, as below.
> 
> The GPC invalidation fix landed, so we can go straight to the super simple v1.
> Compile tested only at this point, I'll formally post this (hopefully today),
> assuming nothing explodes in testing.

/facepalm

I spaced on sending this (and I think on testing it too...).  I'll try to get it
posted in the next few days.

