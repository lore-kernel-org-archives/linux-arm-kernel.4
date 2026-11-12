Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B47F606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z7NHA03u;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hjujjH/R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L0I0n48oV5o7BRj/oH4f6pc2kqveIFdpMiqQByS78r4=; b=Z7NHA03u0Ux75cg05aU5vq0X7t
	vUIKXp3sBtTFW2qLdELSTL/4M7YxOD5OXpjkAUhz0gTDS9ZnsEAUKqu4Buc65oU4cIOnfyi2AMDy9
	kDFUZm6828jw8DnrbcRzl6QktILC2qVQUewTL0BXBxWHrK0L0SWn6TEHfrOc2GV3flHKnDNOMm5O6
	Aluc5YjRlUrisJ991zUZMRFxAAdriR1xsbgvZoaR3C1v6tll+a5nakgm7DlFTI2mfRpJ0E7vfhkgi
	tf+sPnsPTf3aKG0milV0ix/JaXrC/KX1SGEU8GDbozoBB884TV9DxxYFJRDgGLBb46lnViPXyYYib
	YOH8XHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXuo-0000000Af2g-3sCG;
	Thu, 12 Nov 2026 16:44:47 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXui-0000000Af1w-1dhl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:44:45 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1a2761c69fbso8018899c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794501879; x=1795106679; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L0I0n48oV5o7BRj/oH4f6pc2kqveIFdpMiqQByS78r4=;
        b=hjujjH/RgmD/Cvq9uTGJ3+3mpauLd3JY0f+50RebK99y9XhTo7/37Jk4OTOLW0bDGZ
         DEKnxGgEkJsYoim5D38X8EiG4qkQxkKKeEEkYgKWeKUGBGX7n7LkcW4OIWWC+qh+UJ34
         udmnVFMZJzqblU4uFlnLUO4cavkT6L7oO3vZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501879; x=1795106679;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L0I0n48oV5o7BRj/oH4f6pc2kqveIFdpMiqQByS78r4=;
        b=mCnN7pL+R2thgtWJn3LW12hlS0hXs5vgei+aWva+5k4x9HH90WEOw6PVPbAKjcfhan
         aW0YC71FrlDe6IpMyUdNXHOdTjL4usWf15yLEJ58Z9VqAXE0Wo6nOzrlnjQ7BBxYuGlQ
         HD8isSaFwOzGHeLNvYsagaf4TuQpAeG2J1CWMYrKt/c33ZIVDRMy/XGHq5akjhPo9BFh
         kP2u8Xb3hBfcPKXaRkxdvleVDltbQjKem87lFN5/QCq861QrPljUWB39CnCu1aFUoOQv
         xzos6TSAhIeEw2ANO5YPx+P5OumgR+dA7wNid4CkwOBvhWoDJU2fglfjtRc2rnk5lffB
         cN2Q==
X-Forwarded-Encrypted: i=1; AL+hErG5GKwG+jfJ9y9piVXLh5Jo9afzPh3fe+JV1tQioomXo8ntACA86/79p21/AdXft4YGuBLf4Oq6+YGW9B/jN3hC@lists.infradead.org
X-Gm-Message-State: APuU4Z9lQMvCG6EbXLjZB62JWmGR9CuJP0VzYfOMYVOrkqJSqwjPH+Gp
	wPw7VN2mOLfHDSaEhuMAk/7swKZK/OgYRGDgUEhpU1FZsS9wXtbBpuhVUn9cZDspRCcoBgGrj2Q
	rvow=
X-Gm-Gg: AYBFou2tIKhDZ7UImnvJtNQWnTJgIIfc7FG6dGUd0rG85xBWy4QvKvFpXlXTAUo1eE5
	R07y6xbHwWBIYpTsqEiwbhqqXnmcE/+vlsC6nu6NJpB8De9xTbnsjozXvuBzc3s9IxwHQtoKdEz
	pg3GlmAV1zSvchmWVYsGzoRbOiQTb3vwrrVQLGUfOReDrU/c58QylM/Ha32MHl1kyD10vauf+tE
	amedtAKNT/pSrynJrdUA2+8pwkn1c1ZD0/jj+ZGRdKhNU76ePTLMPU16PbZ02p7JYMWTSr3qUPz
	+41x+hMkPgqXLO0wPU+zcVVmel31DsfQQ9T/NZy+zOGC0wMq3BwYkMx7Z6cjCpns3d77Qjb8dYT
	iykYWgcaZX4xwltN16CvtWFb4CB/8X9gAVLrECyIS/nApyzcc83kc+9wtboOsjcAGVa/dEmIzYj
	BWnJKU373eLxRU/bsJaBDoDooFcJrvU7uUco8LY8I4w3P5O3wyEQXY+TX29i/C0PV0YsqXIajQZ
	U6TDibpxWRe5+LTbo2ZX0boY8u3X49LhFkthrFd+PLt9NgwdNOSeElXxf7xufVHgvoZetNXCKXI
	ImJldGH3ZpPHVneqKO5ccBrbzxVONt5/4B8t44xJMQy9itDM0QHZkz1m8/qJSHX1QoO7
X-Received: by 2002:a05:701b:4551:20b0:194:3a84:e67d with SMTP id a92af1059eb24-1b5031b37dcmr81202c88.44.1794501879423;
        Thu, 12 Nov 2026 08:44:39 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:5446:563c:ac92:43a8])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b5031b2519sm137097c88.13.2026.11.12.08.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:44:37 -0800 (PST)
Date: Thu, 12 Nov 2026 08:44:35 -0800
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent
 to dependency
Message-ID: <avXs826ikSctpUnA@google.com>
References: <auzlLwlleGLPsLcw@google.com>
 <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>
 <au0oKFb9CmNzc6Cg@google.com>
 <CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDNbp+eQ0S-E52DETWjQ@mail.gmail.com>
 <avOw_4ZkqtKFHu1B@google.com>
 <2c3bda2b-ccc3-4430-8e09-81b25f6fcda7@rowland.harvard.edu>
 <avSa97F1Nu1LTSCA@google.com>
 <fc43eb13-816b-4cd0-9711-848fdab605ef@rowland.harvard.edu>
 <avUHG8mLuTOUMr8O@google.com>
 <CAJZ5v0j+8_fOc_EEGx4tquqcaH3-nmHd0YMJRb38t2Rw40iV3g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0j+8_fOc_EEGx4tquqcaH3-nmHd0YMJRb38t2Rw40iV3g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_084441_281636_E53A9AAE 
X-CRM114-Status: GOOD (  32.62  )
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

On Thu, Nov 12, 2026 at 05:13:09PM +0100, Rafael J. Wysocki (Intel) wrote:
> On Thu, Nov 12, 2026 at 1:24 AM Brian Norris <briannorris@chromium.org> wrote:
> > I'll give this some time in case Rafael had any other thoughts/replies,
> > but unless something major changes, I'll plan to write/test/submit v3
> > where rpm_idle() calls pm_runtime_mark_last_busy() (part of Rafael's
> > proposal), and *not* make it conditional (i.e., no
> > pm_runtime_use_autosuspend_always()).
> 
> That will work for me.
> 
> > (Or, Rafael is free to do so, since it's his idea. Just let me know so I
> > don't waste my time on it. But I figure he'd rather someone else do the
> > work.)
> 
> I can cut that patch.  It is going to be a one-liner if I'm not
> mistaken and I'd like to write a changelog for it.

OK.

There's potentially quite a bit of follow-up, including patch 5 of this
series (to drop now-redundant .runtime_idle() callbacks), but I can roll
that separately if you'd like. (Would you want to make an immutable
branch for other subsystems to pick the 1-liner up? Or just apply such
patches to your tree, as it seems the IIO maintainer was probably OK
with that?)

I also feel like there's probably room for unit tests in this area, but
again, I can do that separately if they still seem valuable.

> After that patch though, using pm_runtime_mark_last_busy() elsewhere
> will be mostly redundant except for pm_runtime_*_autosuspend().  Since
> all of them call pm_runtime_mark_last_busy() (AFAICS), it looks like
> last_busy can be updated directly in rpm_suspend() when RPM_AUTO is
> passed to it, but if so, rpm_suspend() can simply set the autosuspend
> timer unless it is already running and so last_busy can be eliminated
> entirely.  I guess that should be done too (in follow-up patches)?

__pm_runtime_put_autosuspend() still sticks out, but it's nearly gone.
Its only user is just re-implementinng pm_runtime_put_autosuspend(), so
obviously it doesn't actually make a difference. I've been waiting for
someone to finish this patch...
https://lore.kernel.org/all/20260806-smmu-rpm-v4-1-8183d007331c@oss.qualcomm.com/

So I think you may be correct.

> Moreover, after all of that the difference between pm_runtime_put()
> and pm_runtime_put_autosuspend() will become somewhat academic, so is
> the difference worth retaining?  Or can we just say "If you set the
> autosuspend delay, all async suspends will be deferred" and drop the
> "autosuspend" variant?.

That's my preference. I think having so many put() variants hurts a lot
more than it helps, and especially so if the differences are nearly
nonexistent.

> I also have to say that I agree with your remarks regarding the
> .runtime_idle() callback.  I don't think it has ever been particularly
> useful and life without it would have been simpler.  I'd be happy to
> just get rid of it at one point.

Great! If a few other things settle, and I find that I'm able to clean
up my existing patches to my liking, then I hope to submit such patches
at a later time.

Brian

