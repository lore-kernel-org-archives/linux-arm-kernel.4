Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB39606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 17:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AlP5xREK;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pah1gaaT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=; b=AlP5xREKeyV20E
	Om4T3NCFKJZ0Vy1OWCJFQzaz6sA10l91NRqNJMieAERuX3C2UQmGir2slR71nWT5AT+YRh5ZZfyLs
	uYi/gBWX/ZSZMa9XWJVyZk5iYKPpuhCsGhnRLUzEt0NuBRfysXMTfwt1H79O9XH/7AsbY0InXdrlK
	5o+J0b7GZeGfbhFS9y9ku2a+846ybUBdIl/4d1MING7fpTCmKFYD7B9MJ/pBwZAFXxfQWPxGZVhQA
	T47NJwKhnVz0wPBbFd9R8bbstRLTx4BQMdeYC42fq4sHgL9Ipb1KaqDeiS8ISJU87EbFkQ+IJqo/M
	oMrCfmzeAyrWrpaFOo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeVD-00000000IBe-1OWe;
	Sun, 15 Nov 2026 17:58:55 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeV9-00000000IAE-3UNO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 17:58:53 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-677d35fd1d2so2585261d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 09:58:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765530; cv=none;
        d=google.com; s=arc-20260327;
        b=g6p4yuuNzOlDFVq8rZxLtx7yFRH/9BITGiLIZZ2s3EjHOirBAVpKExs9L8g4ADbApt
         92BX0OdQ4NsnFuWyv7RmAE/Hdu9F7rQrEIKZPjFnj95S6YD/KKZFOfuhmIP+lUY7hGWl
         EOG506rVLovUDcs5QBDj1RL2r1A1DysCm3/BmjCor2F7Ms0ghWNnNo2jGdW5WhRKRz5j
         IimOBGa2+KrZHO1IePTgeEss5qo4F2rKllmNPmjPn+kS/Ly29kwEghysW+/onmt1Hgyl
         dHwVn0om6XyrwYC6hGN3RE/PleDlWJILcp5aaWCGGHmfvjBH13TF4rAaEQoCSttV3+mK
         QXTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        fh=XSgQYXBmHlj2peg0hJSpTnHn2ztVSupmLMNntYpl6QY=;
        b=rqnRz8HbiFYQVlXF7hhpUB3ifNfBPChaxcnI7Lw7p6jj2Uu/F6AHJDwkEU4gV8mD2w
         P9cPgWBVttVwcqDjTV9PJpPFOlOHDiD5Wj8n61cwe9D86xHU+CfEjcDhNojmz/glmfUX
         OEWzg1vB3QLWNr2hb6wNGN3OLeCniouT9Ddmd2dzaRFB2QQdwOYUkS48vRaUhzwhUjY7
         WhfU7hPqL3k9XkJ1RzWEBrfsqyD9Ri6B5lPRazwCOsqqAO3Dp6h/0+fIGrsqcFLJF07L
         w84dD8iIuAkbeubV8scgq+z3pRtsBgrHsWcpXHoCJ4vo7bQH2t+jmIrku39R2rnWytUb
         8BhA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765530; x=1795370330; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        b=pah1gaaTvV0q540jY0p3hiN+oYnDKrruUVcQ7P8XOknqjKPHALuslGTMc3xQiDZ2k9
         o+jNlru4vvTKPXawOfO4iUkBGxqhCcE119HNf944Lx84IWpVVuPt2NkTWfCEYoDyN4UB
         7Ra4w9GW0Q22ZkUToWsmE7p3w/TP/mTaKRW10q/OW6P5y2gryR91Einih0424SpeBV29
         soNytJWX1JRbe4zOSaoOWw1nDYCh2EK24vF4xEhc5t3epivb2A/X6Tv1ULYZgNp72mr+
         SSRqFRdmsTk9vrE2U+n+/oEKStNICCsAeSZO0F3JhyBekFzKDLQ3qMLaupVhUwyQek41
         JIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765530; x=1795370330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        b=0gxF+DbyapEdgX4Nyb1nX/pzFeea9pH8wu9o3/ci4Mys9DebH1KZDE+e8ml2DuVW7/
         peiW/9yEcLxbAMDTJZLc8ykRZYzGoKFqBpVHY1AG8ZgwIqbrXYLgnCLyWJorKFBJ86CI
         rIOwFkRscvnim+SyXIl6JQVo8gDLVxfYZv2mLGh3mVlmR0LYKh3AkbakFkt17I4J4WXQ
         auxJazbqsJKu2w+9/PMfGvxjkJy3cxrajuqPCZW89h2X6J/9LGDURzBg12TYtquFwFu0
         C3DbUUkmCC6tWYyA6jN46qcaeAAIFEQFJ5Yt/y/esI/iG/ZSMBCLEwrpqyUSJ5z8UFqK
         9Arw==
X-Forwarded-Encrypted: i=1; AL+hErHdkx6Rncz0nviGCUs487eDlCebeaY3FkfdnrzqELod6GMwvW2W9LpJx0gPiGw+bBAF+jfzAuFCrM6QrWX6dYxR@lists.infradead.org
X-Gm-Message-State: APuU4Z82TcrM4yXybDOy54le6+wj12JJtvDPr7DPmzI3l1rx7WP1KNaj
	tr/nt5lESr+kiQIPnEccbXNK1Wkp2EPGVSeEhPdEqMNlvzmHV8EMJ2mF8bGPdKkTRjZZN2wIchh
	uvr7MesnzO/jl6NekxbcXA/W71gFoTLU=
X-Gm-Gg: AYBFou22HlXso8iTjBG3tna+f/snJBOoBVmvkfjthm2fSs6WsEWLq8JLgRKQR4HkAQs
	Js2SZlYCizE9nZJ4haXpfwxH5uT9Pd/e5/20f+5p1w5frlAEpyagCq1Dq5nGAsfIt5Ho8SNKXEY
	fsC8PrzVqg5QY4+cHDLH53b3/dxmBFbG5VikGzkGz+0gKr+d8ELJoB2ivXWeK+8WrFk184zSoDK
	qsEYjf2+hIGIet8v4Q0a/zYnCl76LkzDbgQq/LuvjpfBmTkrZ0lKG4BTy69waHqqIXOnkchzP0w
	GeCTP0/pM54stjCpTbkDxebdGrsWXi9s98X3jJ3TPjoD/RYvfNYaNaeY6rjl+xI+VrxkM81umUR
	FgWF3fkEIvOGiUFwRtgJOy6AF6feEbJS7iO9qxwIMBeZaT5Zx1y8taM9HAukkdQGySa0QNhE=
X-Received: by 2002:a05:690e:118f:b0:67d:9fef:d61a with SMTP id
 956f58d0204a3-67d9fefe1a1mr1954166d50.8.1794765530625; Sun, 15 Nov 2026
 09:58:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-6-tanure@linux.com>
In-Reply-To: <20261113121852.334604-6-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:58:40 +0100
X-Gm-Features: AclHuK_i44pvTA9IYISQzdnNKpkNilY1KX3H0SN4TaP7nH1OVG2B38AEZw9Q2Eo
Message-ID: <CAFBinCBbL0F=2Wx66Ef11gUKHdz80vYrwjniMFRzeK-uiu5-rg@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_095851_874079_7D97EB17 
X-CRM114-Status: GOOD (  10.36  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The SoC brings its ethernet interface out on bank Z, but no pin groups
> were described, so a board had no way to hand those pins over to the
> MAC.
>
> Describe them as the two sets a board actually needs: the nine pins the
> interface always uses, and the five extra ones RGMII adds for its wider
> data path.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

