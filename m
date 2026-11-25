Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A82C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4r2C1TEK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jyTslH/h8L0C8HCIteQbCN/1sF3Ppecw+tHudhxEPjo=; b=4r2C1TEKBPLjNGVPsn8t3vKdw/
	jTieNL3VwJ290JovOlWF/LRKyOEMuQzcJqkzcgdZR44D+4b1VR2f1IOQpE2mkgWgFnjJDJQXYD405
	N2AXJAAob3l4HeP7kvJO76gFTSJco5vJL7Ktt2BjQvORpBRb2VayPv1PiVOp6KNfb3ilwVxz3KP9g
	7NU3YkSBIEuZysvihTRtRUX2RS6to0lUqKltBXlzxWzNpr7RFp/+y9ErksP6Jn6LCGn+LR1nmGq9o
	fTWJBrtRXykJoPh5vg/eyeMEGIDoach7I1kNL0+TTNjgdWUqihIyUYWLq7BJXbD4tXhJTeO8h7c5W
	9ScfAHDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEHh-0000000AEMf-2Rb6;
	Wed, 25 Nov 2026 14:47:45 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEHZ-0000000AEKY-02ZL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:47:41 +0000
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-536717a4d83so48172831cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618055; x=1796222855;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jyTslH/h8L0C8HCIteQbCN/1sF3Ppecw+tHudhxEPjo=;
        b=MogDl5b9gApJWDYlycdCCeMwHIAIOzV91Iu07eRt7zBpOv5vfykVl/V/y9LT3BqbCf
         Ds9ikTsGn+SZqtTLJzCv2410tTrT6zpqqNp64zuEyN0z17B2D4q6Y6auAOLmLJnT8sV7
         ycPUUpp7RSlCxraCCHH9dwG3uGUEk2JoJjcdmYL15OyGwD81iScsurIC2jZcsbLO4Ceb
         j7IALmvuV6oONzkiZiV1nY0p4w2zwe5rhJUT1b+FTlog87J98yEFuNbDBmfoyqYc8ZAA
         jcji43SoqUg4baWmrrnu9PYTnE0IlmmHzZMZHaxraPNlOrkeYtRkviO4vUYJcng2L5i8
         g/1w==
X-Forwarded-Encrypted: i=1; AL+hErEg0QXlHF+MUPPoiMRhttXukgiKaryxGsZHRVco8+dlBbxCPed/5ZfWZtCu6mjuQKLI+vaYD8R4tQa1gUsYPg2B@lists.infradead.org
X-Gm-Message-State: APuU4Z94wo+/bJcohkGCvjBrh1WxPF5TrzihK+HTQTDlqREahIH1QQPW
	bbr3OmwoUCX5RtVUpXqRqQ5O4m9uBBNH+e+BwoqzyigYTkgm3Ua5qamBNv79CHd3
X-Gm-Gg: AZFdTZd/xBsJe5y/TfMXcQ45d/Y2ZcDzQeq0oBuQ/YH+nIOxUqFfvrrWC0kPmgmhyBk
	agITYOVJUAzl7G4ixh5aTvfWBDCBkG4PZUffTm6twF3dK6x1Lq4vr0tSY7PzuomtbH0kisjuQdc
	nDZoIZuITgs7C9am2IkCJkpe5CkhSJ1+pbH6Y80B3gBwWCMlx9JBcjOWKb9KzN9T4E8P1Wc5XHE
	wQgI/FE9+CEnx51Y5GoyjgJ944ndDQ+2NrrLbdlXpluXwWq4eOw+cZ7sMO89E4u0JJKei6f7eop
	WpY/ZVrv3FQtgoh8tCDjXzVKVjS4VherJ5W0jhw/0Tf/aglYAMkO4z4LMBaUR+mS6ROb14EaRaQ
	25oKdBI8cnzKDEXiPX0FCeu4+P0BMGu+blXT+k1o3fB+DObgCIKfBUM+IfOwSYDBrB+8EyegPsq
	1ifqVJwh2gIZgYq1eEFhwnKr5jtuTJAhE11QGyVMweWvjXMtBw4d6waH1UQ1+OUGEs7UOSb58LE
	DLs0C7WD1tRBMR1iIhFSjIyeVHUNMMs3y1IYfPoeJB8zXiTgMLxguVOwfBcA/i+8dBL755oIs6b
	3pXzBkDrMSsa00W3ZJmpbcpwWI3X+NwW5Wdjz1LrSicu6irZd94E04Xzi3rF3GD9RlmGoL0=
X-Received: by 2002:a05:622a:e3c4:10b0:55d:84c7:7d7e with SMTP id d75a77b69052e-55d84c77e4amr208145011cf.23.1795618055446;
        Wed, 25 Nov 2026 06:47:35 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d784517casm156114371cf.3.2026.11.25.06.47.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:47:34 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ec20398b05so4944437e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:47:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHaEKhNb0Wi1EZ/+pzTGnDhwnseXlIjtCPYhMGSJ9m6JvbcmGLWq+lejbWr69eACN0qqftI4dEtzd5owsT2DroR@lists.infradead.org
X-Received: by 2002:a05:6122:1daa:b0:5ea:389c:520b with SMTP id
 71dfb90a1353d-5ee8af0b136mr10546236e0c.8.1795618054600; Wed, 25 Nov 2026
 06:47:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com> <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato>
In-Reply-To: <awAqqg6F2Z1t55x2@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:47:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLn444XFOUV75J22dNSnMkcjefusMomnp1dqRe3tsggg@mail.gmail.com>
X-Gm-Features: Aa3M54pxTFdlXtNPAY9vlRQdDdU5I_xDDti_PqZ4BrybSMWjBRbxoSvFUUiO_NA
Message-ID: <CAMuHMdWLn444XFOUV75J22dNSnMkcjefusMomnp1dqRe3tsggg@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_064740_676617_E0EE0D6C 
X-CRM114-Status: GOOD (  23.38  )
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

Hi Wolfram,

On Fri, 20 Nov 2026 at 12:10, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I don't think SCMI itself introduce instability.
> > It only defines the protocol, and each firmware choose its ids.
> > Could you tell me what you mean by instability?
>
> Let me try to reword:
>
> In the past, we wanted to support all kinds of firmware. Sadly, each new
> firmware introduced different IDs here and there. So, we came up with
> some stable IDs ourselves and mapped them to the IDs per firmware. This

For core clocks, we came up with our own IDs, just like in other DT
bindings where there is no simple mapping to hardware.
For power domains and resets, the IDs are derived from the hardware
documentation (register and bitfield indices) (augmented with a few
power domain IDs that have no simple mapping to hardware).

> is a n:1-mapping of firmware IDs to our stable IDs.

Unfortunately this is not 100% true:
  - There may be multiple SCMI IDs corresponding to a single physical
    resource,
  - We are still discovering missing SCMI IDs for some resource.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

