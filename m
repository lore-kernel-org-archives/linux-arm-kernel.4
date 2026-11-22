Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E19606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KGUKKwv1;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CYTXWcOe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=; b=KGUKKwv1p/QaWM
	IOukKwOdT55pSc0CuX9bP7fjlhI8zZs/Lnhf6sXGfn0RlNalQqdWlxEpJaGRTHMdMcfDOhqOQaBe/
	4D6aytsOjNEEurxbSA4DF6B7Xn1WbzpnIbwD2+ZlHEbHnh90wdVbAwZQN1zX84c6Tu5ly7ZciIFBE
	qSAzAZ/L3hJkqxXKy472JHRdVjK/fKjD+YxaO2m9WAkYjmA0YjGNbVxoUw0kc+XCC7FzEcUyoxzcA
	FCPCCIzfA+knYO/oP2a8pX3aEtlaRIideXZDlom+Op++MfXxFMbyByRfARjQh8qo7ORTq8xYFGF2N
	R711HJlWsEcvd7oB2DNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9EV-00000001F8u-2Ogj;
	Sun, 22 Nov 2026 15:11:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9ES-00000001F8A-0z50
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 15:11:58 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso29064155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 07:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795360314; x=1795965114; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=;
        b=CYTXWcOeXl7hzGYQ/GPsVg9e+Zvz9c2RIIWxrBmXUqa//ckylw8Hnjj3dlVuc7p21x
         fLtUBwN9LMayd8sZz5K5hIRnLcIZsE3u3VEOESilNoqmIrmmmRI6Umo+LSsbQKuk3MhV
         lnHZlJ7+iNtmHi5qvnBf8Gnmq6KSa55SowdC7d6/7bcBLw5MUAiPcWJxiQUoAX2voBUD
         Q2a7pOPGis4cAb26j0BbnqbaezRlVMcUBZNCIN7paCVNgZL/6U3M/27jjwjgaND7A3Xy
         dUWQyP/LuzyJ+Bst4TS8KHvMpSovjazfUYkW0bF9C5SnqpWJDvyZWxK546Pr5sgIGvFD
         xo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360314; x=1795965114;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=;
        b=KffTztkuaqYeROH9xhMua4qj0GjYzBgzdafFGpU0yfLV+FIs5T/vCavC8+uRQ2AYVx
         zIS3JSoivrLqDxveDlouEGtVBr94kfrKT0kQBIdUjI3V5Bu9tMCSTcfe92M2ge3rc93I
         g3Qy+uUTd15qy9x8sGrTRL6W9AKIMx2uX89IbXStZ3JmXGePDxvwx7KbABk5WGzpvD/r
         M8YgqTJP9MznuMuuCFu09W7sUaKmRHSDwakUgkeTMAy0AAPEPig2K9ietwtDkaKbTp18
         /hZ85jJbSeoSKDz0BAIlIW44fcrrgMfqFe5ZHAmyV4A50C8WWo5x7w1c53PO1uFlRLHH
         QUGA==
X-Forwarded-Encrypted: i=1; AL+hErG2MENCMqtjVq2RpImhKo4JwY8DH+RVrbBIv7jkYznlVB6MTEjrXSgYBjk7JLYHvNY7QTvWo2VMevOmO2+I0shW@lists.infradead.org
X-Gm-Message-State: APuU4Z913ZiCXcbLPWxVMyvB5WiFCX4HpC0eXIwJTQHA49ZzKl0jEyyQ
	EYloVs+QuPLGOueCNZqRsmTbm9TYdSCqVkRGh6nEBEY29dBryxjHciy2Q9ufBsAHzyo=
X-Gm-Gg: AZFdTZfp1uII3KxGVZPAPcosK1ldnLeeVx8E2iYenWGP328+XqhM0JJNpPo1FiylBoW
	XmjVQ0Z4gV8pJXwgmx0ZlEZzmbw9R7oERHMMYTixWPpFI+NHK7pcxj19Rz0p8i9Hd5XpeU+5jo+
	IgEChMTzogy+dQ6HpD8sttOts1C4suBpuaXkFOI+fjtUTuG8i2FcqZCiXHje2fHBo8tSnHwa0rM
	F1RtvUgZ6+CidFWACNhNdH/HqC9/GP0BMW3UADhM//htBhaFSOqAEHQvyI2iNK/sDwNrFl50bY4
	vKvk11jCpnkoWu/qzhFCVdwK4FH/4+LW07AmpDmD1veIdHW0twIJ5C3NNAQq4EO8snBZELMXlOV
	jJ7rvTyY+hJixTmVgUOgf8YWx/i9hfmrTYwqV4iSqTooIz4a5B6P7W2rrGHLQWoRdNTLApieE+P
	eZHuOZaBc08RuUbdTD1ZkzQqMRnNB9Oj06nl3oOEx9bXpb71lBn/yFubJQAOcwiWBqp7GQO3F37
	vyNDM7FbY7ZFGckW0QZ6CfOLTetsJlARAkGgRwEbSK/r7+09sTIIpVn38XvZy++pO09ZYWOrSF8
	shMVLHzB9wSq0rnAYdKML0vLrft63DWqSf38HSV90PDOPOtULooNkpqJLX5W+4TZswaHUw==
X-Received: by 2002:a05:600c:3484:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb88812f16mr189053065e9.24.1795360313921;
        Sun, 22 Nov 2026 07:11:53 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm16789049f8f.38.2026.11.22.07.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:11:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
Subject: Re: [PATCH v2 0/6] Add Amlogic S7 clock controllers
Message-Id: <179536031124.2724645.9771781564056139591.b4-ty@b4>
Date: Sun, 22 Nov 2026 16:11:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_071156_307702_29E00FFE 
X-CRM114-Status: UNSURE (   5.36  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to clk/linux.git (clk-amlogic), thanks!

[1/6] clk: meson: pll: Support PLLs without a pre-divider
      https://git.kernel.org/clk/linux/c/0068f78e25a4
[2/6] clk: meson: pll: Support active-low resets
      https://git.kernel.org/clk/linux/c/288015e923df
[3/6] dt-bindings: clock: Add Amlogic S7 PLL clock controller
      https://git.kernel.org/clk/linux/c/7230757fd4d1
[4/6] clk: amlogic: Add S7 PLL clock controller driver
      https://git.kernel.org/clk/linux/c/19206e1b1299
[5/6] dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      https://git.kernel.org/clk/linux/c/ed4da9fe19c7
[6/6] clk: amlogic: Add S7 peripherals clock controller driver
      https://git.kernel.org/clk/linux/c/20c6003759a5

Best regards,
--
Jerome


