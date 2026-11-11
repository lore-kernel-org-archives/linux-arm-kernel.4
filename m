Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49B0606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 03:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aQoDUkoE;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=i+KNvf9p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yP3MUaap2UdxY9ATROO5FfQ5a2wglkeLGxDqt0I3imo=; b=aQoDUkoELV45rKlRk9YCZ8tJIe
	RQ72JBlnAF93kaOaqRQkZVTEPFOHN8w/BGFXdOntxN4ABzybaj/w3lOdaBfsn0OkpSg/qEntHg7X3
	sHeeK37uf4U3wE2IVtNJVYOJjpK6llXSMwb4Z9tv0widPblej5b+KSIH/wx+k7WPvMkqAFG73X1mt
	iXBDkm50xi1MPmvMGphPs54bptN5SE1kfjlJWBlj2mo/U78bUN+g0ab5AUUTyuIPS516Kkj0wjgz+
	kcPOuw+Yq6+ceFSf24mPWXs0LT1e8nEwoBMc693S4GvR/fJCi2RED0+l7YJV5DPSO6msVD5TY8mPt
	ZN1y/2tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzJg-00000005Zxf-1UX5;
	Wed, 11 Nov 2026 03:48:08 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzJd-00000005ZxC-2yy3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 03:48:07 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-9440304604aso290500085a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 19:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794368884; x=1794973684; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yP3MUaap2UdxY9ATROO5FfQ5a2wglkeLGxDqt0I3imo=;
        b=i+KNvf9pdTQui8YElZah2mgzdPEJO1AUMG750thruT/kq3Q2sPX9HIalRzCp6XWlpV
         Ox/nU3K+ZdpuF41qfIGGEsTFw+3HfV4NpIJHk39BKeG99bPHF2qZDDM+HKbgzPYkwwqV
         pu2cQ5x0pDIMmOEQphTx1ce5G/Al3GwVgpOr0eas9t+Z6EtRx9CV04fVL6Jgw/y3P4xT
         kjfdjZSCv6eh+haR8JF0PjhN3d9GtAvKj4JTgiKYL3KCY0uTvVOTjtZ5r3RxxzqtAgkm
         OlZ14EbNTNnTnBsUY62VCEURW1wvT63toCmDEu1Uo00DohpzBcjYTVnkERpSNFkYCTXg
         lAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368884; x=1794973684;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yP3MUaap2UdxY9ATROO5FfQ5a2wglkeLGxDqt0I3imo=;
        b=SeMhto43kafFvXw4Bsa2GQWjYn31NgP1VkTlge04DcmoBeCb0Va9hqkouUYNq0b5yX
         ytMiXZDftW9OWhMB2z1X3koUT134yu1mtNH9yIBwS5XwbKd9KslvIy1VSStH3DGvgWXb
         ek1DW5EjvQA7zujV7pgiI4qG5nv4PGgxYo+6OI3wBYh1qdIebeGyu7ADH1NKtHuI+1Jq
         ma5MsOOB9ZgiNJiAscov//XZcONWvfBdR1sYs4YLg3+VXhj0JiUJnrh9u6dWeQePKGwx
         0OAIPoGs9KhG2tYQhOWva8STPUNbxCN1RYjKdTqgtALGcPqQWGktQgh/AHsHSiU3pIF9
         QA0w==
X-Forwarded-Encrypted: i=1; AL+hErF6OIlKm8hxgH2CVAUTtBw14MEPJPGbW1nDKam65J2WbRZXwPJO509OITBrAjT/IITNPw+3cFg1RkyWjaov8NNn@lists.infradead.org
X-Gm-Message-State: APuU4Z/57ugeX++y185Yg7ScssFvII/bZ2oNJpdcLNUqtiM1+Laz4O8E
	4d6fTUQAedjHouGVNhXJcMnkbvERr2P9kQp8xHaHzoTxwaycq5w2lht/+oQ/P+3PSw==
X-Gm-Gg: AYBFou3Zgmr5gCzZdz3rCbZMJIDBx5hD0Vn1SnwoisDjvHowF0QHq/s5W3Bhq3qer4/
	tsMUOJzBynTZhy72jq9LYDlocbLQ3J9NkpNnhrsSxTCUnqEJf4pPTm6tdn2Tiyt1LI3Grj2RKi4
	io8t9Mdyj9kmJRYeW3I6z0PNJRIz+rs7tYyleezCi0v+1yYUSv7tzlWq0scRMJpvFBZ8ztG0igv
	lq4kNM/G57X2WkLvKINDtRgw1jYToZcaYrP9QVuWxGLfpVtY4P5E4Igt/lV5cLLv0Qvm0Zf7oeI
	O37P00gbZ72g2hIlDRh45TYWwXXZH4wWAeDzRRSz7fZ69+HVuJ5dw6n2L6b48AMrjP1i70NM7Q9
	lugaxnZCJDUKKE+ZI2o0uPAV4tvKJcYvJuKxR8/UYi46lHIXGWzs7qrBlT9x1i+pXxI3HC/6803
	EjCmHCNVFdHrGX6w7PAM+r+SsYfSg1QaJkK0DtgzjNnFkehlyEBQ7C92MsF0Jjf12RAAKsvSNsF
	+5mWj+uItYUVPkMoMxnjaKjEkaY74tYX9gGumn1gSGmcE799+JvMC4T2SxzxH4vTvPGaehWkvxv
	jHvnE7+6mGhnexr0Lclomyyiv0K9Lg==
X-Received: by 2002:a05:620a:710c:b0:93e:5677:317b with SMTP id af79cd13be357-947ae870df7mr271298485a.25.1794368883684;
        Tue, 10 Nov 2026 19:48:03 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::d355])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e9b4bsm385166085a.39.2026.11.10.19.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:48:03 -0800 (PST)
Date: Tue, 10 Nov 2026 22:47:59 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Brian Norris <briannorris@chromium.org>
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
Message-ID: <2c3bda2b-ccc3-4430-8e09-81b25f6fcda7@rowland.harvard.edu>
References: <20261103221717.3840215-1-briannorris@chromium.org>
 <20261103141442.v2.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
 <CAJZ5v0jWCz0XDgzeETbmMfGOmvh2G9qcx7xLODrpQ9NiwsddKA@mail.gmail.com>
 <auuICAm4BC_8Pzs5@google.com>
 <CAJZ5v0jTX1FgeS9FCV=+V4uacSgLQBVsSPnU27ybgUGg57GUOA@mail.gmail.com>
 <auzlLwlleGLPsLcw@google.com>
 <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>
 <au0oKFb9CmNzc6Cg@google.com>
 <CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDNbp+eQ0S-E52DETWjQ@mail.gmail.com>
 <avOw_4ZkqtKFHu1B@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avOw_4ZkqtKFHu1B@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_194806_122829_915C3F22 
X-CRM114-Status: GOOD (  38.55  )
X-Spam-Score: -2.0 (--)
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

On Tue, Nov 10, 2026 at 04:04:15PM -0800, Brian Norris wrote:
> (+CC Alan, since he wrote much of the autosuspend stuff, but also
> because he might(?) have better context for some of the .runtime_idle()
> + pm_runtime_mark_last_busy() questions)

I'm coming into this discussion in the middle, so I probably don't have 
a good picture of all the issues you've been talking about.  From what I 
gather, it sounds like this is mostly a question of how long a parent 
device should delay autosuspending after all its children go into 
runtime suspend.  Is that right?

The idea behind autosuspend was simple enough: Try to optimize energy 
usage by putting a device into runtime suspend only when it seems likely 
that the device will remain suspended for more than a brief period of 
time -- long enough to make the extra work of suspending and resuming 
worthwhile.  In principle the driver core could collect statistics for 
each device about how long it remains resumed and suspended, but the 
benefits of such a detailed analysis didn't seem worth the effort.  And 
given that drivers know more about how their devices will tend to behave 
than the core does, it made sense to let drivers determine the best 
autosuspend delay time for each device individually.

In theory, a driver or bus type might want to have differing delay 
values for the time after all children are suspended vs. the time after 
the device had some other work to do (not related to its children).  How 
much of an advantage would that yield?  I don't know, but I felt that it 
wasn't large enough to put support for it into the first implementation 
of autosuspend.

So yes, in the current scheme a parent's inactivity period doesn't start 
until all its children are suspended (unless the ignore_children flag is 
set, but never mind that now).  The parent's autosuspend delay therefore 
should take into account the expected time before one of the children 
may have to be resumed, as well as the expected time before the parent 
itself may be asked to do something that doesn't involve any children.
(Note that if a device has more than one child, the expected time before 
any of its children will be resumed can be different from the expected 
time before any single particular child will be resumed.)

The simplest way to carry this out is to do pm_runtime_mark_last_busy() 
whenever a child suspends.  But other approaches to the same goal are 
conceivable.

Of course it's not possible to determine an "ideal" autosuspend delay 
time.  In fact, I suspect that in most cases we aren't even close.  But 
I think doing it this way is still better than anything else that isn't 
a lot more complex.

> I don't think we should be treating current autosuspend delays for
> parent devices as meaningful at all, per the above. So I think this is a
> chance to try to improve the architecture so it makes sense, and then
> figure out if any existing delays should be tuned/reduced.
> 
> Ideally, yes, we can avoid making significant system power changes to
> the negative, but I don't think that we should prioritize that above all
> else, as long as it's *possible* to tune the autosuspend delays in a way
> that makes sense.

Of course it's possible to tune the autosuspend delays.  That's what 
/sys/.../power/autosuspend_delay_ms is for.  Whether it's possible to do 
so in a way that makes sense will depend very heavily on the type of 
device in question and the way the system is used.  One possible 
approach might be to have a userspace daemon that tracks all runtime PM 
transitions and tries to do some sort of dynamic tuning.  How well would 
that work?  I don't know, but it would be a good research project for 
somebody.

> Side note: I think .runtime_idle() should be removed. As far as I can
> tell, it's only used for working around architectural problems in
> runtime PM (like $subject), or for implementing autosuspend without
> actually using autosuspend (usually because they predated autosuspend).

I have never given much thought to runtime_idle().  When we were doing 
the initial implementation of runtime PM I didn't see any use for it, 
but Rafael was quite certain that it had its place and the issue wasn't 
important enough to argue about.  I wouldn't mind a bit if it were 
eliminated, but I also don't really mind the extra overhead of the idle 
callback pointers and support routines.

> At the same time, it makes it harder to reason about the runtime PM API
> surface -- because currently, .runtime_idle() is a primary reason that
> pm_runtime_put() and pm_runtime_put_autosuspend() are different.

I wouldn't put it that way.  My feeling is that pm_runtime_put() could 
be replaced by pm_runtime_put_autosuspend(), since they should behave 
identically for devices that don't use autosuspend.  (If there are any 
devices that _do_ use autosuspend and also use pm_runtime_put() -- well, 
I'd say that sounds like either a design error or a simple oversight.)  
The reason for having two different routines is mainly historical: 
pm_runtime_put_autosuspend() was added some time after pm_runtime_put() 
and we didn't want to mess up the existing callers.  Maybe this 
judgement was a mistake.

> "Last PM reference" can be a bit subtle; particularly, the child only
> drops a reference on its parent once it *completes* autosuspend (even if
> it was last "busy" much earlier). That means autosuspend delays become
> additive along the hierarchy. Is that desirable?

That's up to the maintainers of the device and its bus subsystem.  They 
can arrange the default autosuspend delays any way they like, taking the 
children's autosuspend delays into account if they want -- and the user 
can always override the defaults.  But one thing that does _not_ make 
sense would be to have non-additive delays where a parent's delay is 
shorter than its child's.

Your email was fairly long, and I have touched on only a few of the 
issues it brought up.  Is there anything significant you still want to 
discuss?

Alan Stern

