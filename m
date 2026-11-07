Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4836A606EEB7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 00:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CbXaKlFy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0HOUp8ZP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=; b=CbXaKlFysei2AV
	W/DgkTnVGm/EykTQBP+WWwSSXDGixmY2CnDUzVKCyXDn6Re1SDuY2tx2Og+7P5xLDf6WEbpf2U/EA
	vvN2+MuWLTukV+X2fnbVVLHBXcF2yNiQ3tx5d95Dln8ZIz172wZBEh7yjhg7wfo4/bnqvY3Y+ZoSb
	0xLfZDQ9Jpl1a1JXW0T0WZ22fTXdbphrkjSATcG6IcvOAeCyadAAR6+pZbpQ1Kd5xEhYCkD0M6HQ0
	OPw4dcG9r1E/meOlEHlF7XzVHTDcytZNCcBIM/ZogsvU7Hp+HRKiJbcOQtmm2+EB0FsVepNCwJcKL
	rftmLrupBKJQza/MtIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUdX-0000000Dx4g-0puH;
	Sat, 07 Nov 2026 00:50:40 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUdO-0000000Dx4D-3sLc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 00:50:24 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8b33de9d2b1so9437297b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 16:50:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794012616; cv=none;
        d=google.com; s=arc-20260327;
        b=DXcJlhnJzeqnJTM9Bzc8NG5Q4v8ZSJkKVCR/lHo1JQ70OZqMk86JhJy6dWqOjHJzDP
         44d6CCzCNbEvZbhIahhQW8q+iHUJNl+ZEmzZOiRnewuqwWsyvDiD5VUoxbLohSF7bGui
         GUyLFMOu1Rq0Y1ajWid8mFF+ZL77YcRE0ZgLfvcIj4mSy7uatj1lD2A5KJUaw4gKxzMK
         sUUZR/0a2vpBXxuPNMvxEiYJFL7MwNJGZ7+aCy9+s5aL+mB3j52iug9SNZXDBZ5QorPw
         g0xZxS/BVFRozJR7X6AQQ8jBvVJxmK9FPUNGSBWd2Fkrsnsg5PMZfK+jYGq/aGABVNLX
         9x1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
        fh=2mj3WdNe+6TwaxoxQORHY092tVUNa+ZYM4nM9KD22yw=;
        b=rfwOPbu+0FCHhk9f68Fkk1kq9Y9ZI7EErMEmDu1dxDT1LmBC59B6i2V+JOFF0NQBTs
         y0QK2R6bBxsF0XaPxjbVGJO3OaXdrdwJKdqMM+/Rr2mVxl/fX1UefSQ1j8QM3nwhpJn5
         bRGb7L5AhNvPakkgdsoCuCUvy885gMkx3lyTN2nN3fcfM/zhz3daEYo+XIhAriprVaQk
         wV1wNPtBJX5iqd0268ydAXZLUml3mLBGRhTsHEJIS7uZYNZYXCAZMUio8l+HsbK9vIx6
         6fvjsDPy2uLuFgNcV5oYEhQ/JLLoAAAxTP6mKE/7cdVvqGrBR3QtbmJfKNWta0WJGvgw
         X/Gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794012616; x=1794617416; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
        b=0HOUp8ZP4uf3F40FXOK5oKBykcpIXMuWPXycGvWNvVMKg5DdDs/q87FTyqKM63iSbM
         0kEWX5njAup570MRCBNNXeGfcQKpkJAR+h8Oqy1JSB9gfleg8ZHjwu3s5RvtBs3PKQ9a
         vyFK9zOlfLR3T9CWdRpZ7aci7BmWEyqKMxCxdTOfS9MsgaJDnrLLFFYek2vTfr3K4fTD
         5Dlmh1jit5EL0i9Ho3FCwoTxzslgT3SssTh6H+EfZhLuE+A0aBA916Mvwj9I0zN4JrcZ
         5tDOqqpzB6fr1PR1gBRh8hiP4uPHcOHbRcYPIRQloLjEDuxeWPghJlFYjUyKPRevLIgz
         19aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794012616; x=1794617416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
        b=zfoeNLI8w1ZiU+IL6e7SdeXcAgLMmO3CD7/ihtle+e133IbNZIsSHQTz36x8aqJ15Z
         Xu6U6crna74++Yw4+76DJr3RHvV+pIi31Z98NSBoy3pAxS9gPXO8nykmrV1p8UJ8+WJb
         vqBylrdU+ndfS+9teq46cMNgu7LXbHXl/tbEY1siWyxjMuM1WB1DB1nEPTvWAWCv1kOh
         6Zpw7zzJdGAiPZCZOQ/jx74TxjRkh3FewToXCFghkkAvxqdeW3ANjO/IbRHtnBMCgczW
         ER4hchnLPIYzeXjFTE7Be7PugmR8C34NmIG/NhjsQiZeo4MnY3sM4a+Z84LoniPc1dgF
         q9tA==
X-Forwarded-Encrypted: i=1; AL+hErGvKvh+43rzV+9x/JIshOMopI2bkX0TH/rzkWQylh9M9FesLHnGOGuSeiChdwcjUC0nq+sNODe9vXh+z02QZ6KN@lists.infradead.org
X-Gm-Message-State: APuU4Z9jdISzh71610EV345O4R0s2rQU/nncUWIYxnpAwUySQNysqh9r
	lm4Vud8FzvhOUTO1BbRl8RVdFHJVdQwzrCCmPik9t/BeSwi0rMLyal+ijOpVnSvSYF6KHSh2pJQ
	s2Yiv4n79Ib8iYVVjllHlmTiN2jJzzzE=
X-Gm-Gg: AYBFou3di/6qCCBiQw7NgrmgLb89sgOxuR5YVXyyTleK/GjwhqpcH8HYgN4odS0cPp8
	Rvc55ijDtDB4skQbZVgrDpvNbuCaufWKX6wKRzRfpZRpFS1zoo7qqfeM1OdOlI0JJUeUHZnRY+S
	F9GN5gCALWU4FVcTg8e6HX60zpHnpeuAVDld/ftgB73Crv1zBTgzlumcgQ/j5lJp5+wRnq5yBmO
	obkGGh01P2NZHE6I5wbcwDJwpL21Byi3fV9xUVjf3VBwcl75/oOzPxyPf7ocHMFBTC8a/ahW+kQ
	/BVmAnQLyqeVkCBbmwt0Kdk+AEAKwqcq2xrRhtYggrRJ1ljUGjE2apT56p+thtepc7VVgKaqAz3
	jv9sJBxuw2gSYt+3iCj2gu5+v6+vgn69CSMypHlT+4Vg466yafRWW04wbSqY=
X-Received: by 2002:a05:690c:d8c:b0:8b3:f05:dd6d with SMTP id
 00721157ae682-8b34192ea67mr20495907b3.45.1794012615901; Fri, 06 Nov 2026
 16:50:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
 <20261106022907.10735-1-prasanth.padarthi10@gmail.com> <20261106022907.10735-3-prasanth.padarthi10@gmail.com>
 <71eb94df4d373d0f3afbe2a8ff880869f96e054b.camel@codeconstruct.com.au>
In-Reply-To: <71eb94df4d373d0f3afbe2a8ff880869f96e054b.camel@codeconstruct.com.au>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Sat, 7 Nov 2026 06:20:02 +0530
X-Gm-Features: AclHuK_zfgDPcux-rGy0j0Dx_Q046t2jqfjZUDa9PKNbMEPl2IK8UVzJpqMRhCY
Message-ID: <CAMFFDGgebSfVGfogTG--kpOnGNP5UxWVUGW2g_Sej_18FybNVQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: aspeed: Hand over global GPIOP
 passthrough to local mux controls
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linusw@kernel.org, Tan Siewert <tan.siewert@9elements.com>, joel@jms.id.au, 
	ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, brgl@kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_165019_065581_E0C6769C 
X-CRM114-Status: GOOD (  47.40  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

Thanks for the detailed review.

I'll address the naming, error handling, and implementation concerns
you've raised.

Regarding the necessity of the patch, on B650D4U, GPIO-only power
control failed with SCU51C[9] set. In my hardware testing, clearing
that bit allowed remote and physical-button power control to work.

However, I haven't yet established whether this requires a pinctrl
driver change or can be handled through existing initialization.

I'll investigate the existing pinctrl path further before sending
another revision.

Thanks,
Prasanth

On Fri, Nov 6, 2026 at 4:24=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Prasanth,
>
> On Fri, 2026-11-06 at 07:59 +0530, Prasanth Kumar Padarthi wrote:
> > On B650D4U, GPIO-only host power control fails when SCU51C[9]
> > enables GPIOP passthrough, even after the normal GPIO request path
> > clears the individual SCU4BC selections.
> >
> > Transfer globally selected GPIOP0-P5 THRU roles to SCU4BC[29:24]
> > before registering the controller, then clear the active shared
> > sources. Leave PWM selection and the strap-source selector unchanged.
> > Clear SCU510[28] through SCU514 and verify the shared enables cleared.
> >
> > If handover fails, retain an instance-local error and reject affected
> > GPIO and mux requests before changing their mux state. Check every
> > pin in a mux group before calling the shared helper. Retain prepared
> > local selections after partial failure rather than blindly restoring
> > a shared enable.
> >
> > Probe-time normalization policy, concurrent SCU writers and
> > post-handover registration failure remain open design questions.
> > Electrical continuity, mixed-pair forwarding, protected-write paths,
> > PWM coexistence and SCU510[28] hardware handling remain unvalidated.
> >
> > The implementation passed remote power-on, remote graceful power-off
> > and physical-button power-on tests on B650D4U with an OpenBMC Linux
> > 6.18.24-based kernel. The rebased version was ARM compile-tested on
> > v7.4-rc1 using aspeed_g5_defconfig with AST2600 pinctrl enabled.
> > With the managed-registration prerequisite, the v7.4-rc1 version
> > also completed one unbind/rebind cycle under generic KASAN on
> > B650D4U hardware and in AST2600 QEMU. Host power operations have
> > not been retested with the v7.4-rc1 kernel.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> > ---
> >  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 145 ++++++++++++++++++++-
> >  1 file changed, 141 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed-g6.c
> > index 85d6640ff..be22a9184 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > @@ -4,7 +4,10 @@
> >  #include <linux/init.h>
> >  #include <linux/io.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> >  #include <linux/pinctrl/pinctrl.h>
> >  #include <linux/pinctrl/pinmux.h>
> >  #include <linux/types.h>
> > @@ -36,6 +39,8 @@
> >  #define SCU4D8               0x4D8 /* Multi-function Pin Control #23 *=
/
> >  #define SCU500               0x500 /* Hardware Strap 1 */
> >  #define SCU510               0x510 /* Hardware Strap 2 */
> > +#define SCU514               0x514 /* Hardware Strap 2 Clear */
> > +#define SCU51C               0x51c /* Hardware Strap 3 */
> >  #define SCU610               0x610 /* Disable GPIO Internal Pull-Down =
#0 */
> >  #define SCU614               0x614 /* Disable GPIO Internal Pull-Down =
#1 */
> >  #define SCU618               0x618 /* Disable GPIO Internal Pull-Down =
#2 */
> > @@ -2743,12 +2748,56 @@ static struct aspeed_pinctrl_data aspeed_g6_pin=
ctrl_data =3D {
> >       .nconfmaps =3D ARRAY_SIZE(aspeed_g6_pin_config_map),
> >  };
> >
> > +struct aspeed_g6_probe_data {
> > +     struct aspeed_pinctrl_data pdata;
> > +     int thru_error;
> > +};
> > +
> > +static bool aspeed_g6_is_thru_pin(unsigned int pin)
> > +{
> > +     return pin >=3D AB22 && pin <=3D AB23;
> > +}
> > +
> > +static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
> > +                                      struct pinctrl_gpio_range *range=
,
> > +                                      unsigned int offset)
> > +{
> > +     struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(pct=
ldev);
> > +     struct aspeed_g6_probe_data *g6 =3D
> > +             container_of(pdata, struct aspeed_g6_probe_data, pdata);
> > +
> > +     if (g6->thru_error && aspeed_g6_is_thru_pin(offset))
> > +             return g6->thru_error;
> > +
> > +     return aspeed_gpio_request_enable(pctldev, range, offset);
> > +}
> > +
> > +static int aspeed_g6_set_mux(struct pinctrl_dev *pctldev,
> > +                          unsigned int function, unsigned int group)
> > +{
> > +     struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(pct=
ldev);
> > +     struct aspeed_g6_probe_data *g6 =3D
> > +             container_of(pdata, struct aspeed_g6_probe_data, pdata);
> > +     const struct aspeed_pin_group *pgroup =3D &pdata->pinmux.groups[g=
roup];
> > +     unsigned int i;
> > +
> > +     /* Check the entire group before the shared helper changes any pi=
n. */
> > +     if (g6->thru_error) {
> > +             for (i =3D 0; i < pgroup->npins; i++) {
> > +                     if (aspeed_g6_is_thru_pin(pgroup->pins[i]))
> > +                             return g6->thru_error;
> > +             }
> > +     }
> > +
> > +     return aspeed_pinmux_set_mux(pctldev, function, group);
> > +}
> > +
> >  static const struct pinmux_ops aspeed_g6_pinmux_ops =3D {
> >       .get_functions_count =3D aspeed_pinmux_get_fn_count,
> >       .get_function_name =3D aspeed_pinmux_get_fn_name,
> >       .get_function_groups =3D aspeed_pinmux_get_fn_groups,
> > -     .set_mux =3D aspeed_pinmux_set_mux,
> > -     .gpio_request_enable =3D aspeed_gpio_request_enable,
> > +     .set_mux =3D aspeed_g6_set_mux,
> > +     .gpio_request_enable =3D aspeed_g6_gpio_request_enable,
> >       .strict =3D true,
> >  };
> >
> > @@ -2778,15 +2827,103 @@ static const struct pinctrl_desc aspeed_g6_pin=
ctrl_desc =3D {
> >       .confops =3D &aspeed_g6_conf_ops,
> >  };
> >
> > +/*
> > + * Experimental: transfer the global GPIOP0-P5 THRU selection to the
> > + * individual mux controls before registering any pinctrl consumers.
> > + * PWM selection is higher priority and is deliberately left unchanged=
.
> > + *
> > + * Do not undo the local selections on error: a shared enable may alre=
ady
> > + * have cleared. Keeping the equivalent local selections preserves rou=
ting
> > + * while rejecting affected requests, rather than granting an unsafe G=
PIO.
> > + * Signal continuity during this transfer still needs hardware validat=
ion.
> > + */
> > +static int aspeed_g6_thru_handover(struct regmap *scu)
> > +{
> > +     const u32 local_mask =3D GENMASK(29, 24);
>
> Defining a variable with the value (even though that variable is
> qualified const) means it's not an integer constant expression, which
> may impede some optimisations.
>
> Further, local_mask is not a descriptive name for what's occurring
> here. Please name the mask in terms of its behaviour. Perhaps:
>
> #define GPIOP_UNGROUPED_PASSTHROUGH_MASK GENMASK(29, 24)
>
> > +     unsigned int strap2, strap3, local;
>
> Please lets improve on the name 'local'. Perhaps: ungrouped_passthrough
>
> > +     int ret;
> > +
> > +     ret =3D regmap_read(scu, SCU510, &strap2);
> > +     if (ret)
> > +             return ret;
>
> Consider this error-handling strategy:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/pinctrl/pinctrl-gemini.c?h=3Dv7.4-rc1#n2556
>
> If the first read doesn't work, then we can't expect any of the further
> accesses by the core aspeed pinctrl implementation to work either, so
> we can just bail out entirely in the caller.
>
> > +     ret =3D regmap_read(scu, SCU51C, &strap3);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!(strap2 & BIT(28)) &&
> > +         ((strap2 & BIT(30)) || !(strap3 & BIT(9))))
>
> Please give these bits named macros. This is not easy to comprehend as
> it is.
>
> Also, consider FIELD_GET() from include/linux/bitfield.h. Something
> like:
>
>    if (!FIELD_GET(OTPSTRAP_ENABLE_GPIO_PASSTHROUGH, strap2) &&
>        (FIELD_GET(OTPSTRAP_ENABLE_DEDICATED_STRAP_PINS, strap2) ||
>            !(FIELD_GET(STRAP_ENABLE_GPIO_PASSTHROUGH, strap3)))
>
>
> > +             return 0;
> > +
> > +     /* Preserve every globally selected role, including under PWM. */
>
> This comment feels like a classic LLM statement that somehow manages to
> be simultaneously both too abstract and too detailed, while also devoid
> of context, all in 8 words.
>
> Can we rather say that the PWM functions on these pins are higher
> priority in the mux than the pass-through GPIO function, so if PWM is
> already selected, then the following write does not affect the PWM
> configuration?
>
> > +     ret =3D regmap_update_bits(scu, SCU4BC, local_mask, local_mask);
> > +     if (ret)
> > +             return ret;
> > +     ret =3D regmap_read(scu, SCU4BC, &local);
> > +     if (ret)
> > +             return ret;
> > +     if ((local & local_mask) !=3D local_mask)
> > +             return -EPERM;
>
> Please add a comment here about the write-protection in SCUF30.
>
> > +
> > +     /* Leave the inactive GPIOZ6 source alone in dedicated-strap mode=
. */
>
> 'dedicated strap mode' is a confusing statement because ASPEED's
> documentation is confusing. I think we can drop this comment with
> regard to making other improvements.
>
> > +     if (!(strap2 & BIT(30)) && (strap3 & BIT(9))) {
>
> We've already inspected these bit values previously. Please consider
> extracting them to bool variables for re-use and to improve everyone's
> ability to comprehend the expression.
>
> > +             ret =3D regmap_update_bits(scu, SCU51C, BIT(9), 0);
>
> Essentially, having configured the ungrouped passthrough functions
> above, we can now de-configure the grouped passthrough function in
> strap3 (SCU51C).
>
> It's probably worth noting in a comment that SCU51C cannot be write-
> protected.
>
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (strap2 & BIT(28)) {
> > +             /* SCU510 is write-one-set; do not use an ordinary RW cle=
ar. */
> > +             ret =3D regmap_write(scu, SCU514, BIT(28));
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret =3D regmap_read(scu, SCU510, &strap2);
> > +     if (ret)
> > +             return ret;
> > +     ret =3D regmap_read(scu, SCU51C, &strap3);
> > +     if (ret)
> > +             return ret;
> > +     if ((strap2 & BIT(28)) ||
> > +         (!(strap2 & BIT(30)) && (strap3 & BIT(9))))
> > +             return -EPERM;
>
> This appears to be the negated expression of the earlier one, and given
> we're only returning a fixed value in either case, you could rather use
> the same expression again. Given it's repeated, you could extract it to
> a macro or static inline function.
>
> > +
> > +     return 0;
> > +}
> > +
> >  static int aspeed_g6_pinctrl_probe(struct platform_device *pdev)
> >  {
> > -     int i;
> > +     struct aspeed_g6_probe_data *g6;
> > +     struct regmap *scu;
> > +     int i, ret;
> > +
> > +     if (!pdev->dev.parent)
> > +             return -ENODEV;
> > +     scu =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> > +     if (IS_ERR(scu))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(scu),
> > +                                  "No SCU regmap for THRU handover\n")=
;
> > +
> > +     g6 =3D devm_kzalloc(&pdev->dev, sizeof(*g6), GFP_KERNEL);
> > +     if (!g6)
> > +             return -ENOMEM;
> > +     memcpy(&g6->pdata, &aspeed_g6_pinctrl_data, sizeof(g6->pdata));
>
> This seems unfortunate.
>
> Have you considered other approaches?
>
> > +
> > +     ret =3D aspeed_g6_thru_handover(scu);
>
> Must this logic be separate to the usual set_mux path? If not, I expect
> we don't need to retain thru_error.
>
> > +     if (ret =3D=3D -EPROBE_DEFER)
>
> Do you have an example of how ret could be -EPROBE_DEFER?
>
> > +             return ret;
> > +     if (ret) {
>
> If this handover logic is to be integrated here, can you please test
> for specific return values to separate the regmap access failure from
> the write-protection failure?
>
> Related, I've heard opinions from Tan that this patch is not necessary
> to get the platform booting. Given the current complexity, I'm
> interested to hear whether you can do without it.
>
> Andrew

