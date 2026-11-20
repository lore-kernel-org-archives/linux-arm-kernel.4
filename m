Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A07606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AvDSwmgY;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=80ZvOiqN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RiLXCT33fn3sTnxmiWGsufjs6YJRxioeNCivACLz64o=; b=AvDSwmgYY5Qwh1
	Xcxy+s7+YBLZGyUe81cqFRahYhT9R/tmMOlwoXYL6owV9bfzF9z4xLzhAXgZpImFrol1lQJE7A73V
	9l1P2TozVlxTbupyRrc+tRm1ELQy/LpnSo1KRr6f9wG860PMlk4k5+4toRz3M4u1mnQyZp0Jisexi
	gIM0cjXgVYIDqZOc0BuLjGk3hamqGHkZSAso9XLylh6u3zuWzBlv9roFIeYRaddDh3ItSjgU9K0M2
	216Nfd2+YjoDEe+g5qktYLZzxPbFJNVsAyz3AjAEaOitWF4RvVVJQ0YIEUky8Ku/EFvhHyNVpWQ75
	Z+AnIlbWRnkrRSAlkEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULMj-0000000EXVg-0U7g;
	Fri, 20 Nov 2026 09:57:09 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULMe-0000000EXUD-2um5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=RiLXCT33fn3sTnxmiWGsufjs6YJRxioeNCivACLz64o=; t=1795168624; x=1796378224; 
	b=80ZvOiqN0VlZscs+b4XdkVbVD5P1x9SmQT1e9hYk4arvwQiwI1fx4KKATmQab+8OenculyrdH5F
	pa4X+FaF2mDdkAJf427lOxqs/JLGxbeFwIoGXPrl2QZ7KZPRPKPnXLeqOWpQM+KJjpUl3ecCABwvf
	T/hapNFp2Um8+SZh8FCdRMBAEN2lqJrF43wyZP/FIMKeH8eJCdRihLeFXmmGgQ15ZDa7mOgP2G9tZ
	xM76o5u0WzkGzxDfUEN9ZVNKbLc12gi41c4HuJ5ht1ItbeDijLCCheqaLKNA/giiZGqqiQHFCgYzC
	+kjn/pA800sUOtC3eRtFBqWl5I/T645VHaYQ==;
Date: Fri, 20 Nov 2026 10:56:59 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Nick Terrell <terrelln@fb.com>,
 David Sterba <dsterba@suse.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 j.neuschaefer@gmx.net, f.fainelli@gmail.com, Tony Lindgren
 <tony@atomide.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ARM ZSTD boot compression
Message-ID: <20261120105659.16f48da2@kemnade.info>
In-Reply-To: <CAD++jLmdX=p7Th3omP8dMQuUPyTziMDwMeGPyT9PEGw-wnT5DA@mail.gmail.com>
References: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
	<20260912123827.3aa54e58@kemnade.info>
	<CAD++jLmdX=p7Th3omP8dMQuUPyTziMDwMeGPyT9PEGw-wnT5DA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_015704_999475_414891C8 
X-CRM114-Status: GOOD (  14.01  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 13 Sep 2026 20:17:53 +0200
Linus Walleij <linusw@kernel.org> wrote:

> Hi Andreas,
>=20
> On Sat, Sep 12, 2026 at 12:38=E2=80=AFPM Andreas Kemnade <andreas@kemnade=
.info> wrote:
> > On Fri, 28 Aug 2026 22:32:18 +0200 =20
>=20
> > Andreas Kemnade <andreas@kemnade.info> wrote:
> > =20
> > > Add ZSTD compression to still have a quite high compression but with
> > > not too much boot delay penality.
> > >
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info> =20
> >
> > Anything left for me to do here? =20
>=20
> I think the patches look good.
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>=20
> Please put them into Russell's patch tracker:
> https://www.arm.linux.org.uk/developer/patches/
>=20
I have put them there.
I constantly get this from emails:

 linux@armlinux.org.uk
    retry timeout exceeded

So how to proceed here. Am I just feeding some kind of black hole here?

Regards,
Andreas

