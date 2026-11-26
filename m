Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F3D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=onO/OvqB;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GfFt95gE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N7R2bspuSN2vTU9KXTd+Gs5ucj/LrOjxnprdX2nps1A=; b=onO/OvqBNOp5t9
	6CCWl3pELX4r2R2TDTLjqWfPWvGZo97w9O0MbSozjWrNApN8CyAoJOAekTBZ/1ZE7fX2adUy5RPS2
	xyak1W080G0gZ1WDewpt9Ag/DS/Wu9I3HVL39SO0iXKrqE/nCXdy1A3VUFzRtmqaGg2QXhuBu4Iu2
	A0Ie3s+bzHCt8qLbTG+zgDoGBRlClkjvGCZHGHs69ClckBpgJmxQy5gGXHeuj41KEZfWpI3E9EnBB
	L7WJZSomTV1VMfekMM6Z2nc2zZ+0PAq0QmLkNAp9oFZPobsjhJfU4LUNV6TZkraS4ytjI6KuiTcw7
	3m4W3vCtePNIIhgqQHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYNq-0000000D7pK-1VKP;
	Thu, 26 Nov 2026 12:15:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYNn-0000000D7ol-1PO5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:15:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so70877505e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795695321; x=1796300121; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7R2bspuSN2vTU9KXTd+Gs5ucj/LrOjxnprdX2nps1A=;
        b=GfFt95gE95vQ2eGcXkqQeYRB5vo+mUV4HTeUJeefAXZKeVPRQDGr24zN0f1cY23RKX
         iXbzHNWGPo42VwXp9G3/82krrF5cMkVPhsuazC9PiXIAKSgBSdHaJgEOg30GUtKLGS+M
         pMA5rTf4uqyISENp13hod6B1zDs/t7htWzvZ57JY+lnDgEetfHFfqPBJ11bdVibyF+EE
         7v9je1TgMFT01mM0qRswZ3gArf5c9gcDUzvKDKZ8eV/Cr9/GevdzehPJRA0yj0zfXEkn
         GLVpe+Q5dnuC/VqymDSD+EXCmSEu0bY/NA+E3TTT2CPOhBCCICTp48gbyMmEdpBtj41C
         feLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695321; x=1796300121;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7R2bspuSN2vTU9KXTd+Gs5ucj/LrOjxnprdX2nps1A=;
        b=nTAhEBzcY4XWJeZ2IzCTQbd3OabSivXAFBnOdtx3r+8bXTEKksPZkcH4dXG0rALqD5
         xNsdBbJuCXiV8LcPMJxvHyqmNN6SGcwHE8KCanL51H/5YQltZJEadwwHGZRwXKSJ5oX9
         Fn3MSy5Zl5b1FAVwy4xLGQmX4XBzwiBSLl6VQsWmJWAsOT2lI6MA+A3XtmDWiY3NYiXg
         Mn07Bo3ggtrY47ZYvaxRtUA5Ib7RzNMI/S5QesY512vJ62mAuNMYKdmppF6hGnnQQlmw
         N4uQJdNHb0riiBlbo6bmR5MXqrLLP/ht0LcCmCxrZbdIgnrkZa+kS5ufTo5ghyoHASo6
         5bHA==
X-Forwarded-Encrypted: i=1; AL+hErHx/JfodH1ewViokZw1H5rRvzkiqorotU6LxtJL5tXGizDA1Ue94U+sZB/rq7EztVVc/IATP1517+XYEfDc+7ii@lists.infradead.org
X-Gm-Message-State: APuU4Z/QCOeW4GzwIgDU5nBd8xPbdHTYEvw4Q+/ehRYoSympDm4eaEU+
	hadtjL8TRXyzneHt5wZ/JIXy6/6vgEMNGIvces7NbnM8WGsHfDy0l07pmjubW7UK080=
X-Gm-Gg: AZFdTZdOxDbNBcHlpCIxcOlSD/181xd2J8scAeWoXKfyI3pwZD8x6/7+D1VJp4RAm4a
	YpELYi+uGedKkTte0Ko3lkfk+iwgr5ifHjCS7l4inIg/QV2lAtCTPbCg7aofPgWtthqH6fKiVt3
	2By5KfKrOQCNCcoEMo9KUpZ+g5DHpTtgrqP6Njf0D99oArcJpDrDkrlv46PQIv4MoSyJTu2sQjr
	5tjFvK7I3dcyou+DFMWYnj1kz1+WE67yVzAPGq7rozKKjwlI+KiGBdxZ0wTHj22lGhgCnNiqq34
	D2tM8B7fiZlymL1JVJKCVaD0W4kpN+OcQPyCvVBHChoZ21jCZdZO+HWP4JnaSWYLG50NEDzreml
	OrTv8ho5ctSWrmqMtEzhAEbf2u7OOFuAoTvL7FqQdzLQ7bno84+IqlCuAeYWSp+GJmWsbfLm7ap
	sVjfjuRm/z2Aaq7i0dap/VI42okK9n91SgB5A1Aptd8P5sJ+FBHYoYVwuOgZbJv7U3T51Ghfvuq
	GODRyKR0U30xfI1EWku+s3pqurxsNzvDrho6QxBD8esK8+alSRmivWLsBPFk/i6K5xf8p1NKdua
	XtUXXAo7dHl/YW2T3Yq7rR1irGqH+oZFo5J0Rbt4D9exE+EFmUtOK6jJEYcXGVeGNK6AeZtIE7v
	lPQZxh8swi6UUijBxpxbFilPPpixV8xUvvTiTOm5bDT7w0Iyrf72qKeOc5Usb3go1iA==
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr507224745e9.12.1795695320857;
        Thu, 26 Nov 2026 04:15:20 -0800 (PST)
Received: from ?IPV6:2a02:842a:9b20:d01:a06b:e180:2ea9:f6eb? (2a02-842a-9b20-0d01-a06b-e180-2ea9-f6eb.rev.sfr.net. [2a02:842a:9b20:d01:a06b:e180:2ea9:f6eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm349451575e9.1.2026.11.26.04.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:15:20 -0800 (PST)
Message-ID: <bc5f0035-08ba-4813-9bda-9b2ba68f3680@baylibre.com>
Date: Thu, 26 Nov 2026 13:15:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com>
 <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato>
 <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
 <20261123103633.GB2959742@killaraus.ideasonboard.com>
 <fc13a7a8-b825-400c-9ea0-ceb2670dc478@baylibre.com>
 <20261123160550.GA3050935@killaraus.ideasonboard.com>
 <27796cff-eef5-46ce-8079-93a0a8d40db5@baylibre.com>
 <20261125221502.GD3581@killaraus.ideasonboard.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <20261125221502.GD3581@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_041523_450555_A9B8E204 
X-CRM114-Status: GOOD (  43.87  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Geert, Laurent,

Thanks to both of you for the answers, I reply to all of them here.

On 11/25/26 3:45 PM, Geert Uytterhoeven wrote:
> Status = "reserved" would work fine for a leaf device (e.g. a network
> interface), without further dependencies.
>
> For core components like the CPG and MDLC its different, as every single
> module on the SoCs makes use of them.

Right, an SCMI DT changes every producer and consumer node, and they would change again with each firmware version that changes its ids. If I were to do it, I would handle those changes in a downstream tree, as SCMI does not seem designed for several firmware versions with different ids on the same chip.

>   1. They are not stable!
>      We only _assumed_ they are stable, so we could relax dependencies.
>      With that assumption, there is no longer a need for the (contented)
>      addition of scmi_get_base_info(), which would be needed to
>      distinguish among different firmware using e.g. different ID
>      spaces.

I think this is the real problem, and it is not specific to X5H. Ideally the SCMI firmware keeps its ids stable, and to me it should even be mandatory.

>   2. That can't work for now, due to limitations/deficiencies of the
>      current SCMI firmware specification and/or firmware implementation.

Which ones? Can't we work on improving it?

>   3. Last but not least, they are not hardware description.

They are firmware ids, and the arm,scmi binding is made for them.

On 11/25/26 3:52 PM, Geert Uytterhoeven wrote:
> This only focuses on the IDs, not on different abstractions offered by
> SCMI.
>
> The latter leads to the need for changes in (many) DT bindings and
> drivers, to support the same hardware blocks that are already supported
> without SCMI in the same and/or older SoCs.  How many different DT
> binding variants, with corresponding more complex handling in drivers,
> are you willing to support for the same hardware block?
> The remapping driver takes care of this in a single place, avoiding DT
> binding and driver changes all over the tree.

Agreed, the ids are only one part. But most of the other differences on X5H come from the firmware (missing clocks, zero rates, reserved resets) or from the missing clock domain in SCMI, so I would rather fix them in the firmware and in the specification.

On 11/25/26 3:55 PM, Geert Uytterhoeven wrote:
> So we can't upstream DT, until we have stable IDs for real?

Yes, that would be my take, to avoid glue code based on the firmware version.

To me, development firmware is the SDK, made for development, and a released firmware is the one that has been fully tested, where no new resource or missing id is discovered anymore. As you wrote to Wolfram, "We are still discovering missing SCMI IDs for some resource", so I think the X5H firmware is still in development.

I was also always told not to upstream something that is not mature enough, as your cover letter says for the firmware. So why is it important to upstream the DT before the firmware is mature?

On 11/25/26 11:15 PM, Laurent Pinchart wrote:
> It's not a matter of "in development". Software is always in
> development. Don't get me wrong, I agree that we should minimize
> breaking changes in SCMI firmware, but we can't avoid them, or even
> minimize them enough, without a QA cost that nobody seems willing to
> pay. Where's the stable SCP firmware for X5H ?

Linux is always in development too, and it still keeps its userspace ABI stable. I think a firmware can do the same with its ids: keeping them stable is not a QA cost, it is a rule when adding resources, append only and never renumber.

The open-source SCP firmware I am developing for X5H is public here: https://git.gitlab.arm.com/clegoffic/SCP-firmware/-/tree/renesas

For the SDK firmware, Geert's v5 cover says one table covers SDK 4.31 and later, tested with 4.36 and 4.39, so the ids v5 uses have not changed since 4.31.

Personally, I also don't like to see version numbers of firmware that is neither upstream nor public in an open-source project like the Linux kernel.

On 11/25/26 3:55 PM, Geert Uytterhoeven wrote:
> Zephyr has less complex software abstractions than Linux, and
> might not care about DT stability.

Yes, we are lucky on this one :-D

On 11/25/26 3:56 PM, Geert Uytterhoeven wrote:
> I understand that can work on servers with N CPU cores, N network
> interfaces, and N storage controllers, where you run multiple
> virtual instances using the same DTB describing e.g. a single CPU core,
> network interface, and storage controller.
> But not on an embedded platform with complex I/O...

To me, X5H is an Arm platform like another, not a special case. NXP's automotive S32G, which also has complex I/O, already uses SCMI ids in its mainline DT. That is why I would rather handle the firmware versions with the SCMI quirk framework, the same way for every platform, than with a special case for each SoC.

On 11/25/26 11:15 PM, Laurent Pinchart wrote:
> We have two options to deal with that: either we handle that instability
> in every leaf driver, or we handle it in a central place. The latter
> seems a much better solution to me.

Agreed on a central place rather than every leaf driver. Where we differ is which central place: I think it is the SCMI framework, with its quirk framework, rather than one remapping driver per SoC. A hardware revision is handled by the driver of that hardware, but SCMI is the same protocol on every SoC, so its firmware versions are better handled once in the SCMI stack.

Anyway, I know I am going against the common view here, and maybe I live in an idealistic world. I truly think that one SCMI platform should have only one SCMI firmware version, but somehow several exist here. Do you know why the old SDK firmware versions are not simply fixed and updated?

In general, different SoC vendors seem to face the same issue, so perhaps it comes from the software development process around SCMI servers. That may be worth stating somewhere, or even directly in the SCMI specification, for example that a released SCMI firmware keeps its ids stable.

As long as old firmware versions are not fixed, it changes how the SCMI Linux framework has to think about the product development lifecycle: how can we handle several SCMI server versions without a set of device trees and without dependencies inside the drivers?

My first idea was an upstream interface in the SCMI framework, used by tables maintained downstream. But that does not hold, as an upstream interface needs an upstream user, and I am not in favor of adding one for this.

So I would rather keep a set of atomic patches downstream, one per firmware version, built on the SCMI quirk framework, so they stay easy to rebase and maintain. This way upstream carries no development firmware, no extra device trees and no version-specific code.

This would also follow the comment in drivers/clk/clk-scmi-oem.c: "impl_ver-specific behavior should be considered a bug and handled via SCMI Quirk framework".

> The way to go in my opinion is minimizing firmware breakages *and*
> having a remapping driver. Those are not mutually exclusive.

Agreed, they are not. We only disagree on where the remapping should live.

Best regards,
Clément

