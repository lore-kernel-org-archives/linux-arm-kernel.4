Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDF0606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bob/nDXz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u8E7M7Ll
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XoornKh9z5jpJH7j8+EuQEpUcX1Rogb6YE7C2nngtQ0=; b=bob/nDXzT08qFf
	hoAZc1mu2DmSMMLUpyd61Q8Gk7sERSDf7p8lZJgWygHQdE7LUjO01AE/NuwWZ6wRxmjQaZsCDhG4Y
	xNXLYfoBCfZLA7VZroIm8q8YLKZxAdU44HutnYN+fkD3T5cjmUsTcRKBQht910Cq8OZACUkrIIagL
	gPjkdSR9fGs8tAfZxuPjl5UMAXt0ECOfKIaFkX1qyeKE7Td0nh1yUCcimnXCuavUCzqWTvVVhqml5
	qyNUM2NiLJkzaQ/W4GN5dVQxLeZg2IGkWNkTvTUiV9v2hZNPTJQ0V3/begNK3kYfcFlYPJziM8gH1
	Z9WJPAV1uQ63KIASXLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiYv-00000003MuN-2wms;
	Tue, 10 Nov 2026 09:54:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiYs-00000003Mt3-2qku
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:54:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so6738475e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304481; x=1794909281; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoornKh9z5jpJH7j8+EuQEpUcX1Rogb6YE7C2nngtQ0=;
        b=u8E7M7Ll7r5ZT5p/3FvK6Ux/xO9bb9X2QQpWTEs89YNy4B39E5vrnXf2A3WmQdV8jh
         Bon7VAzZNMchWPqqHHrKLDSvGsjq+Q7xi82cbXrHP65nKabyN4G4oFAJw4D/Hgp9TUSa
         zThxSaxLdp0nW49JdxzDv72yFrDagslRIC0Xbc/ZSmphESmkYXCLjSElWGNr3Jcc6fHF
         9nenSPhD89tieJThv4KquxZtVVxDbvHKmebEfbiMTwVDQUCycfKjtu/lJHfJxphSAJ4I
         0m29xa7PErOU3AyPG0vO9/OTFZPAIVxs7m3rl2405JGaB0aqhIkKt5ZhwHaW3oRKc0DT
         GxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304481; x=1794909281;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XoornKh9z5jpJH7j8+EuQEpUcX1Rogb6YE7C2nngtQ0=;
        b=RTkRmD2a56Rzk4bnUTQidbEcwKyYPOd9NymnHTWNSIKTFmaHJhJwS6IcODqBmSTH91
         Czs8x/qiV8bAxNiW8uo5BmW20t3PXINbLU5cyz6jZj75KPl3h4xEOT2OGhEL3UHOEa4+
         TE285lXHLLRlpdWGwp6xdM0NaWhdhtwq0R9WpE34HFZ6a55LZ/GD6VD+op5zD7pxw2jC
         BUv7SPTlW1SdJyzLEgQnOxvZZ7qvgzy/aFuC+hdYKotoAJYH+nOaVeJRWlPqYbXm8dYN
         JxVou5WZwAkv7/PMDz/z1JFMGjwTB0osGG2vLmN20wGyeEhqP32Y3YOXKbFjmpSd7PY3
         tNGA==
X-Forwarded-Encrypted: i=1; AL+hErFs3R+G2sjgYp9uDOkML5JTPenbZNncOLcEwAes3CpWe6ypvwqOyozO3EzwkwkTJArWQXxAhEMKmpBqNLgQA5xU@lists.infradead.org
X-Gm-Message-State: APuU4Z+WWxWuAguNKWumG1TFvwdyGpy+rDkC0krfj392HFR07tkClbSa
	jl+oGTeN/rzBj7igUiIOuD6ehsfehyBRcnJfoNQcWMRIKnysiuhBGwr5
X-Gm-Gg: AYBFou3TYEmGyEnEvbbzCFX6gwgJ/IuakPRddHyuNLp95Al130rziFC1gvYXj8toV5z
	U5R2W8JngnChyYgukFZghEWMGEG2CiZMrf6UDQxU7qO7chhwfFYQZclMDN0t6cO5NhtRBSxlmSF
	swbaMy2QfFQz6ZwuziDpnGjhUPifGg8E3igp+bra6TRzTDjX/7TNyJMIKDGobKqlPD3ao5Tedd5
	9rJuT0CXXsnruMoiHmqGLtP3UBdL5yujiDW6DFxUY0v1C9Q+pxjjWHcJu2B3JWCLIShFCuBLwOo
	hcYUKBjhAB823xKiRw7jdRQdlUYtCibM3QcxI86GDOfOXRbXcBGRyOAAq1z0Buyx1/ONXsB01t7
	zheCbATUrScQPrrx6nkethm5w//Ugc79D7fIHCZK25asueH3k+Z7LcBP1NSwpkquHcmFPfMVA3U
	egnxaC4E9hSVIplutTwd3DljyuOeMFmiAKuyC2vKmLLP+YavMf3SyvB3+U4M/g5Xr2yjgSbJdkW
	wjyHF484hgDmW6QWqCUpxu7/752GcrnElhe5ZrdVDOvmm+Oa1ff7Xn0kW0M4wRmGP46Isu54X93
	jLlMdJXhsBsbRWBZ5c7AA5JhOYzQIrkg502YCg9w88m7LEZYgUZGE7vWlUnCshon+VeClG9ZSJQ
	YQwqYBw==
X-Received: by 2002:a05:600c:4f4b:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4ba0234bd12mr43740995e9.22.1794304480565;
        Tue, 10 Nov 2026 01:54:40 -0800 (PST)
Received: from ?IPV6:2a02:e98:40:8091:e8d5:38f4:f7b3:6dbc? ([2a02:e98:40:8091:e8d5:38f4:f7b3:6dbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204e22csm48483805e9.12.2026.11.10.01.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 01:54:40 -0800 (PST)
Message-ID: <873c22a2-fd3f-4927-a06f-16a73c30de86@gmail.com>
Date: Tue, 10 Nov 2026 10:54:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/11] serial: 8250_dw: share RX trigger setup and
 describe Allwinner UARTs
To: James Hilliard <james.hilliard1@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
Content-Language: cs, en-US
From: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015442_762154_E69D29B2 
X-CRM114-Status: GOOD (  11.05  )
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Based on tty-next at 6628e7d4c6b2 with the posted RX trigger callback-lifetime
> fix [0] and DW BUSY-safe divisor fix v4 [1]. Platform setup runs before
> installing the BUSY-safe divisor setter.
> 
> [0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
> [1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com
Hello,
thanks for the work, I wanted to upstream my changes [0], but got 
redirected here instead. This fixes the issues I have had in a better way.
I have tested the whole series, so I reply to the cover letter, didn't 
make sense to me to reply to all messages with tested by, but I am not 
sure if that is the right way.

Tested on Unipi G110 controllers (Rockchip RK3328, CPR-described
64-byte FIFOs, ttyS1 and ttyS2) on top of tty-next 6628e7d4c6b2 with
the two prerequisites. rx_trig_bytes now reports 32 instead of 8 by
default, and 1/16/32/62 select the matching hardware levels, checked by
chunk sizes in internal loopback and over a real RS-485 bus between the
two ports at 9600 and 115200 baud. Changing the level mid-transfer
kept all data, and the level survives termios changes and is kept when
set while the port is closed.

Tested-by: Kryštof Černý <cleverline1mc@gmail.com> # RK3328

[0] 
https://lore.kernel.org/all/20261109-8250-select-u6-64bit-v1-0-04bc8332fa34@gmail.com/

