Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC49E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sk9hmEhG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iYZCZ0fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZyKI2qUNxqXt+wcWqV0BvUgrOWmkIinXejzZ4Is8tdg=; b=sk9hmEhGGAAGSj
	mdjyXTyCwnJTBzs3b/eNZGA6O60KZ1UvcIe+Q5sucw1eWMs7j9XHxfed9C/0yB+co/kKTu5B0+229
	IYKfB/Zc8IkHMXN5/tXA2P8KDvH25qyCm3tTNbEe9TUR2RA5DIGn9Vw6ccqj/UvpfQkl4Ox27+DCY
	kCvp9ycW/Tye4znuLaU+JH7re091j1oSAkgn3FhGVUQBTzT6AgiV5OJdeylRreuN/JS7nBICSxOzl
	K1E9D9L0/X3YdtHYKEyBkzZSjmN7Dw+Y+5uFoF6AGiZylxl3pyNVZoDUmvsWgY5VM4+j0xtCc5V4N
	PHvClzONRxs7qa7KacEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN7v-0000000Bdoi-1Ln1;
	Thu, 26 Nov 2026 00:14:15 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN7s-0000000Bdo9-0rS8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:14:13 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-386bd881d39so5772084eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 16:14:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795652051; cv=none;
        d=google.com; s=arc-20260327;
        b=Fu+c8XiY+sm9mhsRK1sgt3MUpH0Id48LgicnrMjR5Z77nMQvXET0LQ+rMSsn4OlwDw
         XL0P/eVCCwpAmQoRI7XKRX83MtxMfcjqiCEbAzWGhBWKlIup11Ae1VqNSZWyQFTX7oGr
         S0T2Je+sqqI4eH1wUrZOaiYPJLorpQZV4yuXtldXScP3pO0vSwEBQa8cyB4GQxsLbGdZ
         nTrz+nbcOh9T7hn/bLc6XLa6Ke3QPNWN/Qn/4TgJuvGaA+ehU+u7emH4/8T+oG5WPv8x
         rU9Kfu8EmWeKstrFXyMUxlBgCsbA5qQCWT5jjcDM/qvlrhGxDedmpzbgDJ3nuL4HMpRp
         x+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZyKI2qUNxqXt+wcWqV0BvUgrOWmkIinXejzZ4Is8tdg=;
        fh=B6GFOn8hji74TfmsgeTTdSf94xx0IakfQ50yYgimna4=;
        b=JgHJ1kd3oeOurK1uEOpXJnWv/J4VIoVMwMqT75F/EaHbLHDUBlTh4Gc04xQxiZLE3N
         gVW3cFoTSzjtMcBqveky19SJGH1+AjZDVw3/Vyzz5q/B81FogmxfTiHFzqr0hKsXl/sX
         E25gonKrho4Yd8Xz0+J/ifd5apJVseXCu2Np9Ng9r8yD2zXO5YOXv29raNMucqiP1Mj4
         Axy80Mylw79uKl2qGdzfwO9wBkRAfQNruIw898EwYqNwuFz1t5XkvdXXmMQpore3OsfY
         bQMWDq4nUjIKz0axVgoAwAZZm7CUHV1lbLqGNxRYycM2O9fLxhfqfgNt3y58ykBuqeGf
         7pbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795652051; x=1796256851; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZyKI2qUNxqXt+wcWqV0BvUgrOWmkIinXejzZ4Is8tdg=;
        b=iYZCZ0fauiBdvV7a1ahZ7s2mHK1VI24MJSwdNHs7UCqLcDCJgrmrUYw7Ip5X6wd0vG
         SaK0b1wXQ/pvMlCLINIY8oKO9tk3iP4GT5uM6eT9gJzc7CZACHxEmRx13/qTa+Y3VokB
         v6a+9/5EHDNUtW6MLTcHajDmWFeKfO2/NDrtNQTsH0ljjGl0Tna5oyz7oR21EST5q8dO
         BXcLopr9qh8ZpkfKeEzBsiBWhz90J4Q73xF16uFrxoukcUNTctnepCcX1gamDrH9nPFC
         wKlYvEhqg+Y6ty4TTLmUJvVSoBWGfvLNkJWiViDOnq9OXVQ2ZWjBs6dN+TB2V2Y7urgf
         FrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652051; x=1796256851;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZyKI2qUNxqXt+wcWqV0BvUgrOWmkIinXejzZ4Is8tdg=;
        b=u6maEH6Fm+A8NN3CeyVlPpFi5Ln00qcX601MJwhEA9TE+D935rL60KFT/fynafAWX9
         RTe3WS8xOeROMVYsmgMszg7nb6/vV9hgoAUMlViAKMRkG7EzmsTsnXP8Rb17fOsZ2c2t
         Jv/moU2WRnpl+JfHSj11IQj9fFzpUQ5IUKL1EaJwubk6IhqFM94UrhX+OeuGZgXU/asj
         pYUr3O1STvfGcFGpci308P2IMcq3ZRHHMsz2exv7PCbxGmwOSI++/Trtrhil3+2ioNZL
         stPuviiCZMu/6IiMTe2KOFTTUJUhbyIroZQt1UH0cPCDvDWjGAy8a6MfC0jyCNqxLjSm
         pHkQ==
X-Forwarded-Encrypted: i=1; AL+hErHGCprpgtABMpV+DvBdDNVgIKq4lUfMr1tIN1kcru6AlVtXR+EThx2SDbOSuA+Qu5BCg2axJmdYqFP/cpSnx9v0@lists.infradead.org
X-Gm-Message-State: APuU4Z8QV7sF5x85yvCwhP1cYUuLlqaz/YfhSbRfWuDvi0fXTO7abpZ8
	bY9zPE9gsF44BabKJUr1fSGwUXpedsZ1awkki1rgcoYGBi3BFq49UBTPhvk2ZLokUJq2HluOjib
	yPCqTsP3LCZtAtKVBf0uVouwlBOWXolI=
X-Gm-Gg: AZFdTZe7AY4NV4fpcVR10zNY4UfiELaiV4puLe10+rGcpt92DoE/juYrslTfdaSsVW6
	YA68M+6WGUlVDRZGSsuwgZkGV9hGbsO94sW1IKcEQK35TIKXHpUozF81u2SnRxpx5TBWJnBBegW
	BdSmvwyHxVL/HxnH6+F2nAS7ZCfCffqo9U7Xr/D+RfnoEw22m/0mRPjjjMO6jHh/RFXvquY3WBd
	ipabdGZ9hv+smeQcB10XIzV3uUlT6TmqAOItMguTgs6kDOZkWkQhx1G8NyoVg3x0Q5q5vsmjVmu
	InPDwDorAgm2ZJ/iPk7SmZ/UvMiuNBx41MmGQIS15ZOVx6J6PYPUBnBfnn7caCOTZSdMTAn+rAA
	0bG9xvCXnoB+jcdXFi9zG3ZSIdi1AYrOiWFD1JtM=
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id
 5a478bee46e88-386a0c0757fmr16642087eec.20.1795652051165; Wed, 25 Nov 2026
 16:14:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
 <20261125072026.2997493-2-prasanth.r@lineo.co.jp> <mo4vj2higl2dmabkeslouimdgoeofqlkyjnngytv5wmub2h4w3@t2ayiiw4qaoz>
In-Reply-To: <mo4vj2higl2dmabkeslouimdgoeofqlkyjnngytv5wmub2h4w3@t2ayiiw4qaoz>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Thu, 26 Nov 2026 09:13:32 +0900
X-Gm-Features: Aa3M54oCRfqrPa_wvFbRD8sm2OXWz8lngNEw2_ns1ZE4Pa74ZiYvVwkIIJgdohE
Message-ID: <CAG7eodFb_-1RPoe8Ha97NhxWXo7BdBjkFvWNOQ7PqYO3U2KCXg@mail.gmail.com>
Subject: Re: [PATCH 01/12] rtc: snvs: clear the wake IRQ on unbind
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	imx@lists.linux.dev, Support Opensource <support.opensource@diasemi.com>, 
	Prasanth R <prasanth.r@lineo.co.jp>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, CL Wang <cl634@andestech.com>, linux-mips@vger.kernel.org, 
	Paul Cercueil <paul@crapouillou.net>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_161412_245748_8326CC22 
X-CRM114-Status: GOOD (  29.58  )
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

Hi Marco,

Thanks for the feedback. You're right, I should have added proper
error handling. I'll use dev_err_probe() and address this across the
series in the v2.

Thanks,
Prasanth

On Wed, Nov 25, 2026 at 6:18=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Hi Prasanth,
>
> thanks for the patches, please see below.
>
> On 26-11-25 16:20, Prasanth R wrote:
> > From: Prasanth R <ragaprasanth@gmail.com>
> >
> > The driver has no remove callback, so the wake IRQ set with
> > dev_pm_set_wake_irq() and the wakeup source enabled with
> > device_init_wakeup() are never released on unbind.
> >
> > When the driver is bound again, dev_pm_set_wake_irq() finds the old
> > wake IRQ, warns "wake irq already initialized" and returns -EEXIST, so
> > the driver prints "failed to enable irq wake".
> >
> > Use the device-managed variants so both are released on unbind.
> >
> > Tested on an i.MX6Q SABRE-SD board by unbinding and binding the driver
> > through sysfs.
> >
> > I used an AI assistant (Claude) to find this and write the change.
> >
> > Fixes: e7afddb2b4d2 ("rtc: snvs: use dev_pm_set_wake_irq() to simplify =
code")
> > Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> > ---
> >  drivers/rtc/rtc-snvs.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
> > index d99a352d6..647952dcd 100644
> > --- a/drivers/rtc/rtc-snvs.c
> > +++ b/drivers/rtc/rtc-snvs.c
> > @@ -383,8 +383,11 @@ static int snvs_rtc_probe(struct platform_device *=
pdev)
> >               return ret;
> >       }
> >
> > -     device_init_wakeup(&pdev->dev, true);
> > -     ret =3D dev_pm_set_wake_irq(&pdev->dev, data->irq);
> > +     ret =3D devm_device_init_wakeup(&pdev->dev);
> > +     if (ret)
> > +             dev_err(&pdev->dev, "failed to init wakeup, %d\n", ret);
>
> If there is an error you should return here. I would also suggest to at
> a proper failure handling for devm_device_init_wakeup() on all the other
> patches, albeit these drivers may not handle it today. Furthermore these
> days dev_err_probe() should be used during probe, so you have a pattern
> like:
>
> if (ret)
>         return dev_err_probe(&pdev->dev, ret, "failed to init wakeup\n");
>
> Regards,
>   Marco
>
> > +
> > +     ret =3D devm_pm_set_wake_irq(&pdev->dev, data->irq);
> >       if (ret)
> >               dev_err(&pdev->dev, "failed to enable irq wake\n");
> >
> > --
> > 2.43.0
> >
> >
> >

