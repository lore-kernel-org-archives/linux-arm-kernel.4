Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD41606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 23:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XSXdjFIP;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O9FbZGWQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=meZuQntashJTcd7s3yiRtBHxVh9sQmthI/UbfhQzfC0=; b=XSXdjFIPxo9T3gcN2Ijvx4Aiwa
	cuo/zd7qpbjC1wm2VBBz/24cxTUKDnv+CYtKDe3HF1lKO1KDvCQ5AnG1fbua4Hykx2gtCEfTzN1BP
	clpE0qPWHyKEnodbaLMisK+a0l5rUJ5SlguGj27/9+qHxG0GSina2hVqPHRdb4xfc57ZHB/gVSwwV
	QK8etiVn1HQo8owLZZxQf8rWjLJus3+nW/8FEQAX+TYDDNgdc2J4pHPyYQgHF4sSUNPaTH7QOymE4
	6oCkdzm8cT4P900A7zBZC7NUa845AKvi6QiqHGem8qydupScjpHlYfVxaKVkU3ZMdPznVPfMcGuyE
	0mMxBfrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReBS-0000000BFDq-3CzB;
	Thu, 12 Nov 2026 23:26:22 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReBQ-0000000BFDI-1bHM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 23:26:21 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-33fb4680717so440119eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 15:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794525979; x=1795130779; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=meZuQntashJTcd7s3yiRtBHxVh9sQmthI/UbfhQzfC0=;
        b=O9FbZGWQ8hH02IjW+kOIEf4Yk9OkIMmpca+gt5EDovb719OcuYbwCNzSWFZ6dGg3nu
         /MKJaZufm4vxcwJk9FJ7v/TnJffps1G69XnIhFaWGQNLQdhhmWzl5YZOK+iJIBFa5hDi
         6W00KoPVh20gyFK52aKO1XQh3LtnUAe4aggfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794525979; x=1795130779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meZuQntashJTcd7s3yiRtBHxVh9sQmthI/UbfhQzfC0=;
        b=OWWW4MRPJVB0S4sccTVPm1Q9gCUmpOMMyE6Kf/oVLqpgBfq5/pCG60TGDRUc5RxN18
         Uj4p2UP23w+5QncxlTZo/NXxUAlNwxRgfP/GYuRmCSLh2A0myDZSXPcUg6N+J5YeCnix
         XNU09J6dcmbxONKu8QSUVwGLdtjMw8NDkIQ3DAfKDCIY4OeMYl0CFwc2YeWPXPgOXPdw
         tOUWJBxZga+UNz0YBwj7XmwQhW++FYRGYKunROeLAXms5PmVA+4XigKtevtLwu3CbJNz
         FkUvE8HI4oDlKid9eTykJ0jX3Ei4Wcorbj31FUObHE1NVNO6kSuUV5SiNs0jR5ApxOJf
         E56A==
X-Forwarded-Encrypted: i=1; AL+hErHaUqO82HBX87ajP2GKJDp82xrqPSdfdjHBgEiWmskgp1kpTYDH8xEh2QiQJJCRTApDFyaCzF+FJIVh4AE0wXkf@lists.infradead.org
X-Gm-Message-State: APuU4Z+WEjKaO7xQmWne/RntjNrtXwCStREpSJFnftBARoeCRj9sNdTt
	isZ2fsnFzftTLt+UD1eUzmYqWTQtK2PHuMLwZsExnfXQxuVMCU4fCOELcPl9d2DuuQ==
X-Gm-Gg: AYBFou35nE3iWA1+WmwqAp8EUVLZ9WmadYuGIGbHSHqOLS2igbc4HfplpWzBR8ZKMRy
	7HJ5HFhluBeNKbVSe4suTUMR9zzn9tlQG45A1isws3KX3VmzaHnsGYnelaS4pBQ3+nXvEmH7SD5
	Y4gHG8Xg6DuJG23GpIydccVSpxfQD8eZUeku1O2oe/6qN0jfXRLiDBIAXlC2SfrJkTvLZJQeFFl
	1gjvUqLkmp5uj6vQh41A+0Cw23H8Pm3laM+1gxeUjRTdXPnI28q7aTiOWhfINgVtDk22BB0U9Qo
	EU2JIAHFYUzizsARTWaqZqyVxfd1Uy/Y1lB92qeqWhPMpJGEOqWKhTT/qlIMuiVNezxQpaR28EX
	sOQoG0Jz273GZgQmmat3YWn/5xH1yrO2D769oeFWGPVc+/ek7Iy53AzY1d8SIMbxD6ttV/rzsFG
	Ao4n1Y2p0vA77dnH3kMOvqH4arkcn8BgUCVnE9F19HA3EYunZOAEJyPxIIWEAMXgFTnQ5Tdpd8J
	v/XuPf9uTa2MjiJPlgwaJ0dt6JBYTKcebS4jsC3YP2PVP7Y7yZbsXjWHNkMuUh2jqo6ckDA/6dH
	moJtnZB7gtlfhBvGjHrNcQO9/L/u2kmmJ5sgqBXS1h2D9Cmv67isVtvcTkWjceau+TwdEnlwK6Y
	QOE4hsFHC/UBvFQ==
X-Received: by 2002:a05:7301:b07:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-37966a5b9eamr527768eec.14.1794525979231;
        Thu, 12 Nov 2026 15:26:19 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:616b:3e06:cec4:c2f9])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3795591f4f8sm1521913eec.13.2026.11.12.15.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 15:26:18 -0800 (PST)
Date: Thu, 12 Nov 2026 15:26:16 -0800
From: Brian Norris <briannorris@chromium.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 5/9] clk: google: Add CPM clock driver
Message-ID: <avZLGHs0OPoC_VGb@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.5.I82dc05365979021379fe730d6d52792a87ff15ed@changeid>
 <179372634472.2573818.17532943286609086157.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179372634472.2573818.17532943286609086157.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_152620_471468_AAADF30C 
X-CRM114-Status: GOOD (  43.39  )
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

Hi Jerome,

Thanks for the review, and sorry for some delay. There was a lot to dig
into here.

On Tue, Nov 03, 2026 at 06:19:04PM +0100, Jerome Brunet wrote:
> > Google Tensor SoCs (used on Pixel phones) manage many resources
> > (including most clocks) using a Central Power Manager (CPM)
> > co-processor. We communicate with CPM using mailboxes, abstracted in the
> > cpm_request_client(), etc., API.
> > 
> > The clock tree is largely not represented fully by this driver, because
> > CPM hides most of the divider, mux, and parent details, instead
> > maintaining its own internal table of mappings for divider and mux
> > values. The one exception is for some of the DPU clocks, where several
> > clocks and dividers are exposed directly, and the firmware API works on
> > divider values instead of clock rates. I attempt to represent this
> > properly with dividers and parents, although I don't have the full
> > display stack running to verify everything yet.
> >
> 
> As you say, the clock tree is not fully represented here. Beyond that, CPM
> owns the clocks themselves, as the driver acknowledges by setting
> CLK_GET_RATE_NOCACHE.
> 
> The driver keeps a partial copy of CPM's state in the kernel:
> 
> - Rate tables below hard-code what the FW has (or should have) instead
>   of rounding the rate, even though there seems to be a ROUND_RATE_OP_ID.

Aaah, ROUND_RATE would be lovely except ... the firmware implementation
has a giant "TBD" / "error: not supported" instead :(

If there are major must-haves (or, very-nice-to-haves) in this firmware
API, I can see if we can get them added, but that's usually easier on
not-yet-launched products, whereas Pixel 10 is more than a year old
already. I'll see what's possible though.

> - kernel handles PLL parenting and divider math for the DP clocks, while the
>   firmware can also switch them to what looks like the oscillator, out of
>   the kernel's view. So the math is likely duplicated as well

I'd have to do a little more research to be sure to what extent the
firmware actually changes any of these behind the scenes. I'd imagine
that for the only divider-exposed clock (DP), it probably doesn't, but
I'm not sure at the moment.

I get your point though; it's certainly not beautiful, and may be
difficult or impossible to maintain in general.

> This middle ground cannot be kept consistent. CCF assumes it knows the
> topology and computes rates from it, but the firmware makes the actual
> decisions. The DP clocks already show it: the tree can report a parent the
> hardware does not use, and .recalc_rate()/.determine_rate() can disagree
> with what CPM programmed.
> 
> I would advise to follow a model closer SCMI. What you are doing here looks
> a lot like it.
> (see drivers/firmware/arm_scmi/clock.c and drivers/clk/clk-scmi.c)
> 
>  - Put the LPCM service protocol (request word layout, dst_id, timeout,
>    error translation) in the CPM firmware/soc driver, behind a small API
>    shared by clk and reset. Philipp asked for the error helper on 6/9; the
>    whole request encoding is common, not just the errors.

I'll try to do some more sharing similar to what you're suggesting. But
full disclosure: the similarities are still somewhat rare in general.
Within a given service (so in this case, you're talking about
CPM_COMMON_LPCM_SERVICE, used by clock, reset, and *part* of pmdomain),
the protocol is largely shared.

But this series also touches CPM_COMMON_LPB_SERVICE (also in pmdomain)
and hints at some CPM_COMMON_PMIC_SERVICE support (RTC and PMIC); and
there are at least 5 more defined servies, as well as a few other
bespoke protocols. Those each have distinct request and response/status
encodings. (Unfortunately.)

So, I'll try to consolidate what I can, but it probably won't go super
far.

>  - Make the clock driver a thin CCF adapter: each CPM clock is an opaque
>    endpoint, and gate/rate requests go to the firmware. Get rates from the
>    firmware (round-rate op) instead of local tables. Model no topology the

As mentioned above, round-rate is a no-go :(

I also don't see any way to query firmware for supported rates. Off the
top of my head, the best I can come up with is sweeping through rates
on SET_RATE and guessing, until we find something that doesn't return
INVALID_ARGS...

>    kernel does not own. If parents must be exposed, the firmware should
>    describe them, as SCMI does, rather than the kernel hard-coding them.

I also do not think topology description is possible with any existing
firmware. I would think if we were revisiting how to do this more
sanely, it would make sense to stop exposing the topology at all, but
TBD.

Anyway, thanks for your thoughts. I'll see what I can do about
ROUND_RATE, but also am interested in your opinion on the best way
forward with the existing firmware API.

For some positive notes:

The vast majority of these clocks do not actually support multiple rates
(at least, not in the tables here), nor do they expose any topology. So
I think I can just remove their rate table, and only rely on
(1) GET_RATE or
(2) SET_RATE, which will only succeed if you get the exact supported rate.

On some other clocks that support multiple rates (e.g.,
HSIOS_MPHY_REF_TCX0_CLK), I don't believe we ever need clk_set_rate().
We only use clk_get_rate(). So, probably same story as the 1-rate
tables.

A few others (DSI0/DSI1) seem to never use any get/set_rate operations,
at least on any Pixel drivers. So that probably can also be omitted.

I think that _only_ leaves DP clocks.

All in all, maybe I can strip a lot of this down quite a bit, and work
on DP separately.

Brian

