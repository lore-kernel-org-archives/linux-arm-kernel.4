Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B395A606EEF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vat7R4fl;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=yUe7/S0S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y2+SCNl1g+fUz/U7qKDHB1BkCucwWSgvxXfo/ANkBxE=; b=Vat7R4flex8eFE
	fQBQOg+cS41HfayxeRAGfHS3STBPRrLxsLiTWpQpcw5+AMU+apLfjNprC3G/PvvetOU4S+rMMKACh
	YKXrhjuyu4I43vusLyvxCNCayclaab0ke+3L0RLAv83uuIMrOumKJfAeXhPhghZGsafeHOPlGcaL8
	aPJQ2LVtDe2opSQb6KTGe4oYDAdzt84YZ6K4Lma91q6Chn+oLrgBUBvES/9LYDapimdcCIUuhGmal
	zgPXEVoJ4Wih+F/cA4PMz8JgDHvQ1ue39lXjPdLuRSPucKBdcCZuMbuxGHjnm2d2KhDEiGH6q56kZ
	XAXWei+QsNphytHV/1rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi3g-00000003FTr-1jNs;
	Tue, 10 Nov 2026 09:22:28 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi3e-00000003FTC-1Aln
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:22:27 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso2057512a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:22:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794302544; cv=none;
        d=google.com; s=arc-20260327;
        b=Lmyz3f4VismxpWrrWljiDrUUkwHbni+utZJ0UPYjq9lfF3VRyMEBeBFRRsvghL0GkO
         ySk7hVS5bZA5d5W2UVJkW8/1QS2ueRT6H4jHdYV3eNxTxXfO8UXxdhYyRDIslzUJHHZN
         gafhkPzG2PE9hq/CadHXypp1cgPcmEZhU/qZjh/i6NyVRtCu5yzcxngm1D/j9s2bXsQM
         YyDqn4l9ntkqppHRO9iP0T+K9tKxNIBh0WbeULndN6xD+sAxdC27MGUfgHCQ4XyEGRQc
         VDBPoGOV6ta7/S2ZONZMJSHPFlCDoK0gszmiVduZxQ26CIS8sTpUArQLRiTd+hORwHj4
         mwDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2+SCNl1g+fUz/U7qKDHB1BkCucwWSgvxXfo/ANkBxE=;
        fh=TMROkySDT9RhqwbpRfz6q3LUIlIqTMF6twLZtjmAp6U=;
        b=BkfIqeYAtKh2ND5rbAISbBjtNa255MP6sZKr+leJjwvqCwFJl7yOl7oz6+JR1Ftp4R
         XtQJHzddcEqKFdwZK//j2VskMvE3o6lEm2VQOgBdqzdAuxKMcU6zsk1F8B8fCGEAWbK5
         TCrWxsi8d37FYwXsI3msEV9ccKaYDat4bGCEwuCCZ+OM5lorfrIJEjh7d7GbK5jjKvta
         lHGH9Lp3qsosgHGsz1lF1QrPXoHECfuBF+Tmn3MJqK8XMcaBKY3vokF55VkKMbfW+Npd
         i99NQg9MGI31IZ4NlSIcN2bipVpSCSIs0PlTituHx65BJVxRnNUz+cgn15jz+sbfE0hB
         Nh2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794302544; x=1794907344; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2+SCNl1g+fUz/U7qKDHB1BkCucwWSgvxXfo/ANkBxE=;
        b=yUe7/S0SRvZM6JitXHk/3Fl3a6jNV3ZY/ZQcz600KGZxJaR8cga9E3Nt9hnQNYBmE1
         vYSBt5apA+Zv7V7KdLj2xFqy5s55OGmaKXxN3cIME2+wV9QPb9O5lO0g6WU9RGZtQl08
         rEmH0hGx0U+gM9dyL2BE8Ya3jD3bwNDMpNFB75Qfy/oCqVXYjzHKqGRZARVGFbgk8Uol
         MekUoQLYBrFvFX74CgK0tq4JJXeKbfIGiyHJWxr6I5AQTTdBB8qTIRapzxUf7nQDAcqD
         ubKBn/22DYgC4CSoIa+rci1MBSq9QsrVhXmyag4Jbc/cPHWTYSH/kghIBHavg6e+zrwo
         xCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302544; x=1794907344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2+SCNl1g+fUz/U7qKDHB1BkCucwWSgvxXfo/ANkBxE=;
        b=fJP3gptDGMq0Xhh6Q+U8PV+vawVPjLRnWRtbCP1r/jWOm40MOQfPGfXfOa05nClioV
         GvEycJBJ/xDrE/3NE+46+wcAW+YTbgWIZS+9ls542cOzaRYDVFyxtPecw+A9rhDhvumb
         W4LsqVvPBNa76r9aGgO49DUEqXo95GeiS23h/1g2C+nUx+5/Srmc76WdKOuY2XZjQsfe
         dyHJ4Vi8UU/hNgBt3nEOUl7ClHNQexRyjsvzi0PLH7RxVZ0/TX/vdai9rSGg7RjxhwMT
         liwkaWpPr42fcNI/tRKXoA8E/B5e/TotPL7pSDzNuz8dR8+7IV59C8QdWFF1i1Zr8paY
         qw2w==
X-Forwarded-Encrypted: i=1; AL+hErENIFMeB/F28wzPY9gCUbiqO1QFgk4jgPXQxHuyxakLs1nsnx00U0OP67CLFCHNmBriR7aPeek6c4QB0GsktQsO@lists.infradead.org
X-Gm-Message-State: APuU4Z88UHwNXBv63czufKkv+ZTZHZlsXW1YdCn2EoXT6YRLxCGzAgLV
	/Tg2jbWRFqBDwAp7UQMhImA4rf7PEWyRdbO6xysXLVFDwWIyrltmgG8CNfhnBqs+DLit2m/ie97
	2qlsL/A9FBTR9/prE25Bx4XoicA8FU17vRnMB08Mwdg==
X-Gm-Gg: AYBFou1HmYoCMFK0SRBKbyYhg7uoqinfl0sO6PHrpQqH6AVoFjcPxoztIUJ2hT+HLvB
	/15FUh/QSVF8MweRoTsMpMYkTdu5fOrco6Cco4WPeQeXFroSRyZmJIUNcckuJwuZa+2C9CDw2/d
	9h4viyq97JyVcL2ePKxUS++XKeYSqbjSQVmJOmt/srge36XeHUeespnossQeRNbfbRjAtGVFvWm
	pNJ0r0J9/tH/CpWK6CA5lUaanRCw54MxxK2Xil109X6N17G0mLVdhfBR3dd5PJUU2B2JAKWLdYj
	2NwUgke6cLSdQdsrIV8RJNEvzQip9vTHJOHsVwTHSiz1ydBOrqxj6jmgzGemIOEC7+R/RuO4TfX
	mR/+6Br6uBBW7PQGkvvrO5jtB7SjG5DIiTpLghXIH6K6DMcbp57/uF0NVkUkEREjfZS2ioPls0l
	+vzLZJ7KTf4N9zyNiBdQ==
X-Received: by 2002:aa7:d691:0:b0:6b4:206d:724b with SMTP id
 4fb4d7f45d1cf-6b7564be0dbmr1242231a12.7.1794302544016; Tue, 10 Nov 2026
 01:22:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109133609.810876-1-robert.marko@sartura.hr>
 <20261109133609.810876-3-robert.marko@sartura.hr> <e189dcb8-1cbd-4629-85dc-1b73243806fd@roeck-us.net>
In-Reply-To: <e189dcb8-1cbd-4629-85dc-1b73243806fd@roeck-us.net>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 10 Nov 2026 10:22:12 +0100
X-Gm-Features: AclHuK9j1ZB9DgxmBU3BCdoMkXb15eczBUGWQkCKPQtctapS4pYm4i7sf3JyTXQ
Message-ID: <CA+HBbNHWVEJb+YHt1FLHSihO++6=kKEeOnazX_58cMUSbMfwQA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] hwmon: sparx5: add LAN969x fan monitoring support
To: Guenter Roeck <linux@roeck-us.net>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_012226_497684_68DA700B 
X-CRM114-Status: GOOD (  42.13  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 12:51=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On Mon, Nov 09, 2026 at 02:35:07PM +0100, Robert Marko wrote:
> > LAN969x has a fan controller with a tachometer in a register block
> > separate from its Sparx5-compatible temperature sensor. Match the fan
> > node independently and expose fan1_input on its own hwmon device.
> >
> > Read the optional pulses-per-revolution property from the fan child.
> > Preserve the temperature-only behavior of existing device trees.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>
> I don't see the point of keeping this as single driver with two completel=
y
> different sets of functionality. If you want to have two instances, pleas=
e
> make it separate drivers.

In v1 it was the same instance but then DT maintainers pointed out
that it should be different nodes at least.

I will split it into a separate driver in v3.

Regards,
Robert

>
> Thanks,
> Guenter
>
> > ---
> > Changes in v2:
> > - Register fan and temperature monitoring as separate hwmon devices.
> > - Reject a present but malformed pulses-per-revolution property.
> >
> >  Documentation/hwmon/sparx5-temp.rst |   9 ++
> >  drivers/hwmon/Kconfig               |   7 +-
> >  drivers/hwmon/sparx5-temp.c         | 146 ++++++++++++++++++++++++----
> >  3 files changed, 139 insertions(+), 23 deletions(-)
> >
> > diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/=
sparx5-temp.rst
> > index 0140809089542..a053d12fbdbbb 100644
> > --- a/Documentation/hwmon/sparx5-temp.rst
> > +++ b/Documentation/hwmon/sparx5-temp.rst
> > @@ -15,6 +15,10 @@ Supported chips:
> >
> >  Author: Lars Povlsen <lars.povlsen@microchip.com>
> >
> > +The driver also supports the Microchip LAN969x temperature sensor and =
fan
> > +controller as separate devices. The fan controller uses the
> > +microchip,lan9691-fan compatible.
> > +
> >  Description
> >  -----------
> >
> > @@ -30,4 +34,9 @@ The following attributes are supported.
> >
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >  temp1_input          Die temperature (in millidegree Celsius.)
> > +fan1_input              Fan speed in RPM (LAN969x only).
>
> FWIW, this is misleading. One instance will support the temperature, a
> separate hwmon device will support the fan. Really, if you want to have
> two separate devices, make it two separate drivers.
>
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +The tachometer counts pulses over one-second intervals, independently =
of the
> > +PWM output. The fan child's pulses-per-revolution property specifies h=
ow many
> > +pulses represent one revolution; it defaults to two.
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 3ae676a56d95c..deb9eb82b8501 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -669,11 +669,12 @@ config SENSORS_I5K_AMB
> >         will be called i5k_amb.
> >
> >  config SENSORS_SPARX5
> > -     tristate "Sparx5 SoC temperature sensor"
> > +     tristate "Sparx5 and LAN969x SoC hardware monitoring"
> >       depends on ARCH_SPARX5 || ARCH_LAN969X || COMPILE_TEST
> >       help
> > -       If you say yes here you get support for temperature monitoring
> > -       with the Microchip Sparx5 SoC.
> > +       If you say yes here you get support for temperature monitoring =
on
> > +       Microchip Sparx5 and LAN969x SoCs, as well as fan monitoring on
> > +       LAN969x SoCs.
>
> Same here. Based on the description and the documentation, a user would n=
ot
> expect to get two separate hardware monitoring devices.
>
> >
> >         This driver can also be built as a module. If so, the module
> >         will be called sparx5-temp.
> > diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
> > index 0fd5c147f8167..1f197004780cc 100644
> > --- a/drivers/hwmon/sparx5-temp.c
> > +++ b/drivers/hwmon/sparx5-temp.c
> > @@ -9,8 +9,11 @@
> >  #include <linux/hwmon.h>
> >  #include <linux/init.h>
> >  #include <linux/io.h>
> > +#include <linux/kernel.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >
> >  #define TEMP_CTRL            0
> >  #define TEMP_CFG             4
> > @@ -20,9 +23,26 @@
> >  #define  TEMP_STAT_VALID     BIT(12)
> >  #define  TEMP_STAT_TEMP              GENMASK(11, 0)
> >
> > +#define FAN_CFG                      0
> > +#define  FAN_CFG_GATE_ENA    BIT(2)
> > +#define  FAN_CFG_STAT_MODE   BIT(0)
> > +#define FAN_PWM_FREQ         4
> > +#define  FAN_PWM_FREQ_CYCLES GENMASK(27, 16)
> > +#define FAN_CNT                      8
> > +#define  FAN_CNT_DATA                GENMASK(15, 0)
> > +
> > +#define FAN_TACH_INTERVAL_HZ 100000
> > +
> > +struct s5_match_data {
> > +     bool is_fan;
> > +};
> > +
> >  struct s5_hwmon {
> >       void __iomem *base;
> > +     void __iomem *fan;
> >       struct clk *clk;
> > +     unsigned long clk_rate;
> > +     u32 pulses_per_revolution;
> >  };
> >
> >  static void s5_temp_enable(struct s5_hwmon *hwmon)
> > @@ -37,6 +57,24 @@ static void s5_temp_enable(struct s5_hwmon *hwmon)
> >       writel(val, hwmon->base + TEMP_CFG);
> >  }
> >
> > +static void s5_fan_enable(struct s5_hwmon *hwmon)
> > +{
> > +     u32 cycles, val;
> > +
> > +     cycles =3D DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_TACH_INTERVAL_H=
Z);
> > +     cycles =3D clamp_val(cycles, 1, FIELD_MAX(FAN_PWM_FREQ_CYCLES));
> > +
> > +     val =3D readl(hwmon->fan + FAN_PWM_FREQ);
> > +     val &=3D ~FAN_PWM_FREQ_CYCLES;
> > +     val |=3D FIELD_PREP(FAN_PWM_FREQ_CYCLES, cycles);
> > +     writel(val, hwmon->fan + FAN_PWM_FREQ);
> > +
> > +     /* Count all tachometer pulses over one-second intervals. */
> > +     val =3D readl(hwmon->fan + FAN_CFG);
> > +     val &=3D ~(FAN_CFG_STAT_MODE | FAN_CFG_GATE_ENA);
> > +     writel(val, hwmon->fan + FAN_CFG);
> > +}
> > +
> >  static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
> >  {
> >       int value;
> > @@ -62,6 +100,17 @@ static int s5_read_temp(struct s5_hwmon *hwmon, lon=
g *temp)
> >       return 0;
> >  }
> >
> > +static int s5_read_fan(struct s5_hwmon *hwmon, long *val)
> > +{
> > +     u32 count;
> > +
> > +     count =3D readl_relaxed(hwmon->fan + FAN_CNT);
> > +     count =3D FIELD_GET(FAN_CNT_DATA, count);
> > +     *val =3D count * 60 / hwmon->pulses_per_revolution;
> > +
> > +     return 0;
> > +}
> > +
> >  static int s5_read(struct device *dev, enum hwmon_sensor_types type,
> >                  u32 attr, int channel, long *val)
> >  {
> > @@ -72,6 +121,10 @@ static int s5_read(struct device *dev, enum hwmon_s=
ensor_types type,
> >               if (attr =3D=3D hwmon_temp_input)
> >                       return s5_read_temp(hwmon, val);
> >               break;
> > +     case hwmon_fan:
> > +             if (attr =3D=3D hwmon_fan_input && hwmon->fan)
> > +                     return s5_read_fan(hwmon, val);
> > +             break;
> >       default:
> >               break;
> >       }
> > @@ -82,62 +135,115 @@ static int s5_read(struct device *dev, enum hwmon=
_sensor_types type,
> >  static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_type=
s type,
> >                            u32 attr, int channel)
> >  {
> > -     if (type !=3D hwmon_temp)
> > -             return 0;
> > +     const struct s5_hwmon *hwmon =3D _data;
> >
> > -     switch (attr) {
> > -     case hwmon_temp_input:
> > -             return 0444;
> > +     switch (type) {
> > +     case hwmon_temp:
> > +             return attr =3D=3D hwmon_temp_input ? 0444 : 0;
> > +     case hwmon_fan:
> > +             if (hwmon->fan && attr =3D=3D hwmon_fan_input)
> > +                     return 0444;
> > +             return 0;
> >       default:
> >               return 0;
> >       }
> >  }
> >
> > -static const struct hwmon_channel_info * const s5_info[] =3D {
> > +static const struct hwmon_channel_info * const s5_temp_info[] =3D {
> >       HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> >       HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> >       NULL
> >  };
> >
> > +static const struct hwmon_channel_info * const s5_fan_info[] =3D {
> > +     HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> > +     NULL
> > +};
> > +
> >  static const struct hwmon_ops s5_hwmon_ops =3D {
> >       .is_visible =3D s5_is_visible,
> >       .read =3D s5_read,
> >  };
> >
> > -static const struct hwmon_chip_info s5_chip_info =3D {
> > +static const struct hwmon_chip_info s5_temp_chip_info =3D {
> >       .ops =3D &s5_hwmon_ops,
> > -     .info =3D s5_info,
> > +     .info =3D s5_temp_info,
> > +};
> > +
> > +static const struct hwmon_chip_info s5_fan_chip_info =3D {
> > +     .ops =3D &s5_hwmon_ops,
> > +     .info =3D s5_fan_info,
> >  };
> >
> >  static int s5_temp_probe(struct platform_device *pdev)
> >  {
> > +     const struct s5_match_data *match_data;
> > +     struct device *dev =3D &pdev->dev;
> >       struct device *hwmon_dev;
> >       struct s5_hwmon *hwmon;
> > +     struct device_node *fan_np __free(device_node) =3D NULL;
> > +     void __iomem *base;
> > +     bool is_fan;
> > +     int ret;
> >
> > -     hwmon =3D devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
> > +     match_data =3D device_get_match_data(dev);
> > +     is_fan =3D match_data && match_data->is_fan;
> > +
> > +     hwmon =3D devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
> >       if (!hwmon)
> >               return -ENOMEM;
> >
> > -     hwmon->base =3D devm_platform_ioremap_resource(pdev, 0);
> > -     if (IS_ERR(hwmon->base))
> > -             return PTR_ERR(hwmon->base);
> > +     base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(base))
> > +             return PTR_ERR(base);
> > +
> > +     if (is_fan) {
> > +             hwmon->fan =3D base;
> > +             hwmon->pulses_per_revolution =3D 2;
> > +             fan_np =3D of_get_available_child_by_name(dev->of_node, "=
fan");
> > +             if (fan_np &&
> > +                 of_property_present(fan_np, "pulses-per-revolution"))=
 {
> > +                     ret =3D of_property_read_u32(fan_np, "pulses-per-=
revolution",
> > +                                                &hwmon->pulses_per_rev=
olution);
> > +                     if (ret)
> > +                             return dev_err_probe(dev, ret,
> > +                                                  "invalid pulses-per-=
revolution\n");
> > +             }
> > +             if (!hwmon->pulses_per_revolution ||
> > +                 hwmon->pulses_per_revolution > 4)
> > +                     return dev_err_probe(dev, -EINVAL,
> > +                                          "invalid pulses-per-revoluti=
on\n");
> > +     } else {
> > +             hwmon->base =3D base;
> > +     }
> >
> > -     hwmon->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> > +     hwmon->clk =3D devm_clk_get_enabled(dev, NULL);
> >       if (IS_ERR(hwmon->clk))
> >               return PTR_ERR(hwmon->clk);
> > +     hwmon->clk_rate =3D clk_get_rate(hwmon->clk);
> >
> > -     s5_temp_enable(hwmon);
> > +     if (is_fan)
> > +             s5_fan_enable(hwmon);
> > +     else
> > +             s5_temp_enable(hwmon);
> >
> > -     hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev,
> > -                                                      "s5_temp",
> > -                                                      hwmon,
> > -                                                      &s5_chip_info,
> > -                                                      NULL);
> > +     hwmon_dev =3D devm_hwmon_device_register_with_info(dev,
> > +                                     is_fan ? "lan969x_fan" : "s5_temp=
", hwmon,
> > +                                     is_fan ? &s5_fan_chip_info :
> > +                                              &s5_temp_chip_info, NULL=
);
> >
> >       return PTR_ERR_OR_ZERO(hwmon_dev);
> >  }
> >
> > +static const struct s5_match_data lan969x_fan_match_data =3D {
> > +     .is_fan =3D true,
> > +};
> > +
> >  static const struct of_device_id s5_temp_match[] =3D {
> > +     {
> > +             .compatible =3D "microchip,lan9691-fan",
> > +             .data =3D &lan969x_fan_match_data,
> > +     },
> >       { .compatible =3D "microchip,sparx5-temp" },
> >       {},
> >  };
> > @@ -154,5 +260,5 @@ static struct platform_driver s5_temp_driver =3D {
> >  module_platform_driver(s5_temp_driver);
> >
> >  MODULE_AUTHOR("Lars Povlsen <lars.povlsen@microchip.com>");
> > -MODULE_DESCRIPTION("Sparx5 SoC temperature sensor driver");
> > +MODULE_DESCRIPTION("Sparx5 SoC hardware monitoring driver");
> >  MODULE_LICENSE("GPL");



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

