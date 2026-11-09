Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FC8606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bFV58l4Q;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u9A9AbW8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gruXRLrwC50Q+01zYBAKobujyZnt2WH+acLyGLcBGqA=; b=bFV58l4Qyq+WuR
	8hhY+9am7df2lsse/tugfhcjuz6Mj8eneYUW9sYvBsRMp7ZMjTGiv9wg70niTlTzr5kaQLkmULRMi
	LA/6gImVoiODyvIxHmnXfO6RQDN9LlxUSUm1oAPnDkAEBHGpxwKRlZjzAWEfYIuoUzBqC3t6OIbsq
	URkEcQgibY5NsdNFG9LS87twcEGZBc6DTla6C7BLaF0HLUxXeGCptTiM1YvdDQQ82NF/CgvJMcTmA
	+xD4qMdKRx3AoUrJSAQoCMO9WGK2P4w1oxr7c7TZQiGMXVQnGV174pC5fZDBWSTXX00ZT0OhroAsW
	0hXqOr+o0S/lOXBeuXIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNBY-00000000UBK-1cl4;
	Mon, 09 Nov 2026 11:05:12 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNBV-00000000UAN-2TCD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:05:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-490585eddfcso599346f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 03:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794222308; x=1794827108; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gruXRLrwC50Q+01zYBAKobujyZnt2WH+acLyGLcBGqA=;
        b=u9A9AbW8akkG93p0k1yVl7Nham68s/S11m6xrkO5FAX3dxMI2RCzDSlrWCRacSFJrI
         tQq/Mb8kXfyArvgfcD5GT8w3USedAT9TINCHE9pbwByzdWBHBoi5PMrFwE5nf2ZTnA45
         vxHfmv1eHZzPUsaZJkUC7uJlq0D6Z22b7pHTCEAcMi1IFD3GZUi4FKrWW19xBwQPi94N
         si4RCVKu8HjUTuI3KlIBGHhzqFcGo7iVnj01tY2Qm+GIc6eSkrWe8GXgdSDYzhzCvaZT
         FdaBTjcagVRTyAcC7GPDRfcZqXN4wW4mTBrZ32kv7kvnV30q0ulanTcYutwH1hccAwgU
         Y0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222308; x=1794827108;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gruXRLrwC50Q+01zYBAKobujyZnt2WH+acLyGLcBGqA=;
        b=ZQSuHHBiSoaNsm7zm3+7GVaPkPd7JaIHrzVO14jSfBuVg8rfLKx/DGvuK6r8VDzX0A
         oeh1CQtuP1yu2Ec7CO7vMW/jSPt2f3/BZ7Vr+vj8S9uTBDonkNHZHmYVvGd2qyMufzlh
         IRnl1ykzviMT6BXgaNbraoav0docN5oHxfewkC6Cm4jGk2J+++dv7EoOtcR5+EjNHxjG
         zcRfcDFXGZ8rTnx9VqnV/gEwljuFYymdWvzAE8jFDWaTptkoZfWMO2RQ5tVBIoH4cw4X
         NsiEOtj3lzu/dNTrvY6gf2blanRNKWcm3aUNo4pKY+xeeBjCIs44zFs8THmtUlxR9FIG
         kSfA==
X-Forwarded-Encrypted: i=1; AL+hErFmow/n5cP6wX9DNSbJPKbtyxooRGsBfP3DDtIzoTFEKKEF3Mu0QzWo31xXzm73u/xeDWeCoShGKksA1ahPXTwp@lists.infradead.org
X-Gm-Message-State: APuU4Z/suqd4uwHWFtglA5FLQ7kuG/suIpaibIVGqrL5ciJFDIzwquYM
	VjI70jUuazEeIN+tdX75ZyvCcp0LVKWgZkOLV/YEs5Q0qDyojrysH5mk3vXaVQ6iDcM=
X-Gm-Gg: AYBFou1s2GJF8otSsV8KIevmi1BNrkeEuSyLauCVd9zNbclaawIYCgTLrga3f6u30r/
	4znn47VgzXOsUuVd+3VwGAdWTIGg7qCyZapF90lPHbTHRei93K2QbuXJWqm6kY52IvOqPe7D89w
	W6uRFaG/zCLISrDmGvFZAM100dOdkIDttKTTWvY0+aGBrGGPX7cU8CEq9jem0uccz+FLTdU1wZ/
	zfijYorwU5h8bgCNjE7zDqaV4hwQtXA39DbhVWWAX3GkwMjVp0FMF3NhhqEgY8tkgSXZICzLwom
	wOEagZyn3CJGZfeHV/S24sUc09dLDUoxDXNknMATEYjABZxrZlwDuq5qjyt+rC2v016voclkJFy
	QZCxQnBe5dX5gPTL2yXnO6Rixwk2UKcLqmseOwaXdYLdeJwTIXDtD9G1Ty+0iZTf55XRZdlzOvr
	2/f+dHJpLSJuzAQmAx1k9TEsD4wmu8FCcGDGUHBlPInGSqH6hyqzBdxKkh45uHx1RHlbVJjCc4K
	lTAc5fAkGaT+r7bIQ8yZnT29xQ2BABux/GjZh4R9k8V9n36ELleDk4+v6TmHi8xI7ccHMKTeY+G
	mRL38+jMQCowzghiIyNEt7wbd5Tmk9Z81YovF58Vvtw=
X-Received: by 2002:a05:6000:2501:b0:48d:f460:2c62 with SMTP id ffacd0b85a97d-4958c0beec1mr7604586f8f.33.1794222307486;
        Mon, 09 Nov 2026 03:05:07 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596f9ab09sm8970489f8f.28.2026.11.09.03.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:05:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Shigeaki Asai <y-asai.0816@docomonet.jp>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, John Williams <porschemad911@gmail.com>
In-Reply-To: <20261004-meson-gamma-v1-1-6347558e2bb3@docomonet.jp>
References: <20261004-meson-gamma-v1-1-6347558e2bb3@docomonet.jp>
Subject: Re: [PATCH] drm/meson: encoder_dsi: load ENCL gamma table while
 ENCL is disabled
Message-Id: <179422230388.1497673.3746542387809770384.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:05:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_030509_686890_E8CD8EAD 
X-CRM114-Status: UNSURE (   8.27  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sun, 04 Oct 2026 23:50:17 +0900, Shigeaki Asai wrote:
> meson_encoder_dsi_atomic_enable() programmed the ENCL gamma LUT right
> after meson_venc_mipi_dsi_mode_set(), i.e. while the ENCL timing
> generator was already running (ENCL_VIDEO_EN=1). Writing the LUT
> during active video stalls the hardware: L_GAMMA_CNTL_PORT
> WR_RDY/ADR_RDY deassert and the ENCL line counter (ENCL_INFO_READ)
> freezes, so every remaining write times out (~8s total at boot) and
> the panel ends up with a corrupted gamma table (wrong colors).
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: encoder_dsi: load ENCL gamma table while ENCL is disabled
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cb7f6d9e4b1d0a411b628ccf78695ad41c66570

-- 
Neil


