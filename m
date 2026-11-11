Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8907606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iERjwhHd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aYsNj+Jj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Lg38hiBjDXw9cSHliNLU5G5GwmBdVZAwW1RU9LwK+4w=; b=iERjwhHdT79qeYfwdtzzCIiVzx
	tMHl85KB4QETWnqBrsB4b8q0h7Hd7xrsNKWfDETEheCy8/r8wEeDeMDm5B4vDISfZbNugdmdQUz33
	XkU4MSItWII6pfdue+3ib9gUEjLrOwjbFezjqGhTzrZMPYRonhyO3ezv02X9gr1IGaObC8lG7QSlu
	XmJoQZ+ndPDcY055yVRKbTg9kLHAcj+04cUqR++kzldQ1gEZisvnwaavUB3P36wWTcxRsUeg7uEAa
	PK+9sNvz3f6T05aWbRFw9jyHQc/5cwrjDgvSXPTaWe8zMyzqAUOpeyPeXNMnw+hPyywSgi4ARQ3d0
	4i9KETfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCNP-00000007KSK-2xnJ;
	Wed, 11 Nov 2026 17:44:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCNO-00000007KSB-1RD0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 17:44:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E920634E7;
	Wed, 11 Nov 2026 17:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0F61F00A05;
	Wed, 11 Nov 2026 17:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794419089;
	bh=Lg38hiBjDXw9cSHliNLU5G5GwmBdVZAwW1RU9LwK+4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aYsNj+JjgNOG/AX25zAAGt2RliUQSf76sv5AsNjNO1u/LByCnXQg19OCButP+nN+L
	 2zFXvTe6prgut3foVwuXfZs2xfSptIk7wI92j8dQmtsqfyEJRsBvFMWbOD4RPnMpaV
	 WNHqkEh/XbLnB5pBb/G6pDjSktZAka5wOlmHItQ8YK+mxmtw1BTllMhFomoSfYKotW
	 woD4H7rHXd3hTGYsaiQB4ELEVeSx6z+IgOquJnfR8pT9NnlVpPFXrekXY53aBev0aJ
	 FQdENxc9+JVgax638KjqDUH4UV/TolKmzVK5KyIsfqVtckoPkifyhnLoZlIPKqATud
	 qfZlrleX+BcwA==
Date: Wed, 11 Nov 2026 17:44:43 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, pbonzini@redhat.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, maz@kernel.org, oupton@kernel.org, 
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	david@kernel.org, mark.rutland@arm.com, ackerleytng@google.com
Subject: Re: [PATCH v2] KVM: Ignore MMU notifiers for guest_memfd-only
 memslots
Message-ID: <avSpIZXjqXZbpUIi@gremlin>
References: <20260714160411.302386-1-alexandru.elisei@arm.com>
 <amPCdAswlk24Xilf@google.com>
 <anxAGkdyPYXBlS00@raptor>
 <autwsR83Ii-tRrqF@gremlin>
 <auzSxEsGAcm3MYtN@google.com>
 <avSn-IW8DMybO-Tg@seanjc-mac.roam.internal>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avSn-IW8DMybO-Tg@seanjc-mac.roam.internal>
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

On Wed, Nov 11, 2026 at 09:38:00AM -0800, Sean Christopherson wrote:
> On Thu, Nov 05, 2026, Sean Christopherson wrote:
> > On Wed, Nov 04, 2026, Lorenzo Stoakes (ARM) wrote:
> > > [updated David's email address to @kernel.org]
> > >
> > > On Wed, Aug 12, 2026 at 10:42:50AM +0100, Alexandru Elisei wrote:
> > > [ ... ]
> > > > On Fri, Jul 24, 2026 at 12:52:20PM -0700, Sean Christopherson wrote:
> > > > > It'll probably take me a few weeks to circle back to this, as I finally crawled
> > > > > out from underneath a pile of urgent and am just now getting back into review
> > > > > mode, but this is fairly high on my todo list, so with luck we might still squeeze
> > > > > this into 7.3.
> > >
> > > Hey Sean,
> > >
> > > I wondered whether you'd had a chance to look at this?
> > >
> > > After discussing this with Marc and Alex it is clear that this is really a
> > > blocker for Alex's SPE series, as we need a sensible means of ensuring
> > > that stage-2 mappings stay in place.
> > >
> > > So ideally would prefer to get something like this in in the next cycle,
> > > if you don't have any objections to it? :)
> > >
> > > If it'd be easier, I think a smaller version of the same patch would also
> > > give us what we need? I.e. your snippet from June with the page ageing part
> > > dropped, as below.
> >
> > The GPC invalidation fix landed, so we can go straight to the super simple v1.
> > Compile tested only at this point, I'll formally post this (hopefully today),
> > assuming nothing explodes in testing.
>
> /facepalm
>
> I spaced on sending this (and I think on testing it too...).  I'll try to get it
> posted in the next few days.

Thanks :) and understandable, the AI wave is making the mailing list
quite... an interesting place to be lately!

--
Cheers, Lorenzo

