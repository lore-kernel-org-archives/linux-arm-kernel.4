Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725C0606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 00:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QeJXWaTY;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OMxrAGXM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AvOYiSMUQBE8hHq85U7RnqlX2B8KEnkOUGs6NK6p6bU=; b=QeJXWaTYe+q705Dd8RGXiGC57K
	cZNg7R64bj0+VUvfJNHzxqA2iIH8yUx+RIpX89HHcH2xrkO+RjvIEdgSKdm/dEmLM1lf9WjWBihaB
	ypZpPUEvPBgo7yAevjuklpxxIFxa/9/q1zVpNHtNMcy/4WAjdhspvfQKP4tdCt5V+jrbV2tSiKJp3
	bLHJHNU0a7QD5B3F8dx0FMk6TaGVrTnT4dzHciF54/KUfD3RX8onUsS73zXLXhqh+uiOxGdYYLIiW
	sF3r6DRcjjN9sh2AirBvysBU1Au27gnUGmQZkjY9tJ8n+LHlmd4mIWUQnDDJRs+NLANhn5gvWl0eQ
	rfDOk0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIbj-00000008EMu-0hpm;
	Thu, 12 Nov 2026 00:24:03 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIbg-00000008EMD-2XiC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 00:24:02 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so1720583c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 16:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794443039; x=1795047839; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AvOYiSMUQBE8hHq85U7RnqlX2B8KEnkOUGs6NK6p6bU=;
        b=OMxrAGXMjsB6v11OHXKG/fR5LExnBVsgoyCwpLhUXTSzU348bl7sQpV1p0hjvGO9zQ
         We6vx+3q5PGwPj/wruY8I5vezGVmwHIjZXD1MeAchLXCiXLy7v83xq2ax8vXJuFedsm1
         31IeqcZdSmq3AmaZ5btcCfSuDrSAJhlGXWIgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794443039; x=1795047839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvOYiSMUQBE8hHq85U7RnqlX2B8KEnkOUGs6NK6p6bU=;
        b=Mm+5bwDsOLs8hB2woUHwrt17Vl7SvcDi/r5Mjzhg8T/e+EqkYhxSai3OUumOKyhPIH
         9f8BIEolJej4UaQXCl/X2pGA1s3bEMhKX0hL7lkcWcgaoZGSyKPKNHdu6yAXvp6BFsJW
         nG12Ofmx6OkPWuBbpZXMy1nVnOy8i/HRIiHv4cfepSdVBmozpf4nihg6Od1Bh3i8ICui
         wev6My7gxYYoo8/vWeHQH9j2o7Y6WB9ur/XXOqX08l+CVUjBcVqc7P84H1YAn7JP6HvL
         NSYvXMG3SZZRcuY1Lb6Lln+OsqO5MCwMnINBZ+osrd44YMe8w2WM+7TpDFWBOhpvgMlZ
         ljog==
X-Forwarded-Encrypted: i=1; AL+hErGVE7ZhjbgpM7ZeapbCcR4aUZ77SGIvQKZedIztFjz2hh27GbhYVozXOhtOrQGKl8i7rXVIi3n/VXDjFZfKA+c7@lists.infradead.org
X-Gm-Message-State: APuU4Z94GqB5CyKedJoIgyI1HgQ5amncJzSaGTpvwVgSqj8WQEbph4Ec
	sjWQtagVK47Fb628n2IKYUc6Oc2zrI/PP5jVIXISRKV/oa2xpEPut6CCCyqfGLS1lA==
X-Gm-Gg: AYBFou0S6Gl8xNY1M6MNmeCeH+CIUCGSlM2Jp40X8IDMxF2eIkjcvMwdKoqV5epznqh
	tDzy5GEJUwPejvd7qY08toKI+cr3l+wFr9xkFeHHpgkRaSvxXv71b53NpPu63ok6ZrcHD+eQHEX
	l3ejrSRr3nAIq8fZeZE8BB4XLgO3iqxFGbyYzArPPUhXSJ01LH/SEjGH5tWoYgR1nXpqg+buR7m
	cU0j3USFgc2iALWIheIX8mtrw45fDffAAqMvZEiI25Q4eO6HS32ZugzqQnWHITSNE36qxFaYaIG
	FA5nuGAeSC98sSLpD5eruAyAO/fvFEqCjhVk6eQV59F9sHSTgRGadA5fiuvRnOWS8+7JYaKcWc0
	On1+idzCeFHDgASiU8EJiqRSmHueh5QVDcQYz663D31UiZWZxiCM8AOQDQl9T3e9+WC5U8htSwC
	xx3xqQFu0zj5qsyj4cmpbdp3aBPGbR7boOofbHzYR8ZWG+zZqGQAjbLihEGwrLicN0Iujhd+yEY
	IYy96l3Eh6GHzBuR2txDk6jKZNmqYHWMJAJ6VdHx/Tdu+8c9USOSxvO/bwoikt2n5qLAee2seJh
	ADIIkkfP12uz1K87Iz9RssTakRwN0/Azh9LAIdt6TPBIzjgVLrScnIKBO0lagqF4sEzLeQ==
X-Received: by 2002:a05:7022:1711:b0:1a3:65d7:efae with SMTP id a92af1059eb24-1b3c03185acmr3161801c88.21.1794443039027;
        Wed, 11 Nov 2026 16:23:59 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:5446:563c:ac92:43a8])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b3b5890c0esm19834613c88.1.2026.11.11.16.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 16:23:57 -0800 (PST)
Date: Wed, 11 Nov 2026 16:23:55 -0800
From: Brian Norris <briannorris@chromium.org>
To: Alan Stern <stern@rowland.harvard.edu>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent
 to dependency
Message-ID: <avUHG8mLuTOUMr8O@google.com>
References: <auuICAm4BC_8Pzs5@google.com>
 <CAJZ5v0jTX1FgeS9FCV=+V4uacSgLQBVsSPnU27ybgUGg57GUOA@mail.gmail.com>
 <auzlLwlleGLPsLcw@google.com>
 <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>
 <au0oKFb9CmNzc6Cg@google.com>
 <CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDNbp+eQ0S-E52DETWjQ@mail.gmail.com>
 <avOw_4ZkqtKFHu1B@google.com>
 <2c3bda2b-ccc3-4430-8e09-81b25f6fcda7@rowland.harvard.edu>
 <avSa97F1Nu1LTSCA@google.com>
 <fc43eb13-816b-4cd0-9711-848fdab605ef@rowland.harvard.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc43eb13-816b-4cd0-9711-848fdab605ef@rowland.harvard.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_162400_711940_DDA956BE 
X-CRM114-Status: GOOD (  58.58  )
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

Hi Alan,

On Wed, Nov 11, 2026 at 03:20:16PM -0500, Alan Stern wrote:
> On Wed, Nov 11, 2026 at 08:42:31AM -0800, Brian Norris wrote:
> > Hi Alan,
> > 
> > On Tue, Nov 10, 2026 at 10:47:59PM -0500, Alan Stern wrote:
> > > So yes, in the current scheme a parent's inactivity period doesn't start 
> > > until all its children are suspended (unless the ignore_children flag is 
> > > set, but never mind that now).
> > 
> > But to be clear, that's not actually how runtime PM works today. It only
> > works this way for the very small handful of drivers where the parent
> > calls pm_runtime_mark_last_busy() in .runtime_idle(). I think several
> > people have acknolwedged that this is a bit of a hack, or at least a
> > missing feature in runtime PM, and probably should be extended more
> > widely.
> 
> I have to agree; it seems like something we missed.  But then, I've 
> always had something of a blind spot for pm_runtime_idle().  In fact, my 
> overall impression has been that in practice, drivers relying on 
> pm_runtime_idle() for anything nontrivial would be more or less mutually 
> exclusive with drivers relying on autosuspend.

I also had that impression. But of the approx 60 drivers that implement
runtime_idle, there are at least 4 GPU drivers: nouveau, radeon, xe_pci
and amdgpu (I'm sure they all copied each other to some extent). There's
also some greybus, drivers/misc/mei/gsc-me.c, and a handful of others.

I suppose you can determine for yourself what's "nontrivial"; and in
many cases, they re-implement many of the same idle checks inside their
runtime_suspend(), so it doesn't matter too much.

> But of course, 
> maintainers are free to do whatever they want.
> 
> > > The parent's autosuspend delay therefore 
> > > should take into account the expected time before one of the children 
> > > may have to be resumed, as well as the expected time before the parent 
> > > itself may be asked to do something that doesn't involve any children.
> > > (Note that if a device has more than one child, the expected time before 
> > > any of its children will be resumed can be different from the expected 
> > > time before any single particular child will be resumed.)
> > 
> > "Expected time before a child may have to resume": isn't that child
> > last_busy + child delay?
> 
> No; that value is the expected time before the child may be 
> autosuspended.  Not to mention that you're mixing up clock times 
> (last_busy) with time intervals (time before).
> 
> >  So that expected time is already in the past by
> > the time the child autosuspends.
> 
> You must have misunderstood what I wrote.  Think of it this way: Let's 
> say the last remaining active child goes into runtime suspend at time T.  
> Let's also say that the parent expects none of the children will need to 
> resume until time T + D.  Is D sufficiently large to make it worthwhile 
> for the parent to suspend and then resume?  If not, the parent should 
> remain active.  If yes, the parent should autosuspend -- and the length 
> of time the parent should wait before autosuspending is on the order of 
> the value of D (let's call it D*) that corresponds to this crossover 
> point.  Thus the parent's autosuspend delay should be set to D*, or 
> something close to it, in order to achieve both objectives.

OK, thanks for explaining again.

I suppose that makes sense, and so Rafael's
rpm_idle()-implies-mark_last_busy() proposal makes sense.

> > My point here was that I think Rafael was overly concerned about
> > precisely tuning parent autosuspend delays at the same time as changing
> > the runtime PM core behavior. Yes, they clearly can be tuned in user
> > space; but he was suggesting a phase-in / opt-in approach to this
> > change, because it might harm system power if it's not re-tuned.
> 
> Is anybody really trying to tune precisely parent autosuspend delays?  
> On what basis?  I'm doubtful that anyone is sufficiently serious about 
> it to be annoyed at this PM core change (i.e., setting last_busy when a 
> child suspends).

I fully agree with you, which is why I don't see why we should make
Rafael's proposal conditional. We should just make the change, IMO.

> > > > At the same time, it makes it harder to reason about the runtime PM API
> > > > surface -- because currently, .runtime_idle() is a primary reason that
> > > > pm_runtime_put() and pm_runtime_put_autosuspend() are different.
> > > 
> > > I wouldn't put it that way.  My feeling is that pm_runtime_put() could 
> > > be replaced by pm_runtime_put_autosuspend(), since they should behave 
> > > identically for devices that don't use autosuspend.
> > 
> > Ah, but that's not actually true! pm_runtime_put_autosuspend() skips
> > .runtime_idle(). It (semi)directly calls rpm_suspend().
> 
> Like I said above, a blind spot regarding pm_runtime_idle().  And/or an 
> impression that a driver might want to use pm_runtime_idle() or 
> autosuspend but not both.
> 
> Anyway, pm_runtime_put_autosuspend() could easily be modified to call 
> pm_runtime_idle() before rpm_suspend() if the device doesn't use 
> autosuspend.  That's not likely to bother anybody.

Sure.

One way or another, I'd like to eliminate the differences. And I'd
prefer doing so by removal, rather than addition, if possible. TBD how
it ends up looking, after the current topic.

> > I appreciate all the responses. One particular part I did have questions
> > on, which I'll mostly copy/paste:
> > 
> > [Rafael:]
> > > Now, let me acknowledge that some drivers evidently want rpm_idle() to
> > > always set the autosuspend timer instead of suspending the device
> > > right away.  That may be because of the "unwanted parent suspends"
> > > problem at hand or for other reasons.
> > 
> > Do we have any idea what the "other reasons" could be? For example,
> > because driver writers found it too difficult to find all the
> > appropriate places to call pm_runtime_mark_last_busy()? (Does commit
> > b3db492e8335 ("PM: runtime: Mark last busy stamp in
> > pm_runtime_put_autosuspend()") help? Or should pm_runtime_put() behave
> > similarly?)
> 
> I have no idea.  Outside the area where I mainly work, I don't know what 
> sorts of things driver writers are doing.  If you know any people who 
> are doing this, you should ask them directly.

There's so much ancient history and copy/paste that it's a bit hard for
me to find out who's doing this for what reasons, outside of nicely
documented changes like commit c537d3457542 ("iio: adc: stm32-adc: fix
runtime autosuspend delay when slow polling").

> > I see that USB is one of the subsystems where .runtime_idle() calls
> > pm_runtime_mark_last_busy(), and I thought you (Alan) might have some
> > more background on that.
> 
> I don't remember exactly why that was done, but probably it was meant to 
> carry out the behavior we've been discussing (autosuspend delay should 
> start when the device and all its children become idle).

OK, thanks for your thoughts. In any case, maybe it doesn't matter why,
if we're simply going to move that behavior into the runtime PM core
as-is.

I'll give this some time in case Rafael had any other thoughts/replies,
but unless something major changes, I'll plan to write/test/submit v3
where rpm_idle() calls pm_runtime_mark_last_busy() (part of Rafael's
proposal), and *not* make it conditional (i.e., no
pm_runtime_use_autosuspend_always()).

(Or, Rafael is free to do so, since it's his idea. Just let me know so I
don't waste my time on it. But I figure he'd rather someone else do the
work.)

Regards,
Brian

