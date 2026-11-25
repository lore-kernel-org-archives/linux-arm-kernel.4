Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7696606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z5sf50zW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hlkk4xXsXyEvb1D9H1K80LoXoGwa5zP1sGDEDxlcUog=; b=Z5sf50zWI/8/XR
	bAL03RMxd66Uxs8TcgOhhKJHktJi3C/D3HkDKZepGzG3lTVcEfXSWkjohZvt7DUshw23vQLpWc4aE
	25vvI9aWOtdvtKNBslgapEkoRiW5Zy+6fR39Ch0nmFZ4vYhRUZwtp7j5doEbClJic7muyWcqlMMDb
	qP2KfrP2PRgRQmAQzdNC2sO12W6SpLbpLGwSUXY+/jUDCGdHdltXAlpxYnA17pJf1XanYf6voA0Et
	KbejYSFHTIRdUy1rlJKwFixoiRqrDijLYdeJzv7mUQivCU2seVfV374zPg5VDtFmcuM3xtEQcrgp2
	5dbctXIrJx8oBN8ovmKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWET4-0000000AHMa-0GcE;
	Wed, 25 Nov 2026 14:59:32 +0000
Received: from mail-qt1-f175.google.com ([209.85.160.175])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWET0-0000000AHLB-1fFG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:59:27 +0000
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55b8cd4e2abso61364321cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618765; x=1796223565;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlkk4xXsXyEvb1D9H1K80LoXoGwa5zP1sGDEDxlcUog=;
        b=xbE9Nlfh6652eDbkSNbVDHtH1ZLUe4jKuXZ3CaD8ylmZI8kAK9wI9ba2szep6GuKwn
         o3aX8MUZjThcr72rk98OYudIuDx5OLHVWLDBKIvhdJnmW+J8P3SsW9kbyCX6MqRFvwrI
         4SDnol09DyRlXc9pFjw/dBTt2UrnRg8Ffzb9k5kE9VJYffSgz78iU43Oc7xNvJj8+dIU
         7gTTHXyBNd0IcXBQyse4EeSgxehQGj+VsIUZx+JwIjE9Tab+DwzFEtmTwFehKSIITyrN
         qSFgTfP2XbzBa1NZvabIEZvJqLoSuahTBdom//bn5VQyE/P2Rv+vC+PCNYOXnnTQYoDa
         fq3A==
X-Forwarded-Encrypted: i=1; AL+hErGRtpV6u35mgmWCE1nEXLAYQ8sfLknzNWIvVexQML29occhQ1KC84utYpTGoU2Cwa8tPri7W6Un/N2IkctsHC9P@lists.infradead.org
X-Gm-Message-State: APuU4Z87oCC2PX+zNF9Utg3Q6qt0jsp8Nb3MIRcqJYSjPmXPW/Qwgcbm
	DREwktnsyUHmx5GV+1080WHFJoUVvJCl1c82FiQzEVqL8Iv1X8N0+8gdHB2IoIyQ
X-Gm-Gg: AZFdTZfQPKbMw7zwT9zwCErXXojqwRjA3dZXnWGyQlpR0/h1SzoksPFhpmR6tk5D7yJ
	zgBzvkXfuhQw7AH3iFXysJ/gCrNfui+EfmXeWfulsNI2g8THV1cIHn/5jwYZ9wBH/AudCLILS3C
	IjLluJFtfr/Z0Bj8/UI1UZ1ou/y1rkeMZvMWngZ+BWN/HPajhbkHK92QCA1IhuQt5gsKd0CEjYI
	BjiK0g/Lf1RD9TJKT4arheMNIGfCK+UknGtsUV3N18xbXF+AhxmwFmZu39O4Qs7jjNQ2FTtR/cl
	3WwuVZYB5wcqMub2BbeSQgjWt9hV/Ip6ZQqrohOSwk1YMnmnEPKtiz8i5VyVOHpAtb5YRcIEK0x
	KfDTJ+mMKn968VNczILZIx4jnOp1UFSP5m4MH90KBB5iJfqqlLvvFxf30crYtTJFGgnTdbo88AU
	yflZNll2pFNbEttWbICL/2DAU8ZPRzE9xe6f+Wu78+WArnbRFK+CWq15jGWbN0Fgldbef7m7AnD
	+O2iW9I5Vu4fjvRRuP/sZx4bMzYCOXLGU5UuQMw6RSWWJowap1/viN5IWN2do2ytx1yXcHXFR5O
	LbbyGUYnWYBa1T1RUmB++qfG+rFJjMDaY5DXxfTXGw1Z+roAmR72GDQwXtUX5RwsyrSHFXs=
X-Received: by 2002:a05:622a:17c9:b0:55d:6e81:2034 with SMTP id d75a77b69052e-55d76ae21f0mr337344701cf.44.1795618764953;
        Wed, 25 Nov 2026 06:59:24 -0800 (PST)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a08552sm162757936d6.34.2026.11.25.06.59.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:59:24 -0800 (PST)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-943e8d35f74so582791285a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:59:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFdSEq2qnC2mGErXFFaMbniJADXio4+L29Wyj9hlT02oHNxHFZvbAhyPTFbWIk45pYwc9NGx6gc0xAphj6BPrvi@lists.infradead.org
X-Received: by 2002:a05:6122:1784:b0:5dc:d0cb:7d74 with SMTP id
 71dfb90a1353d-5ee8adf3de4mr9944668e0c.2.1795618371669; Wed, 25 Nov 2026
 06:52:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com> <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato> <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
In-Reply-To: <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:52:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX71k95powpC9qNiKdN=wRCYyYbvOT=EYmExE_2W8u3GQ@mail.gmail.com>
X-Gm-Features: Aa3M54re5ZNPOW-XITDy6yDteWVZ0ZL2EVGMi9yHMlXJRb9PY-Nvu_jZHjCd6J4
Message-ID: <CAMuHMdX71k95powpC9qNiKdN=wRCYyYbvOT=EYmExE_2W8u3GQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_065926_483115_0EED7DB9 
X-CRM114-Status: GOOD (  21.50  )
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

On Fri, 20 Nov 2026 at 15:33, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> On 11/20/26 12:10 PM, Wolfram Sang wrote:
> > Yes, this means the driver is then tied to a specific firmware version
> > because it only has this mapping. Not nice for a user. But we didn't se=
e
> > another way moving things forward for now.
>
> I think the DT is that other way.
> With the SCMI ids in DT, only the DT is tied to a firmware version, not t=
he drivers.

This only focuses on the IDs, not on different abstractions offered by
SCMI.

The latter leads to the need for changes in (many) DT bindings and
drivers, to support the same hardware blocks that are already supported
without SCMI in the same and/or older SoCs.  How many different DT
binding variants, with corresponding more complex handling in drivers,
are you willing to support for the same hardware block?
The remapping driver takes care of this in a single place, avoiding DT
binding and driver changes all over the tree.

> If a release that changes ids is already out, it needs a new DT, or a qui=
rk for that one release when the DT cannot be updated.
>
> The hardware stays described

SCMI IDs are not hardware description.

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

