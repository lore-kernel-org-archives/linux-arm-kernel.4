Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7929D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oY1srzev
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qhCwXvAyXM1RHsJVCIWLLXEAUGswl0Dh6+s1SkrTVk0=; b=oY1srzevsSBism
	R6OlFHNvbwahAhWKncS9dbHqr9n32SEHyOqquaaMI0BH+7nDPaYwPaLRGxarVLYXTRBBRtNA33Zhq
	eCbIa1KnhpZGD/yRqYPMqbpaoHp1/FVOA8HRIAGLCzXYbM2I7wKlEi427Iaj/GQ+JHLTpgXD78CrB
	WqEDg1v5ExsAuzXkV+c6x7dYeJ/zahsGgl/KwLXYE8iZrwF56ihYQEMZfk2DXQRh5gKKtAFxmM02P
	RP2hhi3u4zqZYFsDKdrbfzBY2vLICCbkDNbjm66YR9dneW7w8A44euUhEE2USutn7dVZDDxi5C7YV
	zj2lOrL3zCnfK7yD9vHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEG8-0000000AE40-0dkL;
	Wed, 25 Nov 2026 14:46:08 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEG5-0000000AE3a-2gUt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:46:07 +0000
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-949664ee41cso594879985a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617964; x=1796222764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhCwXvAyXM1RHsJVCIWLLXEAUGswl0Dh6+s1SkrTVk0=;
        b=TEWGQaYH2gtrD6b2dlEnRAztksTDimL3kmUnDYiXeIQiYbAFynD8MxvytTF8yp3suI
         qlfvKPXrTzOOqOkE2yPd07c/eY3dro48owgHTew2DE1fs/s/keajdSJXmEEudPjGWYKD
         bHDOi9OyjHosbCQeIckUdbw2ZAtpGRljvzS/rQl6IOWNIN304MRgGwEr4BXa4Ph4gLYp
         Vy8ZrnmwbmBM0FMkBTTrUkRc1wi5rJJoZFqHuUD1MGgDGndWqpm6UW4Lc3w6di6WCkXK
         OAdq6GBP3kuUy+CEVsKrYDGcSwWQqq5b/NapghE/yf5FyMph27KXluEs1d3gMaw5XjQu
         hoig==
X-Forwarded-Encrypted: i=1; AL+hErFICmWkcnkyr6OyR7bvFpdXB+Manru1K9YFLMS9ARmTNE9OZsdsA/uXVNMHGylCW80fsXgmcP8L26rWgQvsDnvY@lists.infradead.org
X-Gm-Message-State: APuU4Z+NRnhwNlfiu+TBwtOqVjZpVoMDQ0pSjNMn/lSynoX5k8FcQI1q
	N88aIZPtqPB2YqAxSG18gJxUeI99VhE/End6owFKN2Uo3nvUg04rRvZHY53bzXdd
X-Gm-Gg: AZFdTZc9wjj+phPAlOoFmroPMq90Ie9CaBODRBTnSQghq4IzOrj9oa+x2mYDndf1bXn
	8G4onQETdnz2179agbdRE/nuKLDEViDWdkkpPfFLIi85qw7YkEAqd8be8ybewCY1mTRdjU3sPMt
	PS9Xs2A/i7KRJyUY1IHHQ2mD6WzMdpe+CoFEE1XpNm7dLjBbMpL8cxQEUtr6eQoqNbW3HDZ3gj4
	cJj+tTzMJT/ansjkh+SMu1dZjKgMDC0M0qfT86Tp+Bk0hr0d5YMG1GbT5ougwmRfSOBoq0LZMTG
	LdFvRkQlDliOOfKQ3zFMaTB+BAskOt6QGbjTdKXaGmPBbHLWrEtmABi6Gn0vJU5Y0PDQwkCKItK
	MqwZuDKsH+MWf16QPlMC+wGmcRz8yiZtT24aQHCfsur5hFV+05rBgei7qqQFDKF3p9HUQ0pzU5Y
	1RW/gz56D/HRu3ZuPj+UR6vb+YGrAFpZqJOpo3clpGePYah0+Cf04GfpWzZuiE2YUwPYMBrljqY
	viIlPTrcRYhCDImAxALIOj69BADX7jkeg8/hSjvUQBNepc9Lq8vq5pRlGbNawPg6V/rJk6678/S
	orPjDpViNaex1R90zwJbkJ8dziB9yIWDwzsK7jjnEHyD6ckHsepwF1VLrwiSLoyWzRI=
X-Received: by 2002:a05:620a:450e:b0:949:5c62:e785 with SMTP id af79cd13be357-949ba9b7429mr3286343885a.21.1795617963931;
        Wed, 25 Nov 2026 06:46:03 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a0c18267esm72114085a.4.2026.11.25.06.46.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:46:03 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99e09f4c44bso1114735241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:46:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEfyB8+gi5lAW6BZWCSfSDR016JO8msyDTFSu7wdXSmNr0NwiT9YCWqIe5MbM+O66m368FIRenzwyjVUSMf1uea@lists.infradead.org
X-Received: by 2002:a05:6122:2192:b0:5ec:7589:f9e0 with SMTP id
 71dfb90a1353d-5ee8af4a3d9mr11210352e0c.11.1795617963345; Wed, 25 Nov 2026
 06:46:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
In-Reply-To: <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:45:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2BEAK27P0Da7Nei=DLaHgTdi=FiC5ZMhVegNuGwM5_Q@mail.gmail.com>
X-Gm-Features: Aa3M54o5mrxb1PGlHbFHaQn6zx-fZm6HZYf4SleH1VTd0nBeXxZvXoTTF6NrZag
Message-ID: <CAMuHMdX2BEAK27P0Da7Nei=DLaHgTdi=FiC5ZMhVegNuGwM5_Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_064605_684771_223DBECF 
X-CRM114-Status: GOOD (  21.09  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Cl=C3=A9ment,

On Thu, 19 Nov 2026 at 15:47, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> > TL;DR:
> >
> >     Describe hardware in DT, and perform mapping to abstractions offere=
d
> >     by SCMI in Linux.
>
> A question on the approach
> An SCMI variant DT could mark the CPG and MDLC status =3D "reserved" and =
point the consumers at arm,scmi, while the U-Boot IPL keeps the hardware DT=
.

In theory, yes.

Status =3D "reserved" would work fine for a leaf device (e.g. a network
interface), without further dependencies.

For core components like the CPG and MDLC its different, as every single
module on the SoCs makes use of them.

> Since v4, the series assumes the SCMI ids are stable:
>
> >   - Remove dependencies by making assumptions and dropping disputed
> >     items, to move this series forward:
> >       - Assume all SCMI IDs are stable.
> If they are, why not using them in the DT directly?

Because:
  1. They are not stable!
     We only _assumed_ they are stable, so we could relax dependencies.
     With that assumption, there is no longer a need for the (contented)
     addition of scmi_get_base_info(), which would be needed to
     distinguish among different firmware using e.g. different ID
     spaces.
     FTR, without scmi_get_base_info() we're at the same playing field
     level as some other SoCs vendors that don't bump their version
     numbers at all when making incompatible changes ;-)

  2. That can't work for now, due to limitations/deficiencies of the
     current SCMI firmware specification and/or firmware implementation.

  3. Last but not least, they are not hardware description.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

