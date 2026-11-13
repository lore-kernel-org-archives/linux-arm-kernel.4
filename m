Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96894606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FXmDvimD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TVMglc2G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YavfHroeJbmr+VHcPmcN/QbM0vDy2kwirUjQA6La55g=; b=FXmDvimDpiUnAEbIwQWVDVZ+EA
	NFmgt3te9lnHjWY5mLiNbAR1L1Dd9ayegcaPZRxAYx33Vf0xWXcWSbx+i8X2UFc1C/g8CCwfCyAZy
	2yunuFZJdSRbnUgRoUjJI6YMoECKgd+7P8DvWNuy3ElVf8hd6LWCfVAVA+u14QBGZo+CtfiBNQM9h
	Cp1RGk8kBxc/RYadCukuvssqjU48PkmLP6cuwJaaccK+VDsu7TMQbGvgtuX0fbp2GAT6X4CLjakXh
	SYseXBVRpXuCoWm60zeL+62MxrFDP2QltSIcPsDci8SICnQPmwOTCo4DU1gV71OT27UcskFmqauCR
	biHCoWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxqV-0000000EOyu-1V01;
	Fri, 13 Nov 2026 20:26:03 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxqR-0000000EOxb-1OIm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:26:02 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso2766691fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:25:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601557; cv=none;
        d=google.com; s=arc-20260327;
        b=cVTK0Y1HxiKp58we2oAPGlb6Fe1AF3huQhcNwC3BBA5KGmlj/LCn5O37yjKg94CywA
         SJpGBUR8FI/MuhyZZiBNzl/XHYEDVAkUtPC35ENAsChEDsh7Ku5gl1yziH8QJBZGcoNR
         Dy5xuTNlEuW3j0Bb4pTKcGaOQ6cqfVo0sqLs4Qda4Jo5sUmFvxaDJqD6zc2nDtQhHbCs
         rKUSbnghIr03xVxRU5RZHt9YSX6JH+7UUrz/+7HvmZGFVK0WOgBwF/A43m3eK1iuS7ds
         kh67+8DErxxCoLKa+844yrX65bs3rWdd4cBPDSH8g7xf6lnyOmmKsIq2+Ch2vOUTvaZE
         AAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YavfHroeJbmr+VHcPmcN/QbM0vDy2kwirUjQA6La55g=;
        fh=Fyco2rnM6ib6smwqxIKEaSqKSHS2Vaal6hnqA1+AgOg=;
        b=Q0Uqudjvq+YazvQP3+5KLMLxdYVOiO3VyAfBwW+vl1y+yCcv2MZVEXQ29eJGlIVy+d
         p3F0KEwertdxAgL5iZGPfLp1keqDcnq0Uq9+iyfZCZavNCIySA44q1PJZMwD81WfMe2+
         bklu6bFasGR5hNmLwaEVvND1UymfQ0IKbcg/q/x99zCNurZl4bAmZZq4apbjZU3bRrAZ
         URoCsV1vKv+pVriM6h8mnmqMo/ST9HHp43mbdAft6YrllTFMB4e5NWpHoYWWWHfTVigL
         ARfEIkyqrtVPwCsV+OmcOiJkuNmfq4sKdlAvDfJSekyDxsaZichcdXSwkGpqiRHRUTtK
         ok2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601557; x=1795206357; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YavfHroeJbmr+VHcPmcN/QbM0vDy2kwirUjQA6La55g=;
        b=TVMglc2GfJY+rrEND6EBGUHWYZbdjCgdrhxg6/bzvplDe9O3PoUrS6+Tm+5r8ISH8y
         HYiQmYvUzsm8+Iaq2Dx/EW7G92Wz00znb1av7vg+qsHuYwJNTr1498WsHnQrMoLlhvRP
         qRnvZhZy6A+Al+KPK6eY7WRa2mpW8Nw1pmOtDX1whin/O7EQZraMrzopTouXNCuazcFw
         ZQDjJDDjiDQLIxaHr2Cxw3Ci28qC50HE9hDS43dOC7C6vqWxPVTHXuE74xy4op+dA0I5
         ircSmFHdHtGg9sGIfGPCizTIEBHK5Rq0V9nzbl2p9CUTOEc11dvEQPAfe7+uSNLZw/GZ
         ufaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601557; x=1795206357;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YavfHroeJbmr+VHcPmcN/QbM0vDy2kwirUjQA6La55g=;
        b=SDI4uneAJ6aFbvUiIFoHWVdcCSIZJRUIZJXXuwyeUYk9ykwbN3/2gjgzgp4nGst1Bx
         gFt3ygud6J3JMFbJ3kgxNQXWGwTK2qtHEzxl9J62mA7XR1BSHDeyK5IZNwUp/bd8ZlWb
         eAabwBj8UPaqJbKrcOhCB6JMLnqwlfCtmUg3Sxvi28cobHG0cHsUnsKwQlzAC/96njOv
         PBbbi93HzO68TarPRobZ5BkizG7edFEIi17rRMX1MzozGCw6vgE5dkNvs4IqWjPN8ZUp
         qY9HyCsH0psd7cYL2MZ4FWc45lgyhE4LoicFpACyQAu8RJPIIAmUBeZZQFRztBn4VOwr
         Oi2Q==
X-Forwarded-Encrypted: i=1; AL+hErG6TkNxR1ChzTGON3L5LtxGPXw1TdMIUg6OxqPji5SNEajU+Rl8ih7IugBG/I1wqVEl4djxqNXm7wjR5iPBvSsd@lists.infradead.org
X-Gm-Message-State: APuU4Z9nRd4xXkN/cjMhs3sh2nUhRbMmTC1m2TEzd0chG+Nlk4JgyG8W
	tWy2SYLrdTjXPcIQnXr5M0vnAKqIr1+qd009XTfyt7c2VUvctR56mvkG4Xv+pqQW+UUF90zICGe
	DRPntJ6RA5AZBTkA+vZHHux0kIltrpv0=
X-Gm-Gg: AYBFou3SE9eYmi38omRCGcNEOpr//NJnMgJWue0ht99JlmGWj55xtdfgbkkOFjxDMfO
	bT2L3uzAa0AdmJOzhF7qTOC6PFbC6BVZhVmNeo1QyHtYMsMAqwxV4IDRs/tk39C6n5oqhxoTiC0
	fSN3NotdCdz6arGUdS5ZB0E09n2wfAxsnDaHOFgCwy1l5nNtOsJmDoWcP9TaANYo2d4kwUDysvc
	fEZmJpOVuElKCEY0n7ffh7zgIqWzhhc/n2zs4PEDF7S/yXD6uZn1TLhRLmDnX2aTqclsS+/lNSO
	PFs/I0FaI7l+V1l8fykFUz74f4UMBpCYRlFETuErImnryRR7//yeVKHZLLTsqX89HOBu0gF/aVt
	0dOkUFJ2I+k410y1xCJtEBOcFxDqysdWcxmN+Vk3HJsn2kMgjUXdV2FtdN+7ugK/F2gI4b4PN
X-Received: by 2002:a05:6512:1326:b0:5bf:d00a:b6c0 with SMTP id
 2adb3069b0e04-5c17076e20cmr1778621e87.3.1794601556720; Fri, 13 Nov 2026
 12:25:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-4-8218c1cf8ac8@gmail.com> <380996af-b987-4854-8b52-a3a214b19e79@rock-chips.com>
In-Reply-To: <380996af-b987-4854-8b52-a3a214b19e79@rock-chips.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:25:44 -0800
X-Gm-Features: AclHuK9Z0XxZveIpcBwbR-1StXFvWIPfHqJtynCF1BYTTbRYTOBUF4wn1ddT13s
Message-ID: <CAEy9hNUnZkqyg95DsShdr7UF6CiQvKhpvJxrx0TSoq3do2nyEw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/rockchip: vop2: Don't accept AFBC YTR for
 RGB565 on RK3588
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Piotr Zalewski <pZ010001011111@proton.me>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_122600_604363_BF387B66 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

Hi Chaoyi,

> That' true. The TRM says RK3588 only support XRGB888/RGB888 AFBC YTR format.

v3 follows the TRM: YTR is only accepted for the 8 bit RGB formats, and
the comment is gone.

That also refuses XRGB2101010 with YTR, which displays correctly on my
board (AFBC 16x16 | SPARSE | YTR from the Mali-G610, HDMI and DP). May
the 10 bit formats keep YTR?

v3 5/8: https://lore.kernel.org/r/20261113-vop2-fixes-v3-5-08ae37e83b5c@gmail.com

Best regards,
Arun

