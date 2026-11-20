Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60B6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 07:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TJOpox6H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VaLwNIkn55D7JevqcpHCVmOWA4zFnE98rOcR5xGlqds=; b=TJOpox6HgT/9Ulrh9sTlZkHtp9
	2uKm+n9MSW9JJaR6uXCKILAqYW/x5MfbOoOXFjbfO1fBdphyVGNPYCCqBOUMVO1wzqnS/aDTmne5X
	UnZf9lWHbFa7XdHW64D1rgwmybipNFW8JJAIj68RUOkEwYOL+fqLCTTRm86iEJcJ2zvBuf6sQC6Ru
	dtM3pFLxM8dhZTpwM+IsCnURBYX0u9jhDoNFekjAWnj0Mu+ekyy6tYCtLSB0pGVzrslfTtVpDo2OZ
	o+M1+GZae7D1vLZYC4BWmHFJ0z7U79oR1yii2AOKpAZkgpTHQxmDwUc23hBMRaADNTe3CAlqmjOm3
	+3y0uBQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJUQ-0000000EHbL-3jIc;
	Fri, 20 Nov 2026 07:56:58 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJUO-0000000EHan-2LUw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 07:56:57 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7d2da1667b2so366767137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 23:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161415; x=1795766215;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VaLwNIkn55D7JevqcpHCVmOWA4zFnE98rOcR5xGlqds=;
        b=XGMi99wCLNgXh9spSBvInvmSTF8MOJescs1yYGG/hmq2RN8Mmb3VhyIRqnhajr2GTx
         FhEmgfe/FRBtto2qAWO14HIEmADJsaaF05b8O3ocAyvhKHKdcTaNzUlflGnyyaQrXN8x
         0BZSH3BXXm2Cxl5r/wqNMjsPG2TkbqUHGZ05s+u1o5XHoxdzhgyn/NLAfi3YfcDRtVVZ
         yitwc+5jyV70CJa7tWm7au8CM47l/3JERHud9Vt8MIva4yCVwg6tTnQ4Obo374kdzZbA
         7+m5JspeQQRZwsb8GMh0FJw/2H9JBvMOViqTctqWmfjx5pAAcFILaXEYoMdc9Mw4eE5j
         xyJQ==
X-Forwarded-Encrypted: i=1; AL+hErEM7HuHsPTTrnSQQftyObh0eAOzwcjGMjiFcH/oHhmq7on7blgzrBJfBCgkPU3lAGWL93r+z7f99hyxMGNViZkM@lists.infradead.org
X-Gm-Message-State: APuU4Z8cHsj515sWwpJOmrOSAiB9mnGZAHOGLxtMLlDng/oGZA6vPhN9
	UjbbbkNerHspRbfEPrDHG6oQf9F5WXRxmKeGLni+q8Y30Qf65Rb0ScTQBzbdqcph
X-Gm-Gg: AZFdTZcXtpQ/rhz6Oo5vKRkwehv9V1U5pXVAGv+UX+FsFmJRC5FBhAKDgvsWWm7Xu6t
	D7I53qufzC8bneBqu31OhYvdngFKQpJnGNekbqtiFyQfgdO2uoVVNh9wQenDGiARXLNDxXD6p86
	oQM6yk0095N7tOizkIs86FX4mGGlrCERGE3oKhacT3OWuwFAYIMyolVSWXamCFnqyhf3yILxucE
	16RQ8HF+GrGsgSkttZlnB4XRZBXB08juXHtbT3GvQWzQ0XWj2unWqUACfs4+J4OW0muK8w2xrCL
	/c7SAwJdvJGD7tK7vhK+mnF1vG49u8NaloTehyJxZAtGaPwFTXrekInPxcJXAfXAEkmM42xHf/G
	zfy3zgoBZm5xRv7MCuqfKSzMPdS8+h+CK4XON6r0Y+loHu8M6OJ+YJ66LpuDvpHCSxGKUvTLuKD
	gzMmFx7QlkAB8YqUzM/MMEp91kAmN1m/DVI0WD/37MZSsnCZy9NLgup2j7cXkCW0TIpoId2FkRs
	lsQHubxRWEV2iUuJfYevySfGzze+X7awy0LiTlXmBD4ycK7994s4im8bDgS0FmhDbE8R5yDWsVg
	VKWaSrbePh3VhAQDJnP9k93MJnBBab7O3E4FozruuWNkJ1vSuvJdTB8A1lRh4gWh3K4=
X-Received: by 2002:a05:6102:f0a:b0:7d0:3eca:a872 with SMTP id ada2fe7eead31-7d7395725f1mr811277137.27.1795161415294;
        Thu, 19 Nov 2026 23:56:55 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f3d7bcsm2245861137.4.2026.11.19.23.56.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:56:55 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7d2bf046d7fso337273137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 23:56:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHRsTBGZsFt3Z1lOtFw11XkqAU7gerzpdtc598fpGwj5eK195Jfm4hCMSzTocLanyOx+Dtk4+48OtDBTysxmIJ1@lists.infradead.org
X-Received: by 2002:a05:6102:448b:b0:7cc:26a8:e726 with SMTP id
 ada2fe7eead31-7d739567d98mr1003780137.26.1795161415051; Thu, 19 Nov 2026
 23:56:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <cee843b319c9eceba2339f14a134e305a2b05d7e.1795029012.git.geert+renesas@glider.be>
 <57d2cc58-15ac-434e-ab40-7a8a54d93a1f@mailbox.org>
In-Reply-To: <57d2cc58-15ac-434e-ab40-7a8a54d93a1f@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 08:56:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXS4ZTxLBrZoNycHUzdUp9QsisfA7CcBPyAGw7zTuSoA@mail.gmail.com>
X-Gm-Features: Aa3M54pzvZjiNE5ltwUGvGnHop8D2bVYiqyWJcr5J_J0ppW6-NxZAErFEYs73QQ
Message-ID: <CAMuHMdXXS4ZTxLBrZoNycHUzdUp9QsisfA7CcBPyAGw7zTuSoA@mail.gmail.com>
Subject: Re: [PATCH v5 01/15] clk: renesas: r8a78000: Merge debug prints in r8a78000_clk_get()
To: Marek Vasut <marek.vasut@mailbox.org>
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
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_235656_614215_F44160BA 
X-CRM114-Status: GOOD (  21.97  )
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

Hi Marek,

On Fri, 20 Nov 2026 at 06:28, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> > The two debug prints in r8a78000_clk_get() are very similar.
> > Merge them into a single debug print.
> >
> > While at it, unwrap the (wrongly-indented) continuation of the
> > r8a78000_clk_get() function header, as it fits on a single line.
>
> It might be worth mentioning, that this now also uses
> clk_hw_get_name(hw) instead of map->fw_id .

clk_hw_get_name(hw) was printed before; fw_id will still be printed
in get_hws() after PATCH 04/15.

>
> [...]
>
> > -     dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id, map->fw_id);
> > -
> >       hw = priv->fixed_hws[map->fw_id];
> >
> > -     dev_dbg(dev, "clock %u is %s at %lu Hz\n", id, clk_hw_get_name(hw),
> > -             clk_hw_get_rate(hw));
> > +     dev_dbg(dev, "Mapping DT clock %u to %s at %lu Hz\n", id,
> > +             clk_hw_get_name(hw), clk_hw_get_rate(hw));
> [...]


Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

