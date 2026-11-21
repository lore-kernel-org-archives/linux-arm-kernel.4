Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E618606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xeXy0BhD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cI13BgWJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZDzwv9ZSu6zRp0zmjvhYUCIPS4Yi3I4TG09rcUw6Tm4=; b=xeXy0BhDvgja8w
	87SdG0og/BVsWa5E6wP+lC+y54Ik6mDKJUbsM2hkH95jr1M+m4r2XAHctdybiigqNGpxhpgq/rE2r
	ptJyI5KueZaWQtLCvjcXUApQbKXhdMSNuQLpmEFh34NzxbJMwZUbzjHs/N4E0ykTLg/Vab9mbDirF
	/XIt0xudhJ5uIJsWKc5MrrdMZFs/ykRH2X/pFZ618iHXoRhBr9LYP+59stj7K9nX9Ne5cmQaHzduK
	kaH6JVz1vQjAR4t+vgV/tjTe83bRatNAEd7OJrVrma3ydP73i48LTFtNdjgxnCSnbwyIRk2REOW0b
	goIFXwZOpjsTjjVotKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUhMG-0000000Gzfz-2DtZ;
	Sat, 21 Nov 2026 09:26:08 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUhMD-0000000GzfO-2wCn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 09:26:07 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso1138480f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 01:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795253163; x=1795857963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDzwv9ZSu6zRp0zmjvhYUCIPS4Yi3I4TG09rcUw6Tm4=;
        b=cI13BgWJiEOT2J7fhM9ecXA2WXa8Imis6hxX4LR7txzze8Rk073Z9otss9n4Aummq0
         DtSAJJvEgo+y8MjqZ/2SnyC3x4W3NFI1NM4A+lHZuTFV0d7YQQ/CtUttqC5dpNVVL6Pf
         VpXxMYVaSG/nfd3kr6ubMDuGj2fac7oeOXIdiJixQZJxqo6ltLg8Fa4wlXaaqBuqfeza
         davsxa7qJUYRDBA+d5fRI2QzKl0uUHvMGnSWzlcmIv2hFVUhZd7Ia76e4nEl9M3LH/vu
         Iw9t15Ph4uyRKb64TUzwK+GRSUh7b9lLyJhXqsExZb+EZ7JJro9ynsJWTiYpo+Y9me9/
         sF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795253163; x=1795857963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZDzwv9ZSu6zRp0zmjvhYUCIPS4Yi3I4TG09rcUw6Tm4=;
        b=EiXxm+/whEjbrfY43m+cy+sV1Qrg1GFaICrofp9qNHZG9EHlhIRbc8iAS9Uv2pl0/1
         cM+Eyep7tccMbTnQix88b780T9DtkJG+RD5qtZ8BJFyKyoAvoCCqolah87rVr/+eTZqO
         OhkBXVINGZaMSVHXMgv4zYrjphbjU5K2yjSPT9T/3Cy7o+oARM0sPJKSs5rax5sAy3qV
         VgF7uRUHNMakLEdH8UCEGVn3/0KuuFywFHT2PhCrX4wQFKPYSsj2g2x6FC84pmPethPM
         CqdPXJFWlykg8rwi9xkBtmlVrvj8yZa52FrGvny5qu+Q1JMGZ6GtupPuLP5/gNOs7kls
         SBbw==
X-Forwarded-Encrypted: i=1; AL+hErEphaf6M44AhBlemWrtMyCG/Y1UxlGn8kIIN+KV7FyHzviy7YgZgLMMBjzz4xkJlqVAzI1+aEeDrgJfsC8dE/3d@lists.infradead.org
X-Gm-Message-State: APuU4Z9JINuW8X6weQDRg3XnfVN0pJpzmXRyK0kcf3G0umjOJT0cZrqh
	v1aGdEhLRR5wOVgmcJ7hDatIGapOEdVEIvtyv2eMnWPvJpXTL7cacFfVKKAvQQ==
X-Gm-Gg: AZFdTZcUiDZ8kfHAnURqONy25D9dDd35unVgxCTPXKSH8MPUaJ8gYSU7CVW8zenTUoW
	YXJWV78cV4sjgxe/LPejYA2zakqZqn0L55OsaOBp0XCj9zKb8Nf9VVfUr98LZ0QSNAUMbXfXVHy
	myaZjyuLARenxaDq2D3yIcq7YKCCTX87s4MDzeb/BYIbMeXEh6ima6YL9LX2CcZ/xPR8K2a3ZTm
	E/axvvMzKHbbkabnH1duJsxTQVNapDvfCfYclO1rNVlIiYGpRMrlH6D4ZEznqOC5v0ueI1It3Ll
	mu9zCva4YFwx0nEQKWxjkE2fydk5D0XrpGVrRH5QFUoY/Ws5jD89luxLw/SOUnE9HJ0d6iXCwpQ
	6uBPQsm/IArk+t2XQOtKxk6OHlk/41nFnfDxkGUFlMDgvOK15FfHAPn05AcMQxVXPxlEDHWn2k8
	RMupZmJgw5n3IhftGsuLyng0fvfVf/CV/3FLQ9W+3iOTDoqPwJHajlA+Y2nv2nHpAspbRdw5tev
	xVASxhOEyKuWTSxRBljs5kucoMixls/hstsSzM9CQ/fNpG6gnV1W4BA01UnoINFDnOCTyZJSz6u
	aDwzVvX1dLYdD4gLbNZeLjpRGqhkkc+a8MGwirmjmElcADAHQSLxJcXDpeHd
X-Received: by 2002:a05:6000:2585:b0:4a6:d298:8329 with SMTP id ffacd0b85a97d-4abb6b1b034mr12634377f8f.43.1795253163383;
        Sat, 21 Nov 2026 01:26:03 -0800 (PST)
Received: from dev.Default ([2a0c:5a86:4d09:3a00:3c0f:a5ff:fe86:2946])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm6707420f8f.17.2026.11.21.01.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 01:26:02 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Navid Ghahremani <ghahramani.navid@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: zx279128s pinmux questions
Date: Sat, 21 Nov 2026 10:26:01 +0100
Message-Id: <20261121092601.1543468-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <fWpK6nqqTOKOq96a3X8SYQ@gmail.com>
References: <fWpK6nqqTOKOq96a3X8SYQ@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_012605_783823_E84128BE 
X-CRM114-Status: GOOD (  11.17  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stefan,

On the ZX279128S the pins are individually controllable.

The chip's manual has a table of the pads (GPIO 0-63, in order) with up
to four functions each; e.g. JTAG_TDO can be JTAG_TDO, SIM_VCCEN,
UART1_TXD or GPIO2.  It doesn't give the register bits, so I mapped
those from the stock U-Boot (it writes a per-board table into the
block) and by flipping bits on my H3600 and watching the GPIO inputs:

- 0x94200000 + 0x00..0x0c hold the mux, one field per pin, 2 bits
  where the pad has several functions and 1 bit (function or GPIO)
  where it has one.  E.g. bits 2k+1:2k of +0x00 are GPIO k for
  k = 0..10, and +0x08 holds the NAND/SPI-NAND pads.
- +0x30..+0x38 have one bit per pin; clearing it makes the pin read 0,
  so probably an input enable.
- +0x50..+0xa4 have a 6-bit config field per pin, five per word.
  Bits 1:0 are the pull (01 up, 10 down); I haven't decoded the rest.

The layout is irregular, though (GPIO 11-21 sit in +0x04, GPIO 36-41 at
the top of +0x00, and the 1-bit pads in +0x0c are out of order), so a
driver needs a table per pin with the mux and config positions, much
like the old pinctrl-zx296718.  With that table, a pinmux = <pin
function> binding like yours should work for us too.

I have the per-pin table (manual functions plus the register positions
found so far, some still unverified) if it's useful to you or Navid.

Agustin

