Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BA8606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nfB2WS6S;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8SJZ7VF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/l2T4p9jCPLPtTUGGPewfdDVP0Og2K5VK9xJnKL6jZ4=; b=nfB2WS6Sma7iHodoASCkLXieC1
	lS4APOVhijUqswVKz5TlJM3RjbmsBUC6QGEAuHSvSI7+cDyC5uSMbRlr3DI1ZdTegI5GQ+R9jWb/H
	UyIhDkfXVYzW/SCbEVj9/T3Xe2ZbByRe842Ymdz3+ifi+pds8YuPnza5rzC8wzrxMhN6A/SNzjD2Y
	OymchItMfT2iiRzQP2s+y2JUYSQU9f70seTtjYKXtqPMj6prMW2v5RD6lSWixlPYxo1KvasveC0qe
	ZD7woKwuWEMJX7odAadNf9h/hI8Tjx9zmtF82knb5pp5sDF9zJYjMvVZAAK65cHSUxWoLw9U+Mvwm
	GwszT5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Jc-0000000682z-3DER;
	Wed, 11 Nov 2026 09:08:24 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Ja-0000000681r-0DSu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:08:23 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-85ac281604dso1700748a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 01:08:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794388100; cv=none;
        d=google.com; s=arc-20260327;
        b=C2eLYNZXYkz+8o5V4kv0eASx71RJ3nz7laWP17WN9GETZ51jcpGG01IzruzbTVEs/c
         L7wg1cBjcZCVpE10ol/AkTsqh2cjNAYpti6xC19h2JPz8iHAgZHaVXAbQp5FgOL9iHtG
         yNKW6T1jmgwva4o2rAzxShUY69eucdlfZJ5/wM8CEUmysRNIjYjd8iY4m1b2kc+0Ui4+
         ViIui+HWf7KZq5+lpaOzaR73CPN7pOEmXYMlcZSbBzvBoRgdz+F1CCW9L+wLzhQ79Wtz
         cInMlDxT4tLeRAPM3jst26xpvGigxnT/Tos7JExilT+/Ua9DCgla3MR1IDCNdvPJ2zEk
         3oTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/l2T4p9jCPLPtTUGGPewfdDVP0Og2K5VK9xJnKL6jZ4=;
        fh=mWaBOJQViibkOBQiHvuAu0GN/SYBEsfi5Z/h1ne0d6o=;
        b=He3t0IW6Vrfy+YzCp7WWC08wd3YLBZpPAuo+98D1QzBKw9nyHj3U8zar+eaceKjtTi
         rpk6gkVMedcJkcFA8rpgMc5z0nhqgxBrCFSUISf5gAB2nB0V1Ci7MtRhdVuBh2c24cfw
         9tXaYs4RaWHe7wO5DfwHjYnMycDa89bVBdY+EG5tsiZx82AGU+Giu5E4smkVecbdbBkz
         czsX+d3ZdRICqKqtrVJR+XiP0h7PwAjr4CQAEcMWs8OIkUM+yjriap9Sk5zJehZTGFMj
         r5U6bf4cX/ix+ejaOfT+v3caOr38savV7vRWNi0lcw9RaMo9i8Gsa37P7MY8PtwbuMKT
         kJ2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794388100; x=1794992900; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/l2T4p9jCPLPtTUGGPewfdDVP0Og2K5VK9xJnKL6jZ4=;
        b=v8SJZ7VF1AgbyqFnOBuL1uviqmIyYDXPgFJvN1qZV6sutBWJcvFaNdwwkKyOQQ/+tg
         C79ebNywPWLWlsjsx6GZam8iu8xkTxGqO+AfD49tvYndjTRZjx/nUb1r3Nv8miwK/F+F
         eIkq+B+NWDxwPlHY8Q8w6g8BUCtmxV7olv2Z+MsjnFKVpj+YwgX3qK+2UFe5sHc3QhZ9
         xugPAZ9NS+p9buzxWxXaUgXg81qghy02GVyHssDlXNm3dhS9ele6mKmBqauHEaVo9LWN
         P2FVUZ15nfn198FyY79up3EfsjMMLUZHIcqQOpbziSq3+wXWMfu0vvzunwfMNng2BQY1
         bXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388100; x=1794992900;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/l2T4p9jCPLPtTUGGPewfdDVP0Og2K5VK9xJnKL6jZ4=;
        b=F0oW+0huKLgVRgoGGK0t49hxDRqnTMqrTJp3J2qfFYlYkDZFLPXY2Pr55kXUM+1K+K
         USs+hKh+qVayRxcMYegMTrQOkL7yU98pONvY690LqtOLibpJK09IlvcCl2zqLAMdOb+J
         vN1+W/rI/bdZZGKn8r+AAsSG4oIpg0dSrbmzNol1Wq0UdJ6QEAWpqUa+oafcFrAr4Nfu
         Gt8xT/Ze9SeA0qt+HEfkeQ+u8//MbuqJtsLeCFYDrS3D/4jmssMH8bF8HGRw8znixb1Q
         FViWE5BoDAlgYdrn9Y1ar+Qm4/8fJAaaG0PbMIVUHSHTN5UVrZcupp+vEd1mWb20Z+Vo
         55xg==
X-Forwarded-Encrypted: i=1; AL+hErHhZxsOXeRwERwbkTFSkTa+/uy9OH9KPEBdgmsTo2FjKf/UepYxjeZMK2wZN2t4Shyw6wQBoBAlsGXokwhY3AbG@lists.infradead.org
X-Gm-Message-State: APuU4Z/caWxAcez8BtgngunIJxjWuaCTVheOwe81ltNN3sHAKmh9KQcF
	2+fuJwkrCkgs99ikFpW3CWA1j1oxIFNFo+C3Gp0WufwUynCk6FYK81nVbYQtLjbJlCRXo4LR1Fz
	qv7+KXG58dWE5Y/o/rcM0oZiMtFth8mQ=
X-Gm-Gg: AYBFou0y35F6oFNNnv47+fJpB25k/PC244Fpr3j7eIq/CW74AO758L8hsJdgbQki/or
	e52t7v1DuP8vSUIurWSJLdTYWRXZpxrMtLcXfz2v4B3BlvuqsTLChKi77KsjY+JJl+iNkghAunT
	ufUxoxpQxACN+jIUxZcIK8HViy3v3TP412WgdFVph2OTMgL3vdS5snecUAPaYxOLWXBygj9OioK
	aWLyXFwjHfZTVVN4/vYdzVExyy2G7QpWSEJFs61jwHL2vn1LuFLd8760A45jahoRQ7Y7LrDgIEy
	KtYP373hxynygzsGl5OEtKJLSR+BFOt9Rcg9BhcL5o0eejWqItUdAX5kXIf/wK84c+g6oX+UgCe
	e33CZ+oKHORI6/5OH6Tg6q3WW6tAHCxrUsn1Qnw==
X-Received: by 2002:a05:6830:438a:b0:824:e29:e00e with SMTP id
 46e09a7af769-860f287b5famr1402960a34.20.1794388100515; Wed, 11 Nov 2026
 01:08:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-yv4-remove-ff-nodes-v1-1-aa707a9577b7@gmail.com> <4d149414902c2e7d2d8cbfb2cf741f6e6b21add0.camel@codeconstruct.com.au>
In-Reply-To: <4d149414902c2e7d2d8cbfb2cf741f6e6b21add0.camel@codeconstruct.com.au>
From: Eric Yang <eric.yang.wiwynn@gmail.com>
Date: Wed, 11 Nov 2026 17:08:09 +0800
X-Gm-Features: AclHuK9PoMNLsTgMB1BxJw0pLV5rr9HNmObTBU7Lyh86uA-154BvlF3_R020LyE
Message-ID: <CAFme=rkf7Kgvv2DjLos8EbLamqVzcHMUWsUQb-ZRmeMWjWZ-mA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: yosemite4: Remove Floating Falls board nodes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, patrick@stwcx.xyz, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Sean He <sean.he.wiwynn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_010822_107493_7A8E8CE9 
X-CRM114-Status: GOOD (  31.47  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

Thanks for the review.

On Fri, 2026-11-06 at 15:46 +1030, Andrew Jeffery wrote:
> So the expander and EEPROM are on a pluggable board?

Yes, they are on the Floating Falls board, which is a separate board
that would connect to the Sentinel Dome through a connector. That
connector is not populated on any Sentinel Dome currently in use.

> Which "stage" does the devicetree currently represent?

The Yosemite 4 hardware itself is not going to change any more, and
this is its only devicetree. The Floating Falls board is not part of
that hardware: no system currently in use has it. This patch therefore
only makes the devicetree describe the hardware as it is, by removing
the nodes for a board that is not there.

> Have you seen this discussion:

From what I read in that thread, your concern is that a devicetree
that is changed to follow the current design phase no longer says which
hardware it describes, so changes to it become incompatible changes
against a boundary that is unclear. You suggested:

- sending only the finalised design
- a separate .dts per phase, with the common parts in .dtsi files
- for small differences, a .dts that includes another .dts and adjusts
  properties or deletes nodes

Did I understand your concern correctly, or is the number of changes to
a devicetree also part of it?

I would also like to ask for your advice on how we handle future
platforms during their pre-production design phases.

In our case the firmware is built from the devicetree of the latest
stage only, and the devicetree and the userspace usually change
together, so we would like to send each change as we make it. Even
within one stage, the devicetree can need changes because of new
requirements or problems found. A platform can also have several SKUs
that are developed separately and can be at different stages. We build
all SKUs of a platform into one firmware image with a single
devicetree, so a devicetree per SKU would mean an image per SKU for us.

Of your three suggestions, the second looks the most workable for us.
Sending only the finalised design would leave the devicetree we build
our firmware from out of upstream until the design is final, which we
would like to avoid. The include approach looks suited to small
differences, but the differences between stages on our platforms can
include:

- a device moving to a different I2C bus
- GPIO line names changing
- devices being added or removed

My understanding is that your per-phase suggestion could work for us in
the following way:

- The top-level .dts keeps the platform's current name, and our
  firmware is built from it.
- Parts that do not change between stages or SKUs go into a common
  .dtsi.
- For each SKU, the top-level .dts also includes a .dtsi for the stage
  that SKU is currently at.
- Each change is sent as a DTS patch against the file for the SKU and
  stage it applies to, or against the common .dtsi if it applies to all
  of them.
- When a SKU moves to its next stage, DTS patches add the next stage's
  .dtsi and switch the top-level .dts to include it. The previous
  stage's .dtsi can be removed in a later patch, or kept if you prefer.

For example, with two SKUs at different stages:

  platform.dts            (top-level, keeps the platform's name)
    includes platform-common.dtsi
    includes platform-sku1-stage2.dtsi
    includes platform-sku2-stage1.dtsi

and after SKU 2 moves to its next stage:

  platform.dts
    includes platform-common.dtsi
    includes platform-sku1-stage2.dtsi
    includes platform-sku2-stage2.dtsi   (added)

Is that correct and acceptable to you, or would you recommend something
different? I would appreciate your advice.

Also, when two SKUs have different devices at the same address on the
same bus, the devicetree cannot describe both. I would appreciate your
advice here too: is removing such devices from the devicetree and
creating them in userspace the only way, is there another way, or
should this be avoided at the hardware design stage?

> This kind of verification isn't terribly useful?

In v2 I will leave that paragraph out and reword the commit message to
say that the board is not in any system currently in use and its
connector is not populated.

Thank you for your time and for sharing your perspective on this,
Eric

