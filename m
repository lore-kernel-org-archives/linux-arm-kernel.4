Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F20F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ESFo8/Gp;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oiyhv3ot
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I4EKeLYusuwV9UZSDwAKboaaUngjXvxm9EAu3qSXbis=; b=ESFo8/Gpy+kT1N
	FSmWsLLrMcs1Z/Fbg5Oqx2h5pifmr+uamb5AkbbAGfX4wn/WnJZ2zTgxeG+gwNkbKSBDCI0XWtN3w
	+pdSDFMeWqIm911xl7VGgpl9MnL3oIiMU0u2bTBcHl+9VsEzuplp38/2GZtIj0g5BKWxRivDOzfmb
	mNnO1htzJQK6KlMSzDTJZIfr3pqVKwUZyxVWvmpd29ovg4oZg37ku3KcEIGDLZlAcPXvSluGs1y+r
	Kv7TjoD1cRNUDpPIjcWGIdosVdQ30VELY2op6JP0vgS/E//qskDkBfZQR4T9jW/rrjzWjfShj8In5
	QbtptR3KYD5sgMaO5RhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKY7-00000008W8k-0y59;
	Thu, 12 Nov 2026 02:28:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKY5-00000008W8T-1wuS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:28:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73C5761E54;
	Thu, 12 Nov 2026 02:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFE51F00A05;
	Thu, 12 Nov 2026 02:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794450504;
	bh=I4EKeLYusuwV9UZSDwAKboaaUngjXvxm9EAu3qSXbis=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=oiyhv3ot5t0hTyhk+LOCNGB2tDYfrjJmpw3GAUQuxaF5/i+FjJC+XfH+Ks40jnCRr
	 OAwtS+rwHxfwl3XxHbYmszltVWZXFd4JPMRitDyzuhT+k1QdkGk8XShwWHJTfkMOw3
	 IbNurWr+61zDP/H/GpSJ+3F+l7sIjCVhDizSFOZFJVOD8vCpPPxsuucikaduLzhl0E
	 AuZlFvmGum8z0qXl9GwDxWgCH+2zYQr3UGCdxw2HR++GMpn7wnnVKs2lH4yh8jIo7C
	 IgkEJkWhycNj10xwyajofSWMcnppyU/I/7DmlD94dhwdKVeW3h6I3GiEgoNfCEEJQ6
	 iuuQRXbNevbUQ==
Date: Wed, 11 Nov 2026 18:28:22 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: zhu xin <zxyan0222@gmail.com>
Cc: netdev-bot+sinfo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, muhammad.nazim.amirul.nazle.asmade@altera.com,
 rohan.g.thomas@altera.com, rmk+kernel@armlinux.org.uk,
 o.rempel@pengutronix.de, wojciech.drewek@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v10 0/3] net: stmmac: dwxgmac2: timestamp
 interrupt support + Agilex5 fix
Message-ID: <20261111182822.580e871b@kernel.org>
In-Reply-To: <CAP7veT+buHRMu6f3o5RaKFdv3fABkWKgkO6KFn5js4PEeB8b0w@mail.gmail.com>
References: <20261109134506.2794160-1-zxyan0222@gmail.com>
	<179423231463.488859.16977464890948797360@kernel.org>
	<20261111152012.3506cf35@kernel.org>
	<CAP7veT+buHRMu6f3o5RaKFdv3fABkWKgkO6KFn5js4PEeB8b0w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 12 Nov 2026 10:18:41 +0800 zhu xin wrote:
> On Thu, Nov 12, 2026 at 7:20=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> =
wrote:
> >
> > On Mon, 09 Nov 2026 13:51:54 +0000 netdev-bot+sinfo@kernel.org wrote: =
=20
> > >  - What hardware the change was tested on. For driver fixes please
> > >    mention the device (and if relevant firmware version) used for
> > >    testing, or say that the change was not tested on real hardware.
> > >
> > > Please do not repost the series just to address the above. Instead,
> > > reply to this email with the missing information, so that reviewers
> > > can take it into account. If the series needs another revision for
> > > other reasons, please include the information in the commit messages
> > > then. =20
> >
> > You are at v10 and still getting these automated emails.
> > What's going on? =20
>=20
> As for what is going on: I answered the bot's full questionnaire once,
> in a direct reply at v7 [1], and since v10 the same facts are
> described in the cover letter.  The bot, maybe, evaluates the
> individual commit messages, where I never put the information,
> assuming the reply and the cover letter would count.  They do not,
> so the emails kept coming.  I will fold the tested-on and
> found-by-inspection statements into the commit messages with the
> next revision, which should settle it.

Read what I quoted. It literally tells you to put it in the commit
message on revision. How many times do you have to receive this?
Please either pay attention or stop sending patches.

