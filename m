Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E34606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kXJniMbd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ex/U3oX/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WU1bfrRJnySLXBq2fMTwUjF2uo3KDqqVLdyu6MbMrY4=; b=kXJniMbd2uppDGdwCSRrWPOY6/
	BXIvCEkQIulsQNsV5C7FBIJ8czgc324/nxSyKFTyObqZLuUj07nUsue9DEDXXPY8aQohPgePoipw6
	YbRWxIjGDTbySjMk0+IyWH4l078amerFwaycdstVBcvW8fVcx6ze1sC1Cz8xA8chhH3MoD0l/5iM8
	0tf7M0dnMCa7zdxhPIgJsDR5OKZX+qOh+KG5HMLCpXDwynLmbUPN2gcRIFpgLFmTm4IUJd1ihNOwg
	scKczHx+IZMKjC0fuaflfC+h19VP88ShczDJbh8f6p8v7kp0C9NkfnOGw3z+k7YrRuvMa4m4/7s1g
	31jzHxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxpY-0000000EOhp-42jb;
	Fri, 13 Nov 2026 20:25:04 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxpT-0000000EOgG-40Lm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:25:02 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3adf04a55f5so2036881fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601498; cv=none;
        d=google.com; s=arc-20260327;
        b=Cq0u3NNmaQDK+A2VyTATDFIpDAFquY4JB0QVBbl64rEuvSaFBVAoOazZALoiMlDQI0
         EtdOIZawufLz/6CDoKwyZEagb5Rxuhoy/HbL5ZZfsKXGNKt+virFAcFQ1rEqSeEFPRN/
         z3qCfORAo3ac6pfwAEqsMdOAerCA5JDa2T97p4v9TqfVgPc2AkcSMM+D+XUgbIBfYOH2
         umDc3t/3EMlfTz4nhs4V6d84+uCmMZ2P9nV8HM43m30XSfyuHkVzA161n/Y3njCmjRdk
         mY9fRRUnCP+Xg07SYCm/fsSqe9WQfddg6X3f9zftNU3Tgsct/N0wxZyPDCrtXs3Xktqj
         g4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WU1bfrRJnySLXBq2fMTwUjF2uo3KDqqVLdyu6MbMrY4=;
        fh=6NxFjMCqXSEOmOk8degWF+pmKGXN0HUCVj2AOug0KX8=;
        b=e8uxmwSteoMnp9ZpsdnBuREWX5kDPbrWvLy45X5K26xPbpgp7GNnS+yixJAWMy46IU
         zQhL8G8vRQLSDo9f1NpMlID4vdAAdSN9nvOUJ67KHXEY305aqJdwsczRnDWi9ZHFduP3
         sZquLNRwpMBoKkwmacR+Gi41KdX3Prs0MlJVKRFWOmOBswP9uBoz8MT06e27F/yAIFb4
         k/GTEUfvXKHffj4JJjBxyDb562Het89vY5AW/kglfbDSr3xK432YhDRd7t5OhaFKWlml
         U7z4meHzYtF10mk2HYWWkFeVTtaznWkj6zfATBGSVJuQQoZ6Zai8aePrIOJRErQMdSHM
         Aolw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601498; x=1795206298; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WU1bfrRJnySLXBq2fMTwUjF2uo3KDqqVLdyu6MbMrY4=;
        b=ex/U3oX/+6AbdyptIXjo44xdXSy+K/+5/7wI2/qrW87w9/ukBw2ZeUqC7ev0MJ4wZG
         zK53Qcifg6K1qMyHTQTLGjle4IreaynB/lHTBJMDhQnsMGieCU/pllhShaWzB2L4TJjP
         7jFVMH+jXrCdS5UPdtfTIEEulO9CPtIqEwB2n5sMBHdi/LXNGaNg69IYyobBjX3y/Nyd
         wDbKE4CyoW1HUgR10vk/JmYS5uKYxMwdccmvb4NUn2MchjhDAEpXOHHevoBJMG00yOkU
         Cgn3akdOpK+s+l7WvHUlf2YCkfHNMS6IBNdTJIhnC78kPgwq/ZXDQnKJ6cSZFymfHwUU
         oUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601498; x=1795206298;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WU1bfrRJnySLXBq2fMTwUjF2uo3KDqqVLdyu6MbMrY4=;
        b=IJSbBff4DoNUx5taRNHBngQSHTyQYt9zgi3RTcwF6rauj++nA6kpP7j+uqjWE3NNlm
         OfX0w+iVty/i/Z7BAHcATTCFzvMO4BBy5TDZZPraYwe41Slvq2An9exzC7lBYNFcxtmG
         FQ7pCuRbLR/f8fDeqnXDs6GFaQq784ZEr3FQAZvrfMaVPBBX+vp7kl4zrDGI9roLbdBo
         abPzv8eXGzeXlDNh73mY5EqR2BuLTh7IaSuicOuPNRKj5UOkFgIw4W/cXZepnFwC3Xh+
         WQBh40gz0dTbBWtbwTedeowE4ObDEpIupHgcs6oLdmTIT9UpuzrrSodEx5p6K0jmcR9+
         mgdQ==
X-Forwarded-Encrypted: i=1; AL+hErHxZd5VgKY53nixU7YKgbmLWF3f1kO0sMVckv9ig8zoQ6YkkJfmfzFkGzGJR/X7jC/VXxXqXG9azEH9g2ADSh7+@lists.infradead.org
X-Gm-Message-State: APuU4Z8lOoSH3uxdY+Kq87pzk/RCDSq8mm7WP8ONPwJn/QqrfzqXfWBb
	hadI0wH+CL8Gnbl2i/ODPuloi1l18jwy3FlLrFoKvU5kdr2YCgQMIX8vs7FHUgKb/+q7zv+aCu9
	rsnnOg1R9FymnsD6MKWgT+G+QB0IGpEw=
X-Gm-Gg: AYBFou3DsYjD4iCSDSjDuv92UFlKIPNqIzYCB2OfBm6uYJIIkCeYQ+TefYTI6pnmXfJ
	JH4FcAgDPSAZ6wPrpuylrsVMxgzdxUTO4IvM1wYLsa3DjOhp6gG4oK8N1eC50OGLT7oZ8lGQ+jN
	FMkp7EraKHpG7jBEsOrEKPK/TvZPi/pzF0BPE4hdHuTBsEkuPhcLJtCghdHLQoXjUQF5q43l8ZW
	4Mxu6ar1RK3ht7uWqm17QmbchZmjiiGWdd/lNqq1mTyk5Tnew2QEOsGprSkGX7aE1hZFT50zT86
	tB7W5jNMAEftpYzE8Rtk28PK6EAz3UpR/UzT2DCjOKF6oj+o1ZBms8aRnbmk90TY4qSYpnxn4vN
	KgQf6CYeD8v723noKFDpDTQkWE0ps1c1Ny86zy8PC81vxMdQt7GOFp0XypNBWNwCGqXnHZ5g=
X-Received: by 2002:ac2:4bd3:0:b0:5bf:f87e:3d25 with SMTP id
 2adb3069b0e04-5c17075fbeemr1839415e87.2.1794601497810; Fri, 13 Nov 2026
 12:24:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-3-8218c1cf8ac8@gmail.com> <a5b52d95-7fa2-4148-aa02-cfee6f195e1a@rock-chips.com>
In-Reply-To: <a5b52d95-7fa2-4148-aa02-cfee6f195e1a@rock-chips.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:24:46 -0800
X-Gm-Features: AclHuK9InRTgWzumTIOYOi5MivIL20TRnUBG8RNDv3yJlv7_a6OpEdGqBKKf5lU
Message-ID: <CAEy9hNVKy6sTA70B8kfhP7eBFCUFobFn4SvXUGMxzCs-bpXW0A@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] drm/rockchip: vop2: Fix the HDMI sync polarity on RK3588
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Piotr Zalewski <pZ010001011111@proton.me>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, cristian.ciocaltea@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_122501_728543_1DD2B050 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
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

Hi Damon, Chaoyi,

The TRM names GRF_VO1_CON0 bit 5 the HDMI0 vsync polarity and bit 6
hsync (7 and 8 for HDMI1); the driver, like the vendor kernel, uses
them the other way round.

The HDMI controller agrees with the TRM. With patch 3 and 1920x1080@144
+HSync -VSync the driver sets bit 6, and VIDEO_INTERFACE_STATUS0 reports
-HSync +VSync; with 1600x1280@60 -HSync +VSync it sets bit 5 and the
controller sees +HSync -VSync.

v3 keeps patch 3 as you reviewed it and adds patch 4, which swaps the
two bits; with it the controller reports both modes as set. Please
shout if the TRM is wrong here.

v3 4/8: https://lore.kernel.org/r/20261113-vop2-fixes-v3-4-08ae37e83b5c@gmail.com

Best regards,
Arun

