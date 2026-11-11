Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063DB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 20:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MEAQefz3;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=QuNmykmV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yjMHwJowCgljXYdOuz17suaOhns7jTmqFcuqV1/rikE=; b=MEAQefz3PzjueNn+oEn1m/on/m
	Izr2Lu+S9toexkIsWIqVrralWWvDD32xjyB7qpxB1Z/LeOgmzuEb72uYVa+Ye71A/p3Ft0X+Pp2cD
	9BoKKaGdiYmMPncZrFHlzIJNRQax31h+H9FPjapUAVMzyfh0GPHTjbUtygaCg1SfBLM1g3rs6wW4v
	Rd6tYbgG6PdplR8Uo8Bi9N4X9EpicpCBZt4t0xHUzl28WuFRXn/JLAthCtihm/Sh8USRnBL0uAUIw
	HkBlWKlptcnkh1r8VcxIJmyk9fVcVg7pVfP/zifYoXPHWW6UO8lZPkonbh5ahse76ykSa+ppc6W1+
	RLsuIB/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREny-00000007bqy-0AAz;
	Wed, 11 Nov 2026 20:20:26 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREnu-00000007bqF-2nkp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 20:20:24 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5363c8de563so36466871cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794428421; x=1795033221; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yjMHwJowCgljXYdOuz17suaOhns7jTmqFcuqV1/rikE=;
        b=QuNmykmVg5+Ii1tg4REGIFNs9e8lMRojxqFpE34pVGLuiH6eRMAaqlwAT1q5sVdChA
         /UxJ3aabuEvng9qX/vbJ3YCXm3Xo4ZiVG6Eo9G1HoKFQ1qU/1GP6qfSr1qsm4SNN1Jdg
         szA8T4Ys9r2QqYfz9zOCCS4l5mIMiEfiMKydfGjXI4T+jbUrih64y9IH6hje3SjRJmPR
         BWdFKiCBGoA/o6d04+i404cFqEYZPbq9yyyDH5zvhXpY+3tiPtEaKDwp+y6W/3v45o1o
         Jz0JxE82D2FnPjJOSK5DtOgnKnFjS2iHfWyw2c1KnH+Fo0IzCn3uFhUj0xObMI4CZ5O6
         MJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428421; x=1795033221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjMHwJowCgljXYdOuz17suaOhns7jTmqFcuqV1/rikE=;
        b=ZF9+uYbmtp04/Vbbdn5Vu2aRCr5fxpZYnT+XUHbut7P/vyZJeMEZVAf50GmBz2ch9Q
         /Nlx3RBo96sqa8+f8GV/qRqvtL3nlngtxsNod/ewedXKP7cjj1MO9tEKSJLi26e/7ymq
         5WfZGQqKsRMrmWL6dpZLoo6fvLP9/JWRqj7hEXi63G2Jq7glZy2Q8y/JDnIu5MDBpLqj
         XvB1ZC14oRnrzOftpQdCF7XyoYgJqZvNnriIMViPUvGktTOqdb7xgcQLrUzMqgEKod0L
         VQzkSJlCIoMxAyYmTyxJDUFwzxK8YzglwMuBi2GuyDepf+JnE7YhvpRxHpmYmq/EBVK7
         o2Ng==
X-Forwarded-Encrypted: i=1; AL+hErEScRWVZ9qze/cjhkJV7srNeVpS/xsVi4acsnrH27NJuRm+5Fz3c6c/IaRihuVoYw7YkPx646fM3I4rhD8OZ2Tk@lists.infradead.org
X-Gm-Message-State: APuU4Z9l9M15/VP8H8LRHKWUVfh3Ol1T/xNYrIFIV0QmrbDRYyNTgmVW
	JOvDC8oz+OxL7HJYmWUmdMyihSJ/Ib1XEn2Xc2/HGpqLFGH8N92P4aefEYYUIZa4IA==
X-Gm-Gg: AYBFou25eatSK7GyBdNA1I+aRH5Ii7L5GI1ehJjrW52TAzlNYo3vEkJ1pmO/IflheLu
	iau1SDiGqPj5Khjc98iUMpXcu51Uss2N4kHS2amnOaiEjSO0APG67/GauulP3qpT5FOSWEB8qWb
	VShc2BI8GmV9UP5GwSs0DtZ2AU0bwrL0gCmaLjKJ4tEzzjI5sQYUltKeiu4woYpjh5VckxuZun6
	zeljlo11szCXzDktdbBv7riaZj2cUEX5KTej8Sawx+4dh4TnIEzdOUZnsh3wnoqaIR/X+5VqcoV
	2+13vvTqNaFFkGXEfqWt6HkvBaWVphXnXKkaMO0DkLz8Qyjplf3nJ7QeGJgd7683Wutqq5Hz8v9
	7lRwPZbx2YLqFAsKS5Ul6k0fvvkPUUUrDBCL5mwCNeavqNpD40ze5wo1d46ro88yIlq0CYvI9Jb
	iHTrmAki/weCzPGYPGDEq4xry4APlqH2LSTopFHF1uBNHbdAUTnPT2pQScAQUQNzvYXy9GlHvGh
	H5V5Ev0TE3J5RIPvpmiMXPpghpunW07/8gNTU45SYTvBKAvZNen+naeT0Mrrsxb8fuUX2qgFhMw
	9XkPW+Vq/8fGxhCtj4nRJealwmtDnJM=
X-Received: by 2002:ac8:5713:0:b0:545:c5ec:fa3f with SMTP id d75a77b69052e-556c04f0896mr55320911cf.45.1794428420597;
        Wed, 11 Nov 2026 12:20:20 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::d355])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b93ee00sm57646591cf.16.2026.11.11.12.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:20:19 -0800 (PST)
Date: Wed, 11 Nov 2026 15:20:16 -0500
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
Message-ID: <fc43eb13-816b-4cd0-9711-848fdab605ef@rowland.harvard.edu>
References: <CAJZ5v0jWCz0XDgzeETbmMfGOmvh2G9qcx7xLODrpQ9NiwsddKA@mail.gmail.com>
 <auuICAm4BC_8Pzs5@google.com>
 <CAJZ5v0jTX1FgeS9FCV=+V4uacSgLQBVsSPnU27ybgUGg57GUOA@mail.gmail.com>
 <auzlLwlleGLPsLcw@google.com>
 <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>
 <au0oKFb9CmNzc6Cg@google.com>
 <CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDNbp+eQ0S-E52DETWjQ@mail.gmail.com>
 <avOw_4ZkqtKFHu1B@google.com>
 <2c3bda2b-ccc3-4430-8e09-81b25f6fcda7@rowland.harvard.edu>
 <avSa97F1Nu1LTSCA@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avSa97F1Nu1LTSCA@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_122023_054925_3DB20CD0 
X-CRM114-Status: GOOD (  45.97  )
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

On Wed, Nov 11, 2026 at 08:42:31AM -0800, Brian Norris wrote:
> Hi Alan,
> 
> On Tue, Nov 10, 2026 at 10:47:59PM -0500, Alan Stern wrote:
> > So yes, in the current scheme a parent's inactivity period doesn't start 
> > until all its children are suspended (unless the ignore_children flag is 
> > set, but never mind that now).
> 
> But to be clear, that's not actually how runtime PM works today. It only
> works this way for the very small handful of drivers where the parent
> calls pm_runtime_mark_last_busy() in .runtime_idle(). I think several
> people have acknolwedged that this is a bit of a hack, or at least a
> missing feature in runtime PM, and probably should be extended more
> widely.

I have to agree; it seems like something we missed.  But then, I've 
always had something of a blind spot for pm_runtime_idle().  In fact, my 
overall impression has been that in practice, drivers relying on 
pm_runtime_idle() for anything nontrivial would be more or less mutually 
exclusive with drivers relying on autosuspend.  But of course, 
maintainers are free to do whatever they want.

> > The parent's autosuspend delay therefore 
> > should take into account the expected time before one of the children 
> > may have to be resumed, as well as the expected time before the parent 
> > itself may be asked to do something that doesn't involve any children.
> > (Note that if a device has more than one child, the expected time before 
> > any of its children will be resumed can be different from the expected 
> > time before any single particular child will be resumed.)
> 
> "Expected time before a child may have to resume": isn't that child
> last_busy + child delay?

No; that value is the expected time before the child may be 
autosuspended.  Not to mention that you're mixing up clock times 
(last_busy) with time intervals (time before).

>  So that expected time is already in the past by
> the time the child autosuspends.

You must have misunderstood what I wrote.  Think of it this way: Let's 
say the last remaining active child goes into runtime suspend at time T.  
Let's also say that the parent expects none of the children will need to 
resume until time T + D.  Is D sufficiently large to make it worthwhile 
for the parent to suspend and then resume?  If not, the parent should 
remain active.  If yes, the parent should autosuspend -- and the length 
of time the parent should wait before autosuspending is on the order of 
the value of D (let's call it D*) that corresponds to this crossover 
point.  Thus the parent's autosuspend delay should be set to D*, or 
something close to it, in order to achieve both objectives.

> My point here was that I think Rafael was overly concerned about
> precisely tuning parent autosuspend delays at the same time as changing
> the runtime PM core behavior. Yes, they clearly can be tuned in user
> space; but he was suggesting a phase-in / opt-in approach to this
> change, because it might harm system power if it's not re-tuned.

Is anybody really trying to tune precisely parent autosuspend delays?  
On what basis?  I'm doubtful that anyone is sufficiently serious about 
it to be annoyed at this PM core change (i.e., setting last_busy when a 
child suspends).

> > > At the same time, it makes it harder to reason about the runtime PM API
> > > surface -- because currently, .runtime_idle() is a primary reason that
> > > pm_runtime_put() and pm_runtime_put_autosuspend() are different.
> > 
> > I wouldn't put it that way.  My feeling is that pm_runtime_put() could 
> > be replaced by pm_runtime_put_autosuspend(), since they should behave 
> > identically for devices that don't use autosuspend.
> 
> Ah, but that's not actually true! pm_runtime_put_autosuspend() skips
> .runtime_idle(). It (semi)directly calls rpm_suspend().

Like I said above, a blind spot regarding pm_runtime_idle().  And/or an 
impression that a driver might want to use pm_runtime_idle() or 
autosuspend but not both.

Anyway, pm_runtime_put_autosuspend() could easily be modified to call 
pm_runtime_idle() before rpm_suspend() if the device doesn't use 
autosuspend.  That's not likely to bother anybody.

> I appreciate all the responses. One particular part I did have questions
> on, which I'll mostly copy/paste:
> 
> [Rafael:]
> > Now, let me acknowledge that some drivers evidently want rpm_idle() to
> > always set the autosuspend timer instead of suspending the device
> > right away.  That may be because of the "unwanted parent suspends"
> > problem at hand or for other reasons.
> 
> Do we have any idea what the "other reasons" could be? For example,
> because driver writers found it too difficult to find all the
> appropriate places to call pm_runtime_mark_last_busy()? (Does commit
> b3db492e8335 ("PM: runtime: Mark last busy stamp in
> pm_runtime_put_autosuspend()") help? Or should pm_runtime_put() behave
> similarly?)

I have no idea.  Outside the area where I mainly work, I don't know what 
sorts of things driver writers are doing.  If you know any people who 
are doing this, you should ask them directly.

> I see that USB is one of the subsystems where .runtime_idle() calls
> pm_runtime_mark_last_busy(), and I thought you (Alan) might have some
> more background on that.

I don't remember exactly why that was done, but probably it was meant to 
carry out the behavior we've been discussing (autosuspend delay should 
start when the device and all its children become idle).

Alan Stern

