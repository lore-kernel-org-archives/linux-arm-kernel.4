Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC3E606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dEFPRWkg;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HY/9h7rK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=92f6NRETdzojaigU8EyzxjI/4N0lXsB5qD5xAdIQvbI=; b=dEFPRWkgD0xdO5
	lxitHxG9/yHPNmLGnPdKqo1Os+IBBZxeV+6wyY4ttNj5d5Gv5+ynFEH4UOA2DSdUSzj5hhKWGVPLb
	LJ12S71RgVFoLEu0XTAYE5bWZJnO9vh7D1PKE7T2FCe1t6qtyOlbLwKU/uI1PpL22XOmXRD49AGJK
	uI5QLLkPAekfxCmqF4cBkxivs0iWqU3XKB8pS6Eq6u1IoH43MAIDAVoAsoJuR2hCPTVbrJqDQVCVw
	VfikNseGkeRiWf8/ye+ryU3JANSEE2n1ythxsX8b9Qxv2QDGh4Rskmp2HlmAM94eHgoXIXPcffBlB
	O+lT52AQQbYTcDhoJmug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPfz-0000000FGV7-0gdf;
	Fri, 20 Nov 2026 14:33:19 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPfu-0000000FGTs-2aRy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:33:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-498f5fa5103so572368f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 06:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795185193; x=1795789993; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92f6NRETdzojaigU8EyzxjI/4N0lXsB5qD5xAdIQvbI=;
        b=HY/9h7rK46ju0o7WyXYMvZIJ9r8COLdr8rnr4kZlIVtrqxgxJATHklgjWTRq1k3czA
         t0wzD6IqhTSnLf0Wz6/XF4CGA6EYF/0P1ak8/qbYjnz+gjVLeSvYFY6j5nmU9omTPqcB
         MdHX00NIIvj6xH8Y5kGTGqmddpFqxOhYEu/85KgmBhGH+V/hTo+PU8q6N86uwWrZMrIx
         ULZNLgEMUacgS9RpTESuTMe677uwPzOcVUkzwk7si5o/Fd/n6KxXjZbPDzn2aom90RqK
         BsTbxY2uUpbLkQR1JDLfEPB4U1Fr+o5QmZBfF2J0XG6AcWroIWB4oStVcW52y0dKYsQW
         uoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185193; x=1795789993;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92f6NRETdzojaigU8EyzxjI/4N0lXsB5qD5xAdIQvbI=;
        b=Hp9om5qE++PWoz2a6DtpvSlLUIqp/veaUW1m9tULAxjVk5168afocVSmgXISnb9dlJ
         KJJJ5zPaeF9NNGpZCiUicXAs1VLjNGKu1fWyTVIXu2vCnD8K7SVuxhjtaioKfNlX9gFv
         PzL7W18WliXMPu6FblZ5AET8PG0tix1qW/yG4mXB7SBjBl33shB9R0Sc0jJMkTmWULZT
         5MT5JfJj5H0fAF3kRmDOnCyg53fdCbAKKnftkkAryM7SoYfGVEZD9Cld8M11+BelXHip
         fnTxSet0NMOTBgVALpz+tnf2YmT48d9Y9XEBRDLMFI860Fdf5maCw1MheKyaC+G1uUxr
         GbzQ==
X-Forwarded-Encrypted: i=1; AL+hErH2arxNvUbi+m4t+1mXCxjQ+K9JbDjhP54ewfiFDLLPmn28JZLW1JUXff9HZsvX7Vj/eqPh/MIFQ9AlGlfhiuaO@lists.infradead.org
X-Gm-Message-State: APuU4Z/nCf/0eURM4jRhKfmVA4mfuS5BKh0hHYiAaxY+gE5phts9gYzw
	1WwNvrHhCVpC7YTg86bbvWmDbVQbYd0CQV5l1ivVFMFZ4adA/3JQmNzTkQYrwNAE+pE=
X-Gm-Gg: AZFdTZc2pqr3vXFpz7kCGds50o0Sea6L8zNe72vwlD8auVEkJJsmHyR1MehjmLMYMMq
	2hv5dwAhXHdXfMZuZ+lfEXfgHvufSFBwSLcBLm0S2cOCI68SpiO9TGvU4vJ4bR6iWl8IOQHTjFs
	vzyvpbpOiD5x4aJ1XpUamoW+5K3wxuyO81uW/Zcx5ql8tRtydG64nc5/ECrHhbWlTOxbJwNHhKY
	w8788OSqArPLz0+jLwqA6z/ch8GWgb0QAAe/Empv5eTofl1MDnVE81X2O9iyhIkCrCTvBV9txUU
	/QtQx8kEfJ6Wr5/1c06JZcAo98P9lxAvp0gEnpZd7MvE1eIEvbVhFowFYSWhDYFPFLpR1V3ItFc
	s8kE1HofOFe+9jbMxK4g6kJfYNFeP2fyWSOAvX785rBj+7g9SnF5EjN/ASOwSMiMa0x/Nq9ubwl
	J29HmNH9hDqnaVL8heiTXMPg9dxXeyPmFDlOwgXTJ7DrVJWh6Q0frbAhQLk29AnSSk+tqp3M1Ys
	RapUCLXybgJSr1JXErKjcSrC21KxWUvdPi1dywR4gF8TFrmj+u8xPXmDJo8RDTnPqI0Vu3JK46Q
	U9MJ4IXLPsawo9jqivo1YQELo7a6OEMoItEAgaYcKALiQlE9HsSRYJq5tA==
X-Received: by 2002:a05:6000:400b:b0:4a8:dbbd:69ab with SMTP id ffacd0b85a97d-4abb4f58c75mr6786554f8f.27.1795185192603;
        Fri, 20 Nov 2026 06:33:12 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm5978154f8f.40.2026.11.20.06.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 06:33:12 -0800 (PST)
Message-ID: <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
Date: Fri, 20 Nov 2026 15:33:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
In-Reply-To: <awAqqg6F2Z1t55x2@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_063314_686041_ED7C61D6 
X-CRM114-Status: GOOD (  21.39  )
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

Hi Wolfram,

Thank you for the rewording, it is clear

On 11/20/26 12:10 PM, Wolfram Sang wrote:
> In the past, we wanted to support all kinds of firmware. Sadly, each new
> firmware introduced different IDs here and there. So, we came up with
> some stable IDs ourselves and mapped them to the IDs per firmware. This
> is a n:1-mapping of firmware IDs to our stable IDs.

Sure, that is part of firmware development.
I know several SDK versions exist, and supporting several of them is work for a vendor tree.
As Geert's cover says, "While upstream Linux must only support sufficiently mature firmware versions, vendor trees (e.g. renesas-lts) may still want to support development firmware versions".
Each SDK version can then have its own DT there.

> The support for <n> firmware versions got serious opposition from
> upstream. We concluded that supporting only the latest firmware will
> make most controversial discussion points vanish. So, we now have a
> 1:1-mapping of (the latest) firmware IDs to our stable IDs.

Agreed, supporting several numbering upstream for the same chip only brings confusion.
But then, why can't that one mapping be one DT?

> I guess this is what Geert means with IDs becoming "stable". <n>
> firmware versions might return <n> IDs, but supporting only one firmware
> we get the same "stable" ID from it.
> 
> Sadly, of course, with the next firmware update, we still might get a
> different ID all the time. So, not stable in that regard and we still
> need the mapping :(

When the firmware can be updated, I think an id change should be fixed there first.
That is what I would do in the open-source SCMI server firmware I am writing for this chip.

> Yes, this means the driver is then tied to a specific firmware version
> because it only has this mapping. Not nice for a user. But we didn't see
> another way moving things forward for now.
I think the DT is that other way.
With the SCMI ids in DT, only the DT is tied to a firmware version, not the drivers.
If a release that changes ids is already out, it needs a new DT, or a quirk for that one release when the DT cannot be updated.

The hardware stays described
The CPG and MDLC belong to the SCMI server, so the DT should mark them status = "reserved", and the consumers use the SCMI clock, power domain and reset providers.

The Devicetree Specification v0.4 define "reserved" for this case (section 2.3.4, Table 2.4):
"Typically this is used for devices that are controlled by another software component, such as platform firmware."

Zephyr also uses SCMI on this chip, and it already keeps the SCMI ids in its X5H DT
Juno and STM32MP15 handle their firmware differences the same way, with separate -scmi DT variants that simply include the board DT and an SCMI .dtsi.
If the number of variants grows, tools such as Lopper, which I mentioned before, can help manage them.

Best regards,
Clément

