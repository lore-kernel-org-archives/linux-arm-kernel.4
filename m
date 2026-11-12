Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B919D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 20:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X6kH05f+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oea7d9WU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wMV2nsSJl6xGkmfUvtbbR/+a8KpdpyQgadjZKqs++do=; b=X6kH05f+iBaDRM
	hs0CLllQPRiyyEVux6vn+4fZNtQjmc9JtVdNyhoarsrt3xUlkF8sgQhcZtF50PJ4xodOaSiA90EaV
	tXpoVwzv0T39oEHSm7ZoK/+yctQbomH/nNwIH1XoBJ+2iALLfAu7NcDskSfDEDbzaK4Wsmb1+sytJ
	MWBhy78QwEeQWwqnm/fLTvo7vbKzXIxavOohHaFeqp4O2CIvFBGZF/c42BX6WREObE+F5batB6sxA
	iVbbSz6S1Xqk1j9vy2ZMccCUjKyBlmrwKXX6xE9mm1JElgCmmHs7pWYOthJnFSQEGByA7BJTHqqs7
	+Fn4vJ1zcka3GheNBYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRb7l-0000000Azt0-2orn;
	Thu, 12 Nov 2026 20:10:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRb7k-0000000Azst-2fvE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 20:10:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC18B623DE
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 20:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DBE1F000CA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794514219;
	bh=wMV2nsSJl6xGkmfUvtbbR/+a8KpdpyQgadjZKqs++do=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oea7d9WUqHfzTiVDkeGIwXaDwNGtKAsIjeW8Srs0B6AWiHDKuEHRiwsRKjYojdpsx
	 7RaAYliRpnn+q32nc86uPyUgUH5kBGvd8lyGlID1GQi6PMuW3eJwD4q0fGY+eGxpxh
	 G/dVgcs4JmZvF6xdUO8R+AyC2RVfQ+FgzwHR8ps68aYqcRznRMwx6fKk1lzjsJb8w7
	 jvdDu5Hi7EEpXebatOZGC2xNsTwjrpnoPqXeWr4xsuE2t1hZeVJgXNv4ZHAvFlsxnn
	 dlkRUvKvDty2e0Izi/Q2byXB1ICX5ATqK8/Rv8E2z54xYityDhVNInLGhp3uCSkT2c
	 CV7gt3++aUZsw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3accd1ff4c3so1631481fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 12:10:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFRmOmc/hkG0wAykbiC4/sBK0w0TCfwlujL4qLakM0A/dWXWwDfoFRHzbNTFo9iRUCx451ema4hVneSivilqruM@lists.infradead.org
X-Gm-Message-State: APuU4Z+CaeiENq79QHu3PcjQBRZQ0M2iGi8eor5ZzZeuhf4nCROz34An
	ndjn2YWctAEaOjqmHvpJgrrHhoF0U/ZxQd/ZFUONXMYaRIPeGR5gtB49qmFQWIFYMbRkJWkieTP
	AHDdtdNzhHc/REUVKbsFluXopxxrV9hU=
X-Received: by 2002:a2e:a917:0:b0:3a8:bd3d:546d with SMTP id
 38308e7fff4ca-3ae2b4b615fmr2200351fa.5.1794514217867; Thu, 12 Nov 2026
 12:10:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <auzlLwlleGLPsLcw@google.com> <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>
 <au0oKFb9CmNzc6Cg@google.com> <CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDNbp+eQ0S-E52DETWjQ@mail.gmail.com>
 <avOw_4ZkqtKFHu1B@google.com> <2c3bda2b-ccc3-4430-8e09-81b25f6fcda7@rowland.harvard.edu>
 <avSa97F1Nu1LTSCA@google.com> <fc43eb13-816b-4cd0-9711-848fdab605ef@rowland.harvard.edu>
 <avUHG8mLuTOUMr8O@google.com> <CAJZ5v0j+8_fOc_EEGx4tquqcaH3-nmHd0YMJRb38t2Rw40iV3g@mail.gmail.com>
 <avXs826ikSctpUnA@google.com>
In-Reply-To: <avXs826ikSctpUnA@google.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 12 Nov 2026 21:10:05 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0irBvT=cnK6qTwvoKr+G7cmyFsRFz8yrKo=P=W2euVujw@mail.gmail.com>
X-Gm-Features: AclHuK__4os0EMcsZRKi_kFGQIBcp-RMR8mLlriuERmrjM4SgFsglhioQkJ6M6o
Message-ID: <CAJZ5v0irBvT=cnK6qTwvoKr+G7cmyFsRFz8yrKo=P=W2euVujw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent to dependency
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Nov 12, 2026 at 5:44=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> On Thu, Nov 12, 2026 at 05:13:09PM +0100, Rafael J. Wysocki (Intel) wrote=
:
> > On Thu, Nov 12, 2026 at 1:24=E2=80=AFAM Brian Norris <briannorris@chrom=
ium.org> wrote:
> > > I'll give this some time in case Rafael had any other thoughts/replie=
s,
> > > but unless something major changes, I'll plan to write/test/submit v3
> > > where rpm_idle() calls pm_runtime_mark_last_busy() (part of Rafael's
> > > proposal), and *not* make it conditional (i.e., no
> > > pm_runtime_use_autosuspend_always()).
> >
> > That will work for me.
> >
> > > (Or, Rafael is free to do so, since it's his idea. Just let me know s=
o I
> > > don't waste my time on it. But I figure he'd rather someone else do t=
he
> > > work.)
> >
> > I can cut that patch.  It is going to be a one-liner if I'm not
> > mistaken and I'd like to write a changelog for it.
>
> OK.
>
> There's potentially quite a bit of follow-up, including patch 5 of this
> series (to drop now-redundant .runtime_idle() callbacks), but I can roll
> that separately if you'd like. (Would you want to make an immutable
> branch for other subsystems to pick the 1-liner up? Or just apply such
> patches to your tree, as it seems the IIO maintainer was probably OK
> with that?)

Either of the above is workable in principle, depending on how the
cards will fall.

If need be, I can create an immutable branch.

