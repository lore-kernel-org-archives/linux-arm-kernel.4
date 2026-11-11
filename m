Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA0C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xzwiqiht;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cZ/TsP3z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j26EAR/dzc2upvRIQcmRb74iTI2baBkwNia6YMWLcb0=; b=xzwiqihtaKpskhdJ2vkp1f9T0m
	rCbOURh+vNvFBQbh24BanspgLtYlooI/YzgafDdMA6DKlcscOegag/pB0cFYYUb/hdT3cWyKn43sr
	4tsoUazphJAnBUohmRg4EtaRDqS6SNqYSJGxKomrHpiTe8TC7arUgjmRjXGEzveWuFUJWSh1xDC3d
	UI7F5HbkwSngVUf6w4snr2JCXjyDX0idnuZQC80HROGyA3JSCxCGe/MBQBpgY0vViulpw4iH9WceS
	BJgWsNF/qW70L2mf1vDTmTQteR9Ax+d0VyI6iScBCiRn2GRU36n0GYfluxkEYUBujuxjSYW29H+3I
	bnEhJ1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBPF-00000007Dk7-0O0f;
	Wed, 11 Nov 2026 16:42:41 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBP9-00000007Dje-1V5K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:42:40 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36dbde64409so6866457eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794415354; x=1795020154; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j26EAR/dzc2upvRIQcmRb74iTI2baBkwNia6YMWLcb0=;
        b=cZ/TsP3zsQ/kdW1+nfVEMnQ9+azKyNsinULDCOGbRJTAFij6OrIdmbbpStPvodT7Zx
         b5OhlMAScutsWMxLhNlNJYJkHMTtx+4qT9lPVhC2+U3tN/WQcP93TT9P7tNW211N3vgc
         Z0dE66FhZHRyIfWtx2ydamF9Sv5EBMcCAgF6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415354; x=1795020154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j26EAR/dzc2upvRIQcmRb74iTI2baBkwNia6YMWLcb0=;
        b=yXCRYjjojKB9O9sj7rXTiflG47RPCA89MrEV5V37sgmsAN26/ChZlL6VhfpopGF4yw
         icbmNidDhxQKy25oqRdIfOe5iknoL1SxhDlDZSmo1h4D9xOnPwNz1KydZF2PKAvALcKG
         kt0UcZzo34/84yEqYo7oG60oGo7mefVzh1J0O4KFQ2Nr44UGP0d718RIZyElrr7jgvml
         HFIayyMmIHFls+SpDw+6b/CelV4WPX6//COMs/5COR3WpQP8+Ip4DNuLSBQ0Vdd2V5BG
         DXB6A+/GpU65ZiLkF4FusVYZ4IfWVe2oJ9QLdnS2aRr/6NV0bst7YxD2o1cU7X1QI2Rp
         OIuA==
X-Forwarded-Encrypted: i=1; AL+hErEP6cLnlhkEX8bHcnkND1Vh8pHLWccL+GARKo53eHRBWEjHDjNUvcqnQ921yKXEuvWS4Jp2wkiGsG2+pbSMxX6d@lists.infradead.org
X-Gm-Message-State: APuU4Z+IWQKL4F0/7HKixUDw/DkEnPvza3FmqG6qe4PsolsWvlFi+9e/
	L080bj3niGNU2M64gZbF1lWeValy33Q7DRulS8CYjWTMJMclQ7enqdOoRKZ7L2AAsg==
X-Gm-Gg: AYBFou3xB4Hzfg2QjKi/QisNleLpoebBbyPHqMmNTFNCA8expLXRAsgQklMpvuGGbfJ
	8rmHnyJkrWoC4jP7ZUpxGQtmNrU9JUFEJHmDjP7UGaPO2BhMX0ni9DVgshnGZNRBEo+9vF/nDQR
	mtpqkFqwzPYSBKmlmCAT2vk/s6bsJx8e/FPQgVSf2fPFolWOWeHLcTa02fxX7SHBOD8Ajav+XRs
	/z6cJbiBm9cIDNYujqWAylSyUJ0Iyw2H5gTmmF1824yJJFUCisQAihJF6yoWy1lloY8MRk1XIxd
	9QkLV3dNgPOMAPJKTTz94T1/zgQrOIMLGDiLYp7JqM1ds28L24hoTALpUx3yQAZqPygudcdpiAB
	YCNIuDfTT1jCv/7REz3If4ki78l2i2zwHE4+HwEVGi7n/OUcnsJHjBr22amhOSs9/ewHmqpBZaA
	5cBUd2HEKe6pgMxs6q6LJiMgF+vyenvL9dD//efvQpCdhLymeO5ohnCpmIB+gStmnx4mnMa82WP
	YXYMfd7ghC57mpk5jRH+WGHE5oEOhR01oSKaElS85kNJlAc98I0JoxN6sToj5sQucuG1F/DdTHY
	WtU7nstOSwCfuPafA3tqAarYs6ExFvHAdSvSXD2Q7colgF+cH2kmD/ihdctriaTxE5g=
X-Received: by 2002:a05:693c:40c7:b0:36a:15ee:c20e with SMTP id 5a478bee46e88-37686755924mr3880718eec.33.1794415353952;
        Wed, 11 Nov 2026 08:42:33 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:1fca:3f2:2d78:dd60])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-37520cfe07dsm18544278eec.20.2026.11.11.08.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 08:42:33 -0800 (PST)
Date: Wed, 11 Nov 2026 08:42:31 -0800
From: Brian Norris <briannorris@chromium.org>
To: Alan Stern <stern@rowland.harvard.edu>
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
Message-ID: <avSa97F1Nu1LTSCA@google.com>
References: <20261103141442.v2.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
 <CAJZ5v0jWCz0XDgzeETbmMfGOmvh2G9qcx7xLODrpQ9NiwsddKA@mail.gmail.com>
 <auuICAm4BC_8Pzs5@google.com>
 <CAJZ5v0jTX1FgeS9FCV=+V4uacSgLQBVsSPnU27ybgUGg57GUOA@mail.gmail.com>
 <auzlLwlleGLPsLcw@google.com>
 <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>
 <au0oKFb9CmNzc6Cg@google.com>
 <CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDNbp+eQ0S-E52DETWjQ@mail.gmail.com>
 <avOw_4ZkqtKFHu1B@google.com>
 <2c3bda2b-ccc3-4430-8e09-81b25f6fcda7@rowland.harvard.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c3bda2b-ccc3-4430-8e09-81b25f6fcda7@rowland.harvard.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_084235_453866_B2C5C67C 
X-CRM114-Status: GOOD (  65.38  )
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

On Tue, Nov 10, 2026 at 10:47:59PM -0500, Alan Stern wrote:
> On Tue, Nov 10, 2026 at 04:04:15PM -0800, Brian Norris wrote:
> > (+CC Alan, since he wrote much of the autosuspend stuff, but also
> > because he might(?) have better context for some of the .runtime_idle()
> > + pm_runtime_mark_last_busy() questions)
> 
> I'm coming into this discussion in the middle, so I probably don't have 
> a good picture of all the issues you've been talking about.  From what I 
> gather, it sounds like this is mostly a question of how long a parent 
> device should delay autosuspending after all its children go into 
> runtime suspend.  Is that right?

How long, and when should the inactivity timer start. (The latter more
than the former, really.)

> The idea behind autosuspend was simple enough: Try to optimize energy 
> usage by putting a device into runtime suspend only when it seems likely 
> that the device will remain suspended for more than a brief period of 
> time -- long enough to make the extra work of suspending and resuming 
> worthwhile.  In principle the driver core could collect statistics for 
> each device about how long it remains resumed and suspended, but the 
> benefits of such a detailed analysis didn't seem worth the effort.  And 
> given that drivers know more about how their devices will tend to behave 
> than the core does, it made sense to let drivers determine the best 
> autosuspend delay time for each device individually.
> 
> In theory, a driver or bus type might want to have differing delay 
> values for the time after all children are suspended vs. the time after 
> the device had some other work to do (not related to its children).  How 
> much of an advantage would that yield?  I don't know, but I felt that it 
> wasn't large enough to put support for it into the first implementation 
> of autosuspend.

Right, I don't think anybody is asking for this right now. We're just
trying to clean up the corners on how the existing timer works.

> So yes, in the current scheme a parent's inactivity period doesn't start 
> until all its children are suspended (unless the ignore_children flag is 
> set, but never mind that now).

But to be clear, that's not actually how runtime PM works today. It only
works this way for the very small handful of drivers where the parent
calls pm_runtime_mark_last_busy() in .runtime_idle(). I think several
people have acknolwedged that this is a bit of a hack, or at least a
missing feature in runtime PM, and probably should be extended more
widely.

> The parent's autosuspend delay therefore 
> should take into account the expected time before one of the children 
> may have to be resumed, as well as the expected time before the parent 
> itself may be asked to do something that doesn't involve any children.
> (Note that if a device has more than one child, the expected time before 
> any of its children will be resumed can be different from the expected 
> time before any single particular child will be resumed.)

"Expected time before a child may have to resume": isn't that child
last_busy + child delay? So that expected time is already in the past by
the time the child autosuspends.

But:

> The simplest way to carry this out is to do pm_runtime_mark_last_busy() 
> whenever a child suspends.  But other approaches to the same goal are 
> conceivable.

Yes, I agree it's simple. Maybe the distinction I'm making doesn't
matter that much.

> Of course it's not possible to determine an "ideal" autosuspend delay 
> time.  In fact, I suspect that in most cases we aren't even close.  But 
> I think doing it this way is still better than anything else that isn't 
> a lot more complex.

Ack.

> > I don't think we should be treating current autosuspend delays for
> > parent devices as meaningful at all, per the above. So I think this is a
> > chance to try to improve the architecture so it makes sense, and then
> > figure out if any existing delays should be tuned/reduced.
> > 
> > Ideally, yes, we can avoid making significant system power changes to
> > the negative, but I don't think that we should prioritize that above all
> > else, as long as it's *possible* to tune the autosuspend delays in a way
> > that makes sense.
> 
> Of course it's possible to tune the autosuspend delays.  That's what 
> /sys/.../power/autosuspend_delay_ms is for.  Whether it's possible to do 
> so in a way that makes sense will depend very heavily on the type of 
> device in question and the way the system is used.  One possible 
> approach might be to have a userspace daemon that tracks all runtime PM 
> transitions and tries to do some sort of dynamic tuning.  How well would 
> that work?  I don't know, but it would be a good research project for 
> somebody.

My point here was that I think Rafael was overly concerned about
precisely tuning parent autosuspend delays at the same time as changing
the runtime PM core behavior. Yes, they clearly can be tuned in user
space; but he was suggesting a phase-in / opt-in approach to this
change, because it might harm system power if it's not re-tuned.

> > Side note: I think .runtime_idle() should be removed. As far as I can
> > tell, it's only used for working around architectural problems in
> > runtime PM (like $subject), or for implementing autosuspend without
> > actually using autosuspend (usually because they predated autosuspend).
> 
> I have never given much thought to runtime_idle().  When we were doing 
> the initial implementation of runtime PM I didn't see any use for it, 
> but Rafael was quite certain that it had its place and the issue wasn't 
> important enough to argue about.  I wouldn't mind a bit if it were 
> eliminated, but I also don't really mind the extra overhead of the idle 
> callback pointers and support routines.

The overhead isn't my concern. The mental overhead is. There are several
rough edges that would be smoother without it, IMO.

> > At the same time, it makes it harder to reason about the runtime PM API
> > surface -- because currently, .runtime_idle() is a primary reason that
> > pm_runtime_put() and pm_runtime_put_autosuspend() are different.
> 
> I wouldn't put it that way.  My feeling is that pm_runtime_put() could 
> be replaced by pm_runtime_put_autosuspend(), since they should behave 
> identically for devices that don't use autosuspend.

Ah, but that's not actually true! pm_runtime_put_autosuspend() skips
.runtime_idle(). It (semi)directly calls rpm_suspend().

> (If there are any 
> devices that _do_ use autosuspend and also use pm_runtime_put() -- well, 
> I'd say that sounds like either a design error or a simple oversight.)  
> The reason for having two different routines is mainly historical: 
> pm_runtime_put_autosuspend() was added some time after pm_runtime_put() 
> and we didn't want to mess up the existing callers.  Maybe this 
> judgement was a mistake.
> 
> > "Last PM reference" can be a bit subtle; particularly, the child only
> > drops a reference on its parent once it *completes* autosuspend (even if
> > it was last "busy" much earlier). That means autosuspend delays become
> > additive along the hierarchy. Is that desirable?
> 
> That's up to the maintainers of the device and its bus subsystem.  They 
> can arrange the default autosuspend delays any way they like, taking the 
> children's autosuspend delays into account if they want -- and the user 
> can always override the defaults.  But one thing that does _not_ make 
> sense would be to have non-additive delays where a parent's delay is 
> shorter than its child's.
> 
> Your email was fairly long, and I have touched on only a few of the 
> issues it brought up.  Is there anything significant you still want to 
> discuss?

I appreciate all the responses. One particular part I did have questions
on, which I'll mostly copy/paste:

[Rafael:]
> Now, let me acknowledge that some drivers evidently want rpm_idle() to
> always set the autosuspend timer instead of suspending the device
> right away.  That may be because of the "unwanted parent suspends"
> problem at hand or for other reasons.

Do we have any idea what the "other reasons" could be? For example,
because driver writers found it too difficult to find all the
appropriate places to call pm_runtime_mark_last_busy()? (Does commit
b3db492e8335 ("PM: runtime: Mark last busy stamp in
pm_runtime_put_autosuspend()") help? Or should pm_runtime_put() behave
similarly?)

I see that USB is one of the subsystems where .runtime_idle() calls
pm_runtime_mark_last_busy(), and I thought you (Alan) might have some
more background on that.

Thanks,
Brian

