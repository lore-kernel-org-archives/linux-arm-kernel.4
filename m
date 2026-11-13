Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8815E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 06:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zgfUgwUy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KjkY0qxT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wix08yJ27yJSgUGKEpKBIXQFAmhik0Hn4X6nmBhrer0=; b=zgfUgwUybW2CLI
	DT0tgtVg5Ej+B3xBDDQb9Iu8+C3YcmyvX4rsrSN/DAZCphq/WylCKHoMxkS2IH5SXRjaMxf1IuIRO
	OLpxfhvR8SrFKGVl4ok5d5FA0d67Tn3k5rD3FrFoLtXLLC4hK/+NLcmNB/q/RNrZQ/TgvESx+ujO1
	UkTa+Ng834D1AqxO6WMlqJMvFt21DTwTFAz50v76jfgolwTAISAmhz+s+s9RI9k3b6cz2DwzSEfu/
	MkEXP/2rl8+1/LNHROYJz2zsyb2I1kK0/BboZ22XYKg06W2+NnTQ8aVvecJ0OxiArzTfY+dqlEoq2
	pk7UuPH4HPWKAnUL7GAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkWM-0000000BknS-0bFd;
	Fri, 13 Nov 2026 06:12:22 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkWJ-0000000Bkn6-0aL9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 06:12:20 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-91f2b826fe9so1478416d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 22:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794550338; cv=none;
        d=google.com; s=arc-20260327;
        b=m0JPYVJvkbr/LFw4207F4ZK4UJxtmNIoOCjgSZ5kIwirYy5nINgabKwwli7Cx/Jqst
         hNGFlWI303zQdCB1UqP0BOYgl6M5bYR3WS/lkNlByqYsh9a6UMNFzxr4pEtnaPs/vGiA
         Wlrg89QLn7OPtFcduvsFRoB/u9YoSD4/SOdH82w0BDpwhJL/WgNbAT/rofSLTfCj+eV+
         XOvEc+ECJLM+pHmG/lQFjquqc1K9vkEVU5Vr8OUGYtX3SmId97QbXBhoIIjsJZgSKl3L
         mxanqBG4BmcT8T0AG4vbXfAxG7G0enakp4KXUZojmF2II1TBm/eB4GPODHYJDb69SbLH
         ObWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wix08yJ27yJSgUGKEpKBIXQFAmhik0Hn4X6nmBhrer0=;
        fh=uKRZ9L79Emd2ediDQVjI9oSLaLUE9if/IkL+MCNKM04=;
        b=SJ6CFZWDT2/l4YcNjiMFCyKrT6bG+v1CptOO+QjAUaM4HKPCeKt/TTrimA132yMiEC
         j4/NX8YyGiKCApVGuXhs3a4um7L1VWGU70uBKpNmJ9U4F+V2vxVXkVV8eEyzK+5KMPEp
         llipESMl1DyIMqL4m8ABYQIwTx+EAvPhQFy68vzTcC8JvcdZ1iHbJ+EUAsDU/rgWxUag
         mev0PoVQ/RY1c7z/BuXZ/OJaI8lHX3SHP4xreqNC2pCK62KOpiQnGh5n8XXJaZF1z0ay
         T+BAVEsxRI+I6BPVrHjzDSCcmONdLMjYLfVlmqo9YBF4xjl9bblgvKG5+TDk24nfoXRB
         hZDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794550338; x=1795155138; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wix08yJ27yJSgUGKEpKBIXQFAmhik0Hn4X6nmBhrer0=;
        b=KjkY0qxTRufgPEMm4YppUAiJ/8mB3yWRUP5ilu3LucrQhIXbnkLu7ACdpMmolZOWHh
         /qjZQZm1ljULXdNDQJQbQMWPY6m3yUa5kOg02a7GxK36tiKNrFoB2qajs0XlRJTVQUZ5
         8EuqBH++HqOVApFphh4gV4crkgav1xpWgV2JIK1ZTjg9gDVJLqo/W5qk/f5wOhX9cdTC
         yd5OI4W2LDyTfnibRSarMUYHNdOMv0oGELl56uRFVqHIvxLrGniEFuUOARiyQYm15Hgs
         4e/xzOYAJaobkn5ssHxab3BEPGQTw1LUI1PLLVv7pgQm6QMLgQ0HpKpe1G1FF938ZRW+
         mL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794550338; x=1795155138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wix08yJ27yJSgUGKEpKBIXQFAmhik0Hn4X6nmBhrer0=;
        b=PUX9SXYwt774PwrxlLJ1rE37mS1UflvETUrflTarm2r8ywwwQFjInN1R68ngmSCkqb
         c7QnfXt2WXkswN9ML36Ge53boUGho715lTt14R4NKIM5Hrj3iefma8+YUpaZ4eNgDTXz
         NVaJccsT+70xrP7QcbO3z5Hi9aZpGK3iMdt24XXFCiwOkbRIKJp92YUIWt/lpMT9QIZt
         Igh8ki2jpqOhW9OpdfbiTmUXeYFJ4jwmnCVC18T0KX8jwHBaTt5OxOz+0/QdvseP0KQO
         1o+MZxMjcvyycmLoR8WFBv84uj59z6IrwhDakUMp84Kn+RjUmxSTsnojvHWVBWrNdJkW
         eqqQ==
X-Forwarded-Encrypted: i=1; AL+hErFLtXkdviVa0av3MV0CzpYiLBtp5k/qxLslxPy5sQzkOmSOjczvcT8csueN7THKNpNHUyolqGtAND9cN1HTr3VE@lists.infradead.org
X-Gm-Message-State: APuU4Z8QyhGgnsiYdpWqGundPr7g+mMZxBuN0/cwD5XmXt6KZbMAIovJ
	jmovVAdmuBds/Dw8Z3Md/pAvBcAXOBodSyLevC51/THSSMfwK/PvgBnxN1GBiB0c+/Ht/4NSVtt
	/RPrEaXFrJB+yk6vJFPjEP5k2Qgblivo=
X-Gm-Gg: AYBFou1yUY4qM4g5Tpoz5IZITpCqPStFASTMglkangHuSCX7T05aHolpOLzYgyVZxSp
	8Wz0yFrePij62tKUnzGdorF2SEW07CYZBTcynGTbXsbNWWsiePqNo27W7mH3+s8+G1FQDEBZp56
	6G2Bw08CK0BAnQekr0VxQqgMs9mIi7gJ4gwDw+I6YX32DpjbxLA6e5F7CJYay7sjej1SVW+4BfA
	CWnBmWdkA58NA1lYSV3aNfj334dub6T/VjUs2k0062N18EAR5ZZJoD7iByaCJGTz3xe2W4i3o1b
	a77S1g2iUKgvSuQSoiVbBCh8dhKXineSt8nrsJsnlWqxVPoIDVlgivQgMncLBeixVd303S9SPIj
	xuVmErNlAwVi4RF3Rwhq3h/mh5AL3PMYfhxtU4a/roUtJDR4LJY6thqfsg/Jp+NlfUAf+
X-Received: by 2002:a05:622a:1813:b0:536:43ea:f876 with SMTP id
 d75a77b69052e-55ac4391cd0mr29866681cf.5.1794550337807; Thu, 12 Nov 2026
 22:12:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
 <20261112-vt8500-timer-updates-v6-4-fd1cea645d1f@gmail.com> <468e51cb-5852-4c8a-938d-bda2aca8c83e@roeck-us.net>
In-Reply-To: <468e51cb-5852-4c8a-938d-bda2aca8c83e@roeck-us.net>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 13 Nov 2026 10:12:06 +0400
X-Gm-Features: AclHuK_xoF4t3_XsXjyB9Y-lmiPCHjRTiY27rZQBkq_kf73XFRERFEk1oNbXQx4
Message-ID: <CABjd4Yz_GNpXoUa5YTRJLvy6bLWDP+Qtc4Oges=mX4pjC-fBdg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] watchdog: vt8500: Add a restart handler
To: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_221219_215563_1184B478 
X-CRM114-Status: GOOD (  29.42  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 4:44=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/12/26 10:55, Alexey Charkov wrote:
> > Reset the SoC through the watchdog when the machine's own restart hook
> > leaves it running: the PMSR write in vt8500_restart() has no effect on
> > WM8950, so a reboot there ends in "Reboot failed -- System halted"
> > unless a watchdog armed from userspace happens to fire.
> >
> > Arm the match a millisecond ahead of the current count, which leaves
> > ample margin for the register writes to land.
> >
> > Register at priority 128, the default for restart handlers and also the
> > priority of the ARM machine restart hook. That hook is registered first=
,
> > from setup_arch(), and handlers of equal priority run in registration
> > order, so this one runs right after it and only matters where the hook
> > fails to reset the SoC.
>
> This isn't really the idea of restart handlers. The sequence should be we=
ll
> defined. That is what the priorities are for. Why not give it a slightly
> lower priority ?

My thinking was along the lines of "I don't care who of you guys does
the job, as long as it's done". But now that you've pointed it out, a
watchdog reset is probably more rude than some other method, and also
requires waiting for the timer to expire, so I'll probably switch it
to 0 to make the "safety net" connotation explicit.

> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >   drivers/watchdog/vt8500-wdt.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wd=
t.c
> > index e0f838fd1d50..0ce1e2b06410 100644
> > --- a/drivers/watchdog/vt8500-wdt.c
> > +++ b/drivers/watchdog/vt8500-wdt.c
> > @@ -25,6 +25,9 @@
> >
> >   #define VT8500_WDT_DEFAULT_TIMEOUT  30      /* seconds */
> >
> > +/* How far ahead of the current count to arm the match for a restart *=
/
> > +#define VT8500_WDT_RESTART_TICKS     (VT8500_TIMER_HZ / 1000)        /=
* 1 ms */
> > +
> >   static bool nowayout =3D WATCHDOG_NOWAYOUT;
> >   module_param(nowayout, bool, 0);
> >   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (=
default=3D"
> > @@ -75,9 +78,18 @@ static int vt8500_watchdog_stop(struct watchdog_devi=
ce *wdd)
> >       return 0;
> >   }
> >
> > +static int vt8500_watchdog_restart(struct watchdog_device *wdd,
> > +                                unsigned long action, void *data)
> > +{
> > +     struct vt8500_wdt_info *info =3D watchdog_get_drvdata(wdd);
> > +
> > +     return vt8500_watchdog_arm(info, VT8500_WDT_RESTART_TICKS);
>
> This sets a 1-ms timer and doesn't wait for it to fire, so the next
> restart handler (if it exists) will be called. That seems odd,
> and may introduce unexpected behavior. Is this intentional ? If so,
> it should be explained.

Not intentional, thanks for pointing it out. I'll add a wait in the
next version.

Thank you for the review!

Best regards,
Alexey

