Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69871606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 01:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jCEHvXYw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TljlCl8p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=; b=jCEHvXYwo0VFAq
	xiE74rAr1xXLGLOTlXDouM248kh2eXDVOwTTPg4hUEhzKZxnpg+b+EtcydL5yGb82I/IrrJmJOTHw
	ObDx9rRBQSbolGy1DnlkwkrkaDQFA39rjKAKw9NVXdoMt+IfUw0T6JKKN5XZSklDT67XWhE9lwu54
	Vba0V7Ap7SUstp4Q94x8jovP+inVwG+GAG6A8lwLQ3dY4lSiModkcVFE5Vt77rtL+iua2cm/7J3nx
	RiYqJl5UE+zioeSnU+K95W3Q/xD0DgbgRw+Z+hGoQqIXvWpaDL89mk4OHRJcAFULrLnfSUBSm4eJt
	2NUXGuE0ZFYaZw7RvgBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWl05-0000000Ek84-2mW8;
	Fri, 27 Nov 2026 01:43:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWl03-0000000Ek7g-0INj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 01:43:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso72579735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 17:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795743820; x=1796348620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
        b=TljlCl8pHJrf7CW5i3iUCMBthg+gp33PU2D+18N42HZh+fwTjT3moV8MQBhFgo+Oo0
         9BMPRCbpzvpePX87jnjYgNcZPonDBI9Y89HLyV31tyT6eoDT9jaUDIpAMujJslWPucqq
         arTCYpcwk6wlRSQi57OPMCrLnw7vmbmARlaRhFwJqtfT7bX+82PD8b7FRsiYEMlrfdF4
         dAFZiDjmCgSsLjbGpI845kchwxEbBamUezGtnXgLxN9vd9swkGpN5RNwxDpBwXKGpdjh
         +sqa6rLHVLEGYakGBPu8TEHTG9J6v5FOB06dAO6SJs7KzP/4G20s5A6EXMm/mxCRhs25
         VKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795743820; x=1796348620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
        b=s/amI1c3G3Z59jogvp+2+wrXjGRTxHXkvUJqv7nOLvXgcC0XPYTvtAM5bNwT+8qEoD
         MSzGTF1MCnagJJBz/DGKxAB0HbXjhNMEWt5uRLmDDaCbw1mzJ1Lfz5Zw09zGlKgtPEwx
         gmDVdo9nu+SoT2H4q92xb/6aKwMzNy5Hat4LptwhAXYy9x7NlmHMgnQlDoYcxGIbNUQe
         deCUXW82lXtzqlAzI4OqkPK1SURSnU+rRLcyKl2RVBtzZ1nFmK+SR6SoRg5bnzvteP3M
         30RG1HBHb1vIcjbP0e/g8Jv9O8jgSNrDcxzzSpXa8uHENS5/P66yo/BNqUa5N28aC8sX
         D3bw==
X-Forwarded-Encrypted: i=1; AL+hErEs/YtECFpkae6zlL7FBPWssGdCYAvyKCacpo0/dp8hWeq6gKMRHPUtdla6jWE7zipb0PYTqZep+OOqc8ssPy4/@lists.infradead.org
X-Gm-Message-State: APuU4Z/AxrSdJCiZk7xjBKdXrMeyYgzfno6gkDyuoh+GutChJFcULKpY
	vrhVa+yB5unJhzhF3xgCnVnqjGV7NQ0SLAZb0eIPIZslo7Qdz4vPJxhW
X-Gm-Gg: AZFdTZcseURdohqxysoGjbrbmu+aXBDhO4OnofNMihOLNaILRiMJL1rbR9rkaRBN7Ja
	gTTrhPiIYMSm+mexKXsgVQ4TQfHFksd1dl4hJMBwULnr0w0iCFXHCaT+t6jnO2XI/9tQR6U1Za0
	QTuASttbeJn1Y6teQl0Ktqjs3NW+zI1gdvXZkJlYwdVhHoFiIzVdIMjgdTTogdlsaPyWSbfZVK7
	cXyZMeFzImeknZBuKBYkLMe25hfapxgwsJ5sk3tKOl0iD0ohL4EZr+eJoTh2yji/rdt4OIrubEF
	WMoUBFLO76hCW0J+3KPhklFz5b5KvxJHnLzzT3dLJYGsZuIueqh92gFJdodm+Fa+sZraZvn6ua2
	PjfVfUP1sXOhJ79vYQmvm9EbBCGyjCzSH4HvhQxayy7RjUcnWiIXu7uRK6nbmPDHWEUnT9ShZSG
	8FyeNW+cFl3XdpUHMKFQ9a2O9mI4maCx+YCBr3a0on2NGurb7P7Xowte9Z83p8kZdxh9a1wbI3R
	5ZDcjTPrSR0zI+ibyAGMTI0GklLdMD2Bsna65iH+BTajiIBaz/0UFkh2frUmYJmlOr4w8+b3WPv
	i/J6fCd+XrMTep3cTCW1RtGznDTWOKKqxnEIO393bwhAxmTZlMQ+E64r5r2QtAXpNAAnaopuac4
	A2YM+96a2gEQn7IcePHSlUIfNqYd2g3iAl9W3Ftgqx9FjZA==
X-Received: by 2002:a05:600c:3b88:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb8880789dmr521380065e9.13.1795743820179;
        Thu, 26 Nov 2026 17:43:40 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm385176475e9.5.2026.11.26.17.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:43:39 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] ASoC: sun8i-codec-analog: Add the headphone inversion control
Date: Fri, 27 Nov 2026 02:43:39 +0100
Message-ID: <20261127014339.1611234-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179476597358.140154.17606905713832103924.b4-review@b4>
References: <179476597358.140154.17606905713832103924.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_174343_130991_B62FA3D1 
X-CRM114-Status: GOOD (  12.89  )
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

On Sun, Nov 15, 2026 at 06:06:13PM +0000, Mark Brown wrote:
> What about the configuration with both set simultaneously, so HPL = L-R
> and HPR = R-L - that's fairly standard with an actual mono signal (ie,
> one channel as opposed to two copies of the mono signal), doubling the
> signal over the speaker?

I tried it on the PocketGo S30 (speaker amplifier bridged across HPL and
HPR), 7.3.1, plain stereo path (AIF1 DA0 "Stereo", headphone source
DAC). Bits 1:0 of PAEN_HP_CTRL set while playing a tone on both channels
and another on the left channel only:

  bits 1:0     both channels    left channel only
  00           normal           normal
  10           louder           silent
  01           loud             loud
  11           silent           silent

With both bits set the speaker only gives a few clicks, for the
one-channel signal too, so on this codec it does not give HPL = L-R,
HPR = R-L. It does no harm either, so there is no reason for the driver
to forbid it: v2 will expose the two bits as independent switches
instead of the enum, and the S30 turns on only the left to right one.

Thanks,
Romain

