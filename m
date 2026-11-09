Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD90606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M6m5PUff;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WX+sG5u7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8WX0F8nMHDszbM5NjizmqwpyrFNWwfILJpVqr66lwxI=; b=M6m5PUff0H57+v
	s8pkFJUAvITycPNnZA/Xuq4A3NZrbzfKkPnjNQ/D1jdeBtmwWPc3clLp8StuW9ANxtHc4oFKZKgr1
	VeekhQFm6WoieDCyu3BLwDoL7UREg+gpLvLZnFZGNKzIZ3QDDXk30Tzt1PjqxL4XvR9ivQvWGW+ox
	IzYIV/FrCliBoc75Cs3vrU8jU1uHfXIvf4G+QGzaXojOwf0Fa7rZCknPC0OK449JuvSKlHc3Ui7YH
	y3oO3XSsFqGXake0jzt9KaDNeVr9NoQodfCVcmbdMpzgiGq/5ZnOO3lUp2k7AGzBmLjU1swdVcvRw
	VCUyjifKEtITzU+xCrsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQREo-000000011wq-1XRi;
	Mon, 09 Nov 2026 15:24:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQREm-000000011wk-3wXQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:24:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0415B633D4
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Nov 2026 15:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5E01F00900
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Nov 2026 15:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794237887;
	bh=8WX0F8nMHDszbM5NjizmqwpyrFNWwfILJpVqr66lwxI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WX+sG5u7EcuZwen1naP7QcR0JG9gtzcmXxO66QIgi8DHcE6a+WdwYKaatDoMxcE32
	 VefY+8zsWi578yt4cUpPkANrFgJYAfwdiYMMXIyktO72MKMQCusxwkPuBJs3peG8SF
	 yFeuZNwUb+T/SqJdwuJiKZ5zRbhQdPTM06VvFJuEGEf//TYsH5GA6yimA8eWnTyDIh
	 B7iuKorqeMjl7jYRIWvXxFmGZY5lBMX0undR4gJcqVGb/coDHJJ4huRd1v7xGJgoWr
	 JuYL812qqj5sdqiwI1jG9ZgwoFROobCxvbFj0BhgRXpewTOo+c3ry2DEQeJ9+zT7oV
	 IRvQw7UtMrttg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c07c7306e1so828380e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:24:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEaOz1EJUNedzYzAl7SAzlzZN12fVoBSj03+HZHUq3RIaT0osPIleW0H/3B/rjFZUyZmyGU2iAaV+cVPLmHGZYV@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZifUrWEDVkHcQ8pEc1wdm42IafZuofbRWwU6AHrXIESkVGBlJ
	YN3xGcxtnaPhCyLGKHg9OCaa11ZILoDUNAgk0z9d/2fgl5JwSrDXY13/cc6gQXNWFxYiYS2keiu
	hj2Ca6/mCaj3KoihElVIxTiwVCBJQY8E=
X-Received: by 2002:a05:6512:6cb:b0:5c1:4e41:3cdf with SMTP id
 2adb3069b0e04-5c1514e0072mr709299e87.12.1794237885651; Mon, 09 Nov 2026
 07:24:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103221717.3840215-1-briannorris@chromium.org>
 <20261103141442.v2.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
 <CAJZ5v0jWCz0XDgzeETbmMfGOmvh2G9qcx7xLODrpQ9NiwsddKA@mail.gmail.com>
 <auuICAm4BC_8Pzs5@google.com> <CAJZ5v0jTX1FgeS9FCV=+V4uacSgLQBVsSPnU27ybgUGg57GUOA@mail.gmail.com>
 <auzlLwlleGLPsLcw@google.com> <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>
 <au0oKFb9CmNzc6Cg@google.com>
In-Reply-To: <au0oKFb9CmNzc6Cg@google.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 16:24:33 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDNbp+eQ0S-E52DETWjQ@mail.gmail.com>
X-Gm-Features: AclHuK931oANkV8p6-cRViUQLiT63hdK6qIBRvMQXju8Za-NQWods2ppuhoMaf0
Message-ID: <CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDNbp+eQ0S-E52DETWjQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent to dependency
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 6, 2026 at 2:06=E2=80=AFAM Brian Norris <briannorris@chromium.o=
rg> wrote:
>
> On Thu, Nov 05, 2026 at 10:18:52PM +0100, Rafael J. Wysocki (Intel) wrote=
:
> > Of course, it will not prevent the parent from suspending if the child
> > does not attempt to resume it for a time longer than its autosuspend
> > delay.  That's by design and you didn't have to take the time to
> > demonstrate it.
>
> To be clear, I wasn't just trying to demonstrate for fun or because it
> wasn't clear. I think there's value in putting concrete reproducible
> test cases out there. (KUnit is an easier common ground than some
> particular piece of obscure hardware.)
>
> > The question is how often those kinds of patterns occur in practice.
> > Or IOW, whether or not they occur often enough to justify adding
> > complexity related specifically to addressing them.
>
> Well, I tried to keep very close to the spirit of the actual real
> reports in question. So when commit c537d3457542 says, "As an example
> [...] cat in_voltageY_raw at a 0.2s rate", I think it's not a far
> stretch to test 0.1s too. And it's actually quite odd (IMO) if 0.2s
> behaves *better* than 0.1s or 0.09s, just because it hits the parent's
> rpm_resume() more often.
>
> > > On Thu, Nov 05, 2026 at 12:59:24PM +0100, Rafael J. Wysocki (Intel) w=
rote:
> > > I would love to hear your counterarguments.
> >
> > OK, I'll say more about that tomorrow (it's past 10 PM here, time to
> > go away from the keyboard).
>
> Great! And don't rush on my account. I'm interested in eventual
> progress, even if not rapid. I'm sure you're busy.

Having to context-switch back to this later would probably be harder
than continuing it now.

> Or, maybe I should have gone to LPC...

I was busy all the time there though, so I guess no regrets at least
from that standpoint.

> > > I don't believe your solution solves the problem,
> >
> > That depends on what problem in particular you mean.
> >
> > It addresses an inconsistency in rpm_resume() and as I said above,
> > this needs to be done anyway because it is not only related to the
> > cases when children or consumers are involved.  There are other cases
> > in which rpm_resume() gets called for an active device and the lack of
> > last_busy update causes the device to suspend earlier than expected.
>
> Yes, on second thought, I agree that your patch addresses a real
> problem, even if it's not (IMO) quite a full solution for commit
> c537d3457542's.

No, it is not a full solution for this kind of a problem.

> > > and my solution does while also handling
> > > the inconsistency you mention.
> >
> > I'm not sure about that.
>
> Sorry, I see that part was inaccurate.

No worries.

> > For example, say a device has an autosuspend delay of 2 s.  Say it is
> > initially suspended and user space writes "on" to its "power/control",
> > so the device resumes.  Now, 1 s later, user space writes "auto" to
> > the device's "power/control" and the autosuspend delay is respected,
> > so the device doesn't suspend.  Next, 1.5 s after the first resume,
> > user space writes "on" to the device's "power/control" and the device
> > does not resume because it is active (its last_busy is not updated).
> > Finally, user space writes "auto" to the device's "power/control", say
> > 1 s later, and the device suspends even though it can be expected to
> > stay active for at least 1 s more.
> >
> > How is that going to be addressed by propagating last_busy from
> > children/consumers to parents/suppliers?
>
> Agreed, your patch addresses some scenarios mine doesn't.
>
> I also agree the power/control behavior is a bit awkward, although it's
> not very convincing to me as a use case.

Well, that was just the first example I could think about while
writing the above.

> (Arbitrary/periodic fiddling
> with power/control seems more like a nuisance API than a real expected
> use case.) Or if it were, I would suggest solving that by adding
> pm_runtime_mark_last_busy() to pm_runtime_allow() :)

Interesting thought, and hold on to it.

> To me, a more convincing one is: a non-autosuspending child with an
> autosuspending parent, in a situation otherwise similar to commit
> c537d3457542. The child is not likely to intentionally update last_busy,
> but only implicitly via rpm_resume(). When you solve the inconsistency
> with your patch, then it enables my patch to be more effective w.r.t.
> the parent.
>
> > Note that I'm not dismissing your proposal, I'm just having doubts
> > about the need to do this kind of thing in the core code.
>
> OK. I agree it adds a bit of complexity, but at the moment, it seems to
> me like the most thorough way to improve the ergonomics for clients
> (drivers) here. And that's pretty much my entire motivation here: to
> improve the ergonomics of runtime PM -- even if in this case, it
> requires a little (core) complexity.
>
> So, I'd love to hear what can make the ergonomics better here, with less
> core complexity.

Let me start with a clear problem statement to kind of refresh the context.

In some cases, there are unwanted parent suspends occurring between
child suspend and resume that delay the latter unnecessarily and
generally waste energy.  They mostly occur when the child suspends and
resumes relatively often and the parent's autosuspend delay is too
short to cover the entire period between the child suspend and resume
along with the preceding period of the child activity following the
most recent update of the parent's last_busy timestamp, at least
sometimes.

Of course, this also equally applies to suppliers and consumers, but
let's focus the attention on parents and children.

The problem addressed by

https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/=
?h=3Dlinux-next&id=3D55b2b8af704f845e01fa2f31ee259b07641ce3a9

makes the unwanted parent suppends to occur more often because it
causes the parent to entirely miss its last_busy updates in the cases
when pm_runtime_resume() (or equivalent) is called for it when it is
active.  When this goes away, it should be possible to address those
"unwanted parent suspends" at least in some cases by increasing the
parent's autosuspend delay.  However, using larger autosuspend delay
values generally causes system power to grow (on average) because it
effectively causes devices to spend less time in suspend, so
increasing autosuspend delay values is not a particularly attractive
option.

Notice though that advancing the last_busy timestamp more often
without reducing the autosuspend delay values of the affected devices
is also likely to lead to the overall increase of system power because
it would effectively cause the devices to spend less time in suspend
(on average) likely increasing their power (unless the majority of
their suspends are unwanted).

Now, let me acknowledge that some drivers evidently want rpm_idle() to
always set the autosuspend timer instead of suspending the device
right away.  That may be because of the "unwanted parent suspends"
problem at hand or for other reasons.  Regardless, it is effectively
equivalent to setting last_busy in rpm_idle(), so they use their
.runtime_idle() callbacks for calling pm_runtime_mark_last_busy().  It
arguably would be nice to allow them to just declare that, for example
by introducing something like pm_runtime_use_autosuspend_always() to
be called instead of pm_runtime_use_autosuspend() if the driver wants
rpm_idle() to always set the autosuspend timer instead of attempting
to suspend the device directly.

I think that using pm_runtime_use_autosuspend_always(), if it existed,
might be attractive for a couple of reasons.  First off, which is
rather obvious, a driver using pm_runtime_use_autosuspend_always()
wouldn't need to worry about last_busy at all, so it would never need
to call pm_runtime_mark_last_busy() or pm_runtime_put_autosuspend().
It would just need to call pm_runtime_use_autosuspend_always() once
and set the autosuspend delay (which may even be combined with the
former).  Second, the autosuspend delay of a driver using
pm_runtime_use_autosuspend_always() would only need to cover the
period after the last runtime PM reference to the given device had
been dropped while currently an autosuspend delay needs to cover that
period along with some (usually unknown) period of device activity
between the most recent last_busy update and the time when rpm_idle()
gets called.  Thus, with pm_runtime_use_autosuspend_always(), the
autosuspend delay usage would be arguably more straightforward and
easier to reason about, and also the autosuspend delay might be
reduced in the majority of cases.

Of course, drivers that have the "unwanted parent suspends" problem
might switch over to using pm_runtime_use_autosuspend_always() and
adjust their autosuspend delay values to cover full periods of their
children's suspension.  In theory, it should be possible to reduce
their autosuspend delay values while at it, for reasons explained
above, so the total average system power might even remain unchanged
at least roughly.  That overall might be a zero-overhead change.

Using pm_runtime_use_autosuspend_always() would also make autosuspend
work consistently in all situations regardless of the reason why the
last runtime PM reference to the given device had been dropped,
including the "power/control" manipulations from user space, in which
case it would be equivalent to calling pm_runtime_mark_last_busy() in
the sysfs code path mentioned by you above.

Moreover, suppose that pm_runtime_use_autosuspend_always() turns out
to work for everybody, regardless of whether or not they have the
"unwanted parent suspends" problem.  In that case, it will be possible
to simplify the whole autosuspend delay handling quite a bit.

