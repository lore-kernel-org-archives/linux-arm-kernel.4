Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C25606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yNHLSjFC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3Wc5x5S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vbdtEbm5LIRul3kqOHVd2p7iN83nh9BlOv0Le65cRbo=; b=yNHLSjFCfr/KLJ
	kEy4ZhKxw0cxuCIJTgX23AUZV7MfnHMf0LlSxZSLEVD1JxZY5lJNGXYrsGxYm1WxzFAPzil6+RSIX
	bGv6RBmjNofey+w4l7xzMSQ1PloAVZqT0pbXZr/yas6WQ/qnsikyAjDO3c6ak/Cgyhu93f1d4lNBM
	MKnLHoVAyJSSqwzdDHDbMCj++bA+cjusiqkVBnLc6Yhi2Ayl8Dq3mF9R4IY85tOsbxJ62JiS7ohpw
	CIZkl4BZT2Az8WK60YcTf7j33sACaYxihUZ0gT+fSKU3FK/0Ttk5/sx5hCLq1JaN3GYcxkJD3gYo9
	0kiIcUtK57RzKPgCRk3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhOp-000000038uV-0Wuw;
	Tue, 10 Nov 2026 08:40:15 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhOl-000000038u5-37XR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:40:13 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso2208171e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 00:40:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794300008; cv=none;
        d=google.com; s=arc-20260327;
        b=VITYfk6EkG8kfUjcc+Xtuqb989NEX/7dHm2pYG2q1fpN/1mPq7WY76QKpTQA5UdP6U
         7TszIZz5iP1bEFXlxhAEG4IpmAJrlFKn6LenkOIZ0vP6E2x3tJtGKDe9oj0RBQliUQSF
         VkNXFEiL/QUfnctrBz76IcQp/Nnov+6HKVAe6fKx/QBkuHSQlwhdHqZ0rTm+2k4mxBo/
         lAeNLPiyIjA6TfCn6iXfCDGbT8gHCShMjul8cEgYeWlV9ylDlV7F89UpFACS1d6VHUYE
         8rCaLDZA6so1emEFF8UYr5TIV3iMBbxEz9vjg2JNJ+cVdQSghHd8tBB01Gq/OwQFJzXC
         S6Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vbdtEbm5LIRul3kqOHVd2p7iN83nh9BlOv0Le65cRbo=;
        fh=h+OInqfPQLTvIfr5Q8fG+8pRNkpY7VCzf8zQy/+IctM=;
        b=itwgepldZ4fugSoWHix+wHu03toXVP3crudlFXMTYXdRaihiMevq0OaqIf+xMPedPj
         iZcsD0s6asURUz8qjxMuQ24v8V1vDiS54aOCzBnQ4+dHrS7JfNvW6EB6AbqvEjz+PcFt
         uM310Z1wjNkQOAL/WI5Xy8rZ/CAFkh7A3+vT/Bbuqf8057tA/NXFuSB0Bib/Q2c1ld3J
         Izf5gceSu1lS+ssqQHPrR5yBZm5sKSPNTwEqoVnrxwUEcr9Di8Hz+Sxmqofw1MTMpXBt
         eJcgaWDOYzeRifV8zQffb/+oDaho/a5WIEZGOvUUL9enjG3BsEPfhRzgbx+EKnT7iVYz
         cPCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794300008; x=1794904808; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbdtEbm5LIRul3kqOHVd2p7iN83nh9BlOv0Le65cRbo=;
        b=B3Wc5x5SHBmUjPz2RAjATxy39V/XGuvlqFzX0Eu2DYJBtPrfonR6yn0ACLUpomcBxZ
         /0lboD+ka5SHIlz2s5rMb+hItcxzai+9HLfqt27+GPLqbMaHBaQI/Y9sobgvFoUkFWMB
         qeCCxvdtwlulaVZ8lvWFQ267JnQXCfLXk30mQn5YRh5wzzoat46+Iug4ESI7AK3bN6uc
         X3FPrOh2SDSgssrq4l03DQa7k7UmJdcxazRAuzJOmrrQKFrFR+ZnKuXvF5zFuTVVPWjt
         EvSUDt/ZHVxrVVm0wmm62RSKLXhzFPM4N1QO9fvbhh/W/X/qm3hUwhx8TPm6WUIihmwG
         DEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794300008; x=1794904808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbdtEbm5LIRul3kqOHVd2p7iN83nh9BlOv0Le65cRbo=;
        b=CJxnCj7/jDeou4OliNWTdZNA8rQW4KnrJaiRWM5A7ftEg8ugOyGarADcpWrSkYwj0N
         cc/lMGsnX6puiIVNzixJGK3Uh1tBXECZtRXDnfDNFw7rvUhlbFnrmbp4+cjce1NOQoqM
         kRtMAW1uGmYCwZvP7QTuvRDD/dY9FJFqo+5g/qSQDGShNquP4Qe1SDQZHAM7iSTSNIuo
         t/mBZI384nSeRVO1cS/JIGEdaZPowDCEfMS/JOSvzJEgSPc88BqcqquNV6R07KS35AGC
         R0+e/vmn4YGGdeFDNfe0zPgXrwBWImLituPVwoK7c9xh/cDpvpEkFMry3p9wFlvj1ZcG
         ek4Q==
X-Forwarded-Encrypted: i=1; AL+hErHNdqTQ2e9M8y/YqZsjTU1j/sCjNAjs2c/VSzRV8Eg7Fe4GJ7tbI0HmVhABGAXI59bbvs2T3h4anYsu8SozZ4xe@lists.infradead.org
X-Gm-Message-State: APuU4Z+4cUvwALURfsnjvfG7e6WQE0KlYO3UK6kTkvQmul3Fw5IxJCzX
	xgl+O0i+DtUu93Cde6mSqOg0XWWu43CPPhWJKyXR7TeUmiEvxhkPrzA+/rV3sEWLdBS0z9F5ZIP
	Me9tw5KicLIrP8emhusvpYyJprVoyvXw=
X-Gm-Gg: AYBFou0924ht3glpKRC7hBhFMoTabsnlBYqxKcmrkuhcbwCj1Is8iYqoJVshNPOSWUR
	c/UxrJCv4tmop0kCFGOEy+irB3BFmjqnwC3Kl3F4OTERARG+3vQs/TdYjjueZ1glXza22zHkwFp
	Ok+3PV1PsHrhondIBtoOV2/8jH6Q0k5cCJ9BqgMuAj4R1BtGz675j7xLbZiCe5tYUzM9zaKDhpR
	T1DwPM+fFG/Nw3vg/0FQUgfvnCbTcO50ZY44ZYWisdJ7tZmDBIYSalLtpDADL9VbIJ3zdcQ/1Jh
	qBDesYmKyeFNVXcK6IDZs+ewXbQGHQblRjLD+8irLj1rUoqAoyjZUVufe3iNgWTkF48+Of0f393
	q8bHGf/rGve/l+W7DkI2NMdeFfUCzL1vbcKhPRDA=
X-Received: by 2002:a05:6512:1090:b0:5bf:c5e8:7451 with SMTP id
 2adb3069b0e04-5c156ef6a9amr561697e87.65.1794300008049; Tue, 10 Nov 2026
 00:40:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com> <245d0e9d4043c0957716a6a32985b6ea5a8cb9ef.camel@codeconstruct.com.au>
In-Reply-To: <245d0e9d4043c0957716a6a32985b6ea5a8cb9ef.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Tue, 10 Nov 2026 16:44:35 +0800
X-Gm-Features: AclHuK_YmaCFjS3fljYs9klvoSNNKJV2oWD2Es6eIsNEQSomFv3bnXQjY-fu8gk
Message-ID: <CAF7HswPYb3hOWA7P-d1zASvd1XzaVeuBkoqz5nXHuDeEAXDhrA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs and GPIO
 line names
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_004011_820644_A95BC622 
X-CRM114-Status: GOOD (  16.31  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 9, 2026 at 10:41=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
> On Fri, 2026-11-06 at 11:08 +0800, Kyle Hsieh wrote:
> > The LTC2305 ADCs use their internal 4.096V reference, so no vref-supply
> > is described. Patch 1 therefore depends on "dt-bindings: iio: adc:
> > ltc2497: Make vref-supply optional for LTC2305/LTC2309"; without it,
> > dtbs_check reports a missing vref-supply for the LTC2305 nodes.
>
> Can you provide a link to this patch? I am yet to find it on lore.

Sorry, I should have sent it before this series. It is now posted at:
https://lore.kernel.org/linux-iio/20261110-ltc2497-vref-optional-v1-1-35c96=
57f3c0f@gmail.com/

> In my opinion what you write here should identify broad patterns across
> the patch series (perhaps how you've grouped the patches and why, if
> necessary) and not rehash the commit messages.

Understood, thanks. I'll rework the cover letter in v2 to describe the
series as a whole instead of repeating the commit messages.

Kyle Hsieh

