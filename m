Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4406B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 06:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XmJ+7b7X;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ao76Wad1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JPZhpWtYo4NPJA/y8/DpauPYh9eE6q0SsStIMNvIRZg=; b=XmJ+7b7XTa3zOMBXj6Df4VO+KX
	Z849d+Gc2I9lwVXWW5LmTgc2+tj/w2L3AlJf1E3cAzj9oRRQFbX09crAewugQZXhh8uJQDsDAmoSn
	zA/UL4se9NJNbocXJSaatTXm4Da2lzR6wib4Ol87BSRCz4pPWP5aCtJbZfujauZrPxBNmSlZDEwPv
	YjQqc2WRz76AWCpcIRtkxYldQxP03Ti6uGlnoIiEdfI9LoNs2TIXmYV5spPEFEntRUkR0VZFMFKy/
	08dhvVUzUBo/tA5gj0QcEdpqrDcxdIbGhZI82wCRKCS7En8Fib5dPPsftHT7vG1wOpgYU67AMJYd8
	SaFMu/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCsr-00000004gSB-2qAy;
	Tue, 17 Nov 2026 06:41:37 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCso-00000004gR8-1cNj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 06:41:35 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6b75c0f5fe8so635292a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 22:41:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897692; cv=none;
        d=google.com; s=arc-20260327;
        b=bC2WGFkLUrFcMz9kl4dKyIBAXhHys+X8DvV8F4VTPd+GVH2UI7Ss6N9x175w9eg1H4
         /XjqnlcogcODcZp7vH8KfaJ7FEWfcJZ0LmPc+fyo1Gr6dJ652JCk/rLUUYFWGq13bY/m
         H4QXY243f4NudVndKnLMW4hWaquofb9KhWYsMI4K8FTswBAFO72j3hlxhp3iwavouDA2
         JWbBBFrRZ+Kk2Irh/ZHYZHk6Vc/7GYNUBhO+anSf6PzOyWM83WxEyq2SQOUZlf+y3ayF
         17/7VwfjTYUZgZpIYMZqi7fkhnQE7aUzNWDtpaOtWGmOubHqCE6mBN1wOPwAbvottFw3
         xyyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JPZhpWtYo4NPJA/y8/DpauPYh9eE6q0SsStIMNvIRZg=;
        fh=LX9Paarc8AKlDN8P0X72WSf6uOqkxKMgpj1XKs7VT1k=;
        b=G8R+DQW9yIvD1CGHGWVVrgYzEXwbfldHT5xZUwM+lNF0uQahbkpq3RZiDq9M5vAtkf
         OUSJneuxWeFeXh7ewUTQPzXfFDYMUsbEinEeBilQFjSd5DarJs+LXoRMUmt2vWM+YA2W
         jiCKs9kvpPhjjob5QQzkYrTWHZBS1zXTKgSCWMBOg9XdvQuB2W/mPKYibHUuUZtAo3Sh
         GJhZ3MZ9bdqRk98ZkCmPeZui62xhEZ3t+HM/GYdr/Fjx9ZKVaZkRTydL2CgCg+Z9DNmu
         s9xRUpf38JmjAfq3ZzRdwBRBt4KDgf/pGr84epcK69vdJ19+/Bj80SECoWCycoBZ0i4S
         fH6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897692; x=1795502492; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPZhpWtYo4NPJA/y8/DpauPYh9eE6q0SsStIMNvIRZg=;
        b=Ao76Wad1Qs3p6CgfeB3oNiAfkid2hREWRqWifeF56+tBVORnq9636AMD8tAoL3tKvt
         A+XJtw1E4NWM72amwzDx5Gvm/QOEdpTzH+mVJG/4QeFB+od2ABTc0PyWttl0bBn8pORC
         nJrc6cxxZCbn4BE/gtain4WngBrIa1vdG4qiFlul9LWN9rB7NNsKDRGZuzp0hCGWKjqA
         Xoac/XlTlejBJQHe3s/VHC2gcG1ee6+Q4zyLht7aT6oAT8RMlOsfS1gOAVHF9vLzAIHY
         f/W2wX7NTllhKJk8bEYiHt6wbYzjhLkdAxBY88lca9otoOxMUXoiAMcFGiqP1VEN6PD4
         qSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897692; x=1795502492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JPZhpWtYo4NPJA/y8/DpauPYh9eE6q0SsStIMNvIRZg=;
        b=ecYqMSHFvvMkBZyBL+R0K8Ih42dy5VjhzPofUhDm+z/o4DMh8aJhHB1JPjfsP77uWP
         z72KGJwbCLlUKBv+yN7xaeUxJ8VD/HJU9anaxqUm2CbGwVXHb69l+J1B3/tVLNPgbh0E
         534MuWKL6D++7FCPa/f14jcjrUzmCMYNQs6YM4LZjUlEOufAzUX7GRB78vr2eD2wcEwL
         Eqcdm6hB8Xx7PN2O1qxnuzccm5qTF+TR6J3tJbHDTnJXlbh4oqQiyA7YG/TGzBghKTaJ
         jbG+juJU4y2tiG8f5gN/PoU6UVh20u//OQDJs7CX0VN6j0EJ8GS/Zevq8SrQWgb+e85P
         2fMg==
X-Forwarded-Encrypted: i=1; AL+hErEqdECCf73FmgoOdkThODJrANllgbZlcuqRpsc1NVwsxoqRGjGDlDcwSUv4jojykcao6sq77t1wEnAzBZW9Dusz@lists.infradead.org
X-Gm-Message-State: APuU4Z+m/vPVrmVSmSLfsrZPkRZaerqIrc7ktLS7sqBE7ZriKJ/2Hf6e
	LHfi2EaRly8DhaYXP+Jnd1cfOsFO+BAblSi6FZg+gEAVlDtei2VBxZOKL4XipRwDlELrw2i1ir3
	ZkOGGpJulCuqBbCnHBwlxYpMfF+Tvehg=
X-Gm-Gg: AYBFou2P0UxhEFhJj6JwSC10eA95df4qLB84wdt6PU//YeFMlGiBLpET9MAmBLtfsAY
	SL4ptlz26GsAIMCbZfuNvKL0NYJqAYs0t8Tud6IAeX75FEsRzimeoX5/zN2D5pJEXY/G6eUTXJv
	lQ9kh+Uml6HKy0TaKD0re4gnIevpunvImn5POPfiHo2xvvRzRm3EtJGknz/mntNmNIuEYRhD/RZ
	zh1WMv+ak+ZkkTl5Lmzxp3EHbdKZkbVTL0CCLrdxsLZbWYKOXfdsDHn4veiS4DswoFQCT0jvOjN
	YtaHvANZyCvhpEW+w0uUe5NCtDLxzyTBMx0Q4DKwptFjTRu7lqGnkzolVFGXeD9FTVFJMMsz0yY
	sVVMxXpu+KltCkcS2t9VuOE2vBTVD1+wVAHquJTC8tiDlsOM2ugeXNXp5FJZptypxnjskClU=
X-Received: by 2002:aa7:dcc8:0:b0:6b1:b5b8:b695 with SMTP id
 4fb4d7f45d1cf-6b7c05c2ab6mr10001732a12.0.1794897691319; Mon, 16 Nov 2026
 22:41:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com> <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
 <CAPwA33JHxsd=nr9F9_KFKWPx+HGaR8P3ee7hxMc8XCS6QY46gw@mail.gmail.com> <0d837fe2-e192-4fc6-a2e5-c23df40684ab@collabora.com>
In-Reply-To: <0d837fe2-e192-4fc6-a2e5-c23df40684ab@collabora.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Tue, 17 Nov 2026 14:41:19 +0800
X-Gm-Features: AclHuK9K0tynceSVuGQK7zRApbKLpPj305E_NQui8VbqIokOScWH3FFiT-Y5p9Q
Message-ID: <CAPwA33LgQqQSnn3vUOQF2wTUiqP2QROKfUpsASJZqjJP6WDi7A@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_224134_464203_02C90EBA 
X-CRM114-Status: GOOD (  11.25  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michael,

On 11/16/26 11:00, Michael Riesch wrote:
> Still what we discussed makes sense, so let us do some refactoring in a
> later series.

As discussed, I plan to add the tx_ prefix to the PLL helpers in 6/9.

I also noticed that struct samsung_mipi_phy holds phy and lanes, which
TX and RX both use, but also the RX-only hs* fields added in 8/9, while
the TX-only PLL state stays in struct samsung_mipi_dcphy.

I am thinking about the following:

1) One struct per direction:

struct samsung_mipi_phy_tx {
  struct phy *phy;
  unsigned int lanes;
  struct reset_control *m_phy_rst;
  bool legacy_mismatch;
  struct { ... } pll;
};

struct samsung_mipi_phy_rx {
  struct phy *phy;
  unsigned int lanes;
  struct reset_control *s_phy_rst;
  unsigned long long hs_clk_rate;
  u16 hsfreq_cfg;
};

2) Keep only phy and lanes in struct samsung_mipi_phy, and move the hs*
fields to struct samsung_mipi_dcphy, next to the PLL state:

struct samsung_mipi_dcphy {
  ...
  struct samsung_mipi_phy tx;
  struct samsung_mipi_phy rx;
  ...
  struct { ... } pll;
  unsigned long long rx_hs_clk_rate;
  u16 rx_hsfreq_cfg;
};

Option 1 changes 6/9 to 8/9, option 2 only 8/9. Which one would be more
convenient for your future work?

Thanks,
Jason

