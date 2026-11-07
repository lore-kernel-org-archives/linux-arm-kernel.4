Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E66A606D80D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NdehE250;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=flQax6z3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Txc3E1PcXQlFNp7c7FiKp/5yHJpupSAoBNaMzkRlDf0=; b=NdehE250OqZGLTpORyMmaR3slz
	EBjsqN5OHLw7UQRFLPHAdyASA8YfTWu21ovyFTe7di1570FM8Cx/MLeGXFPrtIlkpjyfTkpngL9uK
	53l9Pqr4gBb4EXLLLHmWjvsqsLViYKhZIiqd6zQ7voZFwU40w0s28646/5d5ZEEI9GTbG+McxddsP
	+Rg7evni1H06jA1t3YcoZ/Oht3kQTMVGapJTZ1caGWt+O+BtOj2uw2KBmM2Tmj/5MNQGGV8UonCjw
	/EfNskh49kgDKqO/NoI2FJ0wu82s3p9xYfyZwxMAeiV7HHWpJ2JGokyiZdhPeVEXx9f7RArZy327S
	Ub1GsN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTD-0000000ESYc-40op;
	Sat, 07 Nov 2026 10:16:23 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTB-0000000ESXs-1Vmi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:22 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8b0db268bd8so10433947b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 02:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794046580; cv=none;
        d=google.com; s=arc-20260327;
        b=L/ReX6lzuwxs+fBmZ/IIzrh4RAQ4c6VjrswAdOifkXRDCivbozyF5u2/eLV9S9sI9B
         gBmUGCqGq8AiSAYDSAjBHy0Lw0Lc+hKHAj6ZNdIHrTOE46HaFIJO0J8+bbxgSNMuA4ZI
         Hk+CLUVwTzB+qXQF96z7aUbcEzL3KrL9irM2nPIqGw5vgpTAKfhsyYh4+W1+N2zjm8sY
         3PwKdEhnXPwx2gBfqGvcUsGbdiECqavOYdRaZqv+Un5CUiGPTOWpUXWPsybYbnm8dmTv
         /yfkGBFjDbRJRRY7PWPeVOEkVeBr3juPr56vooJ0Tt8ok0Y3cbrTeACg093wKBp5PECx
         TEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Txc3E1PcXQlFNp7c7FiKp/5yHJpupSAoBNaMzkRlDf0=;
        fh=u7WkXmSsWaknWw7FMI594aAxpmbJzmADf0KLC3xXwrs=;
        b=ZbO3rxCq2ZXkPDbUGma3t+etfhOM3tw+0yJ5D7KeL5QOpE9JNGNJMZg+vGvPrQanDo
         PzF4IOTdNQq+SjWxav6h6nSILuCh2xqlNXBAFyqix6Z9MNRZxumDEdVelEtCEMI+5t+R
         9vqPq35IkcAWoq/1POxG7uUGq4UpWBvl9LNzW65t16B77DgnmOKcsW+0unB7gthehFB7
         cDFUiMIyuH8c2zrBJ0afDKx26ztG/xeWBe2eKpf8aP9Pulj1S0SnXcGyPP96VknqUlAh
         XeA3hGVQnfaosrANwx0nMApPzHiD/J3oHU/aefQ9RK4VT0YfyaQCA6p0hBehUlYgbLl+
         btFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046580; x=1794651380; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Txc3E1PcXQlFNp7c7FiKp/5yHJpupSAoBNaMzkRlDf0=;
        b=flQax6z3TDX1JgQ2/8B708xhMwvqMWYAawUOR1gj01LJGZG0xdsWBK7eaETrgAKwuu
         VALY3GBi4iofBUV/iblXGFaSFB06iUbEPiOzpA0GrNpCj2A1Cc0O/ATHGT5n9qbEXCWl
         bdoUVdan+8EfJGvOpDocSxXrpQ0AswMthw81S2fKtyOApZJVM4PLZeV5E4Vu/6j06OfB
         n+L6DkGCqn3RtewyIaYJTdPgJah4CRaQo6MLZFJR0GFKSUb+fv6lLtDVo7y3xtTEIzib
         1NXjuA8YgKTODGurBqy6ZKIWN+GnTn7qsxFICkpAnptSWY9pGgHIbg9bP6crtHBL9409
         CEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046580; x=1794651380;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Txc3E1PcXQlFNp7c7FiKp/5yHJpupSAoBNaMzkRlDf0=;
        b=VZsYAMQDXswcfDkr/TbBn9uFFd+7pArh6hA9YOChuPfPAnktoIugcx1xyqojza74vf
         5GdRgK8fzXsEy+7+H7QowZ2d0zAROovKq6ZqqIM7agLf/VE16uviSBbLNHvhIqg88OQw
         8UzvB49C1GzULh5cCOa+9XIEddLrDeeYIugeUMWztfqaNDbQghIrMVx6XARmWcIlV0nU
         Dtvke6rgrX9TwdAK2DjrY95pUFUXim7u3Fw1ZcxPvdnSUNba/N7DAzoo6fSQ6z5aJyUN
         aBNmW5m1xHkzmLUf2Ji9exloMs25tg1JeFr1cC5HPPLkWhfVaoF+3bTx80QUYM/3I8rw
         K7Ow==
X-Forwarded-Encrypted: i=1; AL+hErHf1aUsVdu7JuooX7WQKynZ+gW492rBN8JLoSS9VSNoz1nfLmJ5BoCvU8ubZjsvMI15auk9RQl6iQZszykRviSD@lists.infradead.org
X-Gm-Message-State: APuU4Z9S0GUw3y5yTJ00HQ4/tboo9xXPxqVOJFYyKFKZ+hyEHL9kQEQy
	VemcY0g+5BrMMHxSXgrbXgq6PI0kTpKPmOxIfooMSzGrFHdf+Xx7gUNEaYnXTdi3dB2qk5hqqg1
	R2s4RzIzcizjaDOizgpzXNDH3VZyQcxA=
X-Gm-Gg: AYBFou0pbV3oXbfRCtHTTES7ntIDwNJUeSnyhcRJeF7sy0V+ujaQAptfbFG+HwuMHEF
	JT/MA1gdoNYMcJyJFL2pXQZRs/rpBv54Sg/zZlUxrknLHsoP8fwpRwmhr1sCbhQR1Q7a9D6Wn1c
	kQHuo9umISdYzFvEFRdYVXx7EG7NycxLmJ59UxnFf3SnYs32+tKrRVtfMj57H8ew8T6s90EsqJk
	AMahkvjGRaXVNkdyaXL5PTIuVQi+i3Co1IyV9K6Gnew5Q0kqQ77NWFxGLTb8+5XTihCAMsQ0VGk
	mKQUESap5RvaMSqSnRqae1X+AdEE0UfPzIgziBIk9kMySOJlLSTGPHvf5jLupaQ8gYhZn7ixj81
	a+PTEns1yfQAwDXm4BirD5iocx1ixaRQkYyO06ZCBv9ho/6bqr/M97Tq7tY4=
X-Received: by 2002:a05:690c:289:b0:8b0:a252:77c6 with SMTP id
 00721157ae682-8b3418dfee1mr22332297b3.19.1794046579785; Sat, 07 Nov 2026
 02:16:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-hantro-remove-v1-1-d0a4678886d7@gmail.com> <0597b71f39fd945d531d3e996d982d5d3a3b9a28.camel@collabora.com>
In-Reply-To: <0597b71f39fd945d531d3e996d982d5d3a3b9a28.camel@collabora.com>
From: Sergei Khomenkov <shomenkow@gmail.com>
Date: Sat, 7 Nov 2026 12:16:08 +0200
X-Gm-Features: AclHuK8U4hp329_sClLRJdwqt0M9udYoGIyX3Gq2TqxXtvVHZa2zNAR132StXO0
Message-ID: <CADxDoMSrwDQfFD-VejUvh3shpo6BKjFWMzXUtsoK=t7=AhPATg@mail.gmail.com>
Subject: Re: [PATCH] media: verisilicon: suspend the device before
 unregistering it on remove
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Frank Li <Frank.Li@nxp.com>, 
	Tharit Tangkijwanichakul <tharitt97@gmail.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_021621_414693_026EF871 
X-CRM114-Status: GOOD (  20.43  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Nicolas,

> To be verified, but its not entirely logical here. My impression was that you
> want to unregister the dev entry sooner, so that it prevent newly open, and turn
> existing fh into a mode where all ioctl will fail.

That part stays first. media_device_unregister() and
hantro_remove_{dec,enc}_func() still run at the top of hantro_remove().
The patch only moves v4l2_device_unregister() and clk_bulk_unprepare()
below the runtime PM calls. v4l2_device_unregister() touches no node
here: it clears the driver data, which equals &vpu->v4l2_dev (the first
member of struct hantro_dev), and drops the device reference.

> Can you do some extra code inspection and report why you strictly need to modify
> the clock states before you unregister the device?

hantro_runtime_suspend() reads the driver data, and with power/control
at "auto" and the default 100 ms autosuspend delay remove() calls it.
The driver core resumes the device before remove(), and its put only
arms the autosuspend timer. So pm_runtime_dont_use_autosuspend()
suspends the device synchronously, the path in the 8e26d4c20ed2 trace.
With the current order the driver data is NULL by then: an unbind or
module unload oopses, after clk_bulk_unprepare() has warned
"Unpreparing enabled". (My reading of the code: with autosuspend_delay_ms
at 0 the device is already suspended when remove() runs; I did not test
that case.)

So two things are strict: runtime PM stopped before
v4l2_device_unregister(), and the clocks disabled before
clk_bulk_unprepare(). The new clk_bulk_disable() does not use the driver
data, so it only has to come before the unprepare.

I suspend through the PM core, not by hand, so that the runtime suspend,
with any genpd power-off, still runs before reset_control_assert(), as
8e26d4c20ed2 wants. I could only test on RK3026, whose VPU has no power
domain, resets or IOMMU. A run on RK3588 or i.MX8M would help.

> p.s. are you sure outside of test build, that PM can be disabled on any of the
> platform hantro driver runs ?

If you mean CONFIG_PM=n: not on Rockchip or i.MX8M, which select PM. On
sunxi, AT91 and STM32 PM is only a default (SUSPEND=y selects PM_SLEEP),
so it can be turned off, but then the driver never enables its clocks:
only hantro_runtime_resume() does. The IS_ENABLED(CONFIG_PM) test is for
such builds and COMPILE_TEST. There pm_runtime_status_suspended()
returns false, so unbind would disable clocks that were never enabled
and hit the "already disabled" WARN. I can drop it if you prefer.

The block itself is for runtime PM forbidden through sysfs
(power/control set to "on"), which root or a udev rule can do on any
platform. Then nothing suspends the device, and it is still active after
pm_runtime_disable(). I tested that case on the board. cedrus and
mali-c55 (2c9b9bcc2569) power off by hand in remove() the same way.

Thanks,
Sergei

